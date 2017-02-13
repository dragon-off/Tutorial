package org.apache.jsp.touchscreens.bossallview.settings_005fnumer;

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
import java.net.*;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;

public final class settings_005fnumer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write(" \r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Настройки времени</title>\r\n");
      out.write("        <LINK REL=\"StyleSheet\" HREF=\"../style.css\" TYPE=\"text/css\">\r\n");
      out.write("\t\t<LINK REL=\"StyleSheet\" HREF=\"../style_messages.css\" TYPE=\"text/css\">\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\" src=\"/lib/ajax.js\"></script>  \t\t\r\n");
      out.write("\t\t<script type=\"text/javascript\" >\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function close_salert(el)\r\n");
      out.write("{\r\n");
      out.write("var elem = parent.frames[0].document.getElementById('blockres');\r\n");
      out.write("elem.innerHTML=elem.innerHTML*1-1;\r\n");
      out.write("if(el==2) elem.innerHTML=0;\r\n");
      out.write("var messages = elem.innerHTML*1;\r\n");
      out.write("if(messages<0)\r\n");
      out.write("\t{\r\n");
      out.write("\tmessages=0;\r\n");
      out.write("\telem.innerHTML=0;\r\n");
      out.write("\t}\r\n");
      out.write("if(messages==0)\r\n");
      out.write("\tparent.frames[0].document.getElementById('block').style.display = 'none';\r\n");
      out.write("parent.frames[1].document.getElementById('message_box_'+el+'_text').innerHTML=\"\";\r\n");
      out.write("if(el==1)\r\n");
      out.write("\tparent.frames[1].document.getElementById('message_box_3_text').innerHTML=\"\";\r\n");
      out.write("}\t\r\n");
      out.write("</script>\r\n");
      out.write("    </head> <body >\r\n");
      out.write("\r\n");
      out.write("   <div id=\"DopElement\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<table align=center border=1>\r\n");
      out.write("<tr><td>ИП адрес</td><td>номер окна</td></tr>\r\n");




Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
String result;
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 



if(request.getParameter("id")!= null) {
	rs = stmt.executeQuery("select top 1 * from is_windows; UPDATE is_windows SET counter ='"+request.getParameter("counter")+"' WHERE id="+request.getParameter("id")+"; ");
};
try{

rs = stmt.executeQuery("SELECT *  FROM is_windows order by counter; ");

int i = 0;
while( rs.next() ){

      out.write("\r\n");
      out.write("<tr valigna=center><td>\r\n");
      out.print( rs.getString("ip") );
      out.write("</td><td>\r\n");
      out.write("<form><input name=\"id\" type=\"hidden\" value=\"");
      out.print( rs.getString("id") );
      out.write("\">\r\n");
      out.write("<input name=\"counter\" value=\"");
      out.print( rs.getString("counter") );
      out.write("\">  <input type=\"submit\" value=\"Изменить\"></form>\r\n");
      out.write("</td></tr>\r\n");
      out.write("\r\n");

i++;
}


}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();

}

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width='100%' height='100%' id=\"message_box_1\" style=\"height:100%;width:100%;position: absolute;left:0px;top:0px;display:none;z-index:998; background-image:url('../images/halfpixel.png');\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td style=\"text-align:center;\">\r\n");
      out.write("<div class=\"error_box\" >\r\n");
      out.write("<table cellpadding=0 cellspacing=0 border=0 style=\"height:100%;width:100%;\">\r\n");
      out.write("\t<tr height='58px'>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div style=\"border-bottom:solid 1px #f43839;height: 58px;background-color: #fccac1;width:100%;\">\r\n");
      out.write("\t\t\t<table cellpadding=0 cellspacing=0 border=0 style=\"height:100%;width:100%;\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px;\">\r\n");
      out.write("\t\t\t\t\t\t<img src='../images/error.gif' border=0/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px; font-family: Arial, sans-serif;font-size:14pt;text-transform:uppercase;color:#f43839;text-align:center;\">\r\n");
      out.write("\t\t\t\t\t\tВнимание!\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px;text-align:right;\">\r\n");
      out.write("\t\t\t\t\t\t<img src='../images/close_error.gif' style=\"cursor:pointer;\" onClick=\"close_salert(1); document.getElementById('message_box_1').style.display='none';\" border=0/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td style=\"padding:5px;vertical-align:top;\" id=\"message_box_1_text\">\r\n");
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td style=\"padding:5px;vertical-align:top;\" id=\"message_box_3_text\">\r\n");
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<div style=\"border-top:solid 1px #f43839;height: 38px;background-color: #fccac1;width:100%;text-align:center;\">\r\n");
      out.write("\t\t\t<input type=\"button\" value=\"OK\" onClick=\"close_salert(1); document.getElementById('message_box_1').style.display='none';\" style=\"height:35px;width:80%;\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width='100%' height='100%' id=\"message_box_2\" style=\"height:100%;width:100%;position: absolute;left:0px;top:0px;display:none;z-index:997;background-image:url('../images/halfpixel.png');\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td style=\"text-align:center;\">\r\n");
      out.write("<div class=\"error_box\" >\r\n");
      out.write("<table cellpadding=0 cellspacing=0 border=0 style=\"height:100%;width:100%;\">\r\n");
      out.write("\t<tr height='58px'>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div style=\"border-bottom:solid 1px #f43839;height: 58px;background-color: #fccac1;width:100%;\">\r\n");
      out.write("\t\t\t<table cellpadding=0 cellspacing=0 border=0 style=\"height:100%;width:100%;\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px;\">\r\n");
      out.write("\t\t\t\t\t\t<img src='../images/error.gif' border=0/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px; font-family: Arial, sans-serif;font-size:14pt;text-transform:uppercase;color:#f43839;text-align:center;\">\r\n");
      out.write("\t\t\t\t\t\tВнимание!\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px;text-align:right;\">\r\n");
      out.write("\t\t\t\t\t\t<img src='../images/close_error.gif' style=\"cursor:pointer;\" onClick=\"close_salert(2); document.getElementById('message_box_2').style.display='none';\" border=0/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td style=\"padding:5px;vertical-align:top;\" id=\"message_box_2_text\">\r\n");
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width='100%' height='100%'  style=\"height:100%;width:100%;position: absolute;left:0px;top:0px;display:none;z-index:999;background-image:url('../images/halfpixel.png');\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td style=\"text-align:center;\">\r\n");
      out.write("<div class=\"error_box\" >\r\n");
      out.write("<table cellpadding=0 cellspacing=0 border=0 style=\"height:100%;width:100%;\">\r\n");
      out.write("\t<tr height='58px'>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div style=\"border-bottom:solid 1px #f43839;height: 58px;background-color: #fccac1;width:100%;\">\r\n");
      out.write("\t\t\t<table cellpadding=0 cellspacing=0 border=0 style=\"height:100%;width:100%;\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px;\">\r\n");
      out.write("\t\t\t\t\t\t<img src='../images/error.gif' border=0/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px; font-family: Arial, sans-serif;font-size:14pt;text-transform:uppercase;color:#f43839;text-align:center;\">\r\n");
      out.write("\t\t\t\t\t\tВнимание!\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:9px;text-align:right;\">\r\n");
      out.write("\t\t\t\t\t\t<img src='../images/close_error.gif' style=\"cursor:pointer;\" onClick=\"close_salert(3); document.getElementById('message_box_3').style.display='none';\" border=0/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td style=\"padding:5px;vertical-align:top;\" id=\"message_box_3_text\">\r\n");
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table></body>\r\n");
      out.write("</html>\r\n");
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
