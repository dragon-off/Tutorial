<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Inline Editing: Form Controls</title>

</head>
<body>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try
    {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:qwin5501");

        String sql = "select * from WORKSTA";
        stmt = conn.prepareStatement(sql);

        rs = stmt.executeQuery();
        out.write("<h1>Presidents</h1>");
        out.write("<p>Double click on any cell to edit the field. Click off the field to save your change.</p>");
        while (rs.next()) 
        {
            out.write(rs.getString("BranchNo"));
			out.write("|"+rs.getString("WStation"));
			out.write("|"+rs.getString("Contents")+"<br>");

        }

    }
    catch(Exception e)
    {
        out.write("failed: " + e.toString());
    }
    finally 
    {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>