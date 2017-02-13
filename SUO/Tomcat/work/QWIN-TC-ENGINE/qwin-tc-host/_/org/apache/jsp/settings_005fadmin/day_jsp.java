package org.apache.jsp.settings_005fadmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import java.io.*;
import java.sql.*;
import com.qmatic.ConnectionContext;
import com.qmatic.QwinFactory.QWinFactory;
import com.qmatic.scripting.Script;
import com.qmatic.scripting.ScriptManager;
import webwork.action.ActionSupport;

public final class day_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	String len="";
	BufferedReader input = null;
	
     String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/settings_admin/day.sql";


	
	
	
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
      }
        
		response.setContentType("text/html");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
        }
        try {
            Connection conn = null;
			
		// izmeni DB!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        String connectionUrl = "jdbc:sqlserver://127.0.0.1;databaseName=Msqms_db;user="+db_username+";password="+db_password+";";

        conn = DriverManager.getConnection(connectionUrl);
       Statement command = conn.createStatement();
        ResultSet rs = command.executeQuery(len);
		rs.next();
        //out.print("OK");
		out.print("ALL:"+rs.getString(1)+"; green:"+rs.getString(2)+"; red:"+rs.getString(3));
        conn.close();
        } catch (SQLException e) {
            out.print("Ошибка: "+e);
        }

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
