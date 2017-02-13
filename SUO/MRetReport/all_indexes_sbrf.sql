use [msqms_db];
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='1et_cc_hap_isc')
BEGIN
	CREATE NONCLUSTERED INDEX [1et_cc_hap_isc] ON [dbo].[Events] 
	(
		[tn] ASC,
		[id] ASC,
		[et] ASC,
		[Happened] ASC,
		[IsCorrected] ASC
	)WITH (PAD_INDEX  = OFF, 
	STATISTICS_NORECOMPUTE  = OFF, 
	SORT_IN_TEMPDB = OFF, 
	IGNORE_DUP_KEY = OFF, 
	DROP_EXISTING = OFF, ONLINE = OFF, 
	ALLOW_ROW_LOCKS  = ON, 
	ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END;

IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='1tn')
BEGIN
	CREATE NONCLUSTERED INDEX [1tn] ON [dbo].[Events] 
	(
		[tn] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF,
	 SORT_IN_TEMPDB = OFF,
	 IGNORE_DUP_KEY = OFF,
	 DROP_EXISTING = OFF,
	 ONLINE = OFF,
	 ALLOW_ROW_LOCKS  = ON,
	 ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END;

IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='1tn_hap')
BEGIN
	CREATE NONCLUSTERED INDEX [1tn_hap] ON [dbo].[Events] 
	(
		[tn] ASC,
		[Happened] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF,
	 SORT_IN_TEMPDB = OFF,
	 IGNORE_DUP_KEY = OFF,
	 DROP_EXISTING = OFF,
	 ONLINE = OFF,
	 ALLOW_ROW_LOCKS  = ON,
	 ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END;

IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='1tn_id')
BEGIN
	CREATE NONCLUSTERED INDEX [1tn_id] ON [dbo].[Events] 
	(
		[id] ASC,
		[tn] ASC
	)WITH (PAD_INDEX  = OFF,
	 STATISTICS_NORECOMPUTE  = OFF,
	 SORT_IN_TEMPDB = OFF,
	 IGNORE_DUP_KEY = OFF,
	 DROP_EXISTING = OFF,
	 ONLINE = OFF,
	 ALLOW_ROW_LOCKS  = ON,
	 ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END;
USE [Msqms_db];
UPDATE [MsQms_db].[dbo].[suo_settings]  SET [value] = '5.6.4' WHERE [name] = 'VER';
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_ET_Happened')
BEGIN
	CREATE NONCLUSTERED INDEX Events_ET_Happened
	on Events (et,Happened)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_et_tnp_Hap')
BEGIN
	CREATE NONCLUSTERED INDEX Events_et_tnp_Hap
	on Events (et,tn,id,Happened)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_Happened')
BEGIN
	CREATE NONCLUSTERED INDEX Events_Happened
	on Events (Happened)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_IsC_et_Hap')
BEGIN
	CREATE NONCLUSTERED INDEX Events_IsC_et_Hap
	on Events (IsCorrected, et, Happened)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_et')
BEGIN
	CREATE NONCLUSTERED INDEX Events_et
	on Events (et)
END;


IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_wassended_et')
BEGIN
	CREATE NONCLUSTERED INDEX Events_wassended_et
	on Events (wassended, et)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_tn_happened')
BEGIN
	CREATE NONCLUSTERED INDEX Events_tn_happened
	on Events (tn, happened)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_cc')
BEGIN
	CREATE NONCLUSTERED INDEX Events_cc
	on Events (cc)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_et_cw')
BEGIN
	CREATE NONCLUSTERED INDEX Events_et_cw
	on Events (et, cw)
END;
IF NOT EXISTS (SELECT * FROM sysindexes WHERE name='Events_tn_et')
BEGIN
	CREATE NONCLUSTERED INDEX Events_tn_et
	on Events (tn, et)
END;