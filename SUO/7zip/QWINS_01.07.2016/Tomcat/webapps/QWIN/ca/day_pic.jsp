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

Date dNow = new Date( );
SimpleDateFormat ft = 
new SimpleDateFormat ("dd.MM.yyyy");
String data_now=ft.format(dNow).toString();

String len="";
BufferedReader input = null;
String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/day_pic.txt";
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
input.close();

String[] parts = len.split("#");
String qsp="SETARRAY(491 ARRAY(512)){} SETARRAY(492 ARRAY(512))";

for (int i = 0; i < parts.length; i++) 
{
	if(data_now.equals(parts[i]))
	{
		qsp="SETARRAY(491 ARRAY(513)){} SETARRAY(492 ARRAY(513))";
		out.println("Day pic");
	};
};
	
ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
Script s = sm.createScript("run", qsp);
s.execute();
sm.killScript(s);

%>  
