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
Comment[0] = "�������� �������� ������ ��� ����� �������������";
Comment[1] = "��� ������� ������ ������";
Comment[2] = "��� ������� ������ � ������ �������";
Comment[3] = "��������� ��������� � ���������� �� ������ ���������";
Comment[4] = "������� ������ ������ ���������";
Comment[5] = "������� ������ � ������ ���������";
Comment[6] = "�������� ����� ���������� �� ������������";
Comment[7] = "�������� �������������� � ������ �������������";
Comment[8] = "�������� �������������� � ������ ���������";
Comment[9] = "�������� ����� ������������/������ �������������";
Comment[10] = "���� ������� ��������� � ��������� ���";
Comment[11] = "����/����� ������������ � ������� ���";
Comment[12] = "����/����� ������������ � ������� ��� ���������� � �������";
Comment[13] = "������� ��������� � ������� ���� ����-��������";
Comment[14] = "������� ��������� � ������� ���� ��������-������������";
Comment[15] = "����� �� �������";


response.setContentType("text/html");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
//String connectionUrl = "jdbc:sqlserver://192.168.0.1;" + "databaseName=journal;user=journal;password=journal;";
String connectionUrl = "jdbc:sqlserver://192.168.0.70;" + "databaseName=master;user=sa;password=spinnaker4ever;";
Connection conn = DriverManager.getConnection(connectionUrl);
int ComIndex = Integer.parseInt(request.getParameter("ComIndex"));
User user = (User)session.getAttribute("QM_USER");
String TypeId = request.getParameter("TypeId");
String UserName = (ComIndex!=12)?user.getUsername():"������������";
out.print(Comment[ComIndex]);



	
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+UserName+"','"+TypeId+"',CONVERT(datetime, getdate()),N'"+Comment[ComIndex]+"');");
out.print("Hello world");
stmt = conn.createStatement();  
%>