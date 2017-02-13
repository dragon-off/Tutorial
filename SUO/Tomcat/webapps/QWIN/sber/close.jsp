<%@ page contentType='text/html;charset=utf-8'%>
<%@ page language="java" import="com.qmatic.web.staff.Utils,com.qmatic.ConnectionContext,javax.servlet.http.*,javax.servlet.*,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
	Script s;
	if(request.getParameter("error_login")!=null) {
		out.println("window.close();");
	} else 
	if(request.getParameter("close_true")!= null) {
		if(request.getParameter("close_true").equals("true")) {
			s = sm.createScript("run", "W="+request.getParameter("workstation")+"IF(COUNTER_CUSTOMER_PRESENT(W) EQ 1) BEGIN U=TIME_NO-COUNTER_CUSTOMER_ITEM(W ITEM_NEXT) IF(((U*2) LE ((ARRAY(501)+ARRAY(500))))  AND COUNTER_CUSTOMER_ITEM(W ITEM_BUTTON) NE 183) BEGIN SETARRAY(5870+W 1) FUNC_INSERT_LAST(W 5 COUNTER_CUSTOMER_ITEM(W ITEM_NUMBER) 182 0) END END FUNC_COUNTER_CLOSE(W) SETARRAY(2900+W 0)");
			s.execute();
			sm.killScript(s);
			%>
			
				window.close();
			


			
			<%
		}
	} else 
		if(request.getParameter("close")!= null) {
			try
			{
				s=sm.createScript("run", "W="+request.getParameter("workstation")+"{}BUTTON_QUEUE(130+W)");
				//out.println(Integer.parseInt(s.execute()));
				if(Integer.parseInt(s.execute())>0) {
					%>
		
					if(confirm("У Вас есть отложенные клиенты, Вы уверены что хотите выйти из пульта.")) {
						//alert(window.location+"&close_true=true");
						httpRequest(url+"&close_true=true", function(req) {   window.close(); }, function(req) { alert("Ошибка завершение работы, повторите выход снова."); }, null, 20000);
		
						
					};
		
				<%
					out.println("yes клиенты");
				}  else {
					out.println("no клиенты");
				};
				sm.killScript(s);
		} catch (Exception e) {
			
		}

	}
%>