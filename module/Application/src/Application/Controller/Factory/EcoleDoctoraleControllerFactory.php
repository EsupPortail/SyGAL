<?php

namespace Application\Controller\Factory;

use Application\Controller\EcoleDoctoraleController;
use Application\Form\EcoleDoctoraleForm;
use Application\Service\EcoleDoctorale\EcoleDoctoraleService;
use Application\Service\Etablissement\EtablissementServiceLocateTrait;
use Application\Service\Individu\IndividuService;
use Application\Service\Role\RoleService;
use Application\Service\Structure\StructureService;
use Zend\Mvc\Controller\ControllerManager;

class EcoleDoctoraleControllerFactory
{
    use EtablissementServiceLocateTrait;

    /**
     * Create service
     *
     * @param ControllerManager $controllerManager
     * @return EcoleDoctoraleController
     */
    public function __invoke(ControllerManager $controllerManager)
    {
        $sl = $controllerManager->getServiceLocator();

        /** @var EcoleDoctoraleForm $form */
        $form = $sl->get('FormElementManager')->get('EcoleDoctoraleForm');

        /**
         * @var EcoleDoctoraleService $ecoleDoctoralService
         * @var IndividuService $individuService
         * @var RoleService $roleService
         * @var StructureService $structureService
         */
        $ecoleDoctoralService = $sl->get('EcoleDoctoraleService');
        $individuService = $sl->get('IndividuService');
        $structureService = $sl->get(StructureService::class);
        $roleService = $sl->get('RoleService');

        $controller = new EcoleDoctoraleController();
        $controller->setEcoleDoctoraleService($ecoleDoctoralService);
        $controller->setIndividuService($individuService);
        $controller->setRoleService($roleService);
        $controller->setEtablissementService($this->locateEtablissementService($sl));
        $controller->setEcoleDoctoraleForm($form);
        $controller->setStructureService($structureService);

        return $controller;
    }
}