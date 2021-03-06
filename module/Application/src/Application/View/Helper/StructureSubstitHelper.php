<?php

namespace Application\View\Helper;

use Application\Entity\Db\Structure;
use Application\Entity\Db\StructureConcreteInterface;

class StructureSubstitHelper extends AbstractHelper
{
    /**
     * @return string
     */
    public function render()
    {
    }

    /**
     * @param StructureConcreteInterface $structurestructureConcrete
     * @param string                     $logoContent
     * @return string
     */
    public function structureSource(StructureConcreteInterface $structurestructureConcrete, $logoContent)
    {
        $texte = '<div class="panel panel-info" id="panel_' . $structurestructureConcrete->getId() . '" >';
        $texte .= '<div class="panel-heading">';
        $texte .= 'Source : ' . $structurestructureConcrete->getSource() . " - Identifiant : " . $structurestructureConcrete->getStructure()->getId();
        $texte .= '</div>';

        $texte .= '<div class="panel-body">';

        $texte .= '<div class="pull-left">';
        $texte .= '<input type="hidden" id="source" name="sourceIds[]" value="' . $structurestructureConcrete->getStructure()->getId() . '" />';
        $texte .= '<table>';
        $texte .= '<tr>';
        $texte .= '<td><input champ="sigle" id="sigle_' . $structurestructureConcrete->getSigle() . '" type="radio" name="sigle"/> </td>';
        $texte .= '<th> &nbsp; Sigle : &nbsp; </th>';
        $texte .= '<td>' . $structurestructureConcrete->getSigle() . '</td>';
        $texte .= '</tr>';
        $texte .= '<tr>';
        $texte .= '<td><input champ="libelle" id="sigle_' . $structurestructureConcrete->getSigle() . '" type="radio" name="libelle"/> </td>';
        $texte .= '<th> &nbsp; Libellé : &nbsp; </th>';
        $texte .= '<td>' . $structurestructureConcrete->getLibelle() . '</td>';
        $texte .= '</tr>';
        $texte .= '<tr>';
        $texte .= '<td><input champ="code" id="sigle_' . $structurestructureConcrete->getSigle() . '" type="radio" name="code"/> </td>';
        $texte .= '<th> &nbsp; Code : &nbsp; </th>';
        $texte .= '<td>' . $structurestructureConcrete->getStructure()->getCode() . '</td>';
        $texte .= '</tr>';
        $texte .= '</table>';

        $texte .= '<br/>';

        $texte .= '<button class="btn btn-danger supprimer">';
        $texte .= '<span class="glyphicon glyphicon-remove"></span>';
        $texte .= 'Retirer de la substitution';
        $texte .= '</button>';
        $texte .= '</div>';

        $texte .= '<div id="logo-div" class="pull-right ">';
        if ($structurestructureConcrete->getCheminLogo() !== null)
            $texte .= '<input champ="logo" id="logo_' . $structurestructureConcrete->getSigle() . '" type="radio" name="logo" /> &nbsp; ';
        $texte .= '<img class="current" style="max-width: 125px; max-height: 125px; border: 1px solid black; background-color: white;" src="data:image/png;base64,' . base64_encode($logoContent) . '"/>';
        $texte .= '<input class="path" type="hidden" champ="cheminLogo" name="cheminLogo" value="' . $structurestructureConcrete->getStructure()->getCheminLogo() . '"/>';
        $texte .= '</div>';
        $texte .= '</div>';
        $texte .= '</div>';

        return $texte;

    }

    /**
     * @param Structure $structure
     * @param string    $logoContent
     * @return string
     */
    function structureCible(Structure $structure, string $logoContent)
    {
        $texte = "";
        $texte .= '<div class="panel panel-success">';

        $texte .= '    <div class="panel-heading">';
        $texte .= 'Source : ' . $structure->getSource() . " - Identifiant : " . $structure->getId();
        $texte .= '    </div>';

        $texte .= '    <div class="panel-body">';
        $texte .= "<div id='logo-div' class='pull-right'>";
        $texte .= "<input type='hidden' name='cible[cheminLogo]' id='logo' value='" . $structure->getCheminLogo() . "'/>";
        $texte .= "<img id='logo_tmp' style='max-width: 125px; max-height: 125px; border: 1px solid black; background-color: white;' src='data:image/png;base64," . base64_encode($logoContent) . "'/>";
        $texte .= "</div>";

        $texte .= "<br/>";

        $texte .= '<table>';
        $texte .= '    <tr>';
        $texte .= '        <th> Sigle  </th>';
        $texte .= '        <td><input type="text" name="cible[sigle]" id="sigle" value="' . $structure->getSigle() . '"/></td>';
        $texte .= '    </tr>';
        $texte .= '    <tr>';
        $texte .= '        <th> Libellé  &nbsp; </th>';
        $texte .= '        <td><input type="text" name="cible[libelle]" id="libelle" value="' . $structure->getLibelle() . '"/></td>';
        $texte .= '    </tr>';
        $texte .= '    <tr>';
        $texte .= '        <th> Code  </th>';
        $texte .= '        <td><input type="text" name="cible[code]" id="code" value="' . $structure->getCode() . '"/></td>';
        $texte .= '    </tr>';
        $texte .= '</table>';

        $texte .= "</div>";
        $texte .= "</div>";
        $texte .= "</div>";

        return $texte;
    }
}