<?php

namespace Soutenance\Form\Justificatif;

use Application\Entity\Db\Fichier;
use Application\Service\FichierThese\FichierTheseServiceAwareTrait;
use Zend\Stdlib\Hydrator\HydratorInterface;

class JusticatifHydrator implements HydratorInterface {
    use FichierTheseServiceAwareTrait;

    /**
     * NB : ne devrait pas servir ...
     * @param Fichier $object
     * @return array
     */
    public function extract($object)
    {
        $data  = [
            'nature' => ($object && $object->getNature())?$object->getNature()->getCode(): null,
            'fichier' => null,
        ];
        return $data;
    }

    /**
     * @param array $data
     * @param Fichier $object
     * @return Fichier
     */
    public function hydrate(array $data, $object)
    {
        $nature = $this->fichierTheseService->fetchNatureFichier($data['nature']);
        $object->setNature($nature);
        return $object;
    }

}