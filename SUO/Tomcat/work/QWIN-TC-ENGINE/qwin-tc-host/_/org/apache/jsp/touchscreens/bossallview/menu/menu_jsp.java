package org.apache.jsp.touchscreens.bossallview.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.qmatic.ConnectionContext;
import com.qmatic.network.User;
import java.util.*;
import com.qmatic.web.i18n.Language;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("        <LINK REL=\"StyleSheet\" HREF=\"../style.css\" TYPE=\"text/css\">\r\n");
      out.write(" <script type=\"text/javascript\" src=\"/touchscreens/lib/ajax.js\"></script> \r\n");
      out.write(" <script type=\"text/javascript\" src=\"../js/Browser.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/qevent.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"menu.js\"></script> \r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\tvar moder=\"\";;\r\n");
      out.write("\tqwin_event.trig = function(eventType, unit, result){\r\n");
      out.write("\tif(eventType*1 == 200)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\tresult=result.split('#');\r\n");
      out.write("\t\tif((result[1]*1)<=0)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\tif(paper_alarm==0)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"В регистраторе талонов закончилась бумага!\");\r\n");
      out.write("\t\t\t\tadd_to_journal(2,\"В регистраторе талонов закончилась бумага!\");\r\n");
      out.write("\t\t\t\tpaper_alarm = 1;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\tpaper_alarm = 0;\r\n");
      out.write("\t\t}\r\n");
      out.write("\telse if(eventType*1 == 183)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\tif(result*1 > 40 && result*1 < 60)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\tplaysoundfunc();\r\n");
      out.write("\t\t\talert(\"В зале VIP-клиент\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("qwin_event.setEvents = function(){\r\n");
      out.write("qwin_event.waitForEventTrig(\"200.183\");\r\n");
      out.write("};\r\n");
      out.write("qwin_event.setEvents();\r\n");
      out.write("\tfunction parseGetParam(param) { \r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t   var get_param=1;\r\n");
      out.write("\t\t   var url = window.location.search.substring(1).split(\"&\");\r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t   if(url.length>0) \r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t   for(var i=0; i<url.length; i++) \r\n");
      out.write("\t\t\t\t{ \r\n");
      out.write("\t\t\t\tvar getVar = url[i].split(\"=\"); \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif(getVar[0]==param) \r\n");
      out.write("\t\t\t\t\tget_param=getVar[1];\r\n");
      out.write("\t\t\t\t} \r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\treturn get_param;\r\n");
      out.write("\t\t} \r\n");
      out.write("\tfunction setCookie(c_name,value,exdays)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\tvar exdate=new Date();\r\n");
      out.write("\t\texdate.setDate(exdate.getDate() + exdays);\r\n");
      out.write("\t\tvar c_value=escape(value) + ((exdays==null) ? \"\" : \"; expires=\"+exdate.toUTCString());\r\n");
      out.write("\t\tdocument.cookie=c_name + \"=\" + c_value;\r\n");
      out.write("\t\t}\r\n");
      out.write("\tfunction getCookie(c_name)\r\n");
      out.write("\t{\r\n");
      out.write("\tvar c_value = document.cookie;\r\n");
      out.write("\tvar c_start = c_value.indexOf(\" \" + c_name + \"=\");\r\n");
      out.write("\tif (c_start == -1)\r\n");
      out.write("\t  {\r\n");
      out.write("\t  c_start = c_value.indexOf(c_name + \"=\");\r\n");
      out.write("\t  }\r\n");
      out.write("\tif (c_start == -1)\r\n");
      out.write("\t  {\r\n");
      out.write("\t  c_value = null;\r\n");
      out.write("\t  }\r\n");
      out.write("\telse\r\n");
      out.write("\t  {\r\n");
      out.write("\t  c_start = c_value.indexOf(\"=\", c_start) + 1;\r\n");
      out.write("\t  var c_end = c_value.indexOf(\";\", c_start);\r\n");
      out.write("\t  if (c_end == -1)\r\n");
      out.write("\t  {\r\n");
      out.write("\tc_end = c_value.length;\r\n");
      out.write("\t}\r\n");
      out.write("\tc_value = unescape(c_value.substring(c_start,c_end));\r\n");
      out.write("\t}\r\n");
      out.write("\treturn c_value;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction set_url()\r\n");
      out.write("\t{\r\n");
      out.write("\tmoder = parseGetParam(\"user\");\r\n");
      out.write("\tvar el = document.getElementById('compet');\r\n");
      out.write("\tvar el2 = document.getElementById('matr');\r\n");
      out.write("\tvar el3 = document.getElementById('fmatr');\r\n");
      out.write("\t");

	User user;
	try {
		user = (User)session.getAttribute("QM_USER");
		out.println("setCookie(\"username\",\""+user.getUsername()+"\",20)");
		out.println(" var username2 = '"+user.getUsername()+"';");
	} catch (Exception e) {
		out.println("");
	}
	out.println("moder = getCookie(\"username\");");
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t//alert(parseGetParam(\"user\"));\r\n");
      out.write("\t/*if(moder==0){ \r\n");
      out.write("\t\r\n");
      out.write("\t};*/\r\n");
      out.write("\t//parent.location.href = \"http://www.yandex.ru\";\r\n");
      out.write("\tif(parseGetParam(\"user\")) {\r\n");
      out.write("\t\tel.setAttribute('href', '../matrix_comp/matrix_comp.html?user='+parseGetParam(\"user\"));\r\n");
      out.write("\t\tel2.setAttribute('href', '../matrix_prior/matrix_prior.html?user='+parseGetParam(\"user\"));\r\n");
      out.write("\t\tel3.setAttribute('href', '../matrix_future/matrix_future.html?user='+parseGetParam(\"user\"));\r\n");
      out.write("\t} else {\r\n");
      out.write("\t\tel.setAttribute('href', '../matrix_comp/matrix_comp.html?user=2');\r\n");
      out.write("\t\tel2.setAttribute('href', '../matrix_prior/matrix_prior.html?user=2');\r\n");
      out.write("\t\tel3.setAttribute('href', '../matrix_future/matrix_future.html?user=2');\r\n");
      out.write("\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t</script> \r\n");
      out.write("    </head>\r\n");
      out.write(" <body onLoad=\"set_url();start_message();\" style=\"overflow-x:hidden;\">\r\n");
      out.write(" <!--<embed src=\"beep.wav\" autostart=false width=0 height=0 name=\"sound1\" enablejavascript=\"true\">-->\r\n");
      out.write(" <bgsound id=\"sound\">\r\n");
      out.write("\r\n");
      out.write(" <table id=\"block\" style=\"width:300px;height:100%;position:absolute;left:0px;top:0px;display:none;\"><tr><td><div style=\"display:none;\" id=\"blockres\">0</div></td></tr></table>\r\n");
      out.write("<table class=tableMain width=170 cellpadding=4 cellspacing=0>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=headerBar>\r\n");
      out.write("\t\t\tОнлайн-мониторинг\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write(" \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("        <tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../monitoring/index.html' target=content>Онлайн-мониторинг</a></td></tr>\r\n");
      out.write("    \r\n");
      out.write("        <tr><td  class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../matrix_prior/matrix_prior.html' target=content id=\"matr\">Матрица приоритетов</a></td></tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("<td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\" style=\"color: blue;\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<a href='../report/index.html' target=content>Статистика</a></td></tr>\r\n");
      out.write("\t\r\n");
      out.write("        <tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a id=\"compet\" href=\"matrix_comp/matrix_comp.html\" target=content>Матрица компетенций</a></td></tr>\r\n");
      out.write("\t<tr><td  class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href=\"../matrix_future/matrix_future.html\" target=content id=\"fmatr\">Матрица будущего состояния</a></td></tr>\r\n");
      out.write("\t\t\r\n");
      out.write(" \r\n");
      out.write("    \r\n");
      out.write("        \r\n");
      out.write("    \r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=headerBar>\r\n");
      out.write("\t\t\tНастройка площадки\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write(" \r\n");
      out.write("\t<tr><td  class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_buttons/settings_buttons.qsp2' target=content>Операции</a></td></tr>\r\n");
      out.write("\t\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_windows/settings_windows.qsp2' target=content>Окна</a></td></tr>\r\n");
      out.write("\t\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_logins/settings_logins.qsp2' target=content>Пользователи</a></td></tr>\r\n");
      out.write("\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_svetofor/settings_svetofor.qsp2' target=content>Светофор</a></td></tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t<td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_time/settings_time.qsp2?login=' target=content>Настройка времени  и чередования</a></td>  \r\n");
      out.write("        \r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_vsp/settings_vsp.qsp2' target=content>Настройка ВСП</a></td></tr>\r\n");
      out.write("\t\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_numer/settings_numer.jsp' target=content>Настройка нумерации окон</a></td></tr>\r\n");
      out.write("\r\n");
      out.write("\t\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../journal/journal.html' target=content>Журнал аудита</a></td></tr>\r\n");
      out.write("\t\t<tr><td class=tdMenuItem onmouseover=\"javascript:this.className='tdMenuItemOver';\" onmouseout=\"javascript:this.className='tdMenuItem';\"><a href='../settings_sprav/settings_sprav.qsp2' target=content>Справочники</a></td></tr>\r\n");
      out.write("\t\r\n");
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
