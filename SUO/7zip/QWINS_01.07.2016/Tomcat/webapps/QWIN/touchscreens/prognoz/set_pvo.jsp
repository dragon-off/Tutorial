<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
	String len="";
	String red;
	BufferedReader input = null;
   	String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/settings_admin/month.sql";
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
	
	//len+="SETARRAY("+request.getParameter("arr1")+" "+request.getParameter("print_time")+")";  
	//len+="SETARRAY("+request.getParameter("arr2")+" "+request.getParameter("print_chel")+")";
	
	
	len+="SETARRAY("+request.getParameter("arx1")+" "+request.getParameter("time1")+")";
	len+="SETARRAY("+request.getParameter("ary1")+" "+request.getParameter("chel1")+")";
	
	len+="SETARRAY("+request.getParameter("arx2")+" "+request.getParameter("time2")+")";
	len+="SETARRAY("+request.getParameter("ary2")+" "+request.getParameter("chel2")+")";
	
	len+="SETARRAY("+request.getParameter("arx3")+" "+request.getParameter("time3")+")";
	len+="SETARRAY("+request.getParameter("ary3")+" "+request.getParameter("chel3")+")";
	
	len+="SETARRAY("+request.getParameter("arx4")+" "+request.getParameter("time4")+")";
	len+="SETARRAY("+request.getParameter("ary4")+" "+request.getParameter("chel4")+")";
	
	len+="SETARRAY("+request.getParameter("arx5")+" "+request.getParameter("time5")+")";
	len+="SETARRAY("+request.getParameter("ary5")+" "+request.getParameter("chel5")+")";
	
	len+="SETARRAY("+request.getParameter("arx6")+" "+request.getParameter("time6")+")";
	len+="SETARRAY("+request.getParameter("ary6")+" "+request.getParameter("chel6")+")";
	
	len+="SETARRAY("+request.getParameter("arx7")+" "+request.getParameter("time7")+")";
	len+="SETARRAY("+request.getParameter("ary7")+" "+request.getParameter("chel7")+")";
	
	len+="SETARRAY("+request.getParameter("arx8")+" "+request.getParameter("time8")+")";
	len+="SETARRAY("+request.getParameter("ary8")+" "+request.getParameter("chel8")+")";
	
	len+="SETARRAY("+request.getParameter("arx9")+" "+request.getParameter("time9")+")";
	len+="SETARRAY("+request.getParameter("ary9")+" "+request.getParameter("chel9")+")";
	
	len+="SETARRAY("+request.getParameter("arx10")+" "+request.getParameter("time10")+")";
	len+="SETARRAY("+request.getParameter("ary10")+" "+request.getParameter("chel10")+")";
	
	len+="SETARRAY("+request.getParameter("arx11")+" "+request.getParameter("time11")+")";
	len+="SETARRAY("+request.getParameter("ary11")+" "+request.getParameter("chel11")+")";
	
	len+="SETARRAY("+request.getParameter("arx12")+" "+request.getParameter("time12")+")";
	len+="SETARRAY("+request.getParameter("ary12")+" "+request.getParameter("chel12")+")";
	
	len+="SETARRAY("+request.getParameter("arx13")+" "+request.getParameter("time13")+")";
	len+="SETARRAY("+request.getParameter("ary13")+" "+request.getParameter("chel13")+")";
	
	len+="SETARRAY("+request.getParameter("arx14")+" "+request.getParameter("time14")+")";
	len+="SETARRAY("+request.getParameter("ary14")+" "+request.getParameter("chel14")+")";
	
	len+="SETARRAY("+request.getParameter("arx15")+" "+request.getParameter("time15")+")";
	len+="SETARRAY("+request.getParameter("ary15")+" "+request.getParameter("chel15")+")";
	
	len+="SETARRAY("+request.getParameter("arx16")+" "+request.getParameter("time16")+")";
	len+="SETARRAY("+request.getParameter("ary16")+" "+request.getParameter("chel16")+")";
	
	len+="SETARRAY("+request.getParameter("arx17")+" "+request.getParameter("time17")+")";
	len+="SETARRAY("+request.getParameter("ary17")+" "+request.getParameter("chel17")+")";
	
	len+="SETARRAY("+request.getParameter("arx18")+" "+request.getParameter("time18")+")";
	len+="SETARRAY("+request.getParameter("ary18")+" "+request.getParameter("chel18")+")";
	
	len+="SETARRAY("+request.getParameter("arx19")+" "+request.getParameter("time19")+")";
	len+="SETARRAY("+request.getParameter("ary19")+" "+request.getParameter("chel19")+")";
	
	len+="SETARRAY("+request.getParameter("arx20")+" "+request.getParameter("time20")+")";
	len+="SETARRAY("+request.getParameter("ary20")+" "+request.getParameter("chel20")+")";
	
	
    	Script s = sm.createScript("run", len); 
	red=s.execute();
    // out.println(red);
	sm.killScript(s);
	//out.print(request.getParameter("pvo"));

%>  
