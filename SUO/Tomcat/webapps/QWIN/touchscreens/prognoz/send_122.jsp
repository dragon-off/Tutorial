<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
	String red;
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    Script s = sm.createScript("run", "FUNC_EVENT_SEND(122 1 "+request.getParameter("pvo")+")"); 
	red=s.execute();
	sm.killScript(s);

%>  
