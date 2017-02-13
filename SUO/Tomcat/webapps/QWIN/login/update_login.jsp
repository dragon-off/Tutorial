<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page language="java" import="java.util.Iterator,java.io.*,java.sql.*,webwork.action.ActionSupport,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,java.util.List,webwork.action.ActionContext, org.json.simple.JSONObject,org.json.simple.parser.JSONParser,org.json.simple.JSONArray"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>

<%@ taglib uri="mole" prefix="m" %>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
ResultSet upd = null;
Statement stmt = null;
stmt = conn.createStatement(); 
if(request.getParameter("username").length()>0) {
	rs = stmt.executeQuery("SELECT * FROM stafinfo where name='"+request.getParameter("username")+"';");
}else{
	rs = stmt.executeQuery("SELECT * FROM stafinfo;");
};

//забираем информация из домена
URL u;
URLConnection c;
InputStreamReader isr;
BufferedReader reader;
String outRes;
String utf8String;
JSONParser parser ;
Object obj;
JSONObject jsonObject;
JSONArray groups;
String update_sql="";
JSONObject jsonGroup;
int grSize = 0;
while(rs.next())
{
	//out.println(rs.getString("Name"));
	u = new URL("http://localhost:8080/GetGroups?user="+rs.getString("Name"));
	c = u.openConnection();
	c.setRequestProperty("Accept-Charset", "UTF-8");
	c.setRequestProperty("Content-Type", "text/plain; charset=utf-8");
	c.setDoInput(true);
	c.setUseCaches(false);
	isr= new InputStreamReader(c.getInputStream());
	reader = new BufferedReader(isr);
	outRes="";
	for(String line; (line = reader.readLine()) != null;) 
		outRes+=line;
	utf8String= new String(outRes.getBytes("windows-1251"), "utf-8");
	parser = new JSONParser();

	obj = parser.parse(utf8String);
	jsonObject = (JSONObject) obj;
	groups = (JSONArray) jsonObject.get("Groups");
	if(true) {
		//grSize = groups.size();
			if(!jsonObject.get("DisplayName").equals("")) {
				update_sql+="UPDATE [Qwin].[dbo].[STAFINFO] SET [Comments] = '"+jsonObject.get("DisplayName")+"("+jsonObject.get("sAMAccountName")+")"+"' WHERE [StafInfoNo]="+rs.getString("StafInfoNo")+";";
			}else{
				update_sql+="UPDATE [Qwin].[dbo].[STAFINFO] SET [Comments] = '"+rs.getString("Name")+"' WHERE [StafInfoNo]="+rs.getString("StafInfoNo")+";";
			};
			
		};

		
		
		//for(int i=0;i<grSize;i++)
		//{
		//	jsonGroup = (JSONObject) groups.get(i);
		//	grName =(String) jsonGroup.get("Name");
			//out.println(i+"<b>"+grName+"<\b>");
			//DisplayName+(sAMAccountName)
		//};
	};

	stmt.execute(update_sql);

%>  
