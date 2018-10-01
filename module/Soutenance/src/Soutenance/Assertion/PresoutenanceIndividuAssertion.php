<?php

namespace Soutenance\Assertion;

use Application\Entity\Db\Role;
use Application\Entity\Db\These;
use Application\Service\UserContextServiceAwareTrait;
use Soutenance\Provider\Privilege\SoutenancePrivileges;
use Zend\Permissions\Acl\Acl;
use Zend\Permissions\Acl\Assertion\AssertionInterface;
use Zend\Permissions\Acl\Resource\ResourceInterface;
use Zend\Permissions\Acl\Role\RoleInterface;

class PresoutenanceIndividuAssertion implements  AssertionInterface {
    use UserContextServiceAwareTrait;

    /**
     * !!!! Pour éviter l'erreur "Serialization of 'Closure' is not allowed"... !!!!
     *
     * @return array
     */
    public function __sleep()
    {
        return [];
    }

    public function __invoke($page)
    {
        return true;
    }

    public function assert(Acl $acl, RoleInterface $role = null, ResourceInterface $resource = null, $privilege = null)
    {
        /** @var These $these */
        $these = $resource;

        if ($this->userContextService->getSelectedIdentityRole()->getCode() === Role::CODE_ADMIN_TECH) return true;

        switch ($privilege) {
            case SoutenancePrivileges::SOUTENANCE_ASSOCIATION_MEMBRE_INDIVIDU:
                $role = $this->userContextService->getSelectedIdentityRole();
                return ($role->getCode() === Role::CODE_BDD && $role->getStructure() === $these->getEtablissement()->getStructure());
                break;
            case SoutenancePrivileges::SOUTENANCE_DATE_RETOUR_MODIFICATION:
                $role = $this->userContextService->getSelectedIdentityRole();
                return ($role->getCode() === Role::CODE_BDD && $role->getStructure() === $these->getEtablissement()->getStructure());
                break;
        }

        return false;
    }
}