<%@ taglib uri="mole" prefix="m" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <%@ include file="../../javascript/qwinUpdate.js"%>
        <script language="JavaScript">

        <%
            if(((Boolean)session.getAttribute("QWIN_CLIENT_SESSION")).booleanValue()){
                out.println("keepSessionAlive('../../time.jsp');");
            }
        %>
        </script>
    </head>

        <frameset cols="190,*">
                <frame src="leftframe.jsp" name="nav">
                <frame src="blank.jsp" name="contents">
        </frameset>

</html>
