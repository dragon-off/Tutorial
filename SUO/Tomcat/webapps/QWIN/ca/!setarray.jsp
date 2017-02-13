<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page language="java" import="java.util.Iterator,
java.io.*,
java.sql.*,
webwork.action.ActionSupport,
com.qmatic.ConnectionContext,
com.qmatic.QwinFactory.QWinFactory,
com.qmatic.scripting.Script,
com.qmatic.scripting.ScriptManager,
webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,
java.util.List,
webwork.action.ActionContext"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ taglib uri="mole" prefix="m" %>
<%
	String logins="";
	String len="";
	String array=request.getParameter("array").replace("\"","");
	String value=request.getParameter("value").replace("\"","");
	String array_key[]=array.split("\\|");
    String array_value[]=value.split("\\|");
	if(array_value.length==array_key.length) {
		for (int i = 0; i < array_key.length-1; i++) {
			if(Integer.parseInt(array_key[i])>0)
			  len+="SETARRAY("+array_key[i]+" \""+array_value[i]+"\") \r\n";
			
		};
	} else {
		out.println("value.len!=array.len");
	};
	out.println(len);
    ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    Script s = sm.createScript("run", len);
	out.println(s.execute());
    sm.killScript(s);
%>  
