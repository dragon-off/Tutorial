<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.network.User,
				 java.util.*,
                 com.qmatic.web.i18n.Language"%>
<%@ taglib uri="mole" prefix="m" %>


<%@ taglib uri="webwork" prefix="ww" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <LINK REL="StyleSheet" HREF="../style.css" TYPE="text/css">
 <script type="text/javascript" src="/touchscreens/lib/ajax.js"></script> 
 <script type="text/javascript" src="../js/Browser.js"></script>
<script type="text/javascript" src="/js/qevent.js"></script>
	<script type="text/javascript" src="menu.js"></script> 
	<script type="text/javascript">
	var moder="";;
	qwin_event.trig = function(eventType, unit, result){
	if(eventType*1 == 200)
		{
		result=result.split('#');
		if((result[1]*1)<=0)
			{
			if(paper_alarm==0)
				{
				alert("В регистраторе талонов закончилась бумага!");
				add_to_journal(2,"В регистраторе талонов закончилась бумага!");
				paper_alarm = 1;
				}
			}
		else
			paper_alarm = 0;
		}
	else if(eventType*1 == 143)
		{
		if(result*1 > 40 && result*1 < 60)
			{
			playsoundfunc();
			alert("В зале VIP-клиент");
			}
		}
};

qwin_event.setEvents = function(){
qwin_event.waitForEventTrig("200.143");
};
qwin_event.setEvents();
	function parseGetParam(param) { 
		   
		   var get_param=1;
		   var url = window.location.search.substring(1).split("&");
		   
		   if(url.length>0) 
			{
		   for(var i=0; i<url.length; i++) 
				{ 
				var getVar = url[i].split("="); 
				
				if(getVar[0]==param) 
					get_param=getVar[1];
				} 
			}
			
			return get_param;
		} 
	function setCookie(c_name,value,exdays)
		{
		var exdate=new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
		document.cookie=c_name + "=" + c_value;
		}
	function getCookie(c_name)
	{
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1)
	  {
	  c_start = c_value.indexOf(c_name + "=");
	  }
	if (c_start == -1)
	  {
	  c_value = null;
	  }
	else
	  {
	  c_start = c_value.indexOf("=", c_start) + 1;
	  var c_end = c_value.indexOf(";", c_start);
	  if (c_end == -1)
	  {
	c_end = c_value.length;
	}
	c_value = unescape(c_value.substring(c_start,c_end));
	}
	return c_value;
	}
	
	function set_url()
	{
	moder = parseGetParam("user");
	var el = document.getElementById('compet');
	var el2 = document.getElementById('matr');
	var el3 = document.getElementById('fmatr');
	<%
	User user;
	try {
		user = (User)session.getAttribute("QM_USER");
		out.println("setCookie(\"username\",\""+user.getUsername()+"\",20)");
		out.println(" var username2 = '"+user.getUsername()+"';");
	} catch (Exception e) {
		out.println("");
	}
	out.println("moder = getCookie(\"username\");");
	%>
	
	//alert(parseGetParam("user"));
	/*if(moder==0){ 
	
	};*/
	//parent.location.href = "http://www.yandex.ru";
	if(parseGetParam("user")) {
		el.setAttribute('href', '../matrix_comp/matrix_comp.html?user='+parseGetParam("user"));
		el2.setAttribute('href', '../matrix_prior/matrix_prior.html?user='+parseGetParam("user"));
		el3.setAttribute('href', '../matrix_future/matrix_future.html?user='+parseGetParam("user"));
	} else {
		el.setAttribute('href', '../matrix_comp/matrix_comp.html?user=2');
		el2.setAttribute('href', '../matrix_prior/matrix_prior.html?user=2');
		el3.setAttribute('href', '../matrix_future/matrix_future.html?user=2');
	}
	}
	

	</script> 
    </head>
 <body onLoad="set_url();start_message();" style="overflow-x:hidden;">
 <!--<embed src="beep.wav" autostart=false width=0 height=0 name="sound1" enablejavascript="true">-->
 <bgsound id="sound">

 <table id="block" style="width:300px;height:100%;position:absolute;left:0px;top:0px;display:none;"><tr><td><div style="display:none;" id="blockres">0</div></td></tr></table>
<table class=tableMain width=170 cellpadding=4 cellspacing=0>
	<tr>
		<td class=headerBar>
			Онлайн-мониторинг
		</td>
	</tr>
 
    
    
        <tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../monitoring/index.html' target=content>Онлайн-мониторинг</a></td></tr>
    
        <tr><td  class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../matrix_prior/matrix_prior.html' target=content id="matr">Матрица приоритетов</a></td></tr>
		<tr>
<td onClick="window.open('http://'+window.location.hostname+':8081/index.html?muser='+moder,'content')" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';" style="color: blue;">
		
		Статистика</td></tr>
	
        <tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a id="compet" href="matrix_comp/matrix_comp.html" target=content>Матрица компетенций</a></td></tr>
	<tr><td  class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href="../matrix_future/matrix_future.html" target=content id="fmatr">Матрица будущего состояния</a></td></tr>
		
 
    
        
    
	<tr>
		<td class=headerBar>
			Настройка площадки
		</td>
	</tr>
 
	<tr><td  class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_buttons/settings_buttons.qsp2' target=content>Операции</a></td></tr>
		<tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_windows/settings_windows.qsp2' target=content>Окна</a></td></tr>
		<tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_logins/settings_logins.qsp2' target=content>Пользователи</a></td></tr>
	<tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_svetofor/settings_svetofor.qsp2' target=content>Светофор</a></td></tr>
	<tr>
	<td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_time/settings_time.qsp2?login=' target=content>Настройка времени  и чередования</a></td>  
        
	
	
	</tr>
		<tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_vsp/settings_vsp.qsp2' target=content>Настройка ВСП</a></td></tr>
		<tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../settings_numer/settings_numer.jsp' target=content>Настройка нумерации окон</a></td></tr>

		<tr><td class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><a href='../journal/journal.html' target=content>Журнал аудита</a></td></tr>
	
</table>
</body>
</html>
