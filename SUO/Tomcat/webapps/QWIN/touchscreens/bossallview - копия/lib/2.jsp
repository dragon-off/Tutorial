<META HTTP-EQUIV="REFRESH" CONTENT="0;URL=http://localhost/logout.action">

<%@ page contentType="text/html; charset=windows-1251" %>
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
    PolicyUtils pu = new PolicyUtils();
%>

<%
String Comment[]=new String[100];
Comment[0] = "Изменена политика группы для групп пользователей";
Comment[1] = "Был изменен состав группы";
Comment[2] = "Был изменен доступ к другим группам";
Comment[3] = "Проведены изменения в информации по группе персонала";
Comment[4] = "Изменен состав группы персонала";
Comment[5] = "Изменен доступ к группе персонала";
Comment[6] = "Изменена общая информация по пользователю";
Comment[7] = "Изменена принадлежность к группе пользователей";
Comment[8] = "Изменена принадлежность к группе персонала";
Comment[9] = "Добавлен новый пользователь/группа пользователей";
Comment[10] = "Были внесены изменения в настройку СУО";
Comment[11] = "Вход/Выход пользователя в систему СУО";
Comment[12] = "Вход/Выход пользователя в систему был произведен с ошибкой";
Comment[13] = "Внесены изменения в матрицу вида окно-операции";
Comment[14] = "Внесены изменения в матрицу вида операции-пользователи";
Comment[15] = "Выход из системы";


response.setContentType("text/html");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
//String connectionUrl = "jdbc:sqlserver://192.168.0.1;" + "databaseName=journal;user=journal;password=journal;";
String connectionUrl = "jdbc:sqlserver://192.168.0.70;" + "databaseName=master;user=sa;password=spinnaker4ever;";
Connection conn = DriverManager.getConnection(connectionUrl);
int ComIndex = Integer.parseInt(request.getParameter("ComIndex"));
User user = (User)session.getAttribute("QM_USER");
String TypeId = request.getParameter("TypeId");
String UserName = (ComIndex!=12)?user.getUsername():"Неопределено";
out.print(Comment[ComIndex]);



	
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"');");
out.print("Hello world");
stmt = conn.createStatement();  
%>