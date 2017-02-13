<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.network.User,
                 com.qmatic.web.i18n.Language"%>

<%@ taglib uri="webwork" prefix="ww" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
          <%
                User user = (User)session.getAttribute("QM_USER");
                out.println(user.getUsername());
           %>
