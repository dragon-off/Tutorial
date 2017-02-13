package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import com.qmatic.web.security.CookieUtils;

public final class error404_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/tags.tld");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fm_005fpath_0026_005fsrc_005fnobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    Throwable exception = org.apache.jasper.runtime.JspRuntimeLibrary.getThrowable(request);
    if (exception != null) {
      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Error Report</title>\r\n");
      out.write("        <link href=\"");
      if (_jspx_meth_m_005fpath_005f0(_jspx_page_context))
        return;
      out.write("\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("        ");

            String touch_startpage = CookieUtils.getCookieValue(request, "touch-startpage");
            if(touch_startpage!=null)
                out.println("<meta http-equiv='refresh' content='5;url=" + touch_startpage + "' />");
        
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <table width='300' border='0' cellspacing='0' cellpadding='0' class='borderedbox'>\r\n");
      out.write("            <tr><td class='boxTop' colspan='2'><h3 class='box'>Error</h3></td></tr><tr>\r\n");
      out.write("            <tr><td>&nbsp;</td></tr>\r\n");
      out.write("            <tr><td style=\"width:25%\"><b>&nbsp;Code:</b></td><td>404</td></tr>\r\n");
      out.write("            <tr><td style=\"width:25%\"><b>&nbsp;Message:</b></td><td>Page not found</td></tr>\r\n");
      out.write("            <tr><td>&nbsp;</td></tr>\r\n");
      out.write("            ");

                if(touch_startpage!=null)
                    out.println("<tr><td  colspan='2'>&nbsp;Redirection in 5 seconds.</b></td></tr>");
            
      out.write("\r\n");
      out.write("       </table>\r\n");
      out.write("    </body>\r\n");
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
}
