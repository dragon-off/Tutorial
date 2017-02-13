package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import java.io.*;
import java.sql.*;
import webwork.action.ActionSupport;
import com.qmatic.ConnectionContext;
import com.qmatic.QwinFactory.QWinFactory;
import com.qmatic.scripting.Script;
import com.qmatic.scripting.ScriptManager;
import webwork.action.ActionSupport;
import com.qmatic.network.User;
import java.util.List;
import webwork.action.ActionContext;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONArray;
import java.net.*;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;

public final class update_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");

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

//Р·Р°Р±РёСЂР°РµРј РёРЅС„РѕСЂРјР°С†РёСЏ РёР· РґРѕРјРµРЅР°
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


      out.write("  \r\n");
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
