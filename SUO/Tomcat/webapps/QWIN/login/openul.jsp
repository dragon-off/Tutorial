<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.util.List,
                 java.util.Iterator,
                 webwork.action.ActionContext,
                 com.qmatic.web.staff.Utils, org.json.simple.JSONObject,org.json.simple.parser.JSONParser,org.json.simple.JSONArray"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ page import ="java.lang.Integer" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%

response.setContentType("text/html");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
String username=request.getParameter("username");
String ws="";
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
		Utils.syncLater(0L); //перезагружаем список пользователей
		logincode=rs.getString(1);
		//out.println("{\"logincode\":\""+rs.getString(1) + "\", \"loginname\":\"" + username+"\"");
	};
};

//забираем информация из домена
URL u = new URL("http://localhost:8080/GetGroups?user="+username);
URLConnection c = u.openConnection();
c.setRequestProperty("Accept-Charset", "UTF-8");
c.setRequestProperty("Content-Type", "text/plain; charset=utf-8");
c.setDoInput(true);
c.setUseCaches(false);
InputStreamReader isr = new InputStreamReader(c.getInputStream());
BufferedReader reader = new BufferedReader(isr);
String outRes="";
for(String line; (line = reader.readLine()) != null;) 
	outRes+=line;
String utf8String= new String(outRes.getBytes("windows-1251"), "utf-8");
//out.println(utf8String.replace("{","").replace("}",","));


rs = stmt.executeQuery("SELECT *  FROM is_windows where ip='"+request.getRemoteAddr()+"' ");
try {
	rs.next();
	if(rs.getRow()>0) {			
		if(rs.getString(3).equals("0")) {  				
		//	out.println("\"ws\":0");
			ws="0";
		} else { 
		//	out.println("\"ws\":"+rs.getString(3));
			ws=rs.getString(3);
		};
	} else {  				
		//out.println("\"ws\":0");
		ws="0";
		rs = stmt.executeQuery("select top 1 * from is_windows; INSERT INTO is_windows(ip) VALUES ('"+request.getRemoteAddr()+"') ");
	};
} catch (SQLException e) {  
//	out.println("\"ws\":0");
}

rs.close();
stmt.close();
conn.close();
JSONParser parser = new JSONParser();
Object obj;
obj = parser.parse(utf8String);
JSONObject jsonObject = (JSONObject) obj;
JSONArray groups = (JSONArray) jsonObject.get("Groups");
int grSize = 0;
int admin = 0;
String grName;
grSize = groups.size();
for(int i=0;i<grSize;i++)
{
	JSONObject jsonGroup = (JSONObject) groups.get(i);
	grName =(String) jsonGroup.get("Name");
	//out.println(grName);
	if(grName.toLowerCase().equals("queue_operatorurlits"))
	{
		admin = 1;
		break;
	}
}



if(admin==1)
{ 
	if((ws!="0" && ws!="")){
		out.println("ok;"+ws+";"+logincode);
		//out.println("<script language=\"javascript\"> window.location=\"/sber/pult.qsp?workstation="+ws+"&logincod="+logincode+"\";</script>");
	}
	else{
		out.println("err1;"+ws);
		//out.println("<script language=\"javascript\"> alert('Номер окна не задан, необходимо сопоставить IP адрес и номер окна в настройках Администратора смены, после чего перезапустить пульт');</script>");
	}
	

} else {
	out.println("err2");
	//out.println("<script language=\"javascript\"> alert('Вы не состоите в группе Операторов СУО, создайте запрос в Доступ Drive');</script>");

};

%>