<?php

namespace Application\Service\ListeDiffusion\Handler;

use Application\Entity\Db\ListeDiffusion;

interface ListeDiffusionHandlerInterface
{
    /**
     * Spécifie la config.
     *
     * @param string[] $config
     */
    public function setConfig(array $config);

    /**
     * Spécifie la liste concernée.
     *
     * @param ListeDiffusion $listeDiffusion
     */
    public function setListeDiffusion(ListeDiffusion $listeDiffusion);

    /**
     * Retourne <code>true</code> si ce plugin sait prendre en charge la liste courante.
     *
     * @return bool
     */
    public function canHandleListeDiffusion();

    /**
     * Initialisation OBLIGATOIRE.
     */
    public function init();

    /**
     * Retourne un tableau contenant les individus pour lesquels une adresse électronique a bien été trouvée.
     *
     * @return string[] [mail => nom individu]
     */
    public function getIndividusAvecAdresse();

    /**
     * Retourne un tableau contenant les individus pour lesquels aucune adresse électronique n'a été trouvée.
     *
     * @return string[] [id individu => nom individu]
     */
    public function getIndividusSansAdresse();

    /**
     * Génération du contenu du fichier attendu par Sympa pour obtenir les ABONNÉS d'une liste de diffusion.
     *
     * @return string
     */
    public function createMemberIncludeFileContent();

    /**
     * Génération du contenu du fichier attendu par Sympa pour obtenir les PROPRIÉTAIRES d'une liste de diffusion.
     *
     * @return string
     */
    public function createOwnerIncludeFileContent();

    /**
     * Génère un nom pour le fichier attendu par Sympa.
     *
     * @param string $prefix
     * @return string
     */
    public function generateResultFileName(string $prefix);
}