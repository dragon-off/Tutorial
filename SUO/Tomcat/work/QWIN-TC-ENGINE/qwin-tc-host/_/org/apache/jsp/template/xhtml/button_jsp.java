package org.apache.jsp.template.xhtml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class button_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.release();
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<table width=\"80\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"button\" onClick=\"");
      if (_jspx_meth_ww_005fproperty_005f0(_jspx_page_context))
        return;
      out.write("\"><tr><td width=\"2\" align=\"left\" valign=\"top\"><img src=\"");
      if (_jspx_meth_m_005fpath_005f0(_jspx_page_context))
        return;
      out.write("\" width=\"2\" height=\"19\" /></td><td class=\"button\" align=\"center\" valign=\"middle\">");
      if (_jspx_meth_ww_005fproperty_005f1(_jspx_page_context))
        return;
      out.write("</td><td width=\"3\" align=\"right\" valign=\"top\"><img src=\"");
      if (_jspx_meth_m_005fpath_005f1(_jspx_page_context))
        return;
      out.write("\" width=\"3\" height=\"19\" /></td></tr></table>");
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
    _jspx_th_ww_005fproperty_005f0.setValue("onClick");
    int _jspx_eval_ww_005fproperty_005f0 = _jspx_th_ww_005fproperty_005f0.doStartTag();
    if (_jspx_th_ww_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_m_005fpath_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  m:path
    com.qmatic.web.tags.Path _jspx_th_m_005fpath_005f0 = (com.qmatic.web.tags.Path) _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.get(com.qmatic.web.tags.Path.class);
    _jspx_th_m_005fpath_005f0.setPageContext(_jspx_page_context);
    _jspx_th_m_005fpath_005f0.setParent(null);
    _jspx_th_m_005fpath_005f0.setSrc("/images/btn_left.gif");
    int _jspx_eval_m_005fpath_005f0 = _jspx_th_m_005fpath_005f0.doStartTag();
    if (_jspx_th_m_005fpath_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fproperty_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    webwork.view.taglib.PropertyTag _jspx_th_ww_005fproperty_005f1 = (webwork.view.taglib.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.get(webwork.view.taglib.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f1.setParent(null);
    _jspx_th_ww_005fproperty_005f1.setValue("label");
    int _jspx_eval_ww_005fproperty_005f1 = _jspx_th_ww_005fproperty_005f1.doStartTag();
    if (_jspx_th_ww_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fnobody.reuse(_jspx_th_ww_005fproperty_005f1);
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
    _jspx_th_m_005fpath_005f1.setSrc("/images/btn_right.gif");
    int _jspx_eval_m_005fpath_005f1 = _jspx_th_m_005fpath_005f1.doStartTag();
    if (_jspx_th_m_005fpath_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.reuse(_jspx_th_m_005fpath_005f1);
    return false;
  }
}
