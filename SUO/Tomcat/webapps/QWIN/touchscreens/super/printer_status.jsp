<%@ page contentType='text/html;charset=utf-8'%><%@ page language="java" import="com.qmatic.web.staff.Utils,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport,java.io.PrintStream,java.io.Reader,java.net.URL" %><%         
if(request.getParameter("printer")!= null) {
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    try
    {
		Script s1;
		try {
			s1 = sm.createScript("run", "P="+request.getParameter("printer")+" Y=PRINTER_TICKETS_LEFT(P) R=1 IF(STRNTS(Y) EQ \"-1\") BEGIN Y=TIME_NO  IF(STRSTN(ARRAY(690+P)) EQ STRSTN(Y))	R=0 END IF(STRSTN(Y) LE 0)	R=0 A=\"\"+P+\"#\"+R+\"#\"+ARRAY(2606)+\"#\"+STRNTS(Y) SETARRAY(690+P Y) SETARRAY(694 R+10) FUNC_EVENT_SEND(200 1 A) A");
			out.print(s1.execute());
			sm.killScript(s1);			
		} catch (Exception e) {
			e.printStackTrace();
		}
    } catch (Exception e) {	e.printStackTrace();
    }
}	%>