<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.sql.*,com.qmatic.ConnectionContext,com.qmatic.network.User,com.qmatic.web.i18n.Language,java.net.InetAddress,java.net.UnknownHostException"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
User user;

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
user = (User)session.getAttribute("QM_USER");
rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('Планировщик заданий','100',CONVERT(datetime, getdate()),'Вход пользователя: "+user.getUsername()+"');");


%>
