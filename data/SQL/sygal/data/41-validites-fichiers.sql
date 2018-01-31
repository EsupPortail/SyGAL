--delete from VALIDITE_FICHIER;

insert into VALIDITE_FICHIER(
  ID,
  FICHIER_ID,
  EST_VALIDE,
  HISTO_CREATEUR_ID,
  HISTO_MODIFICATEUR_ID,
  HISTO_DESTRUCTION,
  HISTO_DESTRUCTEUR_ID,
  HISTO_CREATION,
  HISTO_MODIFICATION,
  LOG,
  MESSAGE
)
  select
    ID,
    FICHIER_ID,
    EST_VALIDE,
    HISTO_CREATEUR_ID,
    HISTO_MODIFICATEUR_ID,
    HISTO_DESTRUCTION,
    HISTO_DESTRUCTEUR_ID,
    HISTO_CREATION,
    HISTO_MODIFICATION,
    LOG,
    MESSAGE
  from sodoct.VALIDITE_FICHIER@DOCTPROD
;


-- avancement de la sequence
DECLARE
  maxid NUMBER;
  nextval NUMBER;
BEGIN
  select max(id) into maxid from VALIDITE_FICHIER;
  loop
    select VALIDITE_FICHIER_ID_SEQ.nextval into nextval from dual;
    EXIT WHEN maxid < nextval;
  end loop;
END;
/

