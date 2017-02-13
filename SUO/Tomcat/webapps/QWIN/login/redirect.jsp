<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.sql.*,com.qmatic.ConnectionContext,com.qmatic.network.User,com.qmatic.web.i18n.Language,java.net.InetAddress,java.net.UnknownHostException"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<html>
<head>    <meta HTTP-EQUIV="REFRESH" content="3; url=<ww:property value="page"/>">    
<script language="javascript">
function redirect() {
//alert(document.URL);
if(document.URL.indexOf('printer')>0)
{
} else {
if(document.URL.indexOf('page=')>0) {
document.location.href=document.URL.substring(document.URL.indexOf('page=') + 5); 
} else {
	document.location.href="/"; }
	};
	};
</script>
    
</head>
<body onload="redirect();">
</body>
</html>



<%

try{
	User user;
	user = (User)session.getAttribute("QM_USER");
			String un = user.getUsername();
		//out.println(request.getParameter("page"));
		out.println("<center><b>��������...</b></center>");
		if(request.getParameter("page")!=null) {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
			Connection conn = DriverManager.getConnection(connectionUrl);
			ResultSet rs = null;
			Statement stmt = null;
			stmt = conn.createStatement(); 
			
			if(request.getParameter("page").equals("/touchscreens/bossallview/index.qsp2?user=1")) {
				rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+user.getUsername()+"','100',CONVERT(datetime, getdate()),'¬ход администратора смены: "+user.getUsername()+"');");
			};
			if(request.getParameter("page").equals("/touchscreens/bossallview/index.qsp2?user=0")) {
				rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+user.getUsername()+"','100',CONVERT(datetime, getdate()),'¬ход модератора: "+user.getUsername()+"');");
			};
			if(request.getParameter("page").indexOf("sber")>0) {
				rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+user.getUsername()+"','100',CONVERT(datetime, getdate()),'¬ход пользовател¤: "+user.getUsername()+"');");
			};
		}
		else
		{
			if(un.toLowerCase().equals("installadmin") || un.toLowerCase().equals("administrator")){
			%>

				<script language="javascript">
					function getout(){
						//document.location.href="/logout.action";
					}
					getout();
				</script>
			<%
			}
		}
}
catch(Exception e){
	out.print(e);	
}

%>

