package org.apache.jsp.sber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.qmatic.web.staff.Utils;
import com.qmatic.ConnectionContext;
import javax.servlet.http.*;
import javax.servlet.*;
import com.qmatic.QwinFactory.QWinFactory;
import com.qmatic.scripting.Script;
import com.qmatic.scripting.ScriptManager;
import webwork.action.ActionSupport;

public final class close_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

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
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("﻿\r\n");
      out.write("\r\n");

	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
	Script s;
	if(request.getParameter("error_login")!=null) {
		out.println("window.close();");
	} else 
	if(request.getParameter("close_true")!= null) {
		if(request.getParameter("close_true").equals("true")) {
			s = sm.createScript("run", "W="+request.getParameter("workstation")+"IF(COUNTER_CUSTOMER_PRESENT(W) EQ 1) BEGIN U=TIME_NO-COUNTER_CUSTOMER_ITEM(W ITEM_NEXT) IF(((U*2) LE ((ARRAY(501)+ARRAY(500))))  AND COUNTER_CUSTOMER_ITEM(W ITEM_BUTTON) NE 183) BEGIN SETARRAY(5870+W 1) FUNC_INSERT_LAST(W 5 COUNTER_CUSTOMER_ITEM(W ITEM_NUMBER) 182 0) END END FUNC_COUNTER_CLOSE(W) SETARRAY(2900+W 0)");
			s.execute();
			sm.killScript(s);
			
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\twindow.close();\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");

		}
	} else 
		if(request.getParameter("close")!= null) {
			try
			{
				s=sm.createScript("run", "W="+request.getParameter("workstation")+"{}BUTTON_QUEUE(130+W)");
				//out.println(Integer.parseInt(s.execute()));
				if(Integer.parseInt(s.execute())>0) {
					
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\tif(confirm(\"У Вас есть отложенные клиенты, Вы уверены что хотите выйти из пульта.\")) {\r\n");
      out.write("\t\t\t\t\t\t//alert(window.location+\"&close_true=true\");\r\n");
      out.write("\t\t\t\t\t\thttpRequest(url+\"&close_true=true\", function(req) {   window.close(); }, function(req) { alert(\"Ошибка завершение работы, повторите выход снова.\"); }, null, 20000);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t};\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t");

					out.println("yes клиенты");
				}  else {
					out.println("no клиенты");
				};
				sm.killScript(s);
		} catch (Exception e) {
			
		}

	}

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
