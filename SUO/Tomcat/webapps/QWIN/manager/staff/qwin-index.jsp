<html>
    <head>
        <title>Staff management</title>
        <%@ include file="../../javascript/qwinUpdate.js"%>
        <script language="JavaScript">

        <%
            if(((Boolean)session.getAttribute("QWIN_CLIENT_SESSION")).booleanValue()){

                out.println("keepSessionAlive('../../time.jsp');");
            }
        %>
        </script>
    </head>

    <frameset cols="250,*">
        <frame SCROLLING="no" src="search/result.jsp?start=0&max=10&qType=SM&q=" name="navigation"  MARGINWIDTH="0" MARGINHEIGHT="0">
        <frame SCROLLING="no" src="welcome.jsp" name="main"  MARGINWIDTH="0" MARGINHEIGHT="0">
    </frameset>


</html>