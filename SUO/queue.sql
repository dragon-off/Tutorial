
# Access: Short, Long, Text, Number, DateTime '1999-10-22 08:30:45.000', LongBinary

# Tables
#
# APPOINT      Actual meeting data for the appointment planner
# APPTGRP      Groups for appointments that is not customer related, rooms, ...
# APPTITEM     Items for each group above in the appointment planner.
# BRANCH       Select outside branch data
# BUTTON       Lookup table for Ticket Button names
# CATEGRY      Lookup table for Category names
# CAUSEDTY     Descripton table only
# CUSTINFO     Customer Registration data
# CUSTPICT     Customer Picture data
# DBFILTER     Validation of entries into the database.
# EVENT        Statisital records for Events.
# EVENTTYP     Descripton table only
# LOGIN        Lookup table for Login settings
# MATERTYP     Lookup table for Matter code names
# MATTER       Statisital records for Matter codes.
# MENUACCESS   Holds Menuitems to be hidden for user groups
# MMSTAGRP
# MMUGRBRH
# MMUSRGRP
# MMWWWSRP     Indicates rights to Stat reports on the WWW, link between layout files and User Groups
# NOTES        Notes attached to a customer also pre screened customers.
# PARAMS       Holds next ID value for all tables.
# PSWDICT      Dictionary words preventing user from entering common words as password.
# PSWREUSE     Prevent user from using same password
# PRINTER      Lookup table for Ticket Printer names
# SELECTTY     Holds value enter for selection at Gender, Socila Status, Family status, Classification in Customer Registration
# STACCESS
# STAFGRP      Registration of groups for the Appointmnet planner
# STAFINFO     Staff Member Registration data
# STAFWORK     Keep tracks of limit of working time in Staff Scheduling
# STATUSTY     Descripton table only
# STGRACCS
# USERGRP      Registration of Users in Staff Member Registration
# USERGRPACL   User group access
# WORKSTA      Lookup table for Work Station names
# VIPLEVEL     Descripton table only
# VISIT        Statisital records for Customers visit.
# VISITPICT    Customer Picture data
# WWWSRP       Keep all layout files valid for WEB access.


# ---------------------------- APPOINT ---------------------------- #

Create Table APPOINT (
  ApptID      Long,
  StafInfoNo  Long,
  RegDate     DateTime,
  PlanGrp     Long,
  PlanId      Long,
  AppGrp      Long,
  AppId       Long,
  AppDate     DateTime,
  AppTime     DateTime,
  AppLength   Short,
  State       Short,
  QueueNo     Short,
  QNoPreset   Short,
  Comments    Text(250));

Create Unique Index APPOINT on APPOINT ( ApptID );
Create Index APPOINT2 on APPOINT ( AppDate, AppGrp, AppId );
Create Index APPOINT3 on APPOINT ( PlanId, PlanGrp, AppDate, AppGrp, AppId, AppTime );
Create Index APPOINT4 on APPOINT ( AppDate, PlanGrp, PlanId );

# ---------------------------- APPTGRP ---------------------------- #

Create Table APPTGRP (
  AppGrp    Long,
  Contents  Text(40));

Create Unique Index APPTGRP on APPTGRP ( AppGrp );

# ---------------------------- APPTITEM --------------------------- #

Create Table APPTITEM (
  AppId     Long,
  AppGrp    Long,
  Color     Long,
  Contents  Text(40));

Create Unique Index APPTITEM on APPTITEM ( AppId );

# ---------------------------- BRANCH --------------------------- #

Create Table BRANCH (
  BranchId    Long,
  BranchNo    Long,
  HashId      Long,
  Name        Text(50),
  TreeName    Text(250),
  Address     Text(250),
  City        Text(30),
  Country     Text(30),
  Notes       Text(50),
  PhoneNum    Text(30),
  Connection  Text(40),
  DirStat     Text(250),
  SetupFile   Text(250),
  SetupInfo   Text(50),
  SetupCatch  Short,
  UseRmDb     Short,
  ImSthSth    Short,
  ImSthDb     Short,
  ImDbDb      Short,
  ExpDbDb     Short,
  TrSthLdate  DateTime,
  TrDbLDate   DateTime,
  TrDbLTime   DateTime,
  ExBranchNo  Long,
  LockSlot    Short,
  TransSched  LongBinary,
  DMUserName  Text(100),
  DMPassWord  Text(100));
  
Create Unique Index BRANCH on BRANCH ( BranchId );

INSERT INTO BRANCH (BranchId,BranchNo,HashId,Name,TreeName,Connection,DirStat,SetupFile,SetupCatch,UseRmDb,ImSthSth,ImSthDb,ImDbDb,ExpDbDb,TrSthLdate,TrDbLDate,TrDbLTime,ExBranchNo,LockSlot,DMUserName,DMPassWord) VALUES (1,1001,503736078,'Local server','Local server','DIRECT','STAT','QSYS.INI',0,1,1,0,0,0,0,0,0,0,0,'DistManagement','');

# ---------------------------- BUTTON ---------------------------- #

Create Table BUTTON (
  BranchNo  Long,
  Button    Short,
  Contents  Text(40));
  
Create Unique Index BUTTON on BUTTON ( BranchNo, Button );
Create Index BUTTON2 on BUTTON ( Button );

INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,1,'Button 1');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,2,'Button 2');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,3,'Button 3');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,4,'Button 4');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,5,'Button 5');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,6,'Button 6');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,7,'Button 7');
INSERT INTO BUTTON (BranchNo, Button, Contents) VALUES (1001,8,'Button 8');

# ---------------------------- CATEGRY ---------------------------- #

Create Table CATEGRY (
  BranchNo  Long,
  Category  Short,
  Contents  Text(40));
  
Create Unique Index CATEGRY on CATEGRY ( BranchNo, Category );
Create Index CATEGRY2 on CATEGRY ( Category );

INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,1,'Category 1');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,2,'Category 2');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,3,'Category 3');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,4,'Category 4');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,5,'Category 5');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,6,'Category 6');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,7,'Category 7');
INSERT INTO CATEGRY (BranchNo, Category, Contents) VALUES (1001,8,'Category 8');

# ---------------------------- CAUSEDTY --------------------------- #

Create Table CAUSEDTY (
  CausedType  Short,
  Contents    Text(40));
  
Create Unique Index CAUSEDTY on CAUSEDTY ( CausedType );


Insert into CAUSEDTY ( CausedType, Contents ) values ( 1 , 'By Parked'        ); #define STAT_CAUSED_PARK		 	1
Insert into CAUSEDTY ( CausedType, Contents ) values ( 2 , 'By Next'          ); #define STAT_CAUSED_NEXT		 	2
Insert into CAUSEDTY ( CausedType, Contents ) values ( 3 , 'By Close'         ); #define STAT_CAUSED_CLOSE		 	3
Insert into CAUSEDTY ( CausedType, Contents ) values ( 4 , 'By Insert First'  ); #define STAT_CAUSED_INSERT_FIRST_MOVE   	4
Insert into CAUSEDTY ( CausedType, Contents ) values ( 5 , 'By Insert Last'   ); #define STAT_CAUSED_INSERT_LAST_MOVE    	5
Insert into CAUSEDTY ( CausedType, Contents ) values ( 6 , 'By Insert Move'   ); #define STAT_CAUSED_INSERT_SORT_MOVE    	6
Insert into CAUSEDTY ( CausedType, Contents ) values ( 7 , 'By Insert Pos.'   ); #define STAT_CAUSED_INSERT_POS_MOVE     	7
Insert into CAUSEDTY ( CausedType, Contents ) values ( 8 , 'By Insert Sort'   ); #define STAT_CAUSED_INSERT_SORT_TIME    	8
Insert into CAUSEDTY ( CausedType, Contents ) values ( 9 , 'By Transfer'      ); #define STAT_CAUSED_TRANSFER  	    		9
Insert into CAUSEDTY ( CausedType, Contents ) values (10 , 'By Move Ticket'   ); #define STAT_CAUSED_MOVE_TICKET       		10 	/* Kunden har f†tt ny lapp med samma track nummer */
Insert into CAUSEDTY ( CausedType, Contents ) values (11 , 'By Move Cust.'    ); #define STAT_CAUSED_MOVE_CUSTOMER     		11 	/* Kunden har blivit kallad och direkt ”verflyttad i en ny grupp */
Insert into CAUSEDTY ( CausedType, Contents ) values (12 , 'By End Customer'  ); #define STAT_CAUSED_END_CUSTOMER      		12 	/* Kunden avslutad med funktion FUNC_END_CUSTOMER */
Insert into CAUSEDTY ( CausedType, Contents ) values (13 , 'By Block End'     ); #define STAT_CAUSED_BLOCK_END   		13 	/* Kunden avslutad med funktion FUNC_BLOCK_NEXT_END */
Insert into CAUSEDTY ( CausedType, Contents ) values (14 , 'By Ins Recycle'   ); #define STAT_CAUSED_INSERT_RECYCLE   		14 	/* Kunden avslutad med funktion FUNC_INSERT_RECYCLE */
Insert into CAUSEDTY ( CausedType, Contents ) values (15 , 'By Park Next'     ); #define STAT_CAUSED_PARK_NEXT        		15 	/* Kunden avslutad i och med ny kund kallas fr†n park med FUNC_PARK_NEXT */
Insert into CAUSEDTY ( CausedType, Contents ) values (16 , 'By Ins Sort Ent'  ); #define STAT_CAUSED_INSERT_SORT_ENTER_TIME   	16
Insert into CAUSEDTY ( CausedType, Contents ) values (17 , 'By Ins Sort App'  ); #define STAT_CAUSED_INSERT_SORT_APPOINT_TIME  	17
Insert into CAUSEDTY ( CausedType, Contents ) values (18 , 'By Ins First Move'); #define STAT_CAUSED_UNDO_INSERT_FIRST_MOVE	18

# ---------------------------- CUSTINFO --------------------------- #

Create Table CUSTINFO (
  CustInfoNo  Long,
  Name        Text(40) NULL,
  Address     Text(150) NULL,
  Town        Text(30) NULL,
  ZIPCode     Text(15) NULL,
  State       Text(20) NULL,
  Country     Text(30) NULL,
  Phone       Text(40) NULL,
  Phone2      Text(40) NULL,
  EMail       Text(100) NULL,
  PINo        Text(40) NULL,
  AccountNo   Text(60) NULL,
  CardNum     Text(150) NULL,
  Title       Text(10) NULL,
  RegDate     DateTime,
  Born        Text(20) NULL,
  VipLevel    Short,
  Gender      Text(20) NULL,
  Social      Text(20) NULL,
  Family      Text(20) NULL,
  Class       Text(20) NULL,
  Comments    Text(250) NULL,
  BranchNo    Long,
  TmStamp     DateTime);
  
Create Unique Index CUSTINFO on CUSTINFO ( CustInfoNo );
Create Index CUSTINF2 on CUSTINFO ( Name );
Create Index CUSTINF3 on CUSTINFO ( PINo );
Create Index CUSTINF4 on CUSTINFO ( CardNum );
Create Index CUSTINF5 on CUSTINFO ( AccountNo );

INSERT INTO CUSTINFO (CustInfoNo,Name,VipLevel,BranchNo) VALUES (1,'Default Customer 1',0,1001);
INSERT INTO CUSTINFO (CustInfoNo,Name,VipLevel,BranchNo) VALUES (2,'Default Customer 2',0,1001);

# ---------------------------- CUSTPICT --------------------------- #

Create Table CUSTPICT (
  CustInfoNo  Long,
  TmStamp     DateTime,
  PictData    LongBinary);
  
Create Unique Index CUSTPICT on CUSTPICT ( CustInfoNo );

# ----------------------------- DBFILTER --------------------------- #
# Each DB control can have input validation indicated in this table

Create Table DBFILTER (
  TableName   Text(20),
  ColumnName  Text(20),
  FiltType    Long,
  FiltValue   Text(40),
  MinLen      Long,
  Comments    Text(40));
  
Create Unique Index DBFILTER on DBFILTER ( TableName, ColumnName );

# ----------------------------- EVENT ---------------------------- #

Create Table EVENT (
  BranchNo   Long,
  TmStamp    DateTime,
  RegDate    DateTime,
  RegTime    DateTime,
  EventType  Short,
  WStation   Short,
  Category   Short,
  Button     Short,
  Printer    Short,
  Display    Short,
  LoginId    Short,
  QueueNo    Short);
  
Create Index EVENT1 on EVENT ( BranchNo, RegDate, EventType, RegTime );

# ---------------------------- EVENTTYP --------------------------- #

Create Table EVENTTYP (
  EventType  Short,
  Contents   Text(40));
  
Create Unique Index EVENTTY1 on EVENTTYP ( EventType );

Insert into EVENTTYP ( EventType, Contents ) values ( 1 , 'Open Workstation'                 ); #define STAT_EVENT_WORKSTATION_OPEN     1
Insert into EVENTTYP ( EventType, Contents ) values ( 2 , 'Close Workstation'                ); #define STAT_EVENT_WORKSTATION_CLOSE    2
Insert into EVENTTYP ( EventType, Contents ) values ( 3 , 'Confirm Next'                     ); #define STAT_EVENT_WORKSTATION_CONFIRM  3
Insert into EVENTTYP ( EventType, Contents ) values ( 4 , 'User Loged On'                    ); #define STAT_EVENT_USER_LOGON           4
Insert into EVENTTYP ( EventType, Contents ) values ( 5 , 'User Loged Off'                   ); #define STAT_EVENT_USER_LOGOFF          5
Insert into EVENTTYP ( EventType, Contents ) values ( 6 , 'Number Inserted on Main Display'  ); #define STAT_EVENT_MAIN_DISPLAY_INSERT  6
Insert into EVENTTYP ( EventType, Contents ) values ( 7 , 'Number Inserted On Panel Display' ); #define STAT_EVENT_PANEL_DISPLAY_INSERT 7
Insert into EVENTTYP ( EventType, Contents ) values ( 8 , 'Number Remoed from Panel Display' ); #define STAT_EVENT_PANEL_DISPLAY_REMOVE 8
Insert into EVENTTYP ( EventType, Contents ) values ( 9 , 'Ticket Printed'                   ); #define STAT_EVENT_PRINTER              9
Insert into EVENTTYP ( EventType, Contents ) values ( 10, 'From Script'                      ); #define STAT_EVENT_SCRIPT       	10
Insert into EVENTTYP ( EventType, Contents ) values ( 11, 'Work Station remove number'       ); #define STAT_EVENT_WORKSTATION_REMOVE   11
Insert into EVENTTYP ( EventType, Contents ) values ( 12, 'Main Display'                     ); #define STAT_EVENT_MAIN_DISPLAY		12

# ----------------------------- LOGIN ----------------------------- #

Create Table LOGIN (
  BranchNo   Long,
  LoginId    Short,
  LoginCode  Short,
  Priority   Short,
  Button     Short,
  Contents   Text(40));
  
Create Unique Index LOGIN on LOGIN ( BranchNo, LoginId );
Create Index LOGIN2 on LOGIN ( LoginId );
Create Index LOGIN3 on LOGIN ( LoginCode );
Create Index LOGIN4 on LOGIN ( Contents );

# ---------------------------- MATERTYP --------------------------- #

Create Table MATERTYP (
  BranchNo  Long,
  Code      Short,
  Contents  Text(40));
  
Create Unique Index MATERTYP on MATERTYP ( BranchNo, Code );

# ----------------------------- MATTER ---------------------------- #

Create Table MATTER (
  BranchNo   Long,
  TmStamp    DateTime,
  RegDate    DateTime,
  TransId    Long,
  TrackNo    Short,
  StartTime  DateTime,
  EndTime    DateTime,
  Code       Short);
  
Create Index MATTER on MATTER ( BranchNo, RegDate, TrackNo, StartTime );
Create Index MATTER1 on MATTER ( BranchNo, TransID );

# ----------------------------- MENUACCESS --------------------------- #
# Menu Access


Create Table MENUACCESS (
  UsrGrpNo  Long,
  HideMenu  Long,
  Name      Text(250));
  
Create Unique Index MENUACCESS on MENUACCESS ( UsrGrpNo, Name );
Create Index MENUACCESS1 on MENUACCESS ( UsrGrpNo );


# ---------------------------- MMSTAGRP --------------------------- #

Create Table MMSTAGRP (
  StafGrpNo   Long,
  StafInfoNo  Long );
  
Create Index MMSTAGRP  on MMSTAGRP ( StafGrpNo );
Create Index MMSTAGRP1 on MMSTAGRP ( StafInfoNo );

INSERT INTO MMSTAGRP (StafGrpNo,StafInfoNo) VALUES (1,1);
INSERT INTO MMSTAGRP (StafGrpNo,StafInfoNo) VALUES (2,2);
INSERT INTO MMSTAGRP (StafGrpNo,StafInfoNo) VALUES (1,3);
INSERT INTO MMSTAGRP (StafGrpNo,StafInfoNo) VALUES (2,3);

# ---------------------------- MMUGRBRH --------------------------- #

Create Table MMUGRBRH (
  UserGrpNo  Long,
  HashId     Long );
  
Create Index MMUGRBRH  on MMUGRBRH ( UserGrpNo );
Create Index MMUGRBRH1 on MMUGRBRH ( HashId );

INSERT INTO MMUGRBRH (UserGrpNo,HashId) VALUES (1,503736078);
INSERT INTO MMUGRBRH (UserGrpNo,HashId) VALUES (1,1644953654);
INSERT INTO MMUGRBRH (UserGrpNo,HashId) VALUES (1,1935764555);

# ---------------------------- MMUSRGRP --------------------------- #

Create Table MMUSRGRP (
  UserNo     Long,
  UserGrpNo  Long );
  
Create Index MMUSRGRP  on MMUSRGRP ( UserNo );
Create Index MMUSRGRP1 on MMUSRGRP ( UserGrpNo );

INSERT INTO MMUSRGRP (UserNo,UserGrpNo) VALUES (1,1);
INSERT INTO MMUSRGRP (UserNo,UserGrpNo) VALUES (2,2);
INSERT INTO MMUSRGRP (UserNo,UserGrpNo) VALUES (3,3);
INSERT INTO MMUSRGRP (UserNo,UserGrpNo) VALUES (4,4);

# ---------------------------- MMWWWSRP --------------------------- #

Create Table MMWWWSRP (
  UserGrpNo  Long,
  LayoutNo   Long );
  
Create Index MMWWWSRP  on MMWWWSRP ( UserGrpNo );
Create Index MMWWWSRP1 on MMWWWSRP ( LayoutNo );

# ------------------------------ NOTES ---------------------------- #

Create Table NOTES (
  BranchNo    Long,
  NotesID     Long,
  TmStamp     DateTime,
  RegDate     DateTime,
  TransId     Long,
  TrackNo     Short,
  ApptID      Long,
  StartTime   DateTime,
  EndTime     DateTime,
  Button      Short,
  CodeTime    Short,
  Code        Short,
  Items       Short,
  APrice      Number,
  StatusType  Short,
  Type1       Text(20),
  Type2       Text(20),
  Text1       Text(40),
  Text2       Text(40),
  NoteText    Memo);
  
Create Unique Index NOTES on NOTES ( BranchNo, NotesID );
Create Index NOTES1 on NOTES ( BranchNo, TransID );
Create Index NOTES2 on NOTES ( BranchNo, TrackNo );
Create Index NOTES3 on NOTES ( BranchNo, ApptID  );
Create Index NOTES4 on NOTES ( BranchNo, TrackNo, RegDate );

# ---------------------------- PARAMS ----------------------------- #

Create Table PARAMS (
  TableName  Text(20),
  LastID     Long);
  
Create Unique Index PARAMS on PARAMS ( TableName );

INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'BRANCH',   1 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'CUSTINFO', 2 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'APPOINT',  1 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'APPSKILL', 1 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'APPTGRP',  3 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'Q-Win Db Version', 5 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'NOTES',  1 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'STAFGRP',  2 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'STAFINFO',  4 );
INSERT INTO PARAMS ( TableName, LastID ) VALUES ( 'USERGRP',  4 );

# ---------------------------- POLICY ----------------------------- #

Create Table POLICY (
  ContextValue  Text(50),
  ContextType   Text(50),
  PolicyItem    Text(255),
  PolicyValue   Text(50));
  
Create Index POLICY on POLICY ( ContextValue );

INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','BRANCH','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','GENERAL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','CALENDAR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','MANAGEMENT_SCREENS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_CALENDAR_LIST','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_DESIGNER','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_STAFF_ADV','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_STAFF_BASIC','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','QUICK_TEXT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','SERVER_EDITOR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','STAFF_MANAGEMENT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','STATISTICAL_REPORTS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','TEXT_EDITOR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','TEXT_EDITOR_TP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','TEXT_EDITOR_TP_SCRIPT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','TEXT_SELECT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-MATIC_CALENDAR_PLAN','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','ARV_NOTIFY_DLG','1'); 
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','ARV_LAYOUT_BY_VIP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','RMENU_UNDO_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','RMENU_UNDO_ARR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','EDIT_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','DELETE_CALLED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','DELETE_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','LST_USE_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','Q-WIN_WORKSTATION','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('1','USERGRP','RESET_PASSWORD','1');

INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','BRANCH','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','GENERAL','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','CALENDAR','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','MANAGEMENT_SCREENS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_CALENDAR_LIST','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_DESIGNER','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_STAFF_ADV','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_STAFF_BASIC','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','QUICK_TEXT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','SERVER_EDITOR','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','STAFF_MANAGEMENT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','STATISTICAL_REPORTS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','TEXT_EDITOR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','TEXT_EDITOR_TP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','TEXT_EDITOR_TP_SCRIPT','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','TEXT_SELECT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-MATIC_CALENDAR_PLAN','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','ARV_NOTIFY_DLG','1'); 
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','ARV_LAYOUT_BY_VIP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','RMENU_UNDO_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','RMENU_UNDO_ARR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','EDIT_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','DELETE_CALLED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','DELETE_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','LST_USE_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','Q-WIN_WORKSTATION','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('2','USERGRP','RESET_PASSWORD','0');

INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','BRANCH','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','GENERAL','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','CALENDAR','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','MANAGEMENT_SCREENS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_CALENDAR_LIST','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_DESIGNER','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_STAFF_ADV','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_STAFF_BASIC','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','QUICK_TEXT','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','SERVER_EDITOR','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','STAFF_MANAGEMENT','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','STATISTICAL_REPORTS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','TEXT_EDITOR','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','TEXT_EDITOR_TP','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','TEXT_EDITOR_TP_SCRIPT','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','TEXT_SELECT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-MATIC_CALENDAR_PLAN','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','ARV_NOTIFY_DLG','1'); 
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','ARV_LAYOUT_BY_VIP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','RMENU_UNDO_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','RMENU_UNDO_ARR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','EDIT_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','DELETE_CALLED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','DELETE_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','LST_USE_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','Q-WIN_WORKSTATION','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('3','USERGRP','RESET_PASSWORD','0');

INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','BRANCH','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','GENERAL','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','CALENDAR','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','MANAGEMENT_SCREENS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_CALENDAR_LIST','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_CLIENT_TERMINAL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_DESIGNER','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_DISTRIBUTED_MANAGEMENT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_STAFF_ADV','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_STAFF_BASIC','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','QUICK_TEXT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','SERVER_EDITOR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','STAFF_MANAGEMENT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','STATISTICAL_REPORTS','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','TEXT_EDITOR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','TEXT_EDITOR_TP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','TEXT_EDITOR_TP_SCRIPT','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','TEXT_SELECT','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-MATIC_CALENDAR_PLAN','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','ARV_NOTIFY_DLG','1'); 
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','ARV_LAYOUT_BY_VIP','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','RMENU_UNDO_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','RMENU_UNDO_ARR','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','EDIT_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','DELETE_CALLED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','DELETE_ARRIVED','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','LST_USE_CALL','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','Q-WIN_WORKSTATION','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('4','USERGRP','RESET_PASSWORD','0');

INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','ENTER_USER_NAME','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','LIST_USER_NAME','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','PSW_NEEDED','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_CLIENT','LOGON','WINDOWS_USER_NAME','0');

INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','ENTER_USER_NAME','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','LIST_USER_NAME','1');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','PSW_NEEDED','0');
INSERT INTO POLICY ( ContextValue, ContextType, PolicyItem, PolicyValue ) VALUES ('QWIN_APICLIENT','LOGON','WINDOWS_USER_NAME','0');

# ---------------------------- POLICYITEM ----------------------------- #

Create Table POLICYITEM (
  Name         Text(255),
  ContextType  Text(50),
  Parent       Text(50) NOT NULL,
  Control      Text(50),
  Description  Text(255));
  
Create Unique Index POLICYITEM on POLICYITEM ( Name );

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

# ---------------------------- PSWDICT ----------------------------- #

Create Table PSWDICT (
  DictWord  Text(50));

Create Unique Index PSWDICT on PSWDICT ( DictWord );

# ---------------------------- PSWREUSE ----------------------------- #

Create Table PSWREUSE (
  LogonName  Text(40),
  LogonPsw   LongBinary NULL,
  TmStamp    DateTime);
  
Create Index PSWREUSE on PSWREUSE ( LogonName, TmStamp );

# ---------------------------- PRINTER ---------------------------- #

Create Table PRINTER (
  BranchNo  Long,
  Printer   Short,
  Contents  Text(40));
  
Create Unique Index PRINTER on PRINTER ( BranchNo, Printer );
Create Index PRINTER2 on PRINTER ( Printer );

INSERT INTO PRINTER (BranchNo,Printer,Contents) VALUES (1001,1,'Printer 1');

# ----------------------------- SELECTTY --------------------------- #

Create Table SELECTTY (
  SelectId    Long,
  TypeVal     Long,
  Contents    Text(40),
  TableName   Text(20),
  ColumnName  Text(20));
  
Create Unique Index SELECTTY on SELECTTY ( SelectId );
Create Index SELECTY1 on SELECTTY ( TableName, ColumnName, Contents );

# ----------------------------- SELECTTY --------------------------- #

Create Table STACCESS (
  StafInfoNo  Long,
  WorkDate    DateTime,
  WorkStart   DateTime,
  WorkEnd     DateTime,
  AccessLev   Short,
  Comments    Text(40));
  
Create Unique Index STACCESS on STACCESS( StafInfoNo, WorkDate, WorkStart );
Create Index STACCES2 on STACCESS ( StafInfoNo );

# ----------------------------- STAFGRP --------------------------- #

Create Table STAFGRP (
  StafGrpNo  Long,
  Name       Text(50),
  ApptAvail  Long );
  
Create Unique Index STAFGRP on STAFGRP ( StafGrpNo );

INSERT INTO STAFGRP (StafGrpNo,Name,ApptAvail) VALUES (1,'StaffGroup1',1);
INSERT INTO STAFGRP (StafGrpNo,Name,ApptAvail) VALUES (2,'StaffGroup2',1);

# ----------------------------- STAFINFO --------------------------- #

Create Table STAFINFO (
  StafInfoNo   Long,
  Name         Text(100) NULL,
  Address      Text(40) NULL,
  ZIPCode      Text(15) NULL,
  Town         Text(30) NULL,
  PINo         Text(40) NULL,
  Phone        Text(40) NULL,
  RegDate      DateTime,
  Comments     Text(40) NULL,
  StaffGroup   Text(20) NULL,
  Salary       Number,
  WorkStart    DateTime,
  WorkEnd      DateTime,
  WorkMax1     Number,
  WorkWeek1    Short,
  WorkMax2     Number,
  WorkWeek2    Short,
  WorkMonth2   Short,
  ButtonName   Text(30) NULL,
  UserAccess   Long,
  LogonName    Text(40) NULL,
  WebUser      Text(30) NULL,
  WebPsw       Text(30) NULL,
  WebUserDir   Text(50) NULL,
  OfficePrn    Text(50) NULL,
  Pager        Text(30) NULL,
  EMail        Text(100) NULL,
  LogonPsw     LongBinary NULL,
  DatePsw      DateTime,
  ChangePsw    Short,
  LoginId      Long,
  PswBlocked   DateTime,
  PswAttempts  Short,
  Code         Short,
  Priority     Short,
  LockToButton Short);
  
Create Unique Index STAFINFO on STAFINFO ( StafInfoNo );
Create Index STAFINF2 on STAFINFO ( Name );
Create Index STAFINF3 on STAFINFO ( PINo );
Create Index STAFINF4 on STAFINFO ( LogonName );

INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkStart,WorkEnd,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswBlocked,PswAttempts,Code,Priority,LockToButton) VALUES (1,'InstallAdmin',0,0,0,0,0,0,0,0,0,'Button1',0,'InstallAdmin',NULL,0,0,1,0,0,1,1,0);    
INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkStart,WorkEnd,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswBlocked,PswAttempts,Code,Priority,LockToButton) VALUES (2,'Administrator',0,0,0,0,0,0,0,0,0,'Button1',0,'Administrator',NULL,0,0,2,0,0,2,1,0);  
INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkStart,WorkEnd,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswBlocked,PswAttempts,Code,Priority,LockToButton) VALUES (3,'DefaultUser',0,0,0,0,0,0,0,0,0,'Button1',0,'DefaultUser',NULL,0,0,3,0,0,3,1,0);      
INSERT INTO STAFINFO (StafInfoNo,Name,RegDate,Salary,WorkStart,WorkEnd,WorkMax1,WorkWeek1,WorkMax2,WorkWeek2,WorkMonth2,ButtonName,UserAccess,LogonName,LogonPsw,DatePsw,ChangePsw,LoginId,PswBlocked,PswAttempts,Code,Priority,LockToButton) VALUES (4,'DistManagement',0,0,0,0,0,0,0,0,0,'Button1',0,'DistManagement',NULL,0,0,4,0,0,4,1,0);

# ----------------------------- STAFWORK --------------------------- #

Create Table STAFWORK (
  BranchNo    Long,
  StafInfoNo  Long,
  WorkDate    DateTime,
  WorkTime    DateTime,
  WorkLength  Short,
  ActDefault  Short,
  Activity    Short,
  ActivityNo  Short);
  
Create Unique Index STAFWORK on STAFWORK( StafInfoNo, WorkDate, WorkTime );
Create Index STAFWOR2 on STAFWORK ( StafInfoNo, WorkDate, WorkTime );
Create Index STAFWRK3 on STAFWORK ( BranchNo, WorkDate, WorkTime );

# ----------------------------- STATUSTY --------------------------- #

Create Table STATUSTY (
  StatusType  Short,
  Contents    Text(40));
  
Create Unique Index STATUSTY on STATUSTY ( StatusType );


Insert into STATUSTY ( StatusType, Contents ) values ( 1 , 'Waiting'); #define DB_STATUS_WAITING	"1"
Insert into STATUSTY ( StatusType, Contents ) values ( 2 , 'Reseted'); #define DB_STATUS_RESETED	"2"
Insert into STATUSTY ( StatusType, Contents ) values ( 3 , 'Cleared'); #define DB_STATUS_CLEARED	"3"
Insert into STATUSTY ( StatusType, Contents ) values ( 4 , 'Removed'); #define DB_STATUS_REMOVED	"4"
Insert into STATUSTY ( StatusType, Contents ) values ( 5 , 'Serving'); #define DB_STATUS_SERVING	"5"
Insert into STATUSTY ( StatusType, Contents ) values ( 6 , 'Served' ); #define DB_STATUS_SERVED		"6"

# ----------------------------- STGRACCS --------------------------- #

Create Table STGRACCS (
  UserGrpNo  Long,
  StafGrpNo  Long,
  StafFlag   Long,
  ApptFlag   Long,
  SchedFlag  Long );
  
Create Index STGRACCS on STGRACCS ( UserGrpNo );
Create Index STGRACCS1 on STGRACCS ( StafGrpNo );

INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES (1,1,14,0);
INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES (2,1,14,0);
INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES (3,1,14,0);
INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES (1,2,14,0);
INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES (2,2,14,0);
INSERT INTO STGRACCS (UserGrpNo,StafGrpNo,ApptFlag,SchedFlag) VALUES (3,2,14,0);

# ----------------------------- USERGRP --------------------------- #

Create Table USERGRP (
  UserGrpNo  Long,
  Name       Text(50));
  
Create Unique Index USERGRP on USERGRP ( UserGrpNo );

INSERT INTO USERGRP (UserGrpNo,Name) VALUES (1,'Install Admin User');
INSERT INTO USERGRP (UserGrpNo,Name) VALUES (2,'Administrator');
INSERT INTO USERGRP (UserGrpNo,Name) VALUES (3,'Default User');
INSERT INTO USERGRP (UserGrpNo,Name) VALUES (4,'Distributed Management');

# ----------------------------- USERGRPACL ------------------------ #

Create Table USERGRPACL (
  USERGRPID     Long,
  ACL_USERGRPID Long);
  
INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (1,1);
INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (2,1);
INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (3,1);
INSERT INTO USERGRPACL (USERGRPID,ACL_USERGRPID) VALUES (4,1);

# ----------------------------- WORKSTA --------------------------- #

Create Table WORKSTA (
  BranchNo  Long,
  WStation  Short,
  Contents  Text(40));
  
Create Unique Index WORKSTA on WORKSTA ( BranchNo, WStation );
Create Index WORKSTA2 on WORKSTA ( WStation );

INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,1,'Counter 1');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,2,'Counter 2');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,3,'Counter 3');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,4,'Counter 4');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,5,'Counter 5');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,6,'Counter 6');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,7,'Counter 7');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,8,'Counter 8');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,9,'Counter 9');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,10,'Counter 10');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,11,'Counter 11');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,12,'Counter 12');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,13,'Counter 13');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,14,'Counter 14');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,15,'Counter 15');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,16,'Counter 16');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,17,'Counter 17');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,18,'Counter 18');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,19,'Counter 19');
INSERT INTO WORKSTA (BranchNo,WStation,Contents) VALUES (1001,20,'Counter 20');

# ----------------------------- VIPLEVEL --------------------------- #

Create Table VIPLEVEL (
  VipLevel  Short,
  Contents  Text(40));
  
Create Unique Index VIPLEVEL on VIPLEVEL ( VipLevel );

# ----------------------------- VISIT ---------------------------- #

Create Table VISIT (
BranchNo    Long,
BranchName  Text(20),
TmStamp     DateTime,
RegDate     DateTime,
TransId     Long,
TrackNo     Short,
AppTime     DateTime,
EnterTime   DateTime,
StartTime   DateTime,
NextTime    DateTime,
ConfTime    DateTime,
EndTime     DateTime,
Button      Short,
Category    Short,
LoginId     Short,
Printer     Short,
Priority    Short,
WStation    Short,
QueueNo     Short,
CausedType  Short,
StatusType  Short,
QueuePos    Short,
Schedule    Text(40),
BtnName     Text(20),
CatName     Text(20),
LoginName   Text(20),
CustInfoNo  Long,
StafInfoNo  Long,
NoteText    Memo);

Create Unique Index VISIT on VISIT ( BranchNo, RegDate, Category, StartTime, TrackNo );
Create Index VISIT1 on VISIT ( BranchNo, RegDate, Category, StatusType, QueuePos );
Create Index VISIT2 on VISIT ( CustInfoNo );

# ---------------------------- VISITPICT --------------------------- #

Create Table VISITPICT (
  TrackNo   Short,
  RegDate   DateTime,
  TmStamp   DateTime,
  PictData  LongBinary);
  
Create Unique Index VISITPICT on VISITPICT ( TrackNo, RegDate );

# ----------------------------- WWWSRP --------------------------- #
# WWW staff report

Create Table WWWSRP (
  PolicyItem  Text(100),
  LayoutName  Text(50),
  LayoutPath  Text(250));
  
Create Unique Index WWWSRP on WWWSRP ( PolicyItem );

# ----------------------------------------------------------------- #


