package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.qmatic.ConnectionContext;
import com.qmatic.network.User;
import com.qmatic.web.i18n.Language;
import java.net.InetAddress;
import java.net.UnknownHostException;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005felse;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005felse = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.release();
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fww_005felse.release();
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
      out.write(" ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  <title>Index</title>\r\n");
      out.write("  <link href=\"");
      if (_jspx_meth_m_005fpath_005f0(_jspx_page_context))
        return;
      out.write("\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <style type=\"text/css\">\r\n");
      out.write("        body { background: #A5A2A5; }\r\n");
      out.write("  </style>\r\n");
      out.write("  </head>\r\n");
      out.write("  <body >\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("\r\n");
      out.write("    <table border=\"0\" height=\"80%\" width=\"100%\">\r\n");
      out.write("\r\n");
      out.write("    <tr><td>\r\n");
      out.write("\r\n");
      out.write("        <table  cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td colspan=\"3\" width='498' height='78' background=\"images/start_top.gif\">\r\n");
      out.write("\t\t\t<table  cellpadding=\"0\" cellspacing=\"0\" width='498' height='78' align=\"center\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t<td width='290'></td>\r\n");
      out.write("\t\t\t<td style='color: 72e118;text-align: right;vertical-align: top;padding-top: 3px; padding-right: 5px;'>\r\n");
      out.write("\t\t\t        ");


            User user = (User)session.getAttribute("QM_USER");
            out.println(Language.getInstance().getText("general.user") + ": " + user.getUsername() + "<br>");
            if(user.getUsername().toLowerCase().equals("installadmin") || user.getUsername().toLowerCase().equals("Administrator")){
        
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script language=\"javascript\">\r\n");
      out.write("          function logoutaction(){\r\n");
      out.write("            document.location.href=\"/logout.action\";\r\n");
      out.write("          }\r\n");
      out.write("        //  logoutaction();\r\n");
      out.write("        </script>\r\n");
      out.write("      ");

      }
        
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("\r\n");
      out.write("            <td class=\"startButton\" bgcolor='#ccffad'>\r\n");
      out.write("              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("                  ");
      if (_jspx_meth_ww_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                  ");
      if (_jspx_meth_ww_005felse_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                  ");
      if (_jspx_meth_ww_005fif_005f1(_jspx_page_context))
        return;
      if (_jspx_meth_ww_005felse_005f1(_jspx_page_context))
        return;
      out.write("</td>\r\n");
      out.write("                </table>\r\n");
      out.write("              </td>\r\n");
      out.write("\r\n");
      out.write("            <td class=\"startButton\" bgcolor='#ccffad'>\r\n");
      out.write("              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("                  ");
      if (_jspx_meth_ww_005fif_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                  ");
      if (_jspx_meth_ww_005felse_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                  ");
      if (_jspx_meth_ww_005fif_005f3(_jspx_page_context))
        return;
      if (_jspx_meth_ww_005felse_005f3(_jspx_page_context))
        return;
      out.write("</td>\r\n");
      out.write("                </table>\r\n");
      out.write("              </td>\r\n");
      out.write("\r\n");
      out.write("           \r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("\r\n");
      out.write("            <td class=\"startButton\" bgcolor='#ccffad'>\r\n");
      out.write("              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("                  \r\n");
      out.write("                    <td>\r\n");
      out.write("                  <a href=\"/touchscreens/bossallview/index.qsp2\"><img border=\"0\" src=\"images/start_manage.gif\"></a></td>\r\n");
      out.write("                </table>\r\n");
      out.write("              </td>\r\n");
      out.write("\r\n");
      out.write("            <td class=\"startButton\" bgcolor='#ccffad'>\r\n");
      out.write("               <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("                  \r\n");
      out.write("                    <tr>\r\n");
      out.write("                  \r\n");
      out.write("                    <td>\r\n");
      out.write("                  <img style=\"cursor:pointer;\" onClick=\"document.location.href='http://'+window.location.hostname+':8080/';\" border=\"0\" src=\"images/start_stat_rep.gif\"></td></tr>\r\n");
      out.write("                </table>\r\n");
      out.write("              </td>\r\n");
      out.write("\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("          \r\n");
      out.write("            <td class=\"startButton\" bgcolor='#ccffad'>\r\n");
      out.write("      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("                <td>\r\n");
      out.write("                 <a href=\"/sber/index.qsp\"> <img border=\"0\" src=\"");
      if (_jspx_meth_m_005fpath_005f1(_jspx_page_context))
        return;
      out.write("\"></a></td>\r\n");
      out.write("              </table>\r\n");
      out.write("            </td>\r\n");
      out.write("\r\n");
      out.write("            <td class=\"startButton\" bgcolor='#ccffad'>\r\n");
      out.write("                   <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n");
      out.write("                  \r\n");
      out.write("                    <tr>\r\n");
      out.write("                  \r\n");
      out.write("                    <td>\r\n");
      out.write("                  <img style=\"cursor:pointer;\" onClick=\"document.location.href='/logout.action';\" border=\"0\" src=\"images/exit.gif\"></td></tr>\r\n");
      out.write("                </table> \r\n");
      out.write("            </td>\r\n");
      out.write("            \r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td colspan=\"2\" background=\"images/start_bottom_left.gif\" height=34 >&nbsp;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t");


						
						out.println(Language.getInstance().getText("general.serverVersion") + ": " + ConnectionContext.getConnection().getVersion()+"  "+request.getRemoteAddr());
					
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("    </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("    <td>\r\n");
      out.write("\r\n");
      out.write("    </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("<!--");
      if (_jspx_meth_ww_005fif_005f4(_jspx_page_context))
        return;
      if (_jspx_meth_ww_005felse_005f4(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("LST_USE_CALL1-->\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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

  private boolean _jspx_meth_m_005fpath_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  m:path
    com.qmatic.web.tags.Path _jspx_th_m_005fpath_005f0 = (com.qmatic.web.tags.Path) _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.get(com.qmatic.web.tags.Path.class);
    _jspx_th_m_005fpath_005f0.setPageContext(_jspx_page_context);
    _jspx_th_m_005fpath_005f0.setParent(null);
    _jspx_th_m_005fpath_005f0.setSrc("/css/default.css");
    int _jspx_eval_m_005fpath_005f0 = _jspx_th_m_005fpath_005f0.doStartTag();
    if (_jspx_th_m_005fpath_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    webwork.view.taglib.IfTag _jspx_th_ww_005fif_005f0 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_ww_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f0.setParent(null);
    _jspx_th_ww_005fif_005f0.setTest("@QM_USER/hasPolicy('STAFF_MANAGEMENT') == true");
    int _jspx_eval_ww_005fif_005f0 = _jspx_th_ww_005fif_005f0.doStartTag();
    if (_jspx_eval_ww_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                    <td>\r\n");
        out.write("                  ");
        int evalDoAfterBody = _jspx_th_ww_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005felse_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:else
    webwork.view.taglib.ElseTag _jspx_th_ww_005felse_005f0 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fww_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_ww_005felse_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005felse_005f0.setParent(null);
    int _jspx_eval_ww_005felse_005f0 = _jspx_th_ww_005felse_005f0.doStartTag();
    if (_jspx_eval_ww_005felse_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                    <td>\r\n");
        out.write("                  ");
        int evalDoAfterBody = _jspx_th_ww_005felse_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005felse_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    webwork.view.taglib.IfTag _jspx_th_ww_005fif_005f1 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_ww_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f1.setParent(null);
    _jspx_th_ww_005fif_005f1.setTest("@QM_USER/hasPolicy('STAFF_MANAGEMENT') == true");
    int _jspx_eval_ww_005fif_005f1 = _jspx_th_ww_005fif_005f1.doStartTag();
    if (_jspx_eval_ww_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<a href=\"manager/staff\"><img  border=\"0\" src=\"images/start_staff_reg.gif\"></a>");
        int evalDoAfterBody = _jspx_th_ww_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f1);
    return false;
  }

  private boolean _jspx_meth_ww_005felse_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:else
    webwork.view.taglib.ElseTag _jspx_th_ww_005felse_005f1 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fww_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_ww_005felse_005f1.setPageContext(_jspx_page_context);
    _jspx_th_ww_005felse_005f1.setParent(null);
    int _jspx_eval_ww_005felse_005f1 = _jspx_th_ww_005felse_005f1.doStartTag();
    if (_jspx_eval_ww_005felse_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<img  border=\"0\" src=\"images/start_staff_reg_disabled.gif\">");
        int evalDoAfterBody = _jspx_th_ww_005felse_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005felse_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f1);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    webwork.view.taglib.IfTag _jspx_th_ww_005fif_005f2 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_ww_005fif_005f2.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f2.setParent(null);
    _jspx_th_ww_005fif_005f2.setTest("@QM_USER/hasPolicy('SERVER_EDITOR') == true");
    int _jspx_eval_ww_005fif_005f2 = _jspx_th_ww_005fif_005f2.doStartTag();
    if (_jspx_eval_ww_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                    <td>\r\n");
        out.write("                  ");
        int evalDoAfterBody = _jspx_th_ww_005fif_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f2);
    return false;
  }

  private boolean _jspx_meth_ww_005felse_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:else
    webwork.view.taglib.ElseTag _jspx_th_ww_005felse_005f2 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fww_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_ww_005felse_005f2.setPageContext(_jspx_page_context);
    _jspx_th_ww_005felse_005f2.setParent(null);
    int _jspx_eval_ww_005felse_005f2 = _jspx_th_ww_005felse_005f2.doStartTag();
    if (_jspx_eval_ww_005felse_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                    <td>\r\n");
        out.write("                  ");
        int evalDoAfterBody = _jspx_th_ww_005felse_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005felse_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f2);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    webwork.view.taglib.IfTag _jspx_th_ww_005fif_005f3 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_ww_005fif_005f3.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f3.setParent(null);
    _jspx_th_ww_005fif_005f3.setTest("@QM_USER/hasPolicy('SERVER_EDITOR') == true");
    int _jspx_eval_ww_005fif_005f3 = _jspx_th_ww_005fif_005f3.doStartTag();
    if (_jspx_eval_ww_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<a href=\"serversettings\"><img border=\"0\" src=\"images/start_sys_conf.gif\"></a>");
        int evalDoAfterBody = _jspx_th_ww_005fif_005f3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f3);
    return false;
  }

  private boolean _jspx_meth_ww_005felse_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:else
    webwork.view.taglib.ElseTag _jspx_th_ww_005felse_005f3 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fww_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_ww_005felse_005f3.setPageContext(_jspx_page_context);
    _jspx_th_ww_005felse_005f3.setParent(null);
    int _jspx_eval_ww_005felse_005f3 = _jspx_th_ww_005felse_005f3.doStartTag();
    if (_jspx_eval_ww_005felse_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("<img border=\"0\" src=\"images/start_sys_conf_disabled.gif\">");
        int evalDoAfterBody = _jspx_th_ww_005felse_005f3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005felse_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f3);
    return false;
  }

  private boolean _jspx_meth_m_005fpath_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  m:path
    com.qmatic.web.tags.Path _jspx_th_m_005fpath_005f1 = (com.qmatic.web.tags.Path) _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.get(com.qmatic.web.tags.Path.class);
    _jspx_th_m_005fpath_005f1.setPageContext(_jspx_page_context);
    _jspx_th_m_005fpath_005f1.setParent(null);
    _jspx_th_m_005fpath_005f1.setSrc("/images/webterm.gif");
    int _jspx_eval_m_005fpath_005f1 = _jspx_th_m_005fpath_005f1.doStartTag();
    if (_jspx_th_m_005fpath_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f1);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    webwork.view.taglib.IfTag _jspx_th_ww_005fif_005f4 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_ww_005fif_005f4.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f4.setParent(null);
    _jspx_th_ww_005fif_005f4.setTest("@QM_USER/hasPolicy('LST_USE_CALL1') == true");
    int _jspx_eval_ww_005fif_005f4 = _jspx_th_ww_005fif_005f4.doStartTag();
    if (_jspx_eval_ww_005fif_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("true");
        int evalDoAfterBody = _jspx_th_ww_005fif_005f4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005fif_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f4);
    return false;
  }

  private boolean _jspx_meth_ww_005felse_005f4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:else
    webwork.view.taglib.ElseTag _jspx_th_ww_005felse_005f4 = (webwork.view.taglib.ElseTag) _005fjspx_005ftagPool_005fww_005felse.get(webwork.view.taglib.ElseTag.class);
    _jspx_th_ww_005felse_005f4.setPageContext(_jspx_page_context);
    _jspx_th_ww_005felse_005f4.setParent(null);
    int _jspx_eval_ww_005felse_005f4 = _jspx_th_ww_005felse_005f4.doStartTag();
    if (_jspx_eval_ww_005felse_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("false");
        int evalDoAfterBody = _jspx_th_ww_005felse_005f4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005felse_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005felse.reuse(_jspx_th_ww_005felse_005f4);
    return false;
  }
}
