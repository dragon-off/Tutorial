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
    for (int i = 0; i < array_key.length-1; i++) {
        len+="SETARRAY("+array_key[i]+" \""+array_value[i]+"\") \r\n";
		if(Integer.parseInt(array_key[i])>1100)
            logins+=String.valueOf(Integer.parseInt(array_key[i])-1100)+",";
    };
	if(logins.length()>0)
		len+="FUNC_EVENT_SEND(142 1 \"PERSONCOMPETENCE logins=\\\""+logins.substring(0,logins.length()-1)+"\\\" END\")";
	out.println(len);
    ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    Script s = sm.createScript("run", len);
	out.println(s.execute());
    sm.killScript(s);
%>  
