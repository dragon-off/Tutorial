-- -----------------------------------------------------------------------------------------------------------------------
--
-- Microsoft SQL Server Database update script for Q-WIN S
--
-- Script 1:
-- Adding/modifying tables and columns
--
-- This script can be used to update database used with any version of Q-WIN from Q-WIN 2000 Q
--
-- Created 2005-05-30 by Ola Carlfalk Q-MATIC Sweden
--
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- DELETE obsolete tables
-- -----------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ACTIVITY')
  DROP TABLE ACTIVITY

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'LOCATION')
  DROP TABLE LOCATION

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'MMACTBRN')
  DROP TABLE MMACTBRN

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table BRANCH
-- -----------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'BRANCH' AND COLUMN_NAME = 'ModemNum')
  ALTER TABLE BRANCH DROP COLUMN ModemNum
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'BRANCH' AND COLUMN_NAME = 'DMUserName')
BEGIN
  ALTER TABLE BRANCH ADD DMUserName VARCHAR(100)
END
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'BRANCH' AND COLUMN_NAME = 'DMPassWord')
BEGIN
  ALTER TABLE BRANCH ADD DMPassWord VARCHAR(100)
END

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table CUSTINFO
-- -----------------------------------------------------------------------------------------------------------------------

ALTER TABLE CUSTINFO ALTER COLUMN EMail VARCHAR(100)

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table MENUACCESS
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'MENUACCESS')
BEGIN
  CREATE TABLE MENUACCESS (
    UsrGrpNo  int,
    HideMenu  int,
    Name      varchar(250));
  CREATE UNIQUE INDEX MENUACCESS ON MENUACCESS ( UsrGrpNo, Name );
  CREATE INDEX MENUACCESS1 ON MENUACCESS ( UsrGrpNo );
END

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table NOTES
-- -----------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOTES ALTER COLUMN NoteText VARCHAR(1000)

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table POLICY
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'POLICY')
BEGIN
  Create Table POLICY (
    ContextValue  varchar(50),
    ContextType   varchar(50),
    PolicyItem    varchar(255),
    PolicyValue   varchar(50));

  Create Index POLICY on POLICY ( ContextValue );
END

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table POLICYITEM
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'POLICYITEM')
BEGIN
  Create Table POLICYITEM (
    Name         varchar(255),
    ContextType  varchar(50),
    Parent       varchar(50) NOT NULL,
    Control      varchar(50),
    Description  varchar(255));
    
  Create Unique Index POLICYITEM on POLICYITEM ( Name );
END

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table PSWDICT
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'PSWDICT')
BEGIN
  Create Table PSWDICT (
    DictWord  varchar(50));

  Create Unique Index PSWDICT on PSWDICT ( DictWord );
END

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table PSWREUSE
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'PSWREUSE')
BEGIN
  Create Table PSWREUSE (
    LogonName  varchar(40),
    LogonPsw   image NULL,
    TmStamp    datetime);

  Create Index PSWREUSE on PSWREUSE ( LogonName, TmStamp );
END

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table STAFINFO
-- -----------------------------------------------------------------------------------------------------------------------

ALTER TABLE STAFINFO ALTER COLUMN EMail VARCHAR(100)

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'LogonPsw')
  ALTER TABLE STAFINFO ADD LogonPsw image NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'DatePsw')
  ALTER TABLE STAFINFO ADD DatePsw DATETIME
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'ChangePsw')
  ALTER TABLE STAFINFO ADD ChangePsw SMALLINT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'LoginId')
  ALTER TABLE STAFINFO ADD LoginId INT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'PswBlocked')
  ALTER TABLE STAFINFO ADD PswBlocked DATETIME
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'PswAttempts')
  ALTER TABLE STAFINFO ADD PswAttempts INT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'Code')
  ALTER TABLE STAFINFO ADD Code INT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'Priority')
  ALTER TABLE STAFINFO ADD Priority INT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'STAFINFO' AND COLUMN_NAME = 'LockToButton')
  ALTER TABLE STAFINFO ADD LockToButton INT

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table USERGRPACL
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'USERGRPACL')
BEGIN
  Create Table USERGRPACL (
    USERGRPID     int,
    ACL_USERGRPID int);
END

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table VISIT
-- -----------------------------------------------------------------------------------------------------------------------

ALTER TABLE VISIT ALTER COLUMN NoteText VARCHAR(1000)

-- -----------------------------------------------------------------------------------------------------------------------
-- END
-- -----------------------------------------------------------------------------------------------------------------------

