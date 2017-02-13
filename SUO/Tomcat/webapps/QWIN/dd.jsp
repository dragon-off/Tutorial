<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page import ="java.net.*" %>
<%@ page import ="java.sql.*" %>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://192.168.0.70:1433;" + "databaseName=master;user=sa;password=spinnaker4ever;";
Connection conn = DriverManager.getConnection(connectionUrl);
Statement stmt = null;
ResultSet rs = null;
stmt = conn.createStatement();
rs = stmt.executeQuery("select * from [master].[dbo].[Journal]; INSERT INTO [master].[dbo].[Journal]([UserName],[type_id],[Comment]) VALUES('fdfsf ',1 ,'אûגאûגאûג ûא ûג');");
  boolean more = rs.next ();
  while (more)
  {
   out.print(rs.getString(1));
   out.print(rs.getString(2));
   out.print(rs.getString(3));
   out.print("<br>");
   more = rs.next ();
  }
%>
