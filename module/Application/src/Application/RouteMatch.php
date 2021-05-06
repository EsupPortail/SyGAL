<?php

namespace Application;

use Application\Entity\Db\EcoleDoctorale;
use Application\Entity\Db\Etablissement;
use Application\Entity\Db\Fichier;
use Application\Entity\Db\FichierThese;
use Application\Entity\Db\Rapport;
use Application\Entity\Db\Role;
use Application\Entity\Db\Doctorant;
use Application\Entity\Db\Structure;
use Application\Entity\Db\These;
use Application\Entity\Db\UniteRecherche;
use Application\Entity\Db\Utilisateur;
use Doctrine\ORM\EntityRepository;
use UnicaenApp\Service\EntityManagerAwareTrait;
use Zend\Router\RouteMatch as BaseRouteMatch;

/**
 * Ce RouteMatch fournit des accesseurs métiers traduisant en entités ses paramètres éventuels
 * (exemple: 'these', 'fichier').
 *
 * @package Application
 */
class RouteMatch extends BaseRouteMatch
{
    use EntityManagerAwareTrait;

    /**
     * @param BaseRouteMatch $routeMatch
     * @return static
     */
    public static function createFrom(BaseRouteMatch $routeMatch)
    {
        $instance = new static($routeMatch->getParams());
        $instance->setMatchedRouteName($routeMatch->getMatchedRouteName());

        return $instance;
    }

    /**
     * @param string $name Nom du paramètre
     * @return mixed
     */
    private function fetchEntityParam($name)
    {
        $repository = $this->getRepository($name);
        if ($repository === null) {
            return null;
        }

        // c'est un identifiant unique qui doit être spécifié
        $id = $this->getParam($name);

        if (! $id) {
            return null;
        }

        // NB: certaines entités peuvent être recherchées par autre chose que par leur id.
        switch ($name) {
            case 'role':
                $criteria = is_numeric($id) ? ['id' => $id] : ['roleId' => $id];
                break;
            case 'fichier':
                $criteria = ['uuid' => $id];
                break;
            default:
                $criteria = ['id' => $id];
        }

        return $repository->findOneBy($criteria);
    }

    /**
     * @var array
     */
    private $repositories = [];

    /**
     * @param $name
     * @return EntityRepository
     */
    private function getRepository($name)
    {
        if (! isset($this->repositories[$name])) {
            $namespace = __NAMESPACE__ . '\\Entity\\Db';
            $fqcn = $namespace . '\\' . ucfirst($name);
            if (!class_exists($fqcn)) {
                return null;
            }
            $this->repositories[$name] = $this->getEntityManager()->getRepository($fqcn);
        }

        return $this->repositories[$name];
    }

    public function getParams()
    {
        return parent::getParams(); // TODO: Change the autogenerated stub
    }


    /**
     * @var These
     */
    private $these;

    /**
     * @return These
     */
    public function getThese()
    {
        if (null === $this->these) {
            $this->these = $this->fetchEntityParam('these');
        }

        return $this->these;
    }

    /**
     * @var Doctorant
     */
    private $doctorant;

    /**
     * @return Doctorant
     */
    public function getDoctorant()
    {
        if (null === $this->doctorant) {
            $this->doctorant = $this->fetchEntityParam('doctorant');
        }

        return $this->doctorant;
    }

    /**
     * @var Fichier
     */
    private $fichier;

    /**
     * @return Fichier
     */
    public function getFichier()
    {
        if (null === $this->fichier) {
            $this->fichier = $this->fetchEntityParam('fichier');
        }

        return $this->fichier;
    }

    /**
     * @var Utilisateur
     */
    private $utilisateur;

    /**
     * @return Utilisateur
     */
    public function getUtilisateur()
    {
        if (null === $this->utilisateur) {
            $this->utilisateur = $this->fetchEntityParam('utilisateur');
        }

        return $this->utilisateur;
    }

    /**
     * @var Role
     */
    private $role;

    /**
     * @return Role
     */
    public function getRole()
    {
        if (null === $this->role) {
            $this->role = $this->fetchEntityParam('role');
        }

        return $this->role;
    }

    /**
     * @var EcoleDoctorale
     */
    private $ecoleDoctorale;

    /**
     * @return EcoleDoctorale
     */
    public function getEcoleDoctorale()
    {
        if (null === $this->ecoleDoctorale) {
            $this->ecoleDoctorale = $this->fetchEntityParam('ecoleDoctorale');
        }

        return $this->ecoleDoctorale;
    }

    /**
     * @var UniteRecherche
     */
    private $uniteRecherche;

    /**
     * @return UniteRecherche
     */
    public function getUniteRecherche()
    {
        if (null === $this->uniteRecherche) {
            $this->uniteRecherche = $this->fetchEntityParam('uniteRecherche');
        }

        return $this->uniteRecherche;
    }

    /**
     * @var Etablissement
     */
    private $etablissement;

    /**
     * @return Etablissement
     */
    public function getEtablissement()
    {
        if (null === $this->etablissement) {
            $this->etablissement = $this->fetchEntityParam('etablissement');
        }

        return $this->etablissement;
    }

    /** @var Structure */
    private $structure;

    /**
     * @return Structure
     */
    public function getStructure()
    {
        if (null === $this->structure) {
            $this->structure = $this->fetchEntityParam('structure');
        }

        return $this->structure;
    }

    /** @var Rapport */
    private $rapport;

    /**
     * @return Rapport
     */
    public function getRapport()
    {
        if (null === $this->rapport) {
            $this->rapport = $this->fetchEntityParam('rapport');
        }

        return $this->rapport;
    }
}