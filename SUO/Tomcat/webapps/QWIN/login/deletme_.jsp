<%@ page import ="java.sql.*" %>
<%@ include file="/login/userpass.jsp" %>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
String username=request.getParameter("username");
String logincode="";
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 
rs = stmt.executeQuery("select * from STAFINFO where [Name]='"+username+"'");
if(rs.next()) { //пользователь есть
	logincode=rs.getString(1);
	//out.println("{\"logincode\":\""+rs.getString(1) + "\", \"loginname\":\"" + rs.getString(2)+"\",");
} else {
	//Создаем нового
	rs = stmt.executeQuery("select max(StafInfoNo)+1 from STAFINFO;INSERT INTO STAFINFO(StafInfoNo,Name,LogonName,LoginId,Code,RegDate) select (max(a.StafInfoNo)+1) as StafInfoNo,'"+username+"' as Name,'"+username+"' as LogonName, (max(a.StafInfoNo)+1) as LoginId, (max(a.StafInfoNo)+1) as Code,getdate() as RegDate from stafinfo a;");
	if(rs.next()) {
		logincode=rs.getString(1);
	};
};
%>