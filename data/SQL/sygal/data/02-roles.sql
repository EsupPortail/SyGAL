
/**
 * 1/ Import des rôles importables.
 */
-- À faire via l'IHM.


/**
 * 2/ Création des rôles non importables.
 */

--delete from ROLE;
INSERT INTO ROLE (
  ID,
  ETABLISSEMENT_ID,
  LIBELLE,
  CODE,
  ROLE_ID,
  SOURCE_CODE,
  SOURCE_ID,
  HISTO_CREATEUR_ID,
  HISTO_MODIFICATEUR_ID)
  with ds (LIBELLE, CODE) as (
    SELECT 'Administrateur technique',   'ADMIN_TECH' from dual union all
    SELECT 'Administrateur',             'ADMIN'      from dual union all
    SELECT 'Bureau des doctorats',       'BDD'        from dual union all
    SELECT 'Bibliothèque universitaire', 'BU'         from dual union all
    SELECT 'Doctorant',                  'DOCTORANT'  from dual
  )
  SELECT
    ROLE_ID_SEQ.nextval,
    etab.id,
    ds.LIBELLE,
    ds.CODE,
    ds.LIBELLE||' '||etab.CODE,
    etab.CODE||'::'||ds.CODE,
    src.id,
    u.id,
    u.id
  FROM ds
    --join ETABLISSEMENT etab on etab.CODE <> 'COMUE'
    join ETABLISSEMENT etab on etab.CODE = etab.CODE
    join SOURCE src on src.CODE = 'COMUE::SYGAL'
    join UTILISATEUR u on u.USERNAME = 'sygal-app'
;

update role set ATTRIB_AUTO = 1, THESE_DEP = 1, STRUCTURE_DEP = 0 where code in (
  'A',
  'B',
  'C',
  'D',
  'M',
  'P',
  'R',
  'DOCTORANT'
);


--------------------------- UTILISATEUR_ROLE -----------------------

--delete from UTILISATEUR_ROLE;
insert into UTILISATEUR_ROLE(UTILISATEUR_ID, ROLE_ID)
  select u.id, r.id
  from UTILISATEUR u, ROLE r
  where u.USERNAME in ('bernardb', 'gauthierb', 'metivier')
        and r.CODE in ('ADMIN_TECH')
;


--------------------------- INDIVIDU_ROLE -----------------------

--delete from INDIVIDU_ROLE;
insert into INDIVIDU_ROLE(ID, INDIVIDU_ID, ROLE_ID)
  with ds(email, code_role, code_etab) as (
    select 'bertrand.gauthier@unicaen.fr',      'ADMIN_TECH', 'UCN' from dual union all
    select 'jean-philippe.metivier@unicaen.fr', 'ADMIN_TECH', 'UCN' from dual union all
    select 'bruno.bernard@unicaen.fr',          'ADMIN_TECH', 'UCN' from dual
  )
  select INDIVIDU_ROLE_ID_SQ.nextval, i.id, r.id from ds
    join INDIVIDU i on i.EMAIL = ds.email
    join ETABLISSEMENT e on e.CODE = ds.code_etab
    join ROLE r on r.SOURCE_CODE = e.code||'::'||ds.code_role
;
