set define off ;

INSERT INTO /*SYGAL.*/IMPORT_OBSERV (ID, CODE, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, ENABLED) VALUES (6, 'RESULTAT_PASSE_A_ADMIS', 'THESE', 'RESULTAT', 'UPDATE', '1', 'Le résultat de la thèse passe à 1 (admis)', 1) ;
INSERT INTO /*SYGAL.*/IMPORT_OBSERV (ID, CODE, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, ENABLED) VALUES (9, 'CORRECTION_PASSE_A_FACULTATIVE', 'THESE', 'CORREC_AUTORISEE', 'UPDATE', 'facultative', 'Correction attendue passe à facultative', 1) ;
INSERT INTO /*SYGAL.*/IMPORT_OBSERV (ID, CODE, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, ENABLED) VALUES (10, 'CORRECTION_PASSE_A_OBLIGATOIRE', 'THESE', 'CORREC_AUTORISEE', 'UPDATE', 'obligatoire', 'Correction attendue passe à obligatoire', 1) ;
