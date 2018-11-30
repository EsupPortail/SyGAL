<?php

namespace Application\Service\These\Factory;

use Application\Service\Notification\NotifierService;
use Application\Service\These\TheseService;
use Application\Service\UserContextService;
use Application\Service\Validation\ValidationService;
use Application\Service\Variable\VariableService;
use Zend\ServiceManager\ServiceLocatorInterface;

class TheseServiceFactory
{
    /**
     * Create service
     *
     * @param ServiceLocatorInterface $serviveManager
     * @return TheseService
     */
    public function __invoke(ServiceLocatorInterface $serviveManager)
    {
        /**
         * @var ValidationService $validationService
         * @var NotifierService $notifierService
         * @var VariableService $variableService
         * @var UserContextService $userContextService
         */
        $validationService = $serviveManager->get('ValidationService');
        $notifierService = $serviveManager->get(NotifierService::class);
        $variableService = $serviveManager->get('VariableService');
        $userContextService = $serviveManager->get('UserContextService');

        $service = new TheseService();
        $service->setValidationService($validationService);
        $service->setNotifierService($notifierService);
        $service->setVariableService($variableService);
        $service->setUserContextService($userContextService);

        return $service;
    }
}
