<html>
    <head>
        <title>
            Server Configuration
        </title>
        <%@ include file="../javascript/qwinUpdate.js"%>
        <script language="JavaScript">

        <%
            if(((Boolean)session.getAttribute("QWIN_CLIENT_SESSION")).booleanValue()){

                out.println("keepSessionAlive('../time.jsp');");
            }
        %>
        </script>
    </head>
    <frameset cols="170, 200,*" border="0">
        <frame name="groups" src="groups.jsp">
        <frameset rows="440,*" border="0">
            <frame name="tree" src="blank.jsp">
            <frame name="actionFrame" src="blank.jsp">
        </frameset>
        <frameset rows="560,*" border="0">
            <frame name="grid" src="blank.jsp">
            <frame name="scriptdbg" src="blank.jsp">
        </frameset>
    </frameset>
</html>