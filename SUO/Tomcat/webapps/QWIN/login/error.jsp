<%--
  Created by IntelliJ IDEA.
  User: jonathan
  Date: 2005-aug-26
  Time: 10:13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <script language="JavaScript">
        function logout() {
            top.location.href="index.jsp";
        }
    </script>

    <title>Logging out</title></head>
  <body onLoad="logout();">
    <center><h2>Please wait..</h2></center>
  </body>
</html>