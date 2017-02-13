<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.qmatic.web.security.CookieUtils"%>
<%@page isErrorPage="true" %>
<%@ taglib uri="mole" prefix="m" %>

<html>
    <head>
        <title>Error</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <%
            String touch_startpage = CookieUtils.getCookieValue(request, "touch-startpage");
            if(touch_startpage!=null)
                out.println("<meta http-equiv='refresh' content='5;url=" + touch_startpage + "'/>");
        %>
    </head>
    <body>
<%
    String code = "500";

    if(touch_startpage!=null){

        out.println("<table width='300' border='0' cellspacing='0' cellpadding='0' class='borderedbox'>");
        out.println("<tr><td class='boxTop' colspan='2'><h3 class='box'>Error</h3></td></tr><tr>");

        out.println("<tr><td style='width:25%'><b>&nbsp;Code:</b></td><td>" + code + "</td></tr>");
        out.println("<tr><td style='width:25%'><b>&nbsp;Message:</b></td><td>" + exception.getMessage() + "</td></tr><tr><td>&nbsp;</td></tr>");
        out.println("<tr><td  colspan='2'>&nbsp;Redirection in 5 seconds.</b></td></tr>");
    }
    else{
%>
        <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
            <tr>
                <td class="boxTop"><h3 class="box">Error</h3></td>
            </tr>
            <tr>

        <td class='boxMain'>
        <div class='settingsGridScroll'>
        <table cellpadding='0' cellspacing='0' width='100%'>
        <tr bgcolor='#EEEEEE'><td>Class</td><td>Method</td><td>Line</td></tr>
<%
    out.println("<b>Message:</b> " + exception.getMessage() + "<br>");
    out.println("<b>Exception:</b> " + exception.getClass() + "<p>");
    StackTraceElement[] elements = exception.getStackTrace();

    for(int i = 0; i< elements.length; i++) {
        %>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;<%=elements[i].getClassName()%></td>
            <td><%=elements[i].getMethodName()%></td>
            <td><%=elements[i].getLineNumber()%></td>

        </tr>
        <%
    }
%>
</table>
                    </div>
                </td>
            </tr>
<%    }
%>
        </table>
    </body>
</html>