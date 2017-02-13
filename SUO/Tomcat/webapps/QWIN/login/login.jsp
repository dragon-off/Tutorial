
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

<%@ page import ="java.lang.Integer" %><%
    session.setAttribute("LOGIN", new Boolean(true));
%>

Logged in...


<%
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
	String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
	Connection conn = DriverManager.getConnection(connectionUrl);
	User user = (User)session.getAttribute("QM_USER");
	String UserName = user.getUsername();
	ResultSet rs = null;
	Statement stmt = null;
	stmt = conn.createStatement(); 
	rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+UserName+"','1',CONVERT(datetime, getdate()),N'Вход/Выход пользователя в систему СУО|Вход/Выход пользователя в систему СУО');");
	stmt = conn.createStatement();  
} catch (SQLException e) {
	out.print("Ошибка: "+e);
};
%>