package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.util.Iterator;
import webwork.action.ActionContext;
import com.qmatic.web.staff.Utils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONArray;
import java.net.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.Integer;

public final class open_005fqueue_005fshiftmoderator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login/userpass.jsp");
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html; charset=windows-1251");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 
String db_username = "qmatic";
String db_password = "qmatic";

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


response.setContentType("text/html");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
String username=request.getParameter("username");
String type_run="queue_shiftmoderator";
//username="Zelenin-AY";
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
for(int i=0;i<grSize;i++)
{
	JSONObject jsonGroup = (JSONObject) groups.get(i);
	grName =(String) jsonGroup.get("Name");
//	out.println(grName);
	//grName=grName.substring(grName.indexOf("_")+1, grName.length());
	grName=grName.toLowerCase(); //нижний регистр
	if(grName.indexOf("queue_")!=-1) { //проверям есть ли группы имеющие "queue_"
		grName=grName.substring(grName.indexOf("queue_"), grName.length());
	//	out.println(grName);
		if(grName.equals("queue_shiftadmin"))
		{
			queue_shiftadmin = true;
		}	
		if(grName.equals("queue_shiftmoderator"))
		{
			queue_shiftmoderator = true;
		}	
		if(grName.equals("queue_operator"))
		{
			queue_operator = true;
		}	
		if(grName.equals("queue_operatorurlits") || grName.equals("queue_operatorul"))
		{
			queue_operatorul = true;
		}
	}
}


if(ws.equals("0")) {
	out.println("<script language=\"javascript\"> alert('Номер окна не задан, необходимо сопоставить IP адрес и номер окна в настройках Администратора смены, после чего перезапустить пульт');</script>");
} else if(type_run.equals("queue_shiftmoderator") && queue_shiftmoderator){
	//out.println("<script language=\"javascript\"> window.location=\"/touchscreens/bossallview/index.qsp2?moderator=1\";</script>");
	out.println("<script language=\"javascript\"> window.location=\"/checker/check.jsp?workstation=0&logincod="+logincode+"&type=queue_shiftmoderator&name="+username+"\";</script>");
} else if(!queue_shiftmoderator){
	out.println("<script language=\"javascript\"> alert('Вы не имеете доступа к мониторингу так как не состоите в группе queue_shiftmoderator');</script>");
} else {
	out.println("<script language=\"javascript\"> alert('Ошибка!');</script>");
};


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

      out.write('\r');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
