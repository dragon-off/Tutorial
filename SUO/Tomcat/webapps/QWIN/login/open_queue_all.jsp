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
<center>
<%

response.setContentType("text/html");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
String username=request.getParameter("username");
String type_run="queue_shiftadmin";

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
		
		Thread.sleep(5000);
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

//out.println(utf8String);
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


JSONParser parser = new JSONParser();
Object obj;
obj = parser.parse(utf8String);
JSONObject jsonObject = (JSONObject) obj;
JSONArray groups = (JSONArray) jsonObject.get("Groups");
int grSize = 0;
boolean queue_shiftadmin = false;
boolean queue_shiftmoderator = false;
boolean queue_operator = false;
boolean queue_operatorul = false;
String grName;
grSize = groups.size();
if(grSize>0) {
	out.println("<b>Вам доступны следующие роли:</b><br>");
} else {
	out.println("<b>У Вас нет доступных ролей СУО</b><br>");
};

for(int i=0;i<grSize;i++)
{
	JSONObject jsonGroup = (JSONObject) groups.get(i);
	grName =(String) jsonGroup.get("Name");
//	out.println(grName);
	//grName=grName.substring(grName.indexOf("_")+1, grName.length());
	grName=grName.toLowerCase(); //нижний регистр
	//s = sm.createScript("run", "W="+request.getParameter("workstation")+"\n SETARRAY(2931+W TIME_NO) IF(COUNTER_LOGIN_ID(W) GT 0) BEGIN IF((ARRAY(2900+W)+20) GT TIME_NO AND TIME_NO GE ARRAY(2900+W)) BEGIN \"0\" END ELSE BEGIN \"1\"	SETARRAY(2900+W TIME_NO)  END END ELSE BEGIN IF(TIME_NO LE (ARRAY(2900+W)+5) AND TIME_NO GE ARRAY(2900+W)) \"0\" ELSE BEGIN \"1\"	SETARRAY(2900+W TIME_NO) END END");
	//out.println(s.execute());
	
	if(grName.indexOf("queue_")!=-1) { //проверям есть ли группы имеющие "queue_"
		grName=grName.substring(grName.indexOf("queue_"), grName.length());
		//out.println(grName);
		if(grName.equals("queue_shiftadmin"))
		{
			queue_shiftadmin = true;
			out.println("<input type=\"button\" onclick=\"run_administrator();\" value=\"Администратор\"><br>");
		}	
		if(grName.equals("queue_shiftmoderator"))
		{
			queue_shiftmoderator = true;
			out.println("<input type=\"button\" onclick=\"run_moderator();\" value=\"Модератор\"><br>");
		}	
		if(grName.equals("queue_operator"))
		{
			queue_operator = true;
			out.println("<input type=\"button\" onclick=\"open_func_fl();\" value=\"Операционист ФЛ\"><br>");
		}	
		if(grName.equals("queue_operatorurlits") || grName.equals("queue_operatorul"))
		{
			queue_operatorul = true;
			out.println("<input type=\"button\" onclick=\"open_func_ul();\" value=\"Операционист ЮЛ\"><br>");
		}
	}
}

%>
<script language="javascript">
function open_func_fl() {
<%
	if(ws.equals("0")) {
		out.println("alert('Номер окна не задан, необходимо сопоставить IP адрес и номер окна в настройках Администратора смены, после чего перезапустить пульт');");
	} else if(queue_operator){
		out.println(" window.location=\"/sber/pult.qsp?workstation="+ws+"&logincod="+logincode+"\";");
	} else if(!queue_operator){
		out.println(" alert('Вы не имеете доступа к пульту физ. лиц. так как не состоите в группе queue_operator');");
	} else {
		out.println(" alert('Ошибка!');");
	};

%>
};
function open_func_ul() {
<%
	if(ws.equals("0")) {
		out.println(" alert('Номер окна не задан, необходимо сопоставить IP адрес и номер окна в настройках Администратора смены, после чего перезапустить пульт');");
	} else if(queue_operatorul){
		out.println(" window.location=\"/sberUL/pult.qsp?workstation="+ws+"&logincod="+logincode+"\";");
	} else if(!queue_operatorul){
		out.println(" alert('Вы не имеете доступа к пульту юр. лиц. так как не состоите в группе queue_operatorul');");
	} else {
		out.println(" alert('Ошибка!');");
	};

%>
};
function run_administrator() {
<%
	if(queue_shiftadmin){
		out.println("window.location=\"/touchscreens/bossallview/index.qsp2?user=1\";");
	} else if(!queue_shiftadmin){
		out.println(" alert('Вы не имеете доступа к пульту мониторингу так как не состоите в группе queue_shiftadmin');");
	} else {
		out.println("alert('Ошибка!');");
	};

%>
};
function run_moderator() {
<%
	if(queue_shiftmoderator){
		out.println(" window.location=\"/touchscreens/bossallview/index.qsp2?moderator=1\";");
	} else if(!queue_operatorul){
		out.println("alert('Вы не имеете доступа к пульту юр. лиц. так как не состоите в группе queue_operatorul');");
	} else {
		out.println(" alert('Ошибка!');");
	};

%>
};
</script>
</center>
<%

u = new URL("http://localhost/login/update_login.jsp?username="+username);
c = u.openConnection();
c.setRequestProperty("Accept-Charset", "UTF-8");
c.setRequestProperty("Content-Type", "text/plain; charset=utf-8");
c.setDoInput(true);
c.setUseCaches(false);
isr = new InputStreamReader(c.getInputStream());

reader = new BufferedReader(isr);

stmt.execute("INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+username+"','100',CONVERT(datetime, getdate()),N'Вход/Выход пользователя в систему СУО');");

rs.close();
stmt.close();
conn.close();
%>