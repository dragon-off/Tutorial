<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page language="java" import="java.util.Iterator,
java.io.*,
java.sql.*,
webwork.action.ActionSupport,
com.qmatic.ConnectionContext,
com.qmatic.QwinFactory.QWinFactory,
com.qmatic.scripting.Script,
com.qmatic.scripting.ScriptManager,
webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,java.util.List,webwork.action.ActionContext"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ taglib uri="mole" prefix="m" %>

<!--
должен применять обновления
из ЦА (qsp,zip)
// из СМСУО qsp
-->

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
ScriptManager sm;
Script s;
	String len="";
	String fileName="";
	BufferedReader input = null;
	if(request.getParameter("file").length()>1) {
		if(request.getParameter("file").equals("msqms_qsys_script.qsp")) {
			rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('Планировщик заданий','100',CONVERT(datetime, getdate()),'Применение справочников из СМСУО');");

		};
		if(request.getParameter("file").equals("qwin_script.qsp")) {
			rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('Планировщик заданий','100',CONVERT(datetime, getdate()),'Применение справочников из ЦА');");

		};
		
		fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/update/"+request.getParameter("file");
	
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
		input.close();
		 sm = ConnectionContext.getQWinFactory().getScriptManager();
		s = sm.createScript("run", len);
		s.execute();
		sm.killScript(s);
	} catch (IOException e) {
		e.printStackTrace();
	};
   
} else {
		fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/update/msqms_qsys_script.qsp";
	};
	
	
Date dNow = new Date( );
SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy");
String data_now=ft.format(dNow).toString();

String len2="";

	BufferedReader input2 = null;
try {
	FileInputStream  fis2 = new FileInputStream("C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/day_pic.txt");
	input2 = new BufferedReader(new InputStreamReader(fis2,"UTF8"));
} catch (FileNotFoundException e) {
out.println(123);
}

try {
	String tmp2="";
	while ((tmp2 = input2.readLine()) != null)
		len2+=" "+tmp2;
} catch (IOException e) {
	e.printStackTrace();
}
input2.close();

String[] parts = len2.split("#");
String qsp="SETARRAY(491 ARRAY(512)){} SETARRAY(492 ARRAY(512)){} SETARRAY(490 ARRAY(512)){}SETARRAY(493 ARRAY(512)){} ";

for (int i = 0; i < parts.length; i++) 
{
	
	if(i >0) {
		out.print("<br>"+parts[i]);
	} else {
		out.print(parts[i]);

	};
	if(data_now.equals(parts[i]))
	{
		qsp="SETARRAY(491 ARRAY(513)){} SETARRAY(492 ARRAY(513)){} SETARRAY(493 ARRAY(513)){} SETARRAY(490 ARRAY(513))";
		
	};
};
	
sm = ConnectionContext.getQWinFactory().getScriptManager();
out.println(qsp);

s = sm.createScript("run", qsp);
s.execute();
sm.killScript(s);
	
%>  
