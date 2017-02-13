<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.network.User,
                 java.util.List,
                 java.util.Iterator,
                 webwork.action.ActionContext,
                 com.qmatic.staff.direct2.StaffDAO,
                 com.qmatic.staff.direct2.Member,
                 com.qmatic.web.staff.usergroup.PolicyUtils"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ page import ="java.lang.Integer" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%

response.setContentType("text/html");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=msqms_db;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
String user = request.getParameter("user");
String set_get = request.getParameter("set");
String type_pult = request.getParameter("type_pult");


ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
if(set_get.equals("")) {
	rs = stmt.executeQuery("SELECT "+type_pult+" FROM login_name where un='sberbank\\"+user+"';");
	rs.next();
	out.println(rs.getString(1));
} else {
	stmt.execute("UPDATE login_name SET "+type_pult+" = '"+set_get+"' WHERE un='sberbank\\"+user+"';");
};
conn.close();
%>