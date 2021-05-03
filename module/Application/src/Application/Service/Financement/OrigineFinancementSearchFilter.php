<?php

namespace Application\Service\Financement;

use Application\Search\Filter\SelectSearchFilter;
use Doctrine\ORM\QueryBuilder;

class OrigineFinancementSearchFilter extends SelectSearchFilter
{
    const NAME = 'financement';

    /**
     * @inheritDoc
     */
    protected function __construct(string $label, string $name, array $options, array $attributes = [], $defaultValue = null)
    {
        parent::__construct($label, $name, $options, $attributes, $defaultValue);
    }

    /**
     * @return self
     */
    static public function newInstance(): self
    {
        $instance = new self(
            "Origine<br>financement",
            self::NAME,
            [],
            ['liveSearch' => true]
        );

        return $instance;
    }

    /**
     * @inheritDoc
     */
    public function createValueOptionsFromData(array $data): array
    {
        $options = [];
        $options[] = $this->valueOptionEmpty();
        $options[] = $this->valueOptionUnknown(); // option spéciale pour valeur === null
        foreach ($data as $origine) {
            $options[] = $this->valueOptionEntity($origine, 'getLibelleLong');
        }

        return $options;
    }

    /**
     * @param QueryBuilder $qb
     */
    public function applyToQueryBuilder(QueryBuilder $qb)
    {
        $alias = 'these'; // todo: rendre paramétrable

        $filterValue = $this->getValue();
        if (!$filterValue) {
            return;
        }

        $qb
            ->leftJoin("$alias.financements", 'fin')
            ->leftJoin('fin.origineFinancement', 'orig')
        ;
        if ($filterValue === 'NULL') {
            $qb
                ->andWhere('orig.id IS NULL');
        } else {
            $qb
                ->andWhere('orig.id = :origine')
                ->setParameter('origine', $filterValue);
        }
    }
}