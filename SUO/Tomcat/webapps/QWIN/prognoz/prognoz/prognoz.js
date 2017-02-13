

var HTTP_TIMEOUT = 5; 
function createXMLHttpRequest() {
	try { return new XMLHttpRequest(); } catch(e) {}
	try { return new ActiveXObject('Msxml2.XMLHTTP'); } catch (e) {}
	try { return new ActiveXObject('Microsoft.XMLHTTP'); } catch (e) {}
	throw 'XMLHttpRequest not supported';
}
 
function httpRequest(url, onSuccess, onFail, postData, timeout) {
	var req = createXMLHttpRequest();
	var method = postData ? 'POST' : 'GET';
	req.open(method, url, true);
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




var TIME_NO=90000;
var TRACK_NO=3000;

var array_data=new Array();
var queue=new Array();
var l_name=new Array();
l_name[1]="VIP pereved";
l_name[2]="VIP";
l_name[3]="UL pereved";
l_name[4]="PK pereved";
l_name[5]="PK";
l_name[6]="prostoy pereved";
l_name[7]="prostoy";
var counter=new Array();
var operation_takt=new Array();
var button_run=new Array();
var prognoz_wt=new Array();
var prognoz_queue=new Array();
for (var r=1; r <= 7; r++) {
	prognoz_wt[""+r.toString()]=new Array();
	prognoz_queue[""+r.toString()]=new Array();
}

function create_last(button,level) {
	queue[TRACK_NO]=new Array();
	queue[TRACK_NO]["ITEM_START"]="89999";
	queue[TRACK_NO]["ITEM_TRACK"]=TRACK_NO.toString();
	queue[TRACK_NO]["ITEM_BUTTON"]=button.toString();
	button_run[button]=true;
	queue[TRACK_NO]["LEVEL"]=level.toString();
	queue[TRACK_NO]["LAST"]=true;
	TRACK_NO++;
	return true;
};

function load_queue(resp) //загружаем очередь
{
	var queue_len;
	var counter_len;
	var but_takt;
	var str_type;
	var last_ticket=new Array();
	last_ticket["1"]=new Array();
	last_ticket["2"]=new Array();
	last_ticket["3"]=new Array();
	last_ticket["4"]=new Array();
	last_ticket["5"]=new Array();
	last_ticket["6"]=new Array();
	last_ticket["7"]=new Array();
	
	str_type = resp.split('@@');
	queue_len=str_type[0].split('#');
	counter_len=str_type[1].split('#');
	but_takt=str_type[2].split('#');
	for (var r=0; r <= queue_len.length-2; r++) {
		items=queue_len[r].split('^');
		queue[items[1]]=new Array();
		queue[items[1]]["ITEM_START"]=items[2];
		queue[items[1]]["ITEM_TRACK"]=items[1];
		queue[items[1]]["ITEM_BUTTON"]=items[3];
		button_run[items[3]]=true;
		queue[items[1]]["LEVEL"]=items[5];
		

	};
	for(var r=1; r <= 20; r++) {
		for(var l=1; l <= 7; l++) {
			create_last(r,l);
		};
		
	};
	
	for (var r=0; r <= counter_len.length-2; r++) {
		//0-counter; 1-stroka prioriteta; 2-vip
		items=counter_len[r].split('^');
		
		counter[items[0]]=new Array();
		counter[items[0]]["VIP"]=items[2];
		counter[items[0]]["COUNTER"]=items[3];
		counter[items[0]]["QUEUE"]=0; //ОБСЛ. КЛИЕНТОВ
		counter[items[0]]["TT"]=0;    //ВРЕМЯ ОБСЛ.
		counter[items[0]]["RUN"]=1;    //для станции есть клиенты
		for (var j=0; j <= items[1].length-1; j++) {
			if(items[1][j]!="0")
				counter[items[0]][j+1]=items[1][j];
		};
	};
	
	for (var r=0; r <= but_takt.length-1; r++) {
		//0-counter; 1-stroka prioriteta; 2-vip
		items=but_takt[r].split('^');
		operation_takt[items[0]]=new Array();
		operation_takt[items[0]]["id"]=items[0];
		operation_takt[items[0]]["takt"]=items[1];
		operation_takt[items[0]]["rwt"]=items[2];
		
	};
};


function load() {
	httpRequest('load_queue.qsp2', function(req) { load_queue(req.responseText); run_prognoz(); }, function(req) {  }, null, 20000);
	return true;
};



function ARRAY(i) {
	return array_data[i];
};

function BUTTON_QUEUE(i) {
	var count=0;
	for(var j in queue) {
		if (!queue.hasOwnProperty(j)) continue;
		if(queue[j]["ITEM_BUTTON"] == i)
			count++;
	};
	return count;
};

function BUTTON_RWT(i,vip) {

if(!button_run[i])
	return null;
	console.log("run BUTTON_RWT");
	
	var max=0;
	var level="7";
	var ticket=null;
	for(var j in queue) {
		if (!queue.hasOwnProperty(j)) continue;
		max_if=(TIME_NO-queue[j]["ITEM_START"]);
		if((queue[j]["ITEM_BUTTON"] == i.toString()) &&
			((max_if>=max  && level==queue[j]["LEVEL"]) || (level>queue[j]["LEVEL"])) && 
			((queue[j]["LEVEL"]!=1 && queue[j]["LEVEL"]!=2) || "1"==vip.toString())) {
				level=queue[j]["LEVEL"];
				max=max_if;
				ticket=j;
		};
	};
	if(ticket!=null) {

		return queue[ticket];
		}
	else
		return null;
};





function del_ticket(ticket,ws) {
	//console.log("run del_ticket");
	if(ticket) {
		if(ticket["LAST"]==true) {
			prognoz_wt[ticket["LEVEL"]][ticket["ITEM_BUTTON"]]=counter[ws]["TT"];
			//print_div("прогнозное время ожидания. операция №"+ticket["ITEM_BUTTON"]+"   клиентов:"+counter[ws]["QUEUE"]+"  рас. время ожидания:"+counter[ws]["TT"]+" приоритет:"+l_name[ticket["LEVEL"]]);
			prognoz_queue[ticket["LEVEL"]][ticket["ITEM_BUTTON"]]=counter[ws]["QUEUE"];
			//console.log("====================DO button="+ticket["ITEM_BUTTON"]+" level="+l_name[ticket["LEVEL"]]+"  queue="+counter[ws]["QUEUE"]+" counter="+counter[ws]["COUNTER"]);
			delete queue[ticket["ITEM_TRACK"]];
		} else {
			//print_div("Вызван клиент в окно "+counter[ws]["COUNTER"]+" клиент из операции №"+ticket["ITEM_BUTTON"]+" приоритет:"+l_name[ticket["LEVEL"]]);
			counter[ws]["QUEUE"]++;
			counter[ws]["TT"]+=(operation_takt[(ticket["ITEM_BUTTON"]*1)]["takt"]*1);
			//	console.log("================level "+ticket["LEVEL"]+"  "+ticket["ITEM_BUTTON"]+"   "+ticket["ITEM_TRACK"]);
			delete queue[ticket["ITEM_TRACK"]];
			//	console.log("posle  queue="+counter[ws]["QUEUE"]+" counter="+counter[ws]["COUNTER"]+" level="+l_name[ticket["LEVEL"]]);
		};
	} else {
		//console.log("ошибка удаления ");
	};
};

function call_ticket_counter(ws_с,i) {
	//console.log("run call_ticket_counter="+counter[ws_с]["COUNTER"]+"     |="+queue_count());
	ws=counter[ws_с];
	//console.log("ws="+ws);
	var next_level=new Array();
	var max_if=0;
	next_level["1"]=new Array();
	next_level["2"]=new Array();
	next_level["1"]["max_rwt"]=0;
	next_level["1"]["LEVEL"]=7;
	next_level["1"]["ticket"]=null;
	next_level["2"]["max_rwt"]=0;
	next_level["2"]["LEVEL"]=7;
	next_level["2"]["ticket"]=null;
	
	for(var j in ws) {
		if (!ws.hasOwnProperty(j)) continue;
		l=ws["COUNTER"];
		if(j>0 && j<21) {
			//console.log("196 j="+j);
			ticket=BUTTON_RWT(j, ws["VIP"]);
///			if(ticket)
///				console.log("293 j="+ticket["ITEM_BUTTON"]);
			if(ticket) {
				max_if=(TIME_NO-ticket["ITEM_START"]);
				//if(max_if>=next_level[ws[j]]["max_rwt"]) {
			
					if((ticket["LEVEL"]<next_level[ws[j]]["LEVEL"]) ||
						((ticket["LEVEL"]==next_level[ws[j]]["LEVEL"]) && next_level[ws[j]]["max_rwt"]<=max_if)) {
						next_level[ws[j]]["ticket"]=ticket;
						next_level[ws[j]]["LEVEL"]=ticket["LEVEL"];
						next_level[ws[j]]["max_rwt"]=max_if;
					}
			//	};
			};
		};
	};
///	console.log("next_level[1][ticket]="+next_level["1"]["ticket"]+"   next_level[1][ticket]="+next_level["1"]["ticket"]);
	if(next_level["1"]["ticket"]) {
		del_ticket(next_level["1"]["ticket"],ws_с);
		//console.log("call "+ws["COUNTER"]+" level 1 "+next_level["1"]["LEVEL"]);
		return i;
	} else if(next_level["2"]["ticket"]) {
		//console.log("call "+ws["COUNTER"]+" level 2 "+next_level["2"]["LEVEL"]);
		///		console.log("call level 2 "+next_level["1"]["max_rwt"]);
		del_ticket(next_level["2"]["ticket"],ws_с);
		return i;
	} else {
		counter[ws["COUNTER"]]["RUN"]=0;
///		console.log("++1");
		var ws_work=0;
		for(var j in counter) {
			if (!counter.hasOwnProperty(j)) continue;
			if(counter[j]["RUN"]==1)
				ws_work=1;
		};
		if(ws_work==1)
			return i+1;
		else
			return i;
	};
}

function queue_count() {
	var count=0;
	for(var j in queue) {
		if (!queue.hasOwnProperty(j)) continue;
		count++;
	};
	return count;
}

function run_prognoz() {

	var counter_min_tt;
	var count=1;
	//console.log("run prognoz");
	i=queue_count();
		while(i>0 && count <200 ) {
		min_tt=99999999;
		count=count+1;
		for(var j in counter) {
			if (!counter.hasOwnProperty(j)) continue;
			if(((counter[j]["TT"]*1) <= min_tt) && (counter[j]["RUN"]==1)) {
				min_tt=counter[j]["TT"]; 
				counter_min_tt=j;
			};
		};

		i=call_ticket_counter(counter[counter_min_tt]["COUNTER"],i);
		i=i-1;
		//console.log(count+" ===================================================================================");
	
	};
	queue=new Array();
};
function print_div(text) {
	document.getElementById("monitor").innerHTML=document.getElementById("monitor").innerHTML+"<br>"+text;
};

