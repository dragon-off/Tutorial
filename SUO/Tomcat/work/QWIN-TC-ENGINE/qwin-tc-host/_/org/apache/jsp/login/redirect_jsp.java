package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.qmatic.ConnectionContext;
import com.qmatic.network.User;
import com.qmatic.web.i18n.Language;
import java.net.InetAddress;
import java.net.UnknownHostException;

public final class redirect_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login/userpass.jsp");
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.release();
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
      out.write("<html>\r\n");
      out.write("<head>    <meta HTTP-EQUIV=\"REFRESH\" content=\"3; url=");
      if (_jspx_meth_ww_005fproperty_005f0(_jspx_page_context))
        return;
      out.write("\">    \r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("function redirect() {\r\n");
      out.write("//alert(document.URL);\r\n");
      out.write("if(document.URL.indexOf('printer')>0)\r\n");
      out.write("{\r\n");
      out.write("} else {\r\n");
      out.write("if(document.URL.indexOf('page=')>0) {\r\n");
      out.write("document.location.href=document.URL.substring(document.URL.indexOf('page=') + 5); \r\n");
      out.write("} else {\r\n");
      out.write("\tdocument.location.href=\"/\"; }\r\n");
      out.write("\t};\r\n");
      out.write("\t};\r\n");
      out.write("</script>\r\n");
      out.write("    \r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"redirect();\">\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


try{
	User user;
	user = (User)session.getAttribute("QM_USER");
			String un = user.getUsername();
		//out.println(request.getParameter("page"));
		out.println("<center><b>Загрузка...</b></center>");
		if(request.getParameter("page")!=null) {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
			Connection conn = DriverManager.getConnection(connectionUrl);
			ResultSet rs = null;
			Statement stmt = null;
			stmt = conn.createStatement(); 
			
			if(request.getParameter("page").equals("/touchscreens/bossallview/index.qsp2?user=1")) {
				rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+user.getUsername()+"','100',CONVERT(datetime, getdate()),'В¬С…РѕРґ Р°РґРјРёРЅРёСЃС‚СЂР°С‚РѕСЂР° СЃРјРµРЅС‹: "+user.getUsername()+"');");
			};
			if(request.getParameter("page").equals("/touchscreens/bossallview/index.qsp2?user=0")) {
				rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+user.getUsername()+"','100',CONVERT(datetime, getdate()),'В¬С…РѕРґ РјРѕРґРµСЂР°С‚РѕСЂР°: "+user.getUsername()+"');");
			};
			if(request.getParameter("page").indexOf("sber")>0) {
				rs = stmt.executeQuery("SELECT TOP 1 *  FROM Journal;INSERT INTO Journal(UserName,type_id,datetime,Comment) VALUES('"+user.getUsername()+"','100',CONVERT(datetime, getdate()),'В¬С…РѕРґ РїРѕР»СЊР·РѕРІР°С‚РµР»В¤: "+user.getUsername()+"');");
			};
		}
		else
		{
			if(un.toLowerCase().equals("installadmin") || un.toLowerCase().equals("administrator")){
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<script language=\"javascript\">\r\n");
      out.write("\t\t\t\t\tfunction getout(){\r\n");
      out.write("\t\t\t\t\t\t//document.location.href=\"/logout.action\";\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\tgetout();\r\n");
      out.write("\t\t\t\t</script>\r\n");
      out.write("\t\t\t");

			}
		}
}
catch(Exception e){
	out.print(e);	
}


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

  private boolean _jspx_meth_ww_005fproperty_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    webwork.view.taglib.PropertyTag _jspx_th_ww_005fproperty_005f0 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f0.setParent(null);
    _jspx_th_ww_005fproperty_005f0.setValue("page");
    int _jspx_eval_ww_005fproperty_005f0 = _jspx_th_ww_005fproperty_005f0.doStartTag();
    if (_jspx_th_ww_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
    return false;
  }
}
