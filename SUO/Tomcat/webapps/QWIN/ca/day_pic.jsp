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
ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
Script s;
String qsp;
int key_pic=0;
String len="";
BufferedReader input = null;
String fileName;
fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/ca/day_pic.txt";
FileInputStream fis;
String tmp;
String[] parts;
Date dNow = new Date( );
SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy");
String data_now=ft.format(dNow).toString();


Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=msqms_db;user="+db_username+";password="+db_password+";";
//String username=request.getParameter("username");

Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
rs = stmt.executeQuery("select * from takt_day where [mdate]='"+data_now+"'");
if(rs.next()) { //день есть в бд значит не чего не делаем, так как день начался и день пик либо задан либо нет
	
} else {	// если день не задан, проверям, сегодня день пик или нет и создаем запись в бд
	//создаем день
		key_pic=0;
		len="";
		input = null;
		try {
			fis = new FileInputStream(fileName);
			input = new BufferedReader(new InputStreamReader(fis,"UTF8"));
		} catch (FileNotFoundException e) {
			return;
		}
		try {
			tmp="";
			while ((tmp = input.readLine()) != null)
				len+=" "+tmp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		input.close();
		parts = len.split("#");
		for (int i = 0; i < parts.length; i++) 
		{
			if(data_now.equals(parts[i].trim())) //если день пик
			{
				qsp="SETARRAY(491 ARRAY(513)){} SETARRAY(492 ARRAY(513)){} SETARRAY(493 ARRAY(513)){} SETARRAY(490 ARRAY(513)){}ARRAY(513)";
				s = sm.createScript("run", qsp);
				stmt.execute("INSERT INTO takt_day(MDATE,value,pic) VALUES ('"+parts[i]+"',"+s.execute()+",1);");
				sm.killScript(s);
				key_pic=1;
			};
		}; //end for
		if(key_pic==0)
		{
			qsp="SETARRAY(491 ARRAY(512)){} SETARRAY(492 ARRAY(512)){} SETARRAY(490 ARRAY(512)){}SETARRAY(493 ARRAY(512)){}ARRAY(512)";
			s = sm.createScript("run", qsp);
			stmt.execute("INSERT INTO takt_day(MDATE,value,pic) VALUES ('"+data_now+"',"+s.execute()+",0);");
			sm.killScript(s);
		};
};
input = null;
try {
	fis = new FileInputStream(fileName);
	input = new BufferedReader(new InputStreamReader(fis,"UTF8"));
} catch (FileNotFoundException e) {
	return;
}
tmp="";
len="";
try {
	while ((tmp = input.readLine()) != null)
		len+=" "+tmp;
} catch (IOException e) {
	e.printStackTrace();
}
input.close();
parts = len.split("#");
for (int i = 0; i < parts.length; i++) 
{
	if(i >0) {
		out.print(","+parts[i]);
	} else {
		out.print(parts[i]);
	};
};
%>  
