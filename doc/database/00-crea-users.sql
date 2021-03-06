--
-- Tablespace, user, etc.
--
--
-- ATTENTION, ce sript doit être personnalisé pour votre contexte :
--
--      Taille du tablespace (cf. `SIZE`).
--      Mot de passe du user "SYGAL" (cf `IDENTIFIED BY`).
--



--
-- Tablespace
--
CREATE TABLESPACE SYGAL_TS DATAFILE 'SYGAL_TS' SIZE 8000000000;

--
-- User
--
CREATE USER "SYGAL" IDENTIFIED BY "azerty" DEFAULT TABLESPACE "SYGAL_TS" TEMPORARY TABLESPACE "TEMP";

--
-- Grants
--
GRANT "CONNECT" TO "SYGAL";
GRANT "RESOURCE" TO "SYGAL";
GRANT "SELECT_CATALOG_ROLE" TO "SYGAL";
GRANT CREATE JOB TO "SYGAL";
GRANT FLASHBACK ANY TABLE TO "SYGAL";
GRANT DEBUG ANY PROCEDURE TO "SYGAL";
GRANT DEBUG CONNECT SESSION TO "SYGAL";
GRANT SELECT ANY DICTIONARY TO "SYGAL";
GRANT ON COMMIT REFRESH TO "SYGAL";
GRANT CREATE MATERIALIZED VIEW TO "SYGAL";
GRANT CREATE DATABASE LINK TO "SYGAL";
GRANT CREATE VIEW TO "SYGAL";
GRANT DROP PUBLIC SYNONYM TO "SYGAL";
GRANT CREATE PUBLIC SYNONYM TO "SYGAL";
GRANT UNLIMITED TABLESPACE TO "SYGAL";
GRANT ALTER SESSION TO "SYGAL";
GRANT SELECT ON "SYS"."DBA_ROLE_PRIVS" TO "SYGAL";
GRANT SELECT ON "SYS"."DBA_TAB_PRIVS" TO "SYGAL";
GRANT SELECT ON "SYS"."DBA_ROLES" TO "SYGAL";
GRANT FLASHBACK ON "SYS"."ALL_SOURCE" TO "SYGAL";
GRANT EXECUTE ON "SYS"."DBMS_LOCK" TO "SYGAL";
GRANT EXECUTE ON "SYS"."DBMS_ALERT" TO "SYGAL";
