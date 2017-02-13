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
Comment[10] = "Были внесены изменения в настройку СУО <!-- настройка СУО -->";
Comment[11] = "Вход/Выход пользователя в систему СУО";
Comment[12] = "Вход/Выход пользователя в систему был произведен с ошибкой";
Comment[13] = "Внесены изменения в матрицу приоритетов <!-- матрица приоритетов -->";
Comment[14] = "Внесены изменения в матрицу компетенции <!-- матрица компетенции  матрица компетенций-->";
Comment[15] = "Сохранение изменений общей информации по пользователю";
Comment[16] = "Сохранение изменений во временных настройках тактик";
Comment[17] = "Изменение в настройках площадки <!-- настройки площадки -->";
Comment[18] = "Изменение в настройках статусов окон и специальной регистрации <!-- настройки статусов окон и специальной регистрации  -->";
Comment[19] = "Изменение во временных настройках чередования, времени и начала рабочего дня и др.";
Comment[20] = "Изменение настройки ВСП";
Comment[21] = "Изменение настройки отображения кнопок на экране touchscreen";

response.setContentType("text/html");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
//String connectionUrl = "jdbc:sqlserver://192.168.0.1;" + "databaseName=journal;user=journal;password=journal;";
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
int ComIndex = Integer.parseInt(request.getParameter("ComIndex"));
String DopComment = request.getParameter("Comment");
String Action = request.getParameter("action");
User user = (User)session.getAttribute("QM_USER");
String TypeId = request.getParameter("TypeId");
String UserName = (ComIndex!=12)?user.getUsername():"Неопределено";
out.print("123");



	
ResultSet rs = null;
Statement stmt = null;
 stmt = conn.createStatement(); 
//out.print("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment,action) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"|" +DopComment+"','"+Action+"');");
if(Action.length()>0)
	rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment,action) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"|" +DopComment+"','"+Action+"');");
else
	rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"|" +DopComment+"');");

	 stmt = conn.createStatement();  
%>