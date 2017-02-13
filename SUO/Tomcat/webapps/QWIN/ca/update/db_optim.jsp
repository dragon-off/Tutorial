<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page language="java" import="java.util.Iterator,java.io.*,java.sql.*,webwork.action.ActionSupport,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,java.util.List,webwork.action.ActionContext"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>

<%@ taglib uri="mole" prefix="m" %>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;

String len="";
BufferedReader input = null;
String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/update/db_optim.qsp";
try {
	FileInputStream fis = new FileInputStream(fileName);
	input = new BufferedReader(new InputStreamReader(fis,"UTF8"));
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
stmt = conn.createStatement(); 
String gg=s.execute();
out.println(gg);
rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;"+gg);



sm.killScript(s);

input.close();
%>  
