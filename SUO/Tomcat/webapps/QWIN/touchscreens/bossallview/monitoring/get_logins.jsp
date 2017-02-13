<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page language="java" import="java.util.Iterator,java.io.*,java.sql.*,webwork.action.ActionSupport,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,java.util.List,webwork.action.ActionContext, org.json.simple.JSONObject,org.json.simple.parser.JSONParser,org.json.simple.JSONArray"%>
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
ResultSet upd = null;
Statement stmt = null;
stmt = conn.createStatement(); 
rs = stmt.executeQuery("SELECT Name,Code,Comments FROM stafinfo;");

String name="";
out.println("var logins_=[100];");
boolean start=false;
while(rs.next())
{

		name=rs.getString("Comments");
		out.println("logins_["+rs.getString("Code")+"]=\""+name+"\";");
	//out.print("{ \"logincode\":'"+rs.getString("Name")+"', \"name\":\""+rs.getString("Comments")+"\", \"name_old\":\""+rs.getString("Name")+"\"}"); 
};


%>  
logins_[0]="-";