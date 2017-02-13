package org.apache.jsp.checker;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class check_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\tvar type;\r\n");
      out.write("\tvar name;\r\n");
      out.write("\tif (!window.console)\r\n");
      out.write("\tconsole = {\r\n");
      out.write("\t\tlog : function () {},\r\n");
      out.write("\t\tinfo : function () {},\r\n");
      out.write("\t\terror : function () {},\r\n");
      out.write("\t\twarn : function () {}\r\n");
      out.write("\r\n");
      out.write("\t}; //Если нет консоли то не обращаем внимание...\r\n");
      out.write("\t\r\n");
      out.write("\tfunction parseGetParam(param) //Чтение параметров из URL\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar get_param = 0;\r\n");
      out.write("\t\tvar url = window.location.search.substring(1).split(\"&\");\r\n");
      out.write("\r\n");
      out.write("\t\tif (url.length > 0) {\r\n");
      out.write("\t\t\tfor (var i = 0; i < url.length; i++) {\r\n");
      out.write("\t\t\t\tvar getVar = url[i].split(\"=\");\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tif (getVar[0] == param)\r\n");
      out.write("\t\t\t\t\tget_param = getVar[1];\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\treturn get_param;\r\n");
      out.write("\t}\r\n");
      out.write("\t\tfunction checkStart(ws,logincode)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tjQuery.ajax({\r\n");
      out.write("\t\turl : '/checkerPult?workstation='+ws+'&name='+name+'&mode=start',\r\n");
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
      out.write("\t\turl : '/checkerPult?workstation='+ws+'&name='+name+'&mode=check',\r\n");
      out.write("\t\ttype : 'GET',\r\n");
      out.write("\t\tcache: false,\r\n");
      out.write("\t\tsuccess : function (a) {\r\n");
      out.write("\t\t\ta = a*1;\r\n");
      out.write("\t\t\tconsole.log(a);\r\n");
      out.write("\t\t\tif(a==0)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tif(type == \"queue_operator\")\r\n");
      out.write("\t\t\t\t\tdocument.location.href = '/sber/pult.qsp?workstation='+ws+'&logincod='+logincode;\r\n");
      out.write("\t\t\t\tif(type == \"queue_operatorul\")\r\n");
      out.write("\t\t\t\t\tdocument.location.href = '/sberUL/pult.qsp?workstation='+ws+'&logincod='+logincode;\r\n");
      out.write("\t\t\t\tif(type == \"queue_shiftadmin\")\r\n");
      out.write("\t\t\t\t\tdocument.location.href = '/touchscreens/bossallview/index.qsp2?user=1';\r\n");
      out.write("\t\t\t\tif(type == \"queue_shiftmoderator\")\r\n");
      out.write("\t\t\t\t\tdocument.location.href = '/touchscreens/bossallview/index.qsp2?moderator=1';\t\r\n");
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
      out.write("\t\tvar ws = parseGetParam('workstation')*1;\r\n");
      out.write("\t\tvar logincode = parseGetParam('logincod')*1;\r\n");
      out.write("\t\tname = parseGetParam('name');\r\n");
      out.write("\t\tconsole.log(name);\r\n");
      out.write("\t\ttype = parseGetParam('type');\r\n");
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
      out.write("\t\t\t<img src=\"loading.gif\"/>\r\n");
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
