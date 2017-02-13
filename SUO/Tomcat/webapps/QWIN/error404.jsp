
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.qmatic.web.security.CookieUtils"%>
<%@page isErrorPage="true" %>
<%@ taglib uri="mole" prefix="m" %>


<html>
    <head>
        <title>Error Report</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <%
            String touch_startpage = CookieUtils.getCookieValue(request, "touch-startpage");
            if(touch_startpage!=null)
                out.println("<meta http-equiv='refresh' content='5;url=" + touch_startpage + "' />");
        %>
    </head>
    <body>
        <table width='300' border='0' cellspacing='0' cellpadding='0' class='borderedbox'>
            <tr><td class='boxTop' colspan='2'><h3 class='box'>Error</h3></td></tr><tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td style="width:25%"><b>&nbsp;Code:</b></td><td>404</td></tr>
            <tr><td style="width:25%"><b>&nbsp;Message:</b></td><td>Page not found</td></tr>
            <tr><td>&nbsp;</td></tr>
            <%
                if(touch_startpage!=null)
                    out.println("<tr><td  colspan='2'>&nbsp;Redirection in 5 seconds.</b></td></tr>");
            %>
       </table>
    </body>
</html>
