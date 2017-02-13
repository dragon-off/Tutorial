<%@ page contentType="text/html; charset=windows-1251" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
	String len="";
	String red;
	BufferedReader input = null;
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
	
	if(request.getParameter("voice")!=null) {
		len+="SETARRAY(460 0)";
	}else{
		len+="SETARRAY(460 1)";
	};
	len+="SETARRAY(2700 "+request.getParameter("mopenh_time")+")";
	len+="SETARRAY(2701 "+request.getParameter("mopenm_time")+")";
	len+="SETARRAY(2702 "+request.getParameter("mcloseh_time")+")";
	len+="SETARRAY(2703 "+request.getParameter("mclosem_time")+")";
	len+="SETARRAY(2704 "+request.getParameter("topenh_time")+")";
	len+="SETARRAY(2705 "+request.getParameter("topenm_time")+")";
	len+="SETARRAY(2706 "+request.getParameter("tcloseh_time")+")";
	len+="SETARRAY(2707 "+request.getParameter("tclosem_time")+")";
	len+="SETARRAY(2708 "+request.getParameter("wopenh_time")+")";
	len+="SETARRAY(2709 "+request.getParameter("wopenm_time")+")";
	len+="SETARRAY(2710 "+request.getParameter("wcloseh_time")+")";
	len+="SETARRAY(2711 "+request.getParameter("wclosem_time")+")";
	len+="SETARRAY(2712 "+request.getParameter("thopenh_time")+")";
	len+="SETARRAY(2713 "+request.getParameter("thopenm_time")+")";
	
	
	len+="SETARRAY(2714 "+request.getParameter("thcloseh_time")+")";
	len+="SETARRAY(2715 "+request.getParameter("thclosem_time")+")";
	len+="SETARRAY(2716 "+request.getParameter("fopenh_time")+")";
	len+="SETARRAY(2717 "+request.getParameter("fopenm_time")+")";
	len+="SETARRAY(2718 "+request.getParameter("fcloseh_time")+")";
	len+="SETARRAY(2719 "+request.getParameter("fclosem_time")+")";
	len+="SETARRAY(2720 "+request.getParameter("satopenh_time")+")";
	len+="SETARRAY(2721 "+request.getParameter("satopenm_time")+")";
	len+="SETARRAY(2722 "+request.getParameter("satcloseh_time")+")";
	len+="SETARRAY(2723 "+request.getParameter("satclosem_time")+")";
	len+="SETARRAY(2724 "+request.getParameter("sunopenh_time")+")";
	len+="SETARRAY(2725 "+request.getParameter("sunopenm_time")+")";
	len+="SETARRAY(2726 "+request.getParameter("suncloseh_time")+")";
	len+="SETARRAY(2727 "+request.getParameter("sunclosem_time")+")";
	//len+="T=TIME_NO ";
	//len+="R=T/1800 ";
	//len+="U=(T-(T/30)*30)*2 ";
	//len+="E=STRNTS(R)+\":\"+STRNTS((T-(R)*1800)/30)+\":\"+STRNTS(U) ";
	//len+="FUNC_EVENT_SEND(130 1 \"CHANGE DAYTABLE \"+E+\" TIME \"+STRNTS(ARRAY(2700)*1)+\" MonOH \"+STRNTS(ARRAY(2701)*1)+\" MonOM \"+STRNTS(ARRAY(2702)*1)+\" MonCH \"+STRNTS(ARRAY(2703)*1)+\" MonCM \"+STRNTS(ARRAY(2704)*1)+\" TueOH \"+STRNTS(ARRAY(2705)*1)+\" TueOM \"+STRNTS(ARRAY(2706)*1)+\" TueCH \"+STRNTS(ARRAY(2707)*1)+\" TueCM \"+STRNTS(ARRAY(2708)*1)+\" WedOH \"+STRNTS(ARRAY(2709)*1)+\" WedOM \"+STRNTS(ARRAY(2710)*1)+\" WedCH \"+STRNTS(ARRAY(2711)*1)+\" WedCM \"+STRNTS(ARRAY(2712)*1)+\" ThuOH \"+STRNTS(ARRAY(2713)*1)+\" ThuOM \"+STRNTS(ARRAY(2714)*1)+\" ThuCH \"+STRNTS(ARRAY(2715)*1)+\" ThuCM \"+STRNTS(ARRAY(2716)*1)+\" FriOH \"+STRNTS(ARRAY(2717)*1)+\" FriOM \"+STRNTS(ARRAY(2718)*1)+\" FriCH \"+STRNTS(ARRAY(2719)*1)+\" FriCM \"+STRNTS(ARRAY(2720)*1)+\" SatOH \"+STRNTS(ARRAY(2721)*1)+\" SatOM \"+STRNTS(ARRAY(2722)*1)+\" SatCH \"+STRNTS(ARRAY(2723)*1)+\" SatCM \"+STRNTS(ARRAY(2724)*1)+\" SunOH \"+STRNTS(ARRAY(2725)*1)+\" SunOM \"+STRNTS(ARRAY(2726)*1)+\" SunCH \"+STRNTS(ARRAY(2727)*1)+\" SunCM \")";

	
    	Script s = sm.createScript("run", len); 
	red=s.execute();
    // out.println(red);
	sm.killScript(s);
	//out.print(request.getParameter("pvo"));

%>  
<html>
<head>    <meta HTTP-EQUIV="REFRESH" content="0; url=settings_time.qsp2">   
</head>
<body>

</body></html>