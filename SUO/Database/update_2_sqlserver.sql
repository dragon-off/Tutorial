
-- -----------------------------------------------------------------------------------------------------------------------
--
-- Microsoft SQL Server Database update script for Q-WIN S
--
-- Script 2:
-- Adding/modifying data in tables
--
-- This script can be used to update database used with any version of Q-WIN from Q-WIN 2000 Q
--
-- Created 2005-05-30 by Ola Carlfalk Q-MATIC Sweden
--
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table CUSTINFO
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM CUSTINFO)
BEGIN
  INSERT INTO CUSTINFO (CustInfoNo,Name,VipLevel,BranchNo) SELECT ISNULL(MAX(CustInfoNo)+1,1),'Default_Customer_1',0,1001 FROM CUSTINFO
  INSERT INTO CUSTINFO (CustInfoNo,Name,VipLevel,BranchNo) SELECT ISNULL(MAX(CustInfoNo)+1,1),'Default_Customer_2',0,1001 FROM CUSTINFO
  UPDATE PARAMS SET LastID = (SELECT MAX(CustInfoNo) FROM CUSTINFO) WHERE TableName = 'CUSTINFO'
END

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table POLICYITEM
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM POLICYITEM)
BEGIN
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('BRANCH','USERGRP',0,'Checkbox','policy.parentBranch');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('GENERAL','USERGRP',0,'Checkbox','policy.parentGeneral');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('CALENDAR','USERGRP',0,'Checkbox','policy.parentCalendar');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('TICKETEDITOR','USERGRP',0,'Checkbox','policy.parentTicketEditor');
  
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('MANAGEMENT_SCREENS','USERGRP',0,'Checkbox','policy.managementScreens');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('STATISTICAL_REPORTS','USERGRP',0,'Checkbox','policy.statisticalReports');
  
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_CALENDAR_LIST','USERGRP','CALENDAR','Checkbox','policy.calendarList');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_CALENDAR_PLAN','USERGRP','CALENDAR','Checkbox','policy.calendarPlan');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('ARV_NOTIFY_DLG','USERGRP','CALENDAR','Checkbox','policy.arvNotifyDlg');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('ARV_LAYOUT_BY_VIP','USERGRP','CALENDAR','Checkbox','policy.layoutByVip');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('RMENU_UNDO_CALL','USERGRP','CALENDAR','Checkbox','policy.rmenuUndoCall');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('RMENU_UNDO_ARR','USERGRP','CALENDAR','Checkbox','policy.rmenuUndoArr');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('EDIT_ARRIVED','USERGRP','CALENDAR','Checkbox','policy.editArrived');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('DELETE_CALLED','USERGRP','CALENDAR','Checkbox','policy.deleteCalled');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('DELETE_ARRIVED','USERGRP','CALENDAR','Checkbox','policy.deleteArrived');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('LST_USE_CALL','USERGRP','CALENDAR','Checkbox','policy.lstUseCall');
  
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_CLIENT_TERMINAL','USERGRP','GENERAL','Checkbox','policy.clientTerminal');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_DESIGNER','USERGRP','GENERAL','Checkbox','policy.designer');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_DISTRIBUTED_MANAGEMENT','USERGRP','GENERAL','Checkbox','policy.distributedManagement');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_STAFF_ADV','USERGRP','GENERAL','Checkbox','policy.staffAdv');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-MATIC_STAFF_BASIC','USERGRP','GENERAL','Checkbox','policy.staffBasic');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('QUICK_TEXT','USERGRP','GENERAL','Checkbox','policy.quickText');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('SERVER_EDITOR','USERGRP','GENERAL','Checkbox','policy.serverEditor');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('STAFF_MANAGEMENT','USERGRP','GENERAL','Checkbox','policy.staffManagement');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('TEXT_EDITOR','USERGRP','TICKETEDITOR','Checkbox','policy.textEditor');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('TEXT_EDITOR_TP','USERGRP','TICKETEDITOR','Checkbox','policy.textEditorTP');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('TEXT_EDITOR_TP_SCRIPT','USERGRP','TICKETEDITOR','Checkbox','policy.textEditorTPScript');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('TEXT_SELECT','USERGRP','TICKETEDITOR','Checkbox','policy.textSelect');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('CUSTOMER_REGISTRATION','USERGRP','GENERAL','Checkbox','policy.customerRegistration');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('Q-WIN_WORKSTATION','USERGRP','GENERAL','Checkbox','policy.q-winWorkstation');

  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('RESET_PASSWORD','USERGRP','GENERAL','Checkbox','policy.resetPassword');
  
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('ENTER_USER_NAME','LOGON',0,'Checkbox','policy.enterUserName');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('LIST_USER_NAME','LOGON',0,'Checkbox','policy.listUserName');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('PSW_NEEDED','LOGON',0,'Checkbox','policy.pswNeeded');
  INSERT INTO POLICYITEM ( Name, ContextType, Parent, Control, Description ) VALUES ('WINDOWS_USER_NAME','LOGON',0,'Checkbox','policy.windowsUserName');
END

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table STAFGRP
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM STAFGRP WHERE Name = 'StaffGroup1')
BEGIN
  INSERT INTO STAFGRP (StafGrpNo,Name,ApptAvail) SELECT ISNULL(MAX(StafGrpNo)+1,1),'StaffGroup1',1 FROM STAFGRP
END

IF NOT EXISTS (SELECT * FROM STAFGRP WHERE Name = 'StaffGroup2')
BEGIN
  INSERT INTO STAFGRP (StafGrpNo,Name,ApptAvail) SELECT ISNULL(MAX(StafGrpNo)+1,1),'StaffGroup2',1 FROM STAFGRP
END

UPDATE PARAMS SET LastID = (SELECT MAX(StafGrpNo) FROM STAFGRP) WHERE TableName = 'STAFGRP'

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table STAFINFO
-- -----------------------------------------------------------------------------------------------------------------------

DECLARE @s_name VARCHAR(40)
DECLARE @s_code INT
DECLARE @s_id INT

SELECT @s_id = ISNULL(MAX(StafInfoNo)+1,1) FROM STAFINFO

SELECT @s_name = 'InstallAdmin', @s_code = 1
IF NOT EXISTS (SELECT * FROM STAFINFO WHERE Name = @s_name)
BEGIN
  INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswAttempts,Code,Priority,LockToButton) SELECT ISNULL(MAX(StafInfoNo)+1,1),@s_name,GETDATE(),0,0,0,0,0,0,'Button1',0,'Administrator','ulan',GETDATE(),0,@s_code,0,@s_code,1,0 FROM STAFINFO
  SET @s_id = @s_id + 1
END

SELECT @s_name = 'Administrator', @s_code = 2
IF NOT EXISTS (SELECT * FROM STAFINFO WHERE Name = @s_name)
BEGIN
  INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswAttempts,Code,Priority,LockToButton) SELECT ISNULL(MAX(StafInfoNo)+1,1),@s_name,GETDATE(),0,0,0,0,0,0,'Button1',0,'Administrator','ulan',GETDATE(),0,@s_code,0,@s_code,1,0 FROM STAFINFO
  SET @s_id = @s_id + 1
END

SELECT @s_name = 'DefaultUser', @s_code = 3
IF NOT EXISTS (SELECT * FROM STAFINFO WHERE Name = @s_name)
BEGIN
  INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswAttempts,Code,Priority,LockToButton) SELECT ISNULL(MAX(StafInfoNo)+1,1),@s_name,GETDATE(),0,0,0,0,0,0,'Button1',0,'Administrator','ulan',GETDATE(),0,@s_code,0,@s_code,1,0 FROM STAFINFO
  SET @s_id = @s_id + 1
END

SELECT @s_name = 'DistManagement', @s_code = 4
IF NOT EXISTS (SELECT * FROM STAFINFO WHERE Name = @s_name)
BEGIN
  INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswAttempts,Code,Priority,LockToButton) SELECT ISNULL(MAX(StafInfoNo)+1,1),@s_name,GETDATE(),0,0,0,0,0,0,'Button1',0,'Administrator','ulan',GETDATE(),0,@s_code,0,@s_code,1,0 FROM STAFINFO
  SET @s_id = @s_id + 1
END

UPDATE PARAMS SET LastID = (SELECT MAX(StafInfoNo) FROM STAFINFO) WHERE TableName = 'STAFINFO'

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table USERGRP
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM USERGRP WHERE Name = 'Install Admin User')
BEGIN
  INSERT INTO USERGRP (UserGrpNo,Name) SELECT ISNULL(MAX(UserGrpNo)+1,1),'Install Admin User' FROM USERGRP
END
IF NOT EXISTS (SELECT * FROM USERGRP WHERE Name = 'Administrator')
BEGIN
  INSERT INTO USERGRP (UserGrpNo,Name) SELECT ISNULL(MAX(UserGrpNo)+1,1),'Administrator' FROM USERGRP
END
IF NOT EXISTS (SELECT * FROM USERGRP WHERE Name = 'Default User')
BEGIN
  INSERT INTO USERGRP (UserGrpNo,Name) SELECT ISNULL(MAX(UserGrpNo)+1,1),'Default User' FROM USERGRP
END
IF NOT EXISTS (SELECT * FROM USERGRP WHERE Name = 'Distributed Management')
BEGIN
  INSERT INTO USERGRP (UserGrpNo,Name) SELECT ISNULL(MAX(UserGrpNo)+1,1),'Distributed Management' FROM USERGRP
END

UPDATE PARAMS SET LastID = (SELECT MAX(UserGrpNo) FROM USERGRP) WHERE TableName = 'USERGRP'

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table PARAMS
-- -----------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM PARAMS WHERE TableName = 'Q-Win Db Version')
  UPDATE PARAMS SET LastID = 5 WHERE TableName = 'Q-Win Db Version'
ELSE
  INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'Q-Win Db Version', 5 );

-- -----------------------------------------------------------------------------------------------------------------------
-- CHANGES in table STGRACCS
-- -----------------------------------------------------------------------------------------------------------------------
DECLARE @ug INT
DECLARE @sg INT

SELECT @ug = UserGrpNo FROM USERGRP WHERE Name = 'Install Admin User'
SELECT @sg = StafGrpNo FROM STAFGRP WHERE Name = 'StaffGroup1'
IF NOT EXISTS (SELECT * FROM STGRACCS WHERE UserGrpNo = @ug AND StafGrpNo = @sg)
  INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES(@ug, @sg,14,0)

SELECT @ug = UserGrpNo FROM USERGRP WHERE Name = 'Administrator'
SELECT @sg = StafGrpNo FROM STAFGRP WHERE Name = 'StaffGroup1'
IF NOT EXISTS (SELECT * FROM STGRACCS WHERE UserGrpNo = @ug AND StafGrpNo = @sg)
  INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES(@ug, @sg,14,0)

SELECT @ug = UserGrpNo FROM USERGRP WHERE Name = 'Default User'
SELECT @sg = StafGrpNo FROM STAFGRP WHERE Name = 'StaffGroup1'
IF NOT EXISTS (SELECT * FROM STGRACCS WHERE UserGrpNo = @ug AND StafGrpNo = @sg)
  INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES(@ug, @sg,14,0)

SELECT @ug = UserGrpNo FROM USERGRP WHERE Name = 'Install Admin User'
SELECT @sg = StafGrpNo FROM STAFGRP WHERE Name = 'StaffGroup2'
IF NOT EXISTS (SELECT * FROM STGRACCS WHERE UserGrpNo = @ug AND StafGrpNo = @sg)
  INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES(@ug, @sg,14,0)

SELECT @ug = UserGrpNo FROM USERGRP WHERE Name = 'Administrator'
SELECT @sg = StafGrpNo FROM STAFGRP WHERE Name = 'StaffGroup2'
IF NOT EXISTS (SELECT * FROM STGRACCS WHERE UserGrpNo = @ug AND StafGrpNo = @sg)
  INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES(@ug, @sg,14,0)

SELECT @ug = UserGrpNo FROM USERGRP WHERE Name = 'Default User'
SELECT @sg = StafGrpNo FROM STAFGRP WHERE Name = 'StaffGroup2'
IF NOT EXISTS (SELECT * FROM STGRACCS WHERE UserGrpNo = @ug AND StafGrpNo = @sg)
  INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES(@ug, @sg,14,0)

-- -----------------------------------------------------------------------------------------------------------------------
-- NEW table POLICY
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM POLICY)
BEGIN

  SELECT @s_name = 'Install Admin User';
  SELECT @s_id = ISNULL(UserGrpNo,0) FROM USERGRP WHERE Name = @s_name;

  IF @s_id > 0
  BEGIN
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','BRANCH','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','GENERAL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','CALENDAR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','MANAGEMENT_SCREENS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_LIST','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DESIGNER','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_ADV','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_BASIC','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','QUICK_TEXT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','SERVER_EDITOR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STAFF_MANAGEMENT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STATISTICAL_REPORTS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP_SCRIPT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_SELECT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_PLAN','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_NOTIFY_DLG','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_LAYOUT_BY_VIP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_ARR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','EDIT_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_CALLED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','LST_USE_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-WIN_WORKSTATION','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RESET_PASSWORD','1');
  END
  
	SELECT @s_name = 'Administrator';
  SELECT @s_id = ISNULL(UserGrpNo,0) FROM USERGRP WHERE Name = @s_name;

  IF @s_id > 0
  BEGIN
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','BRANCH','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','GENERAL','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','CALENDAR','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','MANAGEMENT_SCREENS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_LIST','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DESIGNER','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_ADV','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_BASIC','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','QUICK_TEXT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','SERVER_EDITOR','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STAFF_MANAGEMENT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STATISTICAL_REPORTS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP_SCRIPT','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_SELECT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_PLAN','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_NOTIFY_DLG','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_LAYOUT_BY_VIP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_ARR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','EDIT_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_CALLED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','LST_USE_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-WIN_WORKSTATION','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RESET_PASSWORD','0');
  END
  
	SELECT @s_name = 'Default User';
  SELECT @s_id = ISNULL(UserGrpNo,0) FROM USERGRP WHERE Name = @s_name;

  IF @s_id > 0
  BEGIN
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','BRANCH','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','GENERAL','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','CALENDAR','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','MANAGEMENT_SCREENS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_LIST','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DESIGNER','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_ADV','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_BASIC','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','QUICK_TEXT','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','SERVER_EDITOR','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STAFF_MANAGEMENT','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STATISTICAL_REPORTS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP_SCRIPT','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_SELECT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_PLAN','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_NOTIFY_DLG','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_LAYOUT_BY_VIP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_ARR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','EDIT_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_CALLED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','LST_USE_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-WIN_WORKSTATION','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RESET_PASSWORD','0');
  END
  
	SELECT @s_name = 'Distributed Management';
  SELECT @s_id = ISNULL(UserGrpNo,0) FROM USERGRP WHERE Name = @s_name;

  IF @s_id > 0
  BEGIN
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','BRANCH','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','GENERAL','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','CALENDAR','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','MANAGEMENT_SCREENS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_LIST','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DESIGNER','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_ADV','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_STAFF_BASIC','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','QUICK_TEXT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','SERVER_EDITOR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STAFF_MANAGEMENT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','STATISTICAL_REPORTS','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_EDITOR_TP_SCRIPT','0');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','TEXT_SELECT','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-MATIC_CALENDAR_PLAN','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_NOTIFY_DLG','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','ARV_LAYOUT_BY_VIP','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RMENU_UNDO_ARR','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','EDIT_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_CALLED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','DELETE_ARRIVED','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','LST_USE_CALL','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','Q-WIN_WORKSTATION','1');
    INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES (@s_id,'USERGRP','RESET_PASSWORD','0');
  END
    
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','ENTER_USER_NAME','0');
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','LIST_USER_NAME','1');
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','PSW_NEEDED','0');
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','WINDOWS_USER_NAME','0');

  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','ENTER_USER_NAME','0');
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','LIST_USER_NAME','1');
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','PSW_NEEDED','0');
  INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','WINDOWS_USER_NAME','0');

END

-- -----------------------------------------------------------------------------------------------------------------------
-- New table USERGRPACL
-- -----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM USERGRPACL)
BEGIN
  INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (1,1);
  INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (2,1);
  INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (3,1);
  INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (4,1);
END

-- -----------------------------------------------------------------------------------------------------------------------
-- END
-- -----------------------------------------------------------------------------------------------------------------------

