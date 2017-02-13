// ver. 5 29.06.2016
var vip_v_zale=0;
var	vip=false;
var viz_po_nomeru=0;
var spec_reg=0;
var sel1_i=0;
var sel2_i=0;
var sel3_i=0;
var set_autonext;
var auto_nextTimer;
var prior;
function getVarValueFromURL(url, varName) { //для получение значений из URL
	var query = url.substring(url.indexOf('?') + 1);
	var vars = query.split("&");
	for (var i=0;i<vars.length;i++) {
		var pair = vars[i].split("=");
		if (pair[0] == varName) {
			return pair[1];
		}
	}
	return null;
} ;
sbrf = {
    debug: false, 
	debug_ajax: false, 
	debug_timer: false, 
    log: function(obj) {
        if(this.debug) {
            console.log(obj);
        }
    },
	log_ajax: function(obj) {
        if(this.debug_ajax) {
            console.log(obj);
        }
    },
	log_timer: function(obj) {
        if(this.debug_timer) {
            console.log(obj);
        }
    }
};
var sel_type=null;
var sel_item=null;
var msg_net_preav='У вас нет прав на вызов талонов из очереди';
function select_call(sel){
	if(viz_po_nomeru == 0 && (sel.id=='sel1')) {
		alert(msg_net_preav);
	} else {
		sel_type=sel.id;
		
		sel_item=sel.selectedIndex;
		document.getElementById('sel1').selectedIndex=-1;
		document.getElementById('sel2').selectedIndex=-1;
		document.getElementById('sel3').selectedIndex=-1;
		document.getElementById('sel4').selectedIndex=-1;
		
		document.getElementById(sel_type).selectedIndex=sel_item;
	};
}
function call_select_number() {
	if(viz_po_nomeru == 0 && (sel_type=='sel1')) {
		alert(msg_net_preav);
	} else {
		if(sel_type) {
				//alert(document.getElementById(sel_type).options[sel_item].value);
				run_qwin('call_number_from_queue',document.getElementById(sel_type).options[sel_item].value); 
		//	};
			/////////hide_top_msg(0);
		} else {
			alert("Выберите талон");
		};
		sel_type=null;
		sel_item=null;
	};
}
function hide_top_msg(val)
{
sel_type=null;
sel_item=null;
	if(val==1) {
		document.getElementById('msg_top').style.display='block';
	}else{
		document.getElementById('msg_top').style.display='none';	
	};
}

function createXMLHttpRequest() {
  try { return new XMLHttpRequest(); } catch(e) {}
  try { return new ActiveXObject('Msxml2.XMLHTTP'); } catch (e) {}
  try { return new ActiveXObject('Microsoft.XMLHTTP'); } catch (e) {}
  throw 'XMLHttpRequest not supported';
}
 function sort_ab(a,b) {
	var buf=[];
	var aa;
	var bb;
	for(var i = 0; i < a.length - 1; i++)
	{
		for(var j = i + 1; j < b.length; j++)
		{
			aa=a[i].split("|")[2]*1;
			bb=b[j].split("|")[2]*1;
			if (aa < bb)
			{
				buf[0] = a[i];
				a[i] = b[j];
				b[j] = buf[0];
				
			}
		}
	}
	return b;
}
function swt(a, b) { 
	var split1;
	var split2;
	split1=a.split("|");
	split2=b.split("|");
	split1[2]=split1[2]*1;
	split2[2]=split2[2]*1;

    if (split1[2] <= split2[2])
        return 1;
    else if (split1[2] >= split2[2])
        return -1;
    return 0;
}
var HTTP_TIMEOUT = 10; 
function httpRequest(url, onSuccess, onFail, postData, timeout) {

 
  var req = createXMLHttpRequest();
  var method = postData ? 'POST' : 'GET';
  req.open(method, url, true);
 // req.setRequestHeader('User-Agent', 'XMLHTTP/1.0');
  if (postData) {
    req.setRequestHeader('Content-type','application/x-www-form-urlencoded');
  }

  var timer = null;
  if (!timeout) timeout = HTTP_TIMEOUT;
  if (timeout != -1) {
    timer = setTimeout(httpTimeoutClosure(req, onFail), timeout);
  }

  req.onreadystatechange = httpStatusChangeClosure(req, onSuccess, onFail, timer);
    req.send(postData);
}
  
function httpTimeoutClosure(req, onFail) {
  return function() {
   req.onreadystatechange = null;
    try {req.abort()}
   finally {if (onFail) onFail(req)}
  }
}

function httpStatusChangeClosure(req, onSuccess, onFail, timer) {
  return function() {
    if (req.readyState != 4) return;
    if (timer) clearTimeout(timer);
    if (req.status != 200 && req.status != 304) {
	 
      if (onFail) onFail(req);
      return;
    }    
    if (onSuccess) onSuccess(req);
  }
}

function update_split(resp, type)
{
	update_split(resp);
	alert(1);
	clearTimeout(auto_nextTimer); 
	auto_nextTimer=setTimeout(function() { run_qwin('next',999); wait_next(); },auto_next); 
};
function update_split(resp)
{
	var disable_3=false;
	var line_split;
	line_split = resp.split('#');
	document.getElementById('msg_timeout').style.display='none';
	error_state=0;
	for (var r=0; r <= line_split.length-1; r++) {
		sbrf.log_ajax("		"+line_split[r]);
		obj_split = line_split[r].split('^');

					if(obj_split[0]=='sel1_i')
						sel1_i=obj_split[1];
					if(obj_split[0]=='LOGIN_ERROR')
					{
						if(getVarValueFromURL(document.URL ,'error_login') != "1") {
					//	alert(111);
						window.location=location.href+"&error_login=1";
						};
					};
					if(obj_split[0]=='sel2_i')
						sel2_i=obj_split[1];
					if(obj_split[0]=='sel3_i')
						sel3_i=obj_split[1];
					if(obj_split[0]=='lc')
						if(obj_split[1]==0)
							alert("Перезапустите программу");
					if(obj_split[0]=='display')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='custitemcard') {
						if(obj_split[2])
							document.getElementById(obj_split[0]).innerHTML = obj_split[2].replace("(ПК)","").replace("(VIP)","");
						else
							document.getElementById(obj_split[0]).innerHTML = obj_split[1].replace("(ПК)","").replace("(VIP)","");
						
						};
						
					if(obj_split[0]=='prior')
						prior = obj_split[1];
					if(obj_split[0]=='cst')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='ERROR_LOGIN') {
						location.href='error_login.html';
						alert("В этом окне уже работает операционист");
					};
					if(obj_split[0]=='array_495')
						array_495 = obj_split[1]*1;
					if(obj_split[0]=='vip') {
						if(obj_split[1]=='1') { 
							vip=true;
						} else {
							vip=false;
						};
					}; 			
					if(obj_split[0]=='viz_po_nomeru')
						viz_po_nomeru = obj_split[1]*1;
					if(obj_split[0]=='spec_reg')
						spec_reg = obj_split[1]*1;
					if(obj_split[0]=='array_500')
						array_500 = obj_split[1]*1;
					if(obj_split[0]=='array_501')
						array_501 = obj_split[1]*1;
					if(obj_split[0]=='auto_next')
						auto_next = obj_split[1]*1;
					if(obj_split[0]=='loginname') {
						loginname = obj_split[1];
						document.getElementById("login").innerHTML = obj_split[1];
					}
					if(obj_split[0]=='js_run') {
						try {
							eval(obj_split[1]);
						} catch (e){
							
						};
					};
					if(obj_split[0]=='array_7000_w')
						array_7000_w = obj_split[1]*1;
					if(obj_split[0]=='vseg')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='oper')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='att')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='takt')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='es') {
						error_state = obj_split[1]*1;
							if(error_state==1 && customer_present==1 && counter_item_button==(183)) { //проверка в перерыве или нет станция
								setTimeout('run_qwin(\'pereriv\',1)', 500);
							};
							
						};
					if(obj_split[0]=='taktika') 
						taktika = obj_split[1]*1;
					if(obj_split[0]=='call_track') {
						if(obj_split[1]=='ok') {
							hide_top_msg(0);
						} else if(obj_split[1]=='error') {
							alert("Талон уже вызван другим пользователем.");
							run_qwin('number_call',0);
						}
					};
					if(obj_split[0]=='taktika_norma') 
						taktika_norma = obj_split[1]*1;
					if(obj_split[0]=='ctt') 
						counter_transaction_time = obj_split[1]*1;
				//	if(obj_split[0]=='obsl') 
				//		document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='cp') {
						customer_present = obj_split[1]*1;
						
						if(customer_present == 1) {
							clearTimeout(auto_nextTimer);
							stopCount();
						};
					};
					if(obj_split[0]=='co') 
						counter_open = obj_split[1]*1; 
					if(obj_split[0]=='ci_ib')
						counter_item_button = obj_split[1]*1;
					if(obj_split[0]=='msg_top') {
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
						hide_top_msg(1);
					};
					if(obj_split[0]=='msg_top_sr') {
						if(obj_split[1].length>1) {
							document.getElementById('msg_top').innerHTML = "Выберите операцию :<form name=form1 id=form1><select style='width:220px;' id=spec_reg_sel>"+obj_split[1]+"<INPUT TYPE=BUTTON VALUE=Зарегистрировать onclick=run_qwin('spec_reg_sel',document.getElementById('spec_reg_sel').options[document.getElementById('spec_reg_sel').selectedIndex].value);hide_top_msg(0);type_avalible(2); ></select></form><table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0  onclick=><tr height=17 style='border:none;'><td><input type=button class=button id='otlozh1' onClick=hide_top_msg(0); value='Отмена'/></td></tr></table>";
						} else {
							document.getElementById('msg_top').innerHTML = "Выберите операцию :<form name=form1 id=form1><select style='width:220px;' id=spec_reg_sel>"+obj_split[1]+"<INPUT TYPE=BUTTON VALUE=Зарегистрировать onclick= ></select></form><table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0  onclick=><tr height=17 style='border:none;'><td><input type=button class=button id='otlozh1' onClick=hide_top_msg(0); value='Отмена'/></td></tr></table>";
						};
						hide_top_msg(1);
					};
					if(obj_split[0]=='msg_top_nc') {
					
						document.getElementById('msg_top').innerHTML = "<font style='font-size:12px' >Ожидающие	<table style='font-size:12px' class=table_stton_select cellspacing=0 cellpadding=0 border=0><tr style='border:none;'><td style='border:none;'></td><td style='border:none;'></td></tr><TR><TD colspan=2>	<form name=loginForm1 id=form1><input type=hidden name=call_button />	<select id='sel1' style='width:265px;' SIZE=6  name=menu1 onchange=select_call(this);></select></form></TD></TR><tr><td><form style='margin-top:0; padding-top:0; margin-bottom:0; margin-bottom:0;' name=form1 id=form1>Отложенные мной ("+sel1_i+"):<br><select id='sel2' style='width:130px;' SIZE=6  name=menu1 onchange=select_call(this);></select></form></td><td><form style='margin-top:0; padding-top:0; margin-bottom:0; margin-bottom:0;' name=form1 id=form1>Отложенные другими ("+sel2_i+"):<br><select id='sel3' style='width:130px;' SIZE=6  name=menu1 onchange=select_call(this);></select></td></form></tr><tr><td colspan=2><form style='margin-top:0; padding-top:0; margin-bottom:0; margin-bottom:0;' name=form1 id=form1>Сброшенные:<br><select id='sel4' style='width:265px;' SIZE=6   name=menu1 onchange=select_call(this);></select></form></TD></TR></table><table><tr><td>	<table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0  onclick=>	<tr height=17 style='border:none;'><td><input type=button class=button id='otlozh1' onClick=hide_top_msg(0); value='Отмена'/></td></tr>	</table></TD><TD>	<table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0 onclick=>	<tr height=17><td><input type=button class=button id='otlozh1' onClick=call_select_number(); value='Вызвать'/></td></tr>	</table></TD></TR></TABLE>";
						var a=obj_split[1].split('~;'); //группы
						var b;
						for(var i=0;i<=(a.length-1);i++) {
							var objSel = document.getElementById('sel'+(i+1));
							b=a[i].split('{}');
							//alert("202"+b.length);
								//b=b.sort(swt);
								b=sort_ab(b,b);
							for(var j=0;j<=(b.length-2);j++) {
								if(b[j].length>0) {
								//alert(b[j]);
									objSel.options[j] = new Option(b[j].split("|")[1], b[j].split("|")[0]);
								};
							};
						}
					
						hide_top_msg(1);
					};
					if(obj_split[0]=='blink' & blink_a==0) {
						if(counter_item_button!=(183) && counter_item_button!=(185)) {
							type_avalible(2);
							disable_3=true;
							blink_a=array_500*2;
							blink_b=0;
							//alert(123);
							blink();
						};
					};
					
	};
	//alert("counter_item_button="+counter_item_button+";  error_state="+error_state);
					if(counter_item_button==183){
					sbrf.log("type_avalible(3) len 183");
						type_avalible(3);
						
						};	
					if(counter_item_button==185){
					sbrf.log("type_avalible(3) len 183");
						type_avalible(3);
						
						};
					if(error_state==3 && disable_3==false && customer_present==0) {
					sbrf.log("type_avalible(3) len 188");
						type_avalible(3);
						
						};
					if(counter_transaction_time>0 && blink_a==0)
						type_avalible(1);
					if(spec_reg>0){
						type_avalible(2);
						spec_reg=0;
					};					
					if(vip && vip_v_zale==0) {
							//alert("В зале VIP-клиент");
							vip_v_zale=1;
					} else if(vip==false && vip_v_zale==1) {
						vip_v_zale=0;
							};					
					//alert();
};

function run_qwin(command,value) 
{

 sbrf.log("Запрос "+command);
	if(command=='call_number') {
	//	gro=value.substr(0,2);
	//	value=value.substr(3,4);
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value*1+'&type1=update', function(req) { update_split(req.responseText) }, function(req) { document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		//httpRequest('run.qsp2?type="'+command+'"&workstation='+ws+'&value='+value*1, function(req) { update_split(req.responseText) }, function(req) { document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	} else if(command=='number_call') {
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		//httpRequest('number_call.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	} else if(command=='perevod_msg') {
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		//httpRequest('perevod_msg.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	} else if(command=='spec_reg') {
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		//httpRequest('run_content.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	} else if(command=='vbuffer' ){
		//value=999; {29122016 исправлние бага с отсутсвием повис}
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) { update_split(req.responseText);clearTimeout(auto_nextTimer); auto_nextTimer=setTimeout(function() { run_qwin('next',999);wait_next(); },auto_next); }, function(req) { httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		//httpRequest('run_vbuffer.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText); }, function(req) { httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if( command=='call_number_from_queue' ){
		//alert(value);
		value=value.split('-');
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value[0]+'&type1=update&logincod='+value[1], function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
//		httpRequest('run_call_number_from_queue.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if( command=='perevod' ){
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) { update_split(req.responseText);  
		//httpRequest('run_perevod.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText);  
		clearTimeout(auto_nextTimer); auto_nextTimer=setTimeout(function() { run_qwin('next',999);wait_next(); },auto_next); }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		
		
	
	} else if( command=='pereriv'){
		//alert(1);
		clearTimeout(auto_nextTimer);
		if(counter_item_button==183 && customer_present==1) { 
			httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) {update_split(req.responseText); clearTimeout(auto_nextTimer); 
	auto_nextTimer=setTimeout(function() { run_qwin('next',999); wait_next(); },auto_next); }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		}else {
			httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) {update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		};
		//httpRequest('run_pereriv.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if( command=='in_work'){
		
		clearTimeout(auto_nextTimer);
		if(counter_item_button==185 && customer_present==1) { 
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) { update_split(req.responseText,1); clearTimeout(auto_nextTimer); 
	auto_nextTimer=setTimeout(function() { run_qwin('next',999); wait_next(); },auto_next);  }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		} else {
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) {  update_split(req.responseText); }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		};
		//httpRequest('run_in_work.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if(command=='update_logon'){
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&logincod='+logincod+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);	
		//httpRequest('run_logon.qsp2?type="'+command+'"&workstation='+ws+'&logincod='+logincod+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);	
	} else if(command=='close') {
		httpRequest('close.qsp2?workstation='+ws, function(req) {  }, function(req) { }, null, 20000);
	
	 } else if(command=='update') {
		//httpRequest('run_update.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);

	} else if(command=='next') {
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		
	} else {
		httpRequest('/get?pultfl=1&type1=update&type='+command+'&workstation='+ws+'&value='+value+'&type1=update', function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		//httpRequest('run.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	};

};
var updateTimer;
updateTimer_reset = function() {
	clearTimeout(updateTimer);
	updateTimer = setTimeout(function() {run_qwin('update',0); },2000);
}
function update() {
	updateTimer_reset();
	setTimeout('update()', 30000);
};

