package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Locale;
import com.qmatic.network.SessionFactory;
import com.qmatic.network.LoginPolicy;
import java.util.List;
import java.util.Iterator;
import com.qmatic.web.i18n.Language;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005faction_0026_005fname_005fid;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fiterator_0026_005fvalue;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fm_005fbutton_0026_005fonClick_005flabel_005fnobody;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005faction_0026_005fname_005fid = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fiterator_0026_005fvalue = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fm_005fbutton_0026_005fonClick_005flabel_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.release();
    _005fjspx_005ftagPool_005fww_005faction_0026_005fname_005fid.release();
    _005fjspx_005ftagPool_005fww_005fiterator_0026_005fvalue.release();
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fm_005fbutton_0026_005fonClick_005flabel_005fnobody.release();
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Login</title>\r\n");
      out.write("        <link href=\"");
      if (_jspx_meth_m_005fpath_005f0(_jspx_page_context))
        return;
      out.write("\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("        <script language=\"JavaScript\" >\r\n");
      out.write("\r\n");
      out.write("            function entsub(event, myform) {\r\n");
      out.write("                if (event && event.keyCode == 13){\r\n");
      out.write("                        myform.submit();\r\n");
      out.write("                }\r\n");
      out.write("                else\r\n");
      out.write("                    return true;\r\n");
      out.write("            }\r\n");
      out.write("\t\t\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body> <!--\r\n");
      out.write("        ");

            try{
                LoginPolicy p = SessionFactory.getInstance().getLoginPolicy();
                Language l = Language.getInstance();
                List languages = l.getAvailableLocales();


        
      out.write("\r\n");
      out.write("        <form id=\"loginform\" name=loginForm action=\"login.action\" method=\"post\">\r\n");
      out.write("        <center>\r\n");
      out.write("        <div style=\"margin-top: 100px;\">\r\n");
      out.write("\t\t<div style=\"display:none;\">\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t<tr><td>Locale:</td><td> <select name=\"localeStr\">\r\n");
      out.write("                        ");

                            for(Iterator i = languages.iterator(); i.hasNext();){
                                Locale locale = (Locale)i.next();
                                
      out.write("\r\n");
      out.write("                                <option value=\"");
      out.print(locale.getLanguage() + "_" + locale.getCountry());
      out.write('"');
      out.write('>');
      out.print(locale.getDisplayLanguage());
      out.write("</option>\r\n");
      out.write("                                ");

                            }

                        
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </select> </td></tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t<table  cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=0>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td  width='283' height='78' background=\"../images/login_top.gif\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\t\t  <tr bgcolor='#ccffad'><td><table  cellpadding=\"0\" cellspacing=\"0\"  align=\"center\" bgcolor='#ccffad'>\r\n");
      out.write("\r\n");
      out.write("                        <tr><td>Username: </td><td>\r\n");
      out.write("                        ");

                            if(p.isUsernameListingAllowed()){
                        
      out.write("\r\n");
      out.write("               <select name=\"username\" onkeypress=\"return entsub(event,this.form);\"  onchange=\"loginForm.pagee.value='/index.jsp?id='+this.options[this.selectedIndex].id;\">\r\n");
      out.write("                        ");
      if (_jspx_meth_ww_005faction_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                        </select>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <input type=\"text\" name=\"username\" onKeyPress=\"return entsub(event,this.form);\">\r\n");
      out.write("                        ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    </td></tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>Password: </td><td><input\r\n");
      out.write("                                ");

                                    if(!p.isPasswordRequired())
                                        out.println("disabled");
                                
      out.write("                                \r\n");
      out.write("                                type=\"password\" name=\"password\" onKeyPress=\"return entsub(event,this.form)\"\r\n");
      out.write("                                ");
      out.print(!p.isPasswordRequired()?"style=\"background-color: #EEEEEE;\"":"");
      out.write("\r\n");
      out.write("                                >\r\n");
      out.write("\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td></td><td align=\"right\">");
      if (_jspx_meth_m_005fbutton_005f0(_jspx_page_context))
        return;
      out.write("</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("\t\t\t</table></td></tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td  background=\"../images/login_bottom.gif\" height=34 >&nbsp;\r\n");
      out.write("\t\t\tServer SUO\r\n");
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        </center>\r\n");
      out.write("        <input type=\"hidden\" name=\"sessionID\" value=\"000000\">\r\n");
      out.write("        <input id=\"pagee\" type=\"hidden\" name=\"page\" value=\"/\">\r\n");
      out.write("\r\n");
      out.write("        </form>\r\n");
      out.write("\t\t    <script language=javascript>\r\n");
      out.write("\t\t    \tloginForm.username.focus();\r\n");
      out.write("\t\t    </script>\r\n");
      out.write("            ");
 }
               catch(Exception e){
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <table width=\"500\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"borderedbox\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td class=\"boxTop\"><h3 class=\"box\">Error</h3></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td><br>Unable to create session with Q-win server<br>\r\n");
      out.write("                                    ");
      out.print(e.getMessage());
      out.write("\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                     </table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("             ");
   }
             
      out.write("\r\n");
      out.write("-->\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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

  private boolean _jspx_meth_ww_005faction_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:action
    webwork.view.taglib.ActionTag _jspx_th_ww_005faction_005f0 = (webwork.view.taglib.ActionTag) _005fjspx_005ftagPool_005fww_005faction_0026_005fname_005fid.get(webwork.view.taglib.ActionTag.class);
    _jspx_th_ww_005faction_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005faction_005f0.setParent(null);
    _jspx_th_ww_005faction_005f0.setName("'stafflist'");
    _jspx_th_ww_005faction_005f0.setId("list");
    int _jspx_eval_ww_005faction_005f0 = _jspx_th_ww_005faction_005f0.doStartTag();
    if (_jspx_eval_ww_005faction_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                            ");
        if (_jspx_meth_ww_005fiterator_005f0(_jspx_th_ww_005faction_005f0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_ww_005faction_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_ww_005faction_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005faction_0026_005fname_005fid.reuse(_jspx_th_ww_005faction_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005faction_0026_005fname_005fid.reuse(_jspx_th_ww_005faction_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fiterator_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005faction_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:iterator
    webwork.view.taglib.IteratorTag _jspx_th_ww_005fiterator_005f0 = (webwork.view.taglib.IteratorTag) _005fjspx_005ftagPool_005fww_005fiterator_0026_005fvalue.get(webwork.view.taglib.IteratorTag.class);
    _jspx_th_ww_005fiterator_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fiterator_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005faction_005f0);
    _jspx_th_ww_005fiterator_005f0.setValue("staffMembers");
    int _jspx_eval_ww_005fiterator_005f0 = _jspx_th_ww_005fiterator_005f0.doStartTag();
    if (_jspx_eval_ww_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_ww_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_ww_005fiterator_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_ww_005fiterator_005f0.doInitBody();
      }
      do {
        out.write("\r\n");
        out.write("                                ");
        if (_jspx_meth_ww_005fif_005f0(_jspx_th_ww_005fiterator_005f0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_ww_005fiterator_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_ww_005fiterator_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_ww_005fiterator_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fiterator_0026_005fvalue.reuse(_jspx_th_ww_005fiterator_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fiterator_0026_005fvalue.reuse(_jspx_th_ww_005fiterator_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fiterator_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    webwork.view.taglib.IfTag _jspx_th_ww_005fif_005f0 = (webwork.view.taglib.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(webwork.view.taglib.IfTag.class);
    _jspx_th_ww_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fiterator_005f0);
    _jspx_th_ww_005fif_005f0.setTest("logonName != ''");
    int _jspx_eval_ww_005fif_005f0 = _jspx_th_ww_005fif_005f0.doStartTag();
    if (_jspx_eval_ww_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                                    <option id=\"");
        if (_jspx_meth_ww_005fproperty_005f0(_jspx_th_ww_005fif_005f0, _jspx_page_context))
          return true;
        out.write("\" value=\"");
        if (_jspx_meth_ww_005fproperty_005f1(_jspx_th_ww_005fif_005f0, _jspx_page_context))
          return true;
        out.write('"');
        out.write('>');
        if (_jspx_meth_ww_005fproperty_005f2(_jspx_th_ww_005fif_005f0, _jspx_page_context))
          return true;
        out.write("</option>\r\n");
        out.write("                                ");
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

  private boolean _jspx_meth_ww_005fproperty_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    webwork.view.taglib.PropertyTag _jspx_th_ww_005fproperty_005f0 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fif_005f0);
    _jspx_th_ww_005fproperty_005f0.setValue("loginCode");
    int _jspx_eval_ww_005fproperty_005f0 = _jspx_th_ww_005fproperty_005f0.doStartTag();
    if (_jspx_th_ww_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fproperty_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    webwork.view.taglib.PropertyTag _jspx_th_ww_005fproperty_005f1 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fif_005f0);
    _jspx_th_ww_005fproperty_005f1.setValue("logonName");
    int _jspx_eval_ww_005fproperty_005f1 = _jspx_th_ww_005fproperty_005f1.doStartTag();
    if (_jspx_th_ww_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f1);
    return false;
  }

  private boolean _jspx_meth_ww_005fproperty_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    webwork.view.taglib.PropertyTag _jspx_th_ww_005fproperty_005f2 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f2.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fif_005f0);
    _jspx_th_ww_005fproperty_005f2.setValue("logonName");
    int _jspx_eval_ww_005fproperty_005f2 = _jspx_th_ww_005fproperty_005f2.doStartTag();
    if (_jspx_th_ww_005fproperty_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f2);
    return false;
  }

  private boolean _jspx_meth_m_005fbutton_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  m:button
    com.qmatic.web.tags.ui.ButtonTag _jspx_th_m_005fbutton_005f0 = (com.qmatic.web.tags.ui.ButtonTag) _005fjspx_005ftagPool_005fm_005fbutton_0026_005fonClick_005flabel_005fnobody.get(com.qmatic.web.tags.ui.ButtonTag.class);
    _jspx_th_m_005fbutton_005f0.setPageContext(_jspx_page_context);
    _jspx_th_m_005fbutton_005f0.setParent(null);
    _jspx_th_m_005fbutton_005f0.setLabel("'login'");
    _jspx_th_m_005fbutton_005f0.setOnClick("document.loginForm.submit();");
    int _jspx_eval_m_005fbutton_005f0 = _jspx_th_m_005fbutton_005f0.doStartTag();
    if (_jspx_th_m_005fbutton_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fm_005fbutton_0026_005fonClick_005flabel_005fnobody.reuse(_jspx_th_m_005fbutton_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fm_005fbutton_0026_005fonClick_005flabel_005fnobody.reuse(_jspx_th_m_005fbutton_005f0);
    return false;
  }
}
