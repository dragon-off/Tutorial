<!DOCTYPE HTML PUBLIC  "loose.dtd">
<html>
<head>
<title>Journal</title>
<LINK REL="StyleSheet" HREF="style.css" TYPE="text/css">
<script language='javascript'>
function close_salert(el)
{
var elem = parent.frames[0].document.getElementById('blockres');
elem.innerHTML=elem.innerHTML*1-1;
if(el==2) elem.innerHTML=0;
var messages = elem.innerHTML*1;
if(messages==0)
	parent.frames[0].document.getElementById('block').style.display = 'none';
}
</script>
</head>
<body style="margin:0px;padding:0px;">

<table cellpadding=0 cellspacing=0 width="100%">
<tr height="30px">
	<td class="tableHead" width="20px" style="width:20px;text-align:center;">#</td>
	<td class="tableHead" width="200px" style="width:200px;text-align:center;"><% out.print("\u041F\u043E\u043B\u044C\u0437\u043E\u0432\u0430\u0442\u0435\u043B\u044C"); %></td>
	<td class="tableHead" width="250px" style="width:250px;text-align:center;"><% out.print("\u0414\u0430\u0442\u0430\u002F\u0412\u0440\u0435\u043C\u044F"); %></td>
	<td class="tableHead" style="text-align:center;border-right-color:#E0E0E1;"><% out.print("\u0421\u043E\u0431\u044B\u0442\u0438\u0435"); %></td>
</tr>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*;" %>
<%
Connection conn = null;
String Event = new String("");

Statement stmt = null;
Statement stmt2 = null;

ResultSet rs = null;
ResultSet rs2 = null;

try
{
Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
String db = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=C:\\ProgramData\\Q-MATIC\\QWIN S\\Database\\qwin_5501s_SE.mdb";

conn = DriverManager.getConnection( db );
stmt = conn.createStatement(); 


rs = stmt.executeQuery( "SELECT * from USERGRP" );


%><BR>Names<BR><%
while( rs.next() )
{
%>
this is a line from the DB:  "<%= rs.getString( "Name" ) %>" <BR>
<%
}

%>
<%
}

catch( ClassNotFoundException e )
{
%>
ClassNotFoundException: <%= e.getMessage() %>
<BR>
<%
}
catch( Exception e )
{
%>
Unexpected error: <%= e.getMessage() %>
<BR>
<%
}
finally
{
//Clean up resources, close the connection.
if( conn != null )
{
try
{
conn.close();
}
catch( Exception ignored )
{
}
}
}

%>

</BODY>
</HTML>