<?php

namespace Application\Service\Role;

use Application\Entity\Db\Individu;
use Application\Entity\Db\IndividuRole;
use Application\Entity\Db\Repository\RoleRepository;
use Application\Entity\Db\Role;
use Application\Service\BaseService;
use Application\Entity\Db\Structure;
use Doctrine\ORM\Query\Expr\Join;

class RoleService extends BaseService
{
    /**
     * @return RoleRepository
     */
    public function getRepository()
    {
        /** @var RoleRepository $repo */
        $repo = $this->entityManager->getRepository(Role::class);

        return $repo;
    }

    public function getRolesByStructure(Structure $structure)
    {
        $repo = $this->entityManager->getRepository( Role::class);
        $qb = $repo->createQueryBuilder("ro")
            ->andWhere("ro.structure = :structure")
        ;
        $qb->setParameter('structure', $structure);
        return $qb->getQuery()->execute();
    }

    public function getIndividuByStructure(Structure $structure) {
        $repo = $this->entityManager->getRepository( IndividuRole::class);
        $qb = $repo->createQueryBuilder("ir")
            ->select("i")
            ->leftJoin("individu", "i", "WITH", "ir.individu_id = i.id")
            ->andWhere('ir.structure = structure')
            ->setParameter("structure", $structure);
        return $qb->getQuery()->execute();
    }

    /**
     * @param int $individuSourceCode
     * @return IndividuRole[]
     */
    public function getIndividuRolesByIndividuSourceCode($individuSourceCode)
    {
        $repo = $this->entityManager->getRepository(IndividuRole::class);
        $qb = $repo->createQueryBuilder("ro")
            ->addSelect('i, r')
            ->join('ro.individu', 'i', Join::WITH, 'i.sourceCode = :sourceCode')
            ->join('ro.role', 'r')
            ->setParameter('sourceCode', $individuSourceCode);
        return $qb->getQuery()->execute();
    }


    public function getRoleById($roleId) {
        $repo = $this->entityManager->getRepository(Role::class);
        $individuRole = $repo->findOneBy(["id" => $roleId]);
        return $individuRole;
    }

    public function getIndividuRoleById($individuRoleId) {
        $repo = $this->entityManager->getRepository(IndividuRole::class);
        $individuRole = $repo->findOneBy(["id" => $individuRoleId]);
        return $individuRole;
    }


    /**
     * @param int $individuRoleId
     * @return null|object
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function removeIndividuRoleById($individuRoleId) {
        $individuRole = $this->getIndividuRoleById($individuRoleId);
        $this->entityManager->remove($individuRole);
        $this->entityManager->flush($individuRole);
        return $individuRole;
    }

    public function addIndividuRole(Individu $individu, Role $role) {
        $ur = new IndividuRole();
        $ur->setIndividu($individu);
        $ur->setRole($role);
        $this->getEntityManager()->persist($ur);
        $this->getEntityManager()->flush($ur);
        return $ur;
    }

}