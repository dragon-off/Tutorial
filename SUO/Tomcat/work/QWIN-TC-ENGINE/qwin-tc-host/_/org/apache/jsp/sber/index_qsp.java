package org.apache.jsp.sber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_qsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/JavaScript\">\r\n");
      out.write("<!--\r\n");
      out.write("function insert_last(targ,selObj,restore){ //v3.0\r\n");
      out.write("  \r\n");
      out.write("eval(targ+\".location='?insert_last=\"+selObj.options[selObj.selectedIndex].value+\"&workstation=1'\");\r\n");
      out.write("  if (restore) selObj.selectedIndex=0;\r\n");
      out.write("}\r\n");
      out.write("function insert_first(targ,selObj,restore){ //v3.0\r\n");
      out.write("  \r\n");
      out.write("eval(targ+\".location='?insert_first=\"+selObj.options[selObj.selectedIndex].value+\"&workstation=1'\");\r\n");
      out.write("  if (restore) selObj.selectedIndex=0;\r\n");
      out.write("}\r\n");
      out.write("//-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function alert1()\r\n");
      out.write(" {\r\n");
      out.write("  if(insert_msg.style.display=='none')\r\n");
      out.write("   {\r\n");
      out.write("    insert_msg.style.display='block';\r\n");
      out.write("    setTimeout('close()', 5000);\r\n");
      out.write("   }\r\n");
      out.write("  else \r\n");
      out.write("   {\r\n");
      out.write("   insert_msg.style.display='none';\r\n");
      out.write("   }\r\n");
      out.write(" }\r\n");
      out.write("function alert2()\r\n");
      out.write(" {\r\n");
      out.write("  if(next.style.display=='none')\r\n");
      out.write("   {\r\n");
      out.write("    next.style.display='block';\r\n");
      out.write("   \r\n");
      out.write("   }\r\n");
      out.write("  else \r\n");
      out.write("   {\r\n");
      out.write("   next.style.display='none';\r\n");
      out.write("   }\r\n");
      out.write(" }\r\n");
      out.write("function close()\r\n");
      out.write(" {\r\n");
      out.write("  insert_msg.style.display='none';\r\n");
      out.write("  next.style.display='none';\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1251\" />\r\n");
      out.write("<title>Веб Пульт для того кто всегда рядом</title>\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("BODY {\r\n");
      out.write("background-image: url('img/bg.jpg'); \r\n");
      out.write("}\r\n");
      out.write("table_razdel {\r\n");
      out.write("background:#77B618;\r\n");
      out.write("background:#33CC66;\r\n");
      out.write("}\r\n");
      out.write("table.table_button {\r\n");
      out.write("background-color:#CCCCCC;\r\n");
      out.write("border-right-color:#00FF33;\r\n");
      out.write("text-align:center;\r\n");
      out.write("border-bottom-color:#006633;\r\n");
      out.write("}\r\n");
      out.write("table.table_button_select {\r\n");
      out.write("background-image: url('img/b1.gif');\r\n");
      out.write("text-align:center;\r\n");
      out.write("}\r\n");
      out.write("table.table_button_select2 {\r\n");
      out.write("background-image: url('img/b2.gif');\r\n");
      out.write("text-align:center;\r\n");
      out.write("}\r\n");
      out.write("table.table_button_select3 {\r\n");
      out.write("background-image: url('img/b3.gif');\r\n");
      out.write("text-align:center;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\t\t<title>Фоновый рисунок</title>\r\n");
      out.write("\t\t<style type=\"text/css\">\r\n");
      out.write("\t\t\t.fon {\r\n");
      out.write("\t\t\t\theight: 100%;\r\n");
      out.write("\t\t\t\tborder: 0;\r\n");
      out.write("\t\t\t\tposition: absolute;\r\n");
      out.write("\t\t\t\tleft: 0;\r\n");
      out.write("\t\t\t\ttop: 0;\r\n");
      out.write("\t\t\t\tz-index: -1;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body scroll=no>\r\n");
      out.write("<center>\r\n");
      out.write("\r\n");
      out.write("\t<table border=0 cellpadding=0 cellspacing=0>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td background=\"img/tl.gif\" width=34 height=37></td>\r\n");
      out.write("\t\t<td background=\"img/tc.gif\" height=37>\r\n");
      out.write("\t\t<a href=\"/sber/fl1.exe\">Операционист ФЛ (окно 1)</a><br>\r\n");
      out.write("\t\t<a href=\"/sber/ul1.exe\">Операционист ЮЛ (окно 1)</a><br>\r\n");
      out.write("\t\t<a href=\"/sber/admin.exe\">Администратор смены</a><br>\r\n");
      out.write("\t\t<a href=\"/sber/moderator.exe\">Модератор</a><br>\r\n");
      out.write("<br></td>\r\n");
      out.write("\t\t<td background=\"img/tr.gif\" width=34 height=37></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td background=\"img/cl.gif\" width=34></td>\r\n");
      out.write("\t\t<td bgcolor='#fefefe'>\r\n");
      out.write("\r\n");
      out.write("<form action=\"pult.qsp\"  name=\"form1\" id=\"form1\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("Выберите свое окно:\r\n");
      out.write("  <select name=\"workstation\">\r\n");
      out.write("<option selected disabled>Выберите окно</option>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<option value=1>Окно 1 </option><option value=2>Окно 2</option><option value=3>Окно 3 </option><option value=4>Окно 4 </option><option value=5>Окно 5 </option><option value=6>Окно 6 </option><option value=7>Окно 7 </option><option value=8>Окно 8 </option><option value=9>Окно 9 </option><option value=10>Окно 10 </option><option value=11>Окно 11 </option><option value=12>Окно 12 </option><option value=13>Окно 13 </option><option value=14>Окно 14 </option><option value=15>Окно 15 </option><option value=16>Окно 16 </option><option value=17>Окно 17 </option><option value=18>Окно 18 </option><option value=19>Окно 19 </option><option value=20>Окно 20 </option><option value=21>Окно 21 </option><option value=22>Окно 22 </option><option value=23>Окно 23 </option><option value=24>Окно 24 </option><option value=25>Окно 25 </option> <option value=26>Окно 26 </option><option value=27>Окно 27 </option><option value=28>Окно 28 </option>    </select>\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("Введите логин:\r\n");
      out.write("  <input name=\"logincod\" type=\"text\" />\r\n");
      out.write("</form>\r\n");
      out.write("<br><center>\r\n");
      out.write("\t\t<table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0 onclick=form1.submit()>\r\n");
      out.write("\t\t<tr height=17 style='border:none;'>\r\n");
      out.write("\t\t\t<td style='border:none;cursor:pointer;'><font color='#00000'>Войти</font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("</center>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</td>\r\n");
      out.write("<td background=\"img/cr.gif\" width=34></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("<td background=\"img/dl.gif\" width=34 height=37></td>\r\n");
      out.write("<td background=\"img/dc.gif\" height=37></td>\r\n");
      out.write("<td background=\"img/dr.gif\" width=34 height=37></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</center>\r\n");
      out.write("\r\n");
      out.write("<p><img class=\"fon\" src=\"img/bg.jpg\"  /></p>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
