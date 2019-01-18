<?php

namespace Soutenance\Assertion;

use Application\Service\UserContextService;
use Zend\ServiceManager\ServiceLocatorInterface;

class PresoutenanceAssertionFactory {

    public function __invoke(ServiceLocatorInterface $serviceLocator)
    {
        /**
         * @var UserContextService $userContext
         */
        $userContext = $serviceLocator->get('UnicaenAuth\Service\UserContext');

        /** @var  $assertion */
        $assertion = new PresoutenanceAssertion();
        $assertion->setUserContextService($userContext);

        return $assertion;

    }
}