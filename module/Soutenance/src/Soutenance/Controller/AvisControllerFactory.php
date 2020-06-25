<?php

namespace Soutenance\Controller;

use Application\Service\Acteur\ActeurService;
use Application\Service\Fichier\FichierService;
use Application\Service\FichierThese\FichierTheseService;
use Application\Service\These\TheseService;
use Interop\Container\ContainerInterface;
use Soutenance\Form\Avis\AvisForm;
use Soutenance\Service\Avis\AvisService;
use Soutenance\Service\Membre\MembreService;
use Soutenance\Service\Notifier\NotifierSoutenanceService;
use Soutenance\Service\Proposition\PropositionService;
use Soutenance\Service\Validation\ValidationService;
use Zend\Mvc\Controller\ControllerManager;

class AvisControllerFactory
{
    /**
     * @param ContainerInterface $manager
     * @return AvisController
     */
    public function __invoke(ContainerInterface $manager)
    {

        /**
         * @var ActeurService $acteurService
         * @var AvisService $avisService
         * @var FichierService $fichierService
         * @var FichierTheseService $fichierTheseService
         * @var MembreService $membreService
         * @var NotifierSoutenanceService $notifierSoutenanceService
         * @var PropositionService $propositionService
         * @var TheseService $theseService
         * @var ValidationService $validationService
         */
        $acteurService              = $manager->getServiceLocator()->get(ActeurService::class);
        $avisService                = $manager->getServiceLocator()->get(AvisService::class);
        $fichierService             = $manager->getServiceLocator()->get('FichierService');
        $fichierTheseService        = $manager->getServiceLocator()->get('FichierTheseService');
        $membreService              = $manager->getServiceLocator()->get(MembreService::class);
        $notifierSoutenanceService  = $manager->getServiceLocator()->get(NotifierSoutenanceService::class);
        $propositionService         = $manager->getServiceLocator()->get(PropositionService::class);
        $theseService               = $manager->getServiceLocator()->get('TheseService');
        $validationService          = $manager->getServiceLocator()->get(ValidationService::class);

        /**
         * @var AvisForm $avisForm
         */
        $avisForm = $manager->getServiceLocator()->get('FormElementManager')->get(AvisForm::class);

        /** @var AvisController $controller */
        $controller = new AvisController();
        $controller->setTheseService($theseService);
        $controller->setValidationService($validationService);
        $controller->setActeurService($acteurService);
        $controller->setNotifierSoutenanceService($notifierSoutenanceService);
        $controller->setPropositionService($propositionService);
        $controller->setFichierService($fichierService);
        $controller->setFichierTheseService($fichierTheseService);
        $controller->setAvisService($avisService);
        $controller->setMembreService($membreService);

        $controller->setAvisForm($avisForm);

        return $controller;
    }
}