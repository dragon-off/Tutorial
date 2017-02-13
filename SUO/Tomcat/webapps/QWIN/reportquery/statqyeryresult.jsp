<%@ page import="webwork.action.ActionContext"%><%@ taglib uri="webwork" prefix="ww" %><%
    Object result = ActionContext.getValueStack().findValue("data");
    byte[] b = (byte[])result;               
response.getOutputStream().write(b);%>