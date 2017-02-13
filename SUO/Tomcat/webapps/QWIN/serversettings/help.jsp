<%@ page import="com.qmatic.web.serversettings.Help,
                 webwork.action.ActionContext"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<html>
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <style type="text/css">

            .helpTable {
                margin-left: 10px;
                width: 500px;
            }
        </style>
    </head>
    <body>
        <table class="helpTable">
            <tr><td><img src="<m:path src="/images/help.gif"/>"> <b>Help (<ww:property value="$helpId"/>)</b></td></tr>
            <tr><td>
                <%
                    String text = (String)ActionContext.getValueStack().findValue("helpText");
                    out.print(text);
                %>

            </td></tr>
        </table>
    </body>
</html>