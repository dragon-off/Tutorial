<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
response.setContentType("text/html");
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (ClassNotFoundException e) {
}

String login="";
String logic="";
Boolean first=false;
try {
	Connection conn = null;
	String connectionUrl = "jdbc:sqlserver://127.0.0.1;databaseName=qwin;user="+db_username+";password="+db_password+";";
	conn = DriverManager.getConnection(connectionUrl);
	Statement command = conn.createStatement();
	ResultSet rs = command.executeQuery("SELECT [Name],[Pager] FROM [STAFINFO] order by [LoginId]");
//	rs.next();
//	out.print("{ \"logins\":[");
	while (rs.next()) {
			if(first) {
				login+=",\""+rs.getString(1)+"\"";
				logic+=",\""+rs.getString(2)+"\"";
			} else {
				login+="\""+rs.getString(1)+"\"";
				logic+="\""+rs.getString(2)+"\"";
				first=true;
			};
	};
	conn.close();
} catch (SQLException e) {

};

out.print("{ \"logins\":[");
out.println(login);

out.print("], \"logic\":[");
out.println(logic);

out.print("]}");
	

%>  
