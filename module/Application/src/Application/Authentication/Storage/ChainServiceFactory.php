<?php

namespace Application\Authentication\Storage;

use UnicaenAuth\Authentication\Storage\ChainServiceFactory as BaseChainServiceFactory;

/**
 * Ajout d'un storage maison à ceux d'UnicaenApp.
 *
 * @author Bertrand GAUTHIER <bertrand.gauthier at unicaen.fr>
 */
class ChainServiceFactory extends BaseChainServiceFactory
{
    protected $storages = [
        50 => 'Application\Authentication\Storage\AppStorage',
    ];
}