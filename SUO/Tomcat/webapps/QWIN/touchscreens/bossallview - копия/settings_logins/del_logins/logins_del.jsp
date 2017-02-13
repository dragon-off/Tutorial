<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.util.Iterator,java.io.*,com.qmatic.web.staff.Utils,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
String len="";
String red;
BufferedReader input = null;
String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/touchscreens/bossallview/settings_logins/del_logins/logins_del.qwin";


try {
	input = new BufferedReader(new FileReader(fileName));
} catch (FileNotFoundException e) {
	return;
}
try {
	String tmp;
	while ((tmp = input.readLine()) != null)
	len+=" "+tmp;
} catch (IOException e) {
	e.printStackTrace();
};
ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
Script s = sm.createScript("run", len); 
len=s.execute();
out.print("len: "+len);
sm.killScript(s);
response.setContentType("text/html");
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (ClassNotFoundException e) {
}
try {
	Connection conn = null;
	String connectionUrl = "jdbc:sqlserver://127.0.0.1;databaseName=qwin;user="+db_username+";password="+db_password+";";
	conn = DriverManager.getConnection(connectionUrl);
	Statement command = conn.createStatement();
	ResultSet rs = command.executeQuery(len);
	rs.next();

	
	conn.close();

} catch (SQLException e) {
	out.print("Ошибка: "+e);
};
//обновляем список пользователей из базы в кувин, после их удаления
 Utils.syncLater(500L);
%>  
