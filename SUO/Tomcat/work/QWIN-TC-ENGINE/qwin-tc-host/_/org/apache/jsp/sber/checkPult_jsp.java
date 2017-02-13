package org.apache.jsp.sber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class checkPult_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=windows-1251");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head> \r\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=11\" />\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/jquery-1.11.3.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\tif (!window.console)\r\n");
      out.write("\tconsole = {\r\n");
      out.write("\t\tlog : function () {},\r\n");
      out.write("\t\tinfo : function () {},\r\n");
      out.write("\t\terror : function () {},\r\n");
      out.write("\t\twarn : function () {}\r\n");
      out.write("\r\n");
      out.write("\t}; //Если нет консоли то не обращаем внимание...\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getVarValueFromURL(url, varName) { //для получение значений из URL\r\n");
      out.write("\t\tvar query = url.substring(url.indexOf('?') + 1);\r\n");
      out.write("\t\tvar vars = query.split(\"&\");\r\n");
      out.write("\t\tfor (var i=0;i<vars.length;i++) {\r\n");
      out.write("\t\t\tvar pair = vars[i].split(\"=\");\r\n");
      out.write("\t\t\tif (pair[0] == varName) {\r\n");
      out.write("\t\t\t\treturn pair[1];\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn null;\r\n");
      out.write("\t} ;\r\n");
      out.write("\tfunction checkStart(ws,logincode)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tjQuery.ajax({\r\n");
      out.write("\t\turl : '/checkerPult?workstation='+ws+'&mode=start',\r\n");
      out.write("\t\ttype : 'GET',\r\n");
      out.write("\t\tcache: false,\r\n");
      out.write("\t\tsuccess : function (a) {\r\n");
      out.write("\t\t\tconsole.log(a);\r\n");
      out.write("\t\t\tsetTimeout(function(){checkEnd(ws,logincode)}, 1500);\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror : function(a) {\r\n");
      out.write("\t\t\tconsole.log(\"err\",a);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction checkEnd(ws,logincode)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tjQuery.ajax({\r\n");
      out.write("\t\turl : '/checkerPult?workstation='+ws+'&mode=check',\r\n");
      out.write("\t\ttype : 'GET',\r\n");
      out.write("\t\tcache: false,\r\n");
      out.write("\t\tsuccess : function (a) {\r\n");
      out.write("\t\t\ta = a*1;\r\n");
      out.write("\t\t\tconsole.log(a);\r\n");
      out.write("\t\t\tif(a==0)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tdocument.location.href = '/sber/pult.qsp?workstation='+ws+'&logincod='+logincode;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\t$('.wrapper').hide();\r\n");
      out.write("\t\t\t\talert('Пульт уже открыт');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror : function(a) {\r\n");
      out.write("\t\t\tconsole.log(\"err\",a);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\tvar ws=getVarValueFromURL(document.URL ,'workstation')*1;\r\n");
      out.write("\t\tvar logincode=getVarValueFromURL(document.URL ,'logincod')*1;\r\n");
      out.write("\t\tcheckStart(ws,logincode);\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t</script>\r\n");
      out.write("    <style>\r\n");
      out.write("\t html,body {margin:0px;padding:0px;overflow:hidden;background-color:#808080;}\r\n");
      out.write("\t .wrapper {\r\n");
      out.write("\t\tbackground-color:#808080;\r\n");
      out.write("\t\ttext-align:center;\r\n");
      out.write("\t\tcolor: #fff;\r\n");
      out.write("\t\tfont-family: Arial;\r\n");
      out.write("\t }\r\n");
      out.write("\t .loader {\r\n");
      out.write("\t\twidth: 100%;\r\n");
      out.write("\t\theight: 100%;\r\n");
      out.write("\t\tvertical-align:middle;\r\n");
      out.write("\t\tfont-weight: bold;\r\n");
      out.write("\t }\r\n");
      out.write("\t</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<table class=\"wrapper\" border=0 cellpadding=0 cellspacing=0 width=100% height=100%>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"loader\">\r\n");
      out.write("\t\t\t<img src=\"images/loading.gif\"/>\r\n");
      out.write("\t\t\t<p>Загрузка</p>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
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
