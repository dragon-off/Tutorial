<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page language="java" import="java.util.Iterator,
java.io.*,
java.sql.*,
webwork.action.ActionSupport,
com.qmatic.ConnectionContext,
com.qmatic.QwinFactory.QWinFactory,
com.qmatic.scripting.Script,
com.qmatic.scripting.ScriptManager,
webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,
java.util.List,
webwork.action.ActionContext"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ include file="/login/userpass.jsp" %>





<%@ taglib uri="mole" prefix="m" %>


<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('Планировщик заданий','100',CONVERT(datetime, getdate()),'Применение справочников');");


	String len="";
	BufferedReader input = null;
	String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/update/msqms_qsys_script.qsp";
    try {
		FileInputStream fis = new FileInputStream(fileName);
		input = new BufferedReader(new InputStreamReader(fis,"cp1251"));
    } catch (FileNotFoundException e) {
		return;
	}
	try {
		String tmp;
		while ((tmp = input.readLine()) != null)
			len+=" "+tmp;
	} catch (IOException e) {
		e.printStackTrace();
	}
    ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    Script s = sm.createScript("run", len);
	s.execute();
    sm.killScript(s);
   stmt = conn.createStatement(); 
rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('Планировщик заданий','100',CONVERT(datetime, getdate()),'Применение справочников');");

input.close();
	
	 
    
%>  
