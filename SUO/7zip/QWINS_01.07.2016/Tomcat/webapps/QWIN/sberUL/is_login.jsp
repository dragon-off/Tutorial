<%@ page contentType='text/html;charset=utf-8'%>
<%@ page language="java" import="com.qmatic.web.staff.Utils,com.qmatic.ConnectionContext,javax.servlet.http.*,javax.servlet.*,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%


if(request.getParameter("workstation")!= null) {
    try
    {
    ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
	Script s = sm.createScript("run", "W="+request.getParameter("workstation")+"\n SETARRAY(2931+W TIME_NO) IF(COUNTER_LOGIN_ID(W) GT 0) BEGIN IF((ARRAY(2900+W)+20) GT TIME_NO AND TIME_NO GE ARRAY(2900+W)) BEGIN \"0\" END ELSE BEGIN \"1\"	SETARRAY(2900+W TIME_NO)  END END ELSE BEGIN IF(TIME_NO LE (ARRAY(2900+W)+5) AND TIME_NO GE ARRAY(2900+W)) \"0\" ELSE BEGIN \"1\"	SETARRAY(2900+W TIME_NO) END END");
		
		 out.println(s.execute());
		sm.killScript(s);
    } catch (Exception e) {

out.println("1");
    }
	}
	%>