<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ page import="com.qmatic.ConnectionContext"%>
<%@ taglib uri="mole" prefix="m" %>
<%
    String sessionID = ConnectionContext.getSession().getSessionID();
%>
<html>
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Mozilla/4.5 [en] (WinNT; I) [Netscape]">
        <title>Web Statistic Applet</title>
    </head>
    <body>
        <%
            //request.getContextPath();
            String base = request.getRequestURL().toString();
            int port = request.getServerPort();
            String p = (port==-1)?"80":String.valueOf(port);

            //out.println(request.getContextPath());
            base = "http://" + request.getServerName() + ":" + p + request.getContextPath();
            String basePath = base + "/statistics/result.jsp?report=";
            String queryUrl = base + "/reportquery/statquery.action?";


        %>
        <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
            <tr>
                <td class="boxTop"><h3 class="box">Web Statistic Applet</h3></td>
            </tr>
            <tr>
                <td class="boxMain">
                    <applet CODE="source.webstat.WebStatistic.class" ARCHIVE="webstatistic.jar" WIDTH=500 HEIGHT=600>
                        <param name="QueryURL" value="<%=queryUrl%>">
                        <param name="basePath" value="<%=basePath%>">
                        <param name="sessionID" value="<%=sessionID%>">
                    </applet>
                </td>
            </tr>
        </table>
  </body>
</html>


