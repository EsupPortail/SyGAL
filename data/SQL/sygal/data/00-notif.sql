INSERT INTO IMPORT_NOTIF (ID, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, URL) VALUES (1, 'THESE', 'RESULTAT', 'UPDATE', '1', 'Notification lorsque le résultat de la thèse passe à 1 (admis)', 'https://test.unicaen.fr/sodoct/import/receive-notification');

INSERT INTO IMPORT_OBSERV (ID, CODE, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, ENABLED) VALUES (6, 'RESULTAT_PASSE_A_ADMIS', 'THESE', 'RESULTAT', 'UPDATE', '1', 'Le résultat de la thèse passe à 1 (admis)', 1);
INSERT INTO IMPORT_OBSERV (ID, CODE, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, ENABLED) VALUES (7, 'CORRECTION_PASSE_A_MINEURE', 'THESE', 'CORREC_AUTORISEE', 'UPDATE', 'mineure', 'Correction attendue passe à mineure', 1);
INSERT INTO IMPORT_OBSERV (ID, CODE, TABLE_NAME, COLUMN_NAME, OPERATION, TO_VALUE, DESCRIPTION, ENABLED) VALUES (8, 'CORRECTION_PASSE_A_MAJEURE', 'THESE', 'CORREC_AUTORISEE', 'UPDATE', 'majeure', 'Correction attendue passe à majeure', 1);

INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (2, 6, TO_DATE('2017-09-15 16:07:10', 'YYYY-MM-DD HH24:MI:SS'), '10712', '>1', TO_DATE('2017-09-15 17:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (5, 6, TO_DATE('2017-09-21 15:47:09', 'YYYY-MM-DD HH24:MI:SS'), '10718', '>1', TO_DATE('2017-09-21 16:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (6, 6, TO_DATE('2017-09-25 10:47:10', 'YYYY-MM-DD HH24:MI:SS'), '10102', '>1', TO_DATE('2017-09-25 11:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (10, 8, TO_DATE('2017-10-03 09:37:04', 'YYYY-MM-DD HH24:MI:SS'), '12491', '>majeure', TO_DATE('2017-10-03 10:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (17, 6, TO_DATE('2017-10-25 12:07:01', 'YYYY-MM-DD HH24:MI:SS'), '10926', '>1', TO_DATE('2017-10-25 13:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (44, 6, TO_DATE('2017-11-20 14:16:55', 'YYYY-MM-DD HH24:MI:SS'), '9022', '>1', TO_DATE('2017-11-20 15:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (47, 6, TO_DATE('2017-11-20 15:16:50', 'YYYY-MM-DD HH24:MI:SS'), '10372', '>1', TO_DATE('2017-11-20 16:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (48, 6, TO_DATE('2017-11-20 15:26:57', 'YYYY-MM-DD HH24:MI:SS'), '10730', '>1', TO_DATE('2017-11-20 16:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (49, 6, TO_DATE('2017-11-20 15:26:57', 'YYYY-MM-DD HH24:MI:SS'), '10914', '>1', TO_DATE('2017-11-20 16:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (50, 6, TO_DATE('2017-11-20 16:16:51', 'YYYY-MM-DD HH24:MI:SS'), '10932', '>1', TO_DATE('2017-11-20 17:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (53, 7, TO_DATE('2017-11-28 09:16:57', 'YYYY-MM-DD HH24:MI:SS'), '9974', '>mineure', TO_DATE('2017-11-28 10:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (54, 7, TO_DATE('2017-11-28 14:06:54', 'YYYY-MM-DD HH24:MI:SS'), '10871', '>mineure', TO_DATE('2017-11-28 15:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (62, 6, TO_DATE('2017-12-05 10:56:52', 'YYYY-MM-DD HH24:MI:SS'), '9429', '>1', TO_DATE('2017-12-05 11:00:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (63, 6, TO_DATE('2017-12-05 15:26:59', 'YYYY-MM-DD HH24:MI:SS'), '10881', '>1', TO_DATE('2017-12-05 16:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (64, 7, TO_DATE('2017-12-07 15:36:57', 'YYYY-MM-DD HH24:MI:SS'), '11020', '>mineure', TO_DATE('2017-12-07 16:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (66, 6, TO_DATE('2017-12-12 10:46:49', 'YYYY-MM-DD HH24:MI:SS'), '10726', '>1', TO_DATE('2017-12-12 11:00:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (67, 6, TO_DATE('2017-12-12 11:06:49', 'YYYY-MM-DD HH24:MI:SS'), '10929', '>1', TO_DATE('2017-12-12 12:00:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (68, 7, TO_DATE('2017-12-12 15:36:52', 'YYYY-MM-DD HH24:MI:SS'), '10882', '>mineure', TO_DATE('2017-12-12 16:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (73, 6, TO_DATE('2017-12-13 10:46:50', 'YYYY-MM-DD HH24:MI:SS'), '7669', '>1', TO_DATE('2017-12-13 11:00:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (74, 6, TO_DATE('2017-12-13 10:46:50', 'YYYY-MM-DD HH24:MI:SS'), '9975', '>1', TO_DATE('2017-12-13 11:00:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (75, 6, TO_DATE('2017-12-13 10:56:51', 'YYYY-MM-DD HH24:MI:SS'), '9453', '>1', TO_DATE('2017-12-13 11:00:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (77, 6, TO_DATE('2017-12-14 16:36:58', 'YYYY-MM-DD HH24:MI:SS'), '10882', '>1', TO_DATE('2017-12-14 17:00:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (78, 6, TO_DATE('2017-12-14 16:36:58', 'YYYY-MM-DD HH24:MI:SS'), '9105', '>1', TO_DATE('2017-12-14 17:00:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (79, 6, TO_DATE('2017-12-14 16:56:58', 'YYYY-MM-DD HH24:MI:SS'), '10877', '>1', TO_DATE('2017-12-14 17:00:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (81, 6, TO_DATE('2017-12-15 10:16:48', 'YYYY-MM-DD HH24:MI:SS'), '11028', '>1', TO_DATE('2017-12-15 11:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (82, 7, TO_DATE('2017-12-15 10:16:48', 'YYYY-MM-DD HH24:MI:SS'), '11028', '>mineure', TO_DATE('2017-12-15 11:00:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (83, 6, TO_DATE('2017-12-15 11:16:52', 'YYYY-MM-DD HH24:MI:SS'), '10952', '>1', TO_DATE('2017-12-15 12:00:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (84, 6, TO_DATE('2017-12-15 11:26:50', 'YYYY-MM-DD HH24:MI:SS'), '10739', '>1', TO_DATE('2017-12-15 12:00:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (85, 6, TO_DATE('2017-12-15 11:36:55', 'YYYY-MM-DD HH24:MI:SS'), '10799', '>1', TO_DATE('2017-12-15 12:00:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (86, 7, TO_DATE('2017-12-15 11:36:55', 'YYYY-MM-DD HH24:MI:SS'), '10799', '>mineure', TO_DATE('2017-12-15 12:00:28', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (87, 6, TO_DATE('2017-12-18 10:06:58', 'YYYY-MM-DD HH24:MI:SS'), '9974', '>1', TO_DATE('2017-12-18 11:00:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (94, 6, TO_DATE('2018-01-09 15:16:56', 'YYYY-MM-DD HH24:MI:SS'), '10725', '>1', TO_DATE('2018-01-09 16:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (95, 7, TO_DATE('2018-01-09 15:16:56', 'YYYY-MM-DD HH24:MI:SS'), '10725', '>mineure', TO_DATE('2018-01-09 16:00:15', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (99, 7, TO_DATE('2018-01-12 10:26:49', 'YYYY-MM-DD HH24:MI:SS'), '9944', '>mineure', TO_DATE('2018-01-12 11:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (101, 6, TO_DATE('2018-01-15 14:56:55', 'YYYY-MM-DD HH24:MI:SS'), '11091', '>1', TO_DATE('2018-01-15 15:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (103, 6, TO_DATE('2018-01-15 16:27:00', 'YYYY-MM-DD HH24:MI:SS'), '11276', '>1', TO_DATE('2018-01-15 17:00:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (130, 6, TO_DATE('2018-01-24 12:06:53', 'YYYY-MM-DD HH24:MI:SS'), '10868', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (118, 6, TO_DATE('2018-01-23 15:46:56', 'YYYY-MM-DD HH24:MI:SS'), '8337', '>1', TO_DATE('2018-01-23 16:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (125, 7, TO_DATE('2018-01-24 11:16:53', 'YYYY-MM-DD HH24:MI:SS'), '11959', '>mineure', TO_DATE('2018-01-26 05:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (8, 6, TO_DATE('2017-09-28 15:27:07', 'YYYY-MM-DD HH24:MI:SS'), '10022', '>1', TO_DATE('2017-09-28 16:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (9, 7, TO_DATE('2017-09-28 15:27:07', 'YYYY-MM-DD HH24:MI:SS'), '10022', '>mineure', TO_DATE('2017-09-28 16:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (102, 6, TO_DATE('2018-01-15 16:16:55', 'YYYY-MM-DD HH24:MI:SS'), '12056', '>1', TO_DATE('2018-01-15 17:00:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (104, 7, TO_DATE('2018-01-18 09:56:50', 'YYYY-MM-DD HH24:MI:SS'), '11093', '>mineure', TO_DATE('2018-01-18 10:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (1, 6, TO_DATE('2017-09-15 15:47:14', 'YYYY-MM-DD HH24:MI:SS'), '10470', '>1', TO_DATE('2017-09-15 16:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (3, 6, TO_DATE('2017-09-15 16:37:03', 'YYYY-MM-DD HH24:MI:SS'), '9946', '>1', TO_DATE('2017-09-15 17:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (4, 7, TO_DATE('2017-09-15 16:47:08', 'YYYY-MM-DD HH24:MI:SS'), '10470', '>mineure', null);
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (7, 6, TO_DATE('2017-09-26 14:27:05', 'YYYY-MM-DD HH24:MI:SS'), '10875', '>1', TO_DATE('2017-09-26 15:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (11, 6, TO_DATE('2017-10-03 15:06:59', 'YYYY-MM-DD HH24:MI:SS'), '10022', '>1', TO_DATE('2017-10-03 16:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (12, 6, TO_DATE('2017-10-03 15:47:08', 'YYYY-MM-DD HH24:MI:SS'), '12491', '>1', TO_DATE('2017-10-03 16:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (13, 6, TO_DATE('2017-10-04 08:47:05', 'YYYY-MM-DD HH24:MI:SS'), '10867', '>1', TO_DATE('2017-10-04 09:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (14, 6, TO_DATE('2017-10-04 09:57:00', 'YYYY-MM-DD HH24:MI:SS'), '10732', '>1', TO_DATE('2017-10-04 10:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (15, 6, TO_DATE('2017-10-04 10:37:00', 'YYYY-MM-DD HH24:MI:SS'), '10024', '>1', TO_DATE('2017-10-04 11:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (16, 6, TO_DATE('2017-10-10 11:37:02', 'YYYY-MM-DD HH24:MI:SS'), '12255', '>1', TO_DATE('2017-10-10 12:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (18, 6, TO_DATE('2017-10-25 14:37:09', 'YYYY-MM-DD HH24:MI:SS'), '10862', '>1', TO_DATE('2017-10-25 15:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (19, 6, TO_DATE('2017-10-25 14:37:09', 'YYYY-MM-DD HH24:MI:SS'), '10910', '>1', TO_DATE('2017-10-25 15:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (20, 6, TO_DATE('2017-10-25 14:47:01', 'YYYY-MM-DD HH24:MI:SS'), '10930', '>1', TO_DATE('2017-10-25 15:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (21, 6, TO_DATE('2017-10-25 15:17:04', 'YYYY-MM-DD HH24:MI:SS'), '10067', '>1', TO_DATE('2017-10-25 16:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (22, 6, TO_DATE('2017-10-25 15:27:05', 'YYYY-MM-DD HH24:MI:SS'), '10733', '>1', TO_DATE('2017-10-25 16:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (23, 6, TO_DATE('2017-10-25 15:27:05', 'YYYY-MM-DD HH24:MI:SS'), '10873', '>1', TO_DATE('2017-10-25 16:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (45, 6, TO_DATE('2017-11-20 14:26:47', 'YYYY-MM-DD HH24:MI:SS'), '10727', '>1', TO_DATE('2017-11-20 15:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (51, 6, TO_DATE('2017-11-21 13:56:52', 'YYYY-MM-DD HH24:MI:SS'), '10105', '>1', TO_DATE('2017-11-21 14:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (52, 6, TO_DATE('2017-11-23 15:46:48', 'YYYY-MM-DD HH24:MI:SS'), '10915', '>1', TO_DATE('2017-11-23 16:00:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (55, 6, TO_DATE('2017-12-04 09:56:50', 'YYYY-MM-DD HH24:MI:SS'), '10841', '>1', TO_DATE('2017-12-04 10:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (56, 6, TO_DATE('2017-12-04 10:06:55', 'YYYY-MM-DD HH24:MI:SS'), '10723', '>1', TO_DATE('2017-12-04 11:00:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (57, 6, TO_DATE('2017-12-04 10:06:55', 'YYYY-MM-DD HH24:MI:SS'), '10949', '>1', TO_DATE('2017-12-04 11:00:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (58, 6, TO_DATE('2017-12-04 10:16:54', 'YYYY-MM-DD HH24:MI:SS'), '10916', '>1', TO_DATE('2017-12-04 11:00:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (59, 6, TO_DATE('2017-12-04 10:26:51', 'YYYY-MM-DD HH24:MI:SS'), '10913', '>1', TO_DATE('2017-12-04 11:00:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (60, 6, TO_DATE('2017-12-04 10:56:52', 'YYYY-MM-DD HH24:MI:SS'), '9943', '>1', TO_DATE('2017-12-04 11:00:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (61, 6, TO_DATE('2017-12-04 15:17:02', 'YYYY-MM-DD HH24:MI:SS'), '8995', '>1', TO_DATE('2017-12-04 16:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (65, 7, TO_DATE('2017-12-08 14:36:54', 'YYYY-MM-DD HH24:MI:SS'), '9106', '>mineure', TO_DATE('2017-12-08 15:00:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (69, 6, TO_DATE('2017-12-12 16:16:50', 'YYYY-MM-DD HH24:MI:SS'), '9012', '>1', TO_DATE('2017-12-12 17:00:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (70, 6, TO_DATE('2017-12-12 16:36:55', 'YYYY-MM-DD HH24:MI:SS'), '9944', '>1', TO_DATE('2017-12-12 17:00:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (71, 7, TO_DATE('2017-12-12 16:36:55', 'YYYY-MM-DD HH24:MI:SS'), '9944', '>mineure', TO_DATE('2017-12-12 17:00:22', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (76, 6, TO_DATE('2017-12-13 11:56:57', 'YYYY-MM-DD HH24:MI:SS'), '11959', '>1', TO_DATE('2017-12-13 12:00:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (90, 6, TO_DATE('2017-12-18 14:46:58', 'YYYY-MM-DD HH24:MI:SS'), '11103', '>1', TO_DATE('2017-12-18 15:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (91, 7, TO_DATE('2017-12-18 14:46:58', 'YYYY-MM-DD HH24:MI:SS'), '11103', '>mineure', TO_DATE('2017-12-18 15:00:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (92, 6, TO_DATE('2017-12-18 15:06:58', 'YYYY-MM-DD HH24:MI:SS'), '10899', '>1', TO_DATE('2017-12-18 16:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (93, 7, TO_DATE('2017-12-18 15:06:58', 'YYYY-MM-DD HH24:MI:SS'), '10899', '>mineure', TO_DATE('2017-12-18 16:00:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (97, 6, TO_DATE('2018-01-09 16:16:58', 'YYYY-MM-DD HH24:MI:SS'), '11090', '>1', TO_DATE('2018-01-09 17:00:18', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (98, 6, TO_DATE('2018-01-09 16:46:51', 'YYYY-MM-DD HH24:MI:SS'), '10903', '>1', TO_DATE('2018-01-09 17:00:18', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (100, 7, TO_DATE('2018-01-12 11:26:48', 'YYYY-MM-DD HH24:MI:SS'), '10874', '>mineure', TO_DATE('2018-01-12 12:00:05', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (105, 7, TO_DATE('2018-01-18 16:17:02', 'YYYY-MM-DD HH24:MI:SS'), '10927', '>mineure', TO_DATE('2018-01-18 17:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (106, 7, TO_DATE('2018-01-19 10:26:58', 'YYYY-MM-DD HH24:MI:SS'), '11190', '>mineure', TO_DATE('2018-01-19 11:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (107, 7, TO_DATE('2018-01-19 15:36:58', 'YYYY-MM-DD HH24:MI:SS'), '10919', '>mineure', TO_DATE('2018-01-19 16:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (108, 6, TO_DATE('2018-01-22 11:37:00', 'YYYY-MM-DD HH24:MI:SS'), '11020', '>1', TO_DATE('2018-01-22 12:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (110, 6, TO_DATE('2018-01-22 14:46:50', 'YYYY-MM-DD HH24:MI:SS'), '11102', '>1', TO_DATE('2018-01-22 15:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (111, 6, TO_DATE('2018-01-22 16:56:52', 'YYYY-MM-DD HH24:MI:SS'), '10874', '>1', TO_DATE('2018-01-22 17:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (112, 6, TO_DATE('2018-01-23 11:46:56', 'YYYY-MM-DD HH24:MI:SS'), '6352', '>1', TO_DATE('2018-01-23 12:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (113, 6, TO_DATE('2018-01-23 11:56:55', 'YYYY-MM-DD HH24:MI:SS'), '11020', '>1', TO_DATE('2018-01-23 12:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (114, 6, TO_DATE('2018-01-23 14:16:54', 'YYYY-MM-DD HH24:MI:SS'), '10947', '>1', TO_DATE('2018-01-23 15:00:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (115, 6, TO_DATE('2018-01-23 14:46:56', 'YYYY-MM-DD HH24:MI:SS'), '11023', '>1', TO_DATE('2018-01-23 15:00:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (116, 6, TO_DATE('2018-01-23 14:46:56', 'YYYY-MM-DD HH24:MI:SS'), '9032', '>1', TO_DATE('2018-01-23 15:00:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (117, 6, TO_DATE('2018-01-23 14:56:59', 'YYYY-MM-DD HH24:MI:SS'), '9987', '>1', TO_DATE('2018-01-23 15:00:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (119, 6, TO_DATE('2018-01-23 15:56:53', 'YYYY-MM-DD HH24:MI:SS'), '9727', '>1', TO_DATE('2018-01-23 16:00:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (120, 6, TO_DATE('2018-01-23 16:16:55', 'YYYY-MM-DD HH24:MI:SS'), '10892', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (121, 6, TO_DATE('2018-01-23 16:26:58', 'YYYY-MM-DD HH24:MI:SS'), '11285', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (122, 6, TO_DATE('2018-01-23 16:36:53', 'YYYY-MM-DD HH24:MI:SS'), '10938', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (24, 7, TO_DATE('2017-11-13 10:16:54', 'YYYY-MM-DD HH24:MI:SS'), '10819', '>mineure', TO_DATE('2017-11-13 11:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (46, 6, TO_DATE('2017-11-20 15:06:55', 'YYYY-MM-DD HH24:MI:SS'), '10008', '>1', TO_DATE('2017-11-20 16:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (72, 7, TO_DATE('2017-12-12 17:06:51', 'YYYY-MM-DD HH24:MI:SS'), '9453', '>mineure', TO_DATE('2017-12-13 05:00:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (80, 6, TO_DATE('2017-12-14 17:07:00', 'YYYY-MM-DD HH24:MI:SS'), '8274', '>1', TO_DATE('2017-12-15 05:00:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (88, 6, TO_DATE('2017-12-18 10:36:57', 'YYYY-MM-DD HH24:MI:SS'), '9025', '>1', TO_DATE('2017-12-18 11:00:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (89, 7, TO_DATE('2017-12-18 10:36:57', 'YYYY-MM-DD HH24:MI:SS'), '9025', '>mineure', TO_DATE('2017-12-18 11:00:21', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (96, 6, TO_DATE('2018-01-09 16:06:54', 'YYYY-MM-DD HH24:MI:SS'), '9431', '>1', TO_DATE('2018-01-09 17:00:18', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (109, 7, TO_DATE('2018-01-22 12:06:57', 'YYYY-MM-DD HH24:MI:SS'), '11020', '>mineure', TO_DATE('2018-01-22 13:00:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (123, 6, TO_DATE('2018-01-24 09:26:57', 'YYYY-MM-DD HH24:MI:SS'), '4073', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (124, 6, TO_DATE('2018-01-24 09:36:58', 'YYYY-MM-DD HH24:MI:SS'), '11095', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (126, 6, TO_DATE('2018-01-24 11:36:52', 'YYYY-MM-DD HH24:MI:SS'), '10884', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (127, 6, TO_DATE('2018-01-24 11:46:52', 'YYYY-MM-DD HH24:MI:SS'), '11086', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (128, 6, TO_DATE('2018-01-24 11:46:52', 'YYYY-MM-DD HH24:MI:SS'), '8963', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (129, 7, TO_DATE('2018-01-24 11:56:54', 'YYYY-MM-DD HH24:MI:SS'), '11087', '>mineure', TO_DATE('2018-01-26 05:00:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (131, 6, TO_DATE('2018-01-24 16:46:51', 'YYYY-MM-DD HH24:MI:SS'), '10927', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (132, 6, TO_DATE('2018-01-25 11:06:58', 'YYYY-MM-DD HH24:MI:SS'), '9944', '>1', TO_DATE('2018-01-25 10:13:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO IMPORT_OBSERV_RESULT (ID, IMPORT_OBSERV_ID, DATE_CREATION, SOURCE_CODE, RESULTAT, DATE_NOTIF) VALUES (133, 7, TO_DATE('2018-01-25 14:56:53', 'YYYY-MM-DD HH24:MI:SS'), '8970', '>mineure', TO_DATE('2018-01-26 05:00:12', 'YYYY-MM-DD HH24:MI:SS'));


update IMPORT_OBSERV_RESULT set SOURCE_CODE = 'UCN::'||SOURCE_CODE;

