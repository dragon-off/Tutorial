<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
	//String len="";
	String red;
	//BufferedReader input = null;
   	String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/settings_admin/month.sql";
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    	Script s = sm.createScript("run", "FUNC_EVENT_SEND(122 1 "+request.getParameter("pvo")+")"); 
	red=s.execute();
    // out.println(red);
	sm.killScript(s);
	//out.print(request.getParameter("pvo"));

%>  
