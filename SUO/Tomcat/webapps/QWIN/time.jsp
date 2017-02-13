<%@ page import="java.text.SimpleDateFormat,
                 java.util.Date"%>
 <%--
  Created by IntelliJ IDEA.
  User: Jan Gabrielsson
  Date: 2005-okt-06
  Time: 09:24:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head></head>
  <body><%String time=new SimpleDateFormat("HH:mm:ss").format(new Date());

  %>
    <%=time%></body>
</html>