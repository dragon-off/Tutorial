// ver 5.7 12.02.2016
var vip_v_zale=0;
var viz_po_nomeru=0;
var spec_reg=0;
var sel1_i=0;
var sel2_i=0;
var sel3_i=0;
var status=1; 
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
		alert(msg_net_preav+sel.id);
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

				run_qwin('call_number_from_queue',document.getElementById(sel_type).options[sel_item].value); 
		//	};
			hide_top_msg(0);
		} else {
			alert("Выберите талон"+sel_type);
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
 
function swt(i, ii) { 

     if (i.split("|")[2] < ii.split("|")[2])
         return 1;
     else if (i.split("|")[2] > ii.split("|")[2])
         return -1;
     else
         return 0;
}
var HTTP_TIMEOUT = 10; 
function httpRequest(url, onSuccess, onFail, postData, timeout) {

 sbrf.log("	url "+url);
  var req = createXMLHttpRequest();
  var method = postData ? 'POST' : 'GET';
  req.open(method, url, true);
  req.setRequestHeader('User-Agent', 'XMLHTTP/1.0');
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

function update_split(resp)
{
	var disable_3=false;
	var line_split;
	line_split = resp.split('#');
	document.getElementById('msg_timeout').style.display='none';
	error_state=0;
	vip=false;
	for (var r=0; r <= line_split.length-1; r++) {
		sbrf.log_ajax("		"+line_split[r]);
		obj_split = line_split[r].split('^');

					if(obj_split[0]=='sel1_i')
						sel1_i=obj_split[1];
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
						
						document.getElementById(obj_split[0]).innerHTML = obj_split[1].replace("(ПК) ","").replace("(VIP) ","");
						
						};
					if(obj_split[0]=='cst')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='ERROR_LOGIN') {
						location.href='error_login.html';
						alert("В этом окне уже работает операционист");
					};
					if(obj_split[0]=='array_495')
						array_495 = obj_split[1]*1;
					if(obj_split[0]=='status') {
						if(obj_split[1]=='-') {
							status=0;
							change_avalible('registration',0);
							alert("Регистрация юр. лиц не возможна, операция не активна");
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
					if(obj_split[0]=='loginname') {
						loginname = obj_split[1];
						document.getElementById("login").innerHTML = obj_split[1];
					}
					if(obj_split[0]=='es') {
						error_state = obj_split[1]*1;
							if(error_state==1 && customer_present==1 && counter_item_button==(183)) { //проверка в перерыве или нет станция
								setTimeout('run_qwin(\'pereriv\',1)', 500);
							};
						
						};
					if(obj_split[0]=='taktika') 
						taktika = obj_split[1]*1;
					if(obj_split[0]=='taktika_norma') 
						taktika_norma = obj_split[1]*1;
					if(obj_split[0]=='ctt') 
						counter_transaction_time = obj_split[1]*1;
				//	if(obj_split[0]=='obsl') 
				//		document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='cp') {
					
						customer_present = obj_split[1]*1;
						if(customer_present==1) 
							change_avalible('pereadres',1);
						else 
							change_avalible('pereadres',0);
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
							document.getElementById('msg_top').innerHTML = "Выберите операцию :<form name=form1 id=form1><select id=spec_reg_sel>"+obj_split[1]+"<INPUT TYPE=BUTTON VALUE=Зарегистрировать onclick=run_qwin('spec_reg_sel',document.getElementById('spec_reg_sel').options[document.getElementById('spec_reg_sel').selectedIndex].value);hide_top_msg(0);type_avalible(2); ></select></form><table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0  onclick=><tr height=17 style='border:none;'><td><input type=button class=button id='otlozh1' onClick=hide_top_msg(0); value='Отмена'/></td></tr></table>";
						} else {
							document.getElementById('msg_top').innerHTML = "Выберите операцию :<form name=form1 id=form1><select id=spec_reg_sel>"+obj_split[1]+"<INPUT TYPE=BUTTON VALUE=Зарегистрировать onclick= ></select></form><table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0  onclick=><tr height=17 style='border:none;'><td><input type=button class=button id='otlozh1' onClick=hide_top_msg(0); value='Отмена'/></td></tr></table>";
						};
						hide_top_msg(1);
					};
					if(obj_split[0]=='msg_top_nc') {
					
						document.getElementById('msg_top').innerHTML = "<font style='font-size:12px' >Выберите номер клиента	<table style='font-size:12px' class=table_stton_select cellspacing=0 cellpadding=0 border=0><tr style='border:none;'><td style='border:none;'></td><td style='border:none;'></td></tr><form name=loginForm1 id=form1><TR><TD colspan=2><input type=hidden name=call_button /><select id='sel1' style='width:265px;' SIZE=6  name=menu1 onchange=select_call(this);></select></TD></TR></form><form style='margin-top:0; padding-top:0; margin-bottom:0; margin-bottom:0;' name=form1 id=form1><tr><td>Ваши отложенные клиенты  ("+sel1_i+"):<br><select id='sel2' style='width:130px;' SIZE=5  name=menu1 onchange=select_call(this);></select></form></td><td><form style='margin-top:0; padding-top:0; margin-bottom:0; margin-bottom:0;' name=form1 id=form1>Все отложенные клиенты  ("+sel2_i+"):<br><select id='sel3' style='width:130px;' SIZE=5  name=menu1 onchange=select_call(this);></select></form></td></tr><tr><td colspan=2><form style='margin-top:0; padding-top:0; margin-bottom:0; margin-bottom:0;' name=form1 id=form1 TITLE='Эти сброшенные клиенты доступны'>Вызвать сброшенного клиента  ("+sel3_i+"):<br><select id='sel4' style='width:265px;' SIZE=5   name=menu1 onchange=select_call(this);></select></TD></TR></form></table><table><tr><td><table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0  onclick=><tr height=17 style='border:none;'><td><input type=button class=button id='otlozh1' onClick=hide_top_msg(0); value='Отмена'/></td></tr></table></TD><TD><table class=table_button_select  width=127 height=36 cellspacing=0 cellpadding=0 onclick=><tr height=17><td><input type=button class=button id='otlozh1' onClick=call_select_number(); value='Вызвать'/></td></tr></table></TD></TR></TABLE>";
						var a=obj_split[1].split('~'); //группы
						var b;
						for(var i=0;i<=(a.length-1);i++) {
							var objSel = document.getElementById('sel'+(i+1));
							b=a[i].split('$');
							//alert("202"+b.length);
								b.sort(swt);
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
		if(customer_present==1 && counter_item_button==(185)) { //проверка в перерыве или нет станция
								change_avalible('pereadres',0);
							};
					if(counter_item_button==183){
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
							
					//alert();
};

function run_qwin(command,value) 
{
 //sbrf.log("Запрос "+command);
	if(command=='call_number') {
	//	gro=value.substr(0,2);
	//	value=value.substr(3,4);
		httpRequest('/get?pultfl=1&type='+command+'&workstation='+ws+'&value='+value*1, function(req) { update_split(req.responseText) }, function(req) { document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	} else if(command=='number_call') {
		httpRequest('number_call.qsp2?type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	} else if(command=='perevod_msg') {
		httpRequest('/get?pultfl=1&type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	} else if(command=='spec_reg') {
		httpRequest('run_content.qsp2?type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	} else if(command=='vbuffer' ){
		httpRequest('run_vbuffer.qsp2?type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if( command=='call_number_from_queue' ){
		httpRequest('run_call_number_from_queue.qsp2?type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if( command=='perevod' ){
							change_avalible('pereadres',0);
		httpRequest('/get?pultfl=1&type='+command+'&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	}  else if( command=='pereriv'){
		httpRequest('run_pereriv.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if( command=='in_work'){
	
	//	clearTimeout(auto_nextTimer);
		httpRequest('run_in_work.qsp2?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	
	
	} else if(command=='update_logon'){
		httpRequest('/get?pultfl=1&type='+command+'_ul&workstation='+ws+'&logincod='+logincod+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);	
	} else if(command=='close') {
		httpRequest('close.qsp2?workstation='+ws, function(req) {  }, function(req) { }, null, 20000);
	
	 } else if(command=='update') {
		httpRequest('/get?pultfl=1&type='+command+'_ul&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);

		
	} else if(command=='spec_reg_sel') {
		httpRequest('/get?pultfl=1&type='+command+'_ul&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
		setTimeout('httpRequest(\'/sberUL/call_track.qsp2?workstation=\'+ws, function(req) {  }, function(req) {  }, null, 20000);', 5000);

	} else {
		
		httpRequest('/get?pultfl=1&type='+command+'_ul&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  httpRequest('/login/login.action?username=Administrator', function(req) { }, function(req) { }, null, 20000); document.getElementById('msg_timeout').style.display='block';}, null, 20000);
	};

};
var updateTimer;
updateTimer_reset = function() {
	clearTimeout(updateTimer);
	updateTimer = setTimeout(function() {run_qwin('update',0); },2000);
}
function update() {
	updateTimer_reset();
	setTimeout('update()', 90000);
};

