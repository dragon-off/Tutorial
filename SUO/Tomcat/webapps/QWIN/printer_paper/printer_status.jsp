<%@ page contentType='text/html;charset=utf-8'%><%@ page language="java" import="com.qmatic.web.staff.Utils,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport,java.io.PrintStream,java.io.Reader,java.net.URL" %><%         URL u=null;
if(request.getParameter("printer")!= null) {
String printer_ip;
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
    try
    {
		Script s1 = sm.createScript("run", "GS(\"PRINTER\" \"HOSTNAME\"+"+request.getParameter("printer")+" \"1\")");
		printer_ip=s1.execute();
		sm.killScript(s1);
		try {
			u=new URL("http",printer_ip,80,"/js/getPaperSensor.js");
			byte b[]=new byte[100];
			int c=u.openStream().read(b);
			String s= new  String(b,40,c);
			String n;
			n=s.substring(0,s.lastIndexOf("'"));
		
			s1 = sm.createScript("run", "A=\""+request.getParameter("printer")+"#"+n+"#\"+ARRAY(2606) FUNC_EVENT_SEND(200 1 A) A");
			out.print(s1.execute());
			sm.killScript(s1);			
		} catch (Exception e) {
			e.printStackTrace();
		} 
    } catch (Exception e) {	e.printStackTrace();
    }
}	%>