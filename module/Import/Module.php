<?php

namespace Import;

use Application\Entity\Db\ImportObserv;
use Zend\Config\Factory as ConfigFactory;
use Zend\Console\Adapter\AdapterInterface as Console;
use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;

class Module
{
    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }

    public function getConfig()
    {
        return ConfigFactory::fromFiles([
            __DIR__ . '/config/synchro.config.php',
            __DIR__ . '/config/import.config.php',
        ]);
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getConsoleUsage(Console $console)
    {
        return [
            // command
            'import --service=  --etablissement= [--source-code=] [--synchronize=]' => "Importer toutes les données d'un service d'un établissement.",
            // parameters
            ['--service',       "Requis. Identifiant du service, ex: 'variable'"],
            ['--etablissement', "Requis. Identifiant de l'établissement, ex: 'UCN'"],
            ['--source-code',   "Facultatif. Source code du seul enregistrement à importer"],
            ['--synchronize',   "Facultatif. Réaliser ou non la synchro SRC_XXX => XXX. Valeurs possibles: 0, 1. Valeur par défaut: 1."],

            // command
            'import-all --etablissement= [--synchronize=]' => "Importer toutes les données de tous les serviceq d'un établissement.",
            // parameters
            ['--etablissement',          "Requis. Identifiant de l'établissement, ex: 'UCN'"],
            ['--breakOnServiceNotFound', "Facultatif. Faut-il stopper si un service appelé n'existe pas. Valeurs possibles: 0, 1. Valeur par défaut: 1."],
            ['--synchronize',            "Facultatif. Réaliser ou non la synchro SRC_XXX => XXX. Valeurs possibles: 0, 1. Valeur par défaut: 1."],

            // command
            'process-observed-import-results --etablissement= [--import-observ=]' => "Traitement des résultats d'observation de certains changements durant la synchro.",
            // parameters
            ['--etablissement', "Requis. Identifiant de l'établissement, ex: 'UCN'"],
            ['--import-observ', "Facultatif. Code de la seule observation voulue. Valeurs possibles: " . implode(', ', ImportObserv::CODES)],
        ];
    }
}
