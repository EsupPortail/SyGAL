<?php

namespace Application\Service\Fichier;

use Application\Command\ShellScriptRunner;
use Application\Entity\Db\ContenuFichier;
use Application\Entity\Db\Fichier;
use Application\Entity\Db\NatureFichier;
use Application\Entity\Db\Repository\FichierRepository;
use Application\Entity\Db\These;
use Application\Entity\Db\ValiditeFichier;
use Application\Entity\Db\VersionFichier;
use Application\Filter\NomFichierFormatter;
use Application\Service\BaseService;
use Application\Service\Fichier\Exception\DepotImpossibleException;
use Application\Service\Fichier\Exception\ValidationImpossibleException;
use Application\Service\ValiditeFichier\ValiditeFichierServiceAwareInterface;
use Application\Service\ValiditeFichier\ValiditeFichierServiceAwareTrait;
use Application\Service\VersionFichier\VersionFichierServiceAwareInterface;
use Application\Service\VersionFichier\VersionFichierServiceAwareTrait;
use Application\Validator\Exception\CinesErrorException;
use Application\Validator\FichierCinesValidator;
use Doctrine\Common\Collections\Collection;
use Retraitement\Service\RetraitementServiceAwareInterface;
use Retraitement\Service\RetraitementServiceAwareTrait;
use UnicaenApp\Exception\LogicException;
use UnicaenApp\Exception\RuntimeException;
use UnicaenApp\Util;
use Zend\Filter\FilterInterface;

class FichierService extends BaseService
    implements VersionFichierServiceAwareInterface, ValiditeFichierServiceAwareInterface, RetraitementServiceAwareInterface
{
    use VersionFichierServiceAwareTrait;
    use ValiditeFichierServiceAwareTrait;
    use RetraitementServiceAwareTrait;

    /**
     * @return FichierRepository
     */
    public function getRepository()
    {
        /** @var FichierRepository $repo */
        $repo = $this->entityManager->getRepository(Fichier::class);

        return $repo;
    }

    /**
     * @param $code
     * @return null|VersionFichier
     */
    public function fetchVersionFichier($code)
    {
        /** @var VersionFichier $nature */
        $version = $this->getEntityManager()->getRepository(VersionFichier::class)->findOneBy(['code' => $code]);

        return $version;
    }

    /**
     * @param $code
     * @return null|NatureFichier
     */
    public function fetchNatureFichier($code)
    {
        /** @var NatureFichier $nature */
        $nature = $this->getEntityManager()->getRepository(NatureFichier::class)->findOneBy(['code' => $code]);

        return $nature;
    }

    /**
     * @param bool $estAnnexe
     * @return NatureFichier|null
     * @deprecated estAnnexe devrait être abandonné
     */
    public function fetchNatureFichierByEstAnnexe($estAnnexe)
    {
        return $this->fetchNatureFichier($estAnnexe ? NatureFichier::CODE_FICHIER_NON_PDF : NatureFichier::CODE_THESE_PDF);
    }

    /**
     * Crée des fichiers concernant la soutenance de la thèse spécifiée, à partir des données d'upload fournies.
     *
     * @param These           $these        Thèse concernée
     * @param array           $uploadResult Données résultant de l'upload de fichiers
     * @param NatureFichier   $nature       Version de fichier
     * @param VersionFichier  $version
     * @param string          $retraitement
     * @param FilterInterface $nomFichierFormatter
     * @return Fichier[] Fichiers créés
     */
    public function createFichiersFromUpload(
        These $these,
        array $uploadResult,
        NatureFichier $nature,
        VersionFichier $version = null,
        $retraitement = null,
        FilterInterface $nomFichierFormatter = null)
    {
        $fichiers = [];
        $files = $uploadResult['files'];

        if ($version === null) {
            $version = $this->versionFichierService->getRepository()->fetchVersionOriginale();
        }

        // normalisation au cas où il n'y a qu'un fichier
        if (isset($files['name'])) {
            $files = [$files];
        }

        foreach ((array)$files as $file) {
            $path = $file['tmp_name'];
            $nomFichier = $file['name'];
            $typeFichier = $file['type'];
            $tailleFichier = $file['size'];

            // validation du format de fichier
            if ($nature->estFichierNonPdf() && $typeFichier === Fichier::MIME_TYPE_PDF) {
                throw new DepotImpossibleException("Le format de fichier PDF n'est pas accepté pour les annexes");
            }
            if ($nature->estThesePdf() && $typeFichier !== Fichier::MIME_TYPE_PDF) {
                throw new DepotImpossibleException("Seul le format de fichier PDF est accepté pour la thèse");
            }


            $fichier = new Fichier();
            $fichier
                ->setThese($these)
                ->setNature($nature)
                ->setVersion($version)
                ->setTypeMime($typeFichier)
                ->setNomOriginal($nomFichier)
                ->setTaille($tailleFichier)
                ->setRetraitement($retraitement);

            // à faire en dernier car le formatter exploite des propriétés du Fichier
            $fichier->setNom($nomFichierFormatter ? $nomFichierFormatter->filter($fichier) : $nomFichier);

            $contenuFichier = new ContenuFichier();
            $contenuFichier->setData(file_get_contents($path));
            $fichier->setContenuFichier($contenuFichier);
            $contenuFichier->setFichier($fichier);

            $this->entityManager->persist($contenuFichier);
            $this->entityManager->persist($fichier);
            $this->entityManager->flush($contenuFichier);
            $this->entityManager->flush($fichier);

            unlink($path);

            $fichiers[] = $fichier;

            unset($fichier);
        }

        return $fichiers;
    }

    /**
     * Exécute le test de validité au fichier spécifié et enregistre le résultat via une entité ValiditeFichier.
     *
     * @param Fichier $fichier
     * @return ValiditeFichier
     * @throws ValidationImpossibleException Erreur rencontrée lors de la validation
     */
    public function validerFichier(Fichier $fichier)
    {
        $exceptionThrown = null;

        try {
            $estArchivable = $this->fichierCinesValidator->isValid($fichier);
            $message = $estArchivable ? "Le fichier est archivable" : current($this->fichierCinesValidator->getMessages());
        }
        catch (CinesErrorException $cee) { // erreur possible à identifier
            $estArchivable = null;
            $message = $cee->getMessage();
            $exceptionThrown = $cee;
        }
        catch (RuntimeException $re) { // erreur non identifiée
            $estArchivable = null;
            $message = "Le test d'archivabilité a rencontré un problème : " . $re->getMessage();
            $exceptionThrown = $re;
        }

        $resultat = [
            'estArchivable' => $estArchivable,
            'resultat'      => $this->fichierCinesValidator->getResult(),
            'message'       => $message,
        ];

        $this->validiteFichierService->clearValiditesFichier($fichier);
        $validite = $this->validiteFichierService->createValiditeFichier($fichier, $resultat);

        if ($exceptionThrown) {
            throw new ValidationImpossibleException("Erreur rencontrée lors de la validation.", 0, $exceptionThrown);
        }

        return $validite;
    }

    /**
     * @param Fichier $fichier Fichier à retraiter
     * @return Fichier Futur fichier retraité
     */
    private function preparerFichierRetraite(Fichier $fichier)
    {
        $version = $fichier->getVersion()->estVersionCorrigee() ?
            VersionFichier::CODE_ARCHI_CORR :
            VersionFichier::CODE_ARCHI;

        // si un fichier retraité "partiel" peut avoir déjà été créé en cas de retraitement en tâche de fond, on l'utilise.
        $fichierRetraite = current($this->getRepository()->fetchFichiers($fichier->getThese(), NatureFichier::CODE_THESE_PDF, $version, true));
        if ($fichierRetraite && $fichierRetraite->getEstPartiel()) {
            return $fichierRetraite;
        }

        // suppression de tout fichier retraité existant
        if ($fichierRetraite) {
            $this->deleteFichiers([$fichierRetraite]);
        }

        $fichierRetraite = new Fichier();
        $fichierRetraite
            ->setThese($fichier->getThese())
            ->setNature($fichier->getNature())
            ->setNom($fichier->getNom())
            ->setTypeMime($fichier->getTypeMime())
            ->setNomOriginal($fichier->getNomOriginal())
            ->setEstPartiel(true)
            ->setTaille(0)
            ->setEstAnnexe($fichier->getEstAnnexe());

        $fichierRetraite->setVersion($this->versionFichierService->getRepository()->findOneByCode($version));
        $fichierRetraite->setRetraitement(Fichier::RETRAITEMENT_AUTO);

        $nomFichierFormatter = new NomFichierFormatter();
        $fichierRetraite->setNom($nomFichierFormatter->filter($fichierRetraite));

        return $fichierRetraite;
    }

    /**
     * À partir du fichier spécifié, crée un fichier retraité rattaché à la même thèse.
     *
     * @param Fichier $fichier Fichier à retraiter
     * @param string  $timeout Timeout éventuel à appliquer au lancement du script de retraitement.
     * @return Fichier Fichier retraité
     */
    public function creerFichierRetraite(Fichier $fichier, $timeout = null)
    {
        $outputFilePath = $this->retraitementService->retraiterFichier($fichier, $timeout);
        // Si le timout éventuel est atteint, une exception TimedOutCommandException est levée.

        $outputFileContent = file_get_contents($outputFilePath);
        unlink($outputFilePath);

        $fichierRetraite = $this->preparerFichierRetraite($fichier);
        $fichierRetraite
            ->setEstPartiel(false)
            ->setTaille(strlen($outputFileContent));

        $contenuFichierRetraite = new ContenuFichier();
        $contenuFichierRetraite->setData($outputFileContent);
        $contenuFichierRetraite->setFichier($fichierRetraite);
        $fichierRetraite->setContenuFichier($contenuFichierRetraite);

        $this->entityManager->beginTransaction();
        try {
            $this->entityManager->persist($fichierRetraite);
            $this->entityManager->persist($contenuFichierRetraite);
            $this->entityManager->flush($fichierRetraite);
            $this->entityManager->flush($contenuFichierRetraite);
            $this->entityManager->commit();
        } catch (\Exception $e) {
            $this->entityManager->rollback();
            throw new RuntimeException("Erreur survenue lors de l'enregistrement du fichier retraité", 0, $e);
        }

        return $fichierRetraite;
    }

    /**
     * Version asynchrone de la création d'un fichier retraité.
     *
     * L'idée est de créer un Fichier partiel (sans ContenuFichier associé) puis de lancer le retraitement
     * en tâche de fond.
     *
     * @param Fichier $fichier
     * @see FichierService::creerFichierRetraite()
     */
    public function creerFichierRetraiteAsync(Fichier $fichier)
    {
        $newFichier = $this->preparerFichierRetraite($fichier);

        try {
            $this->entityManager->persist($newFichier);
            $this->entityManager->flush($newFichier);
        } catch (\Exception $e) {
            throw new RuntimeException("Erreur survenue lors de l'enregistrement du fichier retraité", 0, $e);
        }

        // lancement du script de retraitement en tâche de fond
        $scriptPath = APPLICATION_DIR . '/bin/fichier-retraiter.sh';
        $destinataires = $newFichier->getHistoModificateur()->getEmail();
        $args = sprintf('--tester-archivabilite --notifier="%s" %s', $destinataires, $fichier->getId());
        $runner = new ShellScriptRunner($scriptPath);
        $runner->setAsync();
        $runner->run($args);
    }

    /**
     * Supprime définitivement un fichier.
     * S'il s'agit du fichier de thèse original, suppression aussi du fichier retraité éventuel.
     *
     * @param Fichier $fichier
     */
    public function supprimerFichier(Fichier $fichier)
    {
        $version = $fichier->getVersion();
        $these = $fichier->getThese();

        // si c'est le fichier de thèse original qui est supprimé, suppression aussi du fichier retraité éventuel
        $supprimerAussiTheseRetraite = ! $fichier->getEstAnnexe() && $version->estVersionOriginale();

        // suppression du fichier
        // NB: "validites" supprimés en cascade
        $this->deleteFichiers([$fichier]);

        if ($supprimerAussiTheseRetraite) {
            // suppression aussi du fichier retraité éventuel
            // NB: "validites" supprimés en cascade
            $versionASupprimer = $version->estVersionCorrigee() ?
                VersionFichier::CODE_ARCHI_CORR :
                VersionFichier::CODE_ARCHI;
//            $fichierTheseRetraite = $these->getFichiersBy(false, null, true, $versionASupprimer)->first() ?: null;
            $fichierTheseRetraite = current($this->getRepository()->fetchFichiers($fichier->getThese(), NatureFichier::CODE_THESE_PDF, $versionASupprimer, true));
            if ($fichierTheseRetraite !== null) {
                $this->deleteFichiers([$fichierTheseRetraite]);
            }
        }
    }

    /**
     * Supprime définitivement des fichiers liés à une thèse.
     *
     * @param array|Collection $fichiers
     */
    public function deleteFichiers($fichiers)
    {
        /** @var Fichier $fichier */
        foreach ($fichiers as $fichier) {
            $these = $fichier->getThese();

            $these->removeFichier($fichier);
            $this->entityManager->remove($fichier);
            $this->entityManager->flush($fichier);
        }
    }

    /**
     * Génère un fichier PNG temporaire pour aperçu de la première page de ce fichier,
     * et retourne son contenu binaire.
     *
     * @param Fichier $fichier
     * @return string Contenu binaire du fichier PNG généré
     * @throws LogicException Format de fichier incorrect
     */
    public function apercuPremierePage(Fichier $fichier)
    {
        if ($fichier->getTypeMime() !== Fichier::MIME_TYPE_PDF) {
            return Util::createImageWithText("Erreur: Seul le format |de fichier PDF est accepté", 200, 100);
        }

        if (! extension_loaded('imagick')) {
            return Util::createImageWithText("Erreur: extension PHP |'imagick' non chargée", 170, 100);
        }

        $inputFilePath = $fichier->writeFichierToDisk();
        $outputFilePath = sys_get_temp_dir() . '/' . uniqid($fichier->getNom() . '-') . '.png';

        $im = new \Imagick();
        $im->setResolution(300, 300);
        $im->readImage($inputFilePath . '[0]'); // 1ere page seulement
        $im->setImageFormat('png');
        $im->writeImage($outputFilePath);
        $im->clear();
        $im->destroy();

        $content = file_get_contents($outputFilePath);

        unlink($outputFilePath);

        return $content;
    }


    /**
     * @var FichierCinesValidator
     */
    protected $fichierCinesValidator;

    /**
     * @param FichierCinesValidator $fichierCinesValidator
     * @return $this
     */
    public function setFichierCinesValidator(FichierCinesValidator $fichierCinesValidator)
    {
        $this->fichierCinesValidator = $fichierCinesValidator;

        return $this;
    }
}