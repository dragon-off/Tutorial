

var TIME_NO=90000;
var TRACK_NO=3000;

var ticket_print_time=0; //прогнозное время печатаемого талона
var ticket_print_chel=0; //прогнозное колво печатаемого талона
var total_resultat; //результат прогноза всех кнопок для отправки в кувин

var array_clients = new Array;//результат прогноза (кол-во клиентов) всех кнопок для отправки в кувин

var DEBUG=false; //отоладка, вывод в консоль

var array_data=[];//new Array();
var queue=[];//new Array();
var l_name=[];//new Array();
l_name[1]="VIP pereved";
l_name[2]="VIP";
l_name[3]="UL pereved";
l_name[4]="PK pereved";
l_name[5]="PK";
l_name[6]="prostoy pereved";
l_name[7]="prostoy";


var oper_name=[];//new Array();

oper_name[1]='Карты оформить, перевыпустить';
oper_name[2]='Карты получить';
oper_name[3]='Переводы';
oper_name[4]='Наличные, пенсии';
oper_name[5]='Вклады';
oper_name[6]='Кредит ежемесячный платеж';
oper_name[7]='Выписки, обращения';
oper_name[8]='Ипотека оформить';
oper_name[9]='Обмен валюты';
oper_name[10]='Монеты, чеки';
oper_name[11]='Сейфы';
oper_name[12]='Компенсации, доверенности';
oper_name[13]='Платежи, квартплата, телефон, ГИБДД';
oper_name[14]='Платежи, квартплата, телефон, ГИБДД';
oper_name[15]='Платежи, квартплата, телефон, ГИБДД!';
oper_name[16]='Обслуживание юр. лиц';
var counter=[];//new Array();
var operation_takt=[];//new Array();
//takt dlja UL
operation_takt[141]=[];
operation_takt[141]["id"]=141;
operation_takt[141]["takt"]=300;
operation_takt[141]["rwt"]=0;
var button_run=[];//new Array();
var prognoz_wt=[];//new Array();
var prognoz_queue=[];//new Array();
//задаем 0 значение по прогнозу операций
for (var r=1; r <= 7; r++) {
	prognoz_wt[""+r.toString()]=[];//new Array();
	prognoz_queue[""+r.toString()]=[];//new Array();
	for (var t=1; t <= 20; t++) {
	//	prognoz_queue[""+r.toString()][t]=0;
		//prognoz_wt[""+r.toString()][t]=0;
	};
}



function create_last(button,level) { //добавляем клиентов в конец очерди каждой операции (140 так как 7 уровне и 20 операций) для расчета прогнозного времени
	queue[TRACK_NO]=[];//new Array();
	queue[TRACK_NO][sar("ITEM_START")]=TIME_NO; //наименьшее время ожидания
	queue[TRACK_NO][sar("ITEM_TRACK")]=TRACK_NO.toString();
	queue[TRACK_NO][sar("ITEM_BUTTON")]=button.toString();
	button_run[button]=true;
	queue[TRACK_NO][sar("LEVEL")]=level.toString();
	queue[TRACK_NO]["LAST"]=true;
	TRACK_NO++;
	return true;
};
function sar(str)
{
var out = 0;
switch(str)
	{
	case "VIP": {out=30;break;}
	case "COUNTER": {out=31;break;}
	case "QUEUE": {out=32;break;}
	case "TT": {out=33;break;}
	case "RUN": {out=34;break;}
	
	case "ITEM_START": {out=0;break;}
	case "ITEM_TRACK": {out=1;break;}
	case "ITEM_BUTTON": {out=2;break;}
	case "LEVEL": {out=3;break;}
	case "BUTTON": {out=4;break;}
	}
return out;
}
function load_queue(resp) //загружаем очередь
{

	TRACK_NO=3000;
	var queue_len;
	var counter_len;
	var but_takt;
	var str_type;
	var last_ticket=[];//new Array();
	last_ticket["1"]=[];//new Array();
	last_ticket["2"]=[];//new Array();
	last_ticket["3"]=[];//new Array();
	last_ticket["4"]=[];//new Array();
	last_ticket["5"]=[];//new Array();
	last_ticket["6"]=[];//new Array();
	last_ticket["7"]=[];//new Array();
	
	str_type = resp.split('@@');
	queue_len=str_type[0].split('#'); //клиенты

	counter_len=str_type[1].split('#'); //окна
	but_takt=str_type[2].split('#'); //такт нормативные по окнопкам
	TIME_NO=str_type[3]*1;
	

	
	for (var r=0; r <= counter_len.length-2; r++) {
	
		//0-counter; 1-stroka prioriteta; 2-vip
		items=counter_len[r].split('^');
		
		i=items[0]*1;
		counter[i]=[];
		counter[i][30]=items[2]; //вип VIP
		counter[i][31]=items[3]; //номер окна COUNTER
		//items[1] = matrix[items[3]*1-1].substr(0,20);	
		
		counter[i][32]=items[4]*1; //ОБСЛ. КЛИЕНТОВ QUEUE
		counter[i][33]=items[5]*1;    //ВРЕМЯ ОБСЛ. TT
		counter[i][34]=1;    //для станции есть клиенты RUN
		counter[i][35]=0;    //переведенные в окно
		var len_f=matrix[items[3]*1-1].substr(0,20);
	
		for (var j=0; j <= items[1].length-1; j++) {
			if(items[1].substr(j,1)!="0") {
			
				if(len_f.substr(j,1)!="0")
					counter[i][j+1]=len_f.substr(j,1);
				};
		};
	};
	
	
	for (var r=0; r <= queue_len.length-2; r++) {
		items=queue_len[r].split('^');

		queue[items[1]]=[];//new Array();
		queue[items[1]][0]=items[2];
		if((items[4]*1)>80){
		//	console.log("155 "+(items[4]*1));
			//console.log(items);
			if(counter[((items[4]*1)-80)])
				counter[((items[4]*1)-80)][35]++;
		};
		queue[items[1]][1]=items[1];
		queue[items[1]][2]=items[3];
		button_run[items[3]]=true;
		queue[items[1]][3]=items[5];
		queue[items[1]][4]=items[4]*1;
	};
	
	for(var r=1; r <= 20; r++) {
	//	if(button_run[r]) {
			for(var l=1; l <= 7; l++) {
				create_last(r,l);
			};
	//	};
		
	};
	
	
	
	
	for (var r=0; r <= but_takt.length-1; r++) {
		//0-counter; 1-stroka prioriteta; 2-vip
		items=but_takt[r].split('^');
		operation_takt[items[0]]=[];//new Array();
		operation_takt[items[0]]["id"]=items[0];
		operation_takt[items[0]]["takt"]=items[1];
		operation_takt[items[0]]["rwt"]=items[2];
		
	};
};


//load_queue(строка)-- загрузка очереди, окон, такт нормативного...
//run_prognoz() 	--расчет прогнозного времени ожидания
//					по итогам мы получим 2 двумерных массива prognoz_wt и prognoz_queue

function load_pi(ticket_print) {
	httpRequest('/touchscreens/super/load_queue2.qsp2', function(req) { load_queue(req.responseText);  run_prognoz(); print_result(ticket_print);}, function(req) {  }, null, 3000);
	return true;
};



function BUTTON_QUEUE(i) {
	var count=0;
	for(var j in queue) {
		if (!queue.hasOwnProperty(j)) continue;
		if(queue[j][sar("ITEM_BUTTON")] == i)
			count++;
	};
	return count;
};
var ticket_=[];//new Array();
var but_cache_vip=new Array();
var but_cache=new Array();
var count_rwt=0;
function BUTTON_RWT(i,vip,ws) {
if(counter[ws][35]==0) {
	if(but_cache_vip[i]!=null && vip) {
	console.log("cahce1");
		return queue[but_cache_vip[i]];
	};
	if(but_cache[i]!=null) {		
		console.log("cahce2");
		return queue[but_cache[i]];
	};
} else {
//console.log("vizov perevedennogo v okno="+ws+"    "+counter[ws][35]);
};
if(!button_run[i])
	return null;
	count_rwt++;
	var max=0;
	var level="7";
	var ticket=null;
	for(var j in queue) {
		if (!queue.hasOwnProperty(j)) continue;
		max_if=(TIME_NO-queue[j][sar("ITEM_START")]);
	
		if(((queue[j][sar("BUTTON")] == 80+ws*1) || (queue[j][sar("ITEM_BUTTON")] == i.toString() && (!queue[j][sar("BUTTON")] || queue[j][sar("BUTTON")]<80))) && //проверка что это искомая кнопка или переведнный клиент в окно
			((max_if>=max  && level==queue[j][sar("LEVEL")]) || (level>queue[j][sar("LEVEL")])) && 
			((queue[j][sar("LEVEL")]!=1 && queue[j][sar("LEVEL")]!=2) || "1"==vip.toString())) {
				level=queue[j][sar("LEVEL")];
				max=max_if;
				ticket=j;
		};
	};
	if(ticket!=null) {
		
		if((queue[ticket][sar("BUTTON")]*1)<80) {
			
			if(queue[ticket][sar("LEVEL")]<3) {
				but_cache_vip[i]=ticket;
			} else {
				but_cache[i]=ticket;
			};
		};
	

		return queue[ticket];
		}
	else {
			but_cache[i]=null;
			if(vip)
				but_cache_vip[i]=null;
		return null;
		};
};


function del_ticket(ticket,ws) {
//console.log("ws = "+ws+"     ticket "+ticket);
	if(ticket) {
	//console.log(ticket);
		if(ticket["LAST"]==true) {
			prognoz_wt[ticket[sar("LEVEL")]][ticket[sar("ITEM_BUTTON")]]=counter[ws][sar("TT")];
			prognoz_queue[ticket[sar("LEVEL")]][ticket[sar("ITEM_BUTTON")]]=counter[ws][sar("QUEUE")];
		
			delete queue[ticket[sar("ITEM_TRACK")]];
		} else {
			counter[ws][sar("QUEUE")]++;
			counter[ws][sar("TT")]+=(operation_takt[(ticket[sar("ITEM_BUTTON")]*1)]["takt"]*1);
			delete queue[ticket[sar("ITEM_TRACK")]];
		};
		if((ticket[sar("BUTTON")]*1)>80) {
		
			counter[(ticket[sar("BUTTON")]*1)-80][35]--;
			}
		if((ticket[sar("BUTTON")]*1)<80)
			if(ticket[[sar("LEVEL")]]<3) {
				but_cache_vip[ticket[sar("ITEM_BUTTON")]]=null;
			} else {
				but_cache[ticket[sar("ITEM_BUTTON")]]=null;
			};
	} else {
		//console.log("ошибка удаления ");
	};
};

function call_ticket_counter(ws_с,i) {
var ws=[];
	ws=counter[ws_с];
	
				//alert(counter[ws_с][1]);
	
	
	
	var next_level=[];//new Array();
	var max_if=0;
	next_level["1"]=[];//new Array();
	next_level["2"]=[];//new Array();
	next_level["1"][0]=0; //"max_rwt"
	next_level["1"][1]=7;//level
	next_level["1"][2]=null;//ticket
	next_level["2"][0]=0;//"max_rwt"
	next_level["2"][1]=7;//level
	next_level["2"][2]=null;//ticket
	for(var j in ws) {
		if (!ws.hasOwnProperty(j)) continue;
		l=ws[sar("COUNTER")];
		//console.log(l);
		//console.log(l);
		if(j>0 && j<21) {
			//ticket=BUTTON_RWT(j, ws["VIP"]);
		
			ticket=BUTTON_RWT(j, ws[sar("VIP")], ws[sar("COUNTER")]);
			
			
			
	
			if(ticket) {
	
				max_if=(TIME_NO-ticket[sar("ITEM_START")]);
				if((ticket[sar("LEVEL")]<next_level[ws[j]][1]) ||
				((ticket[sar("LEVEL")]==next_level[ws[j]][1]) && next_level[ws[j]][0]<=max_if)) {
					next_level[ws[j]][2]=ticket;
					next_level[ws[j]][1]=ticket[sar("LEVEL")];
					next_level[ws[j]][0]=max_if;
				};
			};
		};
	};
	if((next_level["1"][2]) && ((next_level["1"][2] && !next_level["2"][2]) || 
	(next_level["1"][1]<next_level["2"][1]) || 
	(next_level["1"][1]==next_level["2"][1] ))) {
		del_ticket(next_level["1"][2],ws_с);	
		return i;
	} else if(next_level["2"][2]) {
			del_ticket(next_level["2"][2],ws_с);
		return i;
	} else {
	//console.log("counter[ws["+sar("COUNTER")+"]]["+sar("RUN")+"]");
		counter[ws[sar("COUNTER")]][sar("RUN")]=0;
		var ws_work=0;
		for(var j in counter) {
			if (!counter.hasOwnProperty(j)) continue;
			if(counter[j][sar("RUN")]==1)
				ws_work=1;
		};
		if(ws_work==1)
			return i+1;
		else
			return i;
	};
	return ;
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
	
	i=queue_count();
 
		while(i>0 && count <1000 ) { //идем по всей очереди
		min_tt=99999999;
		counter_min_tt=null;
		count=count+1;
		for(var j in counter) {
			if (!counter.hasOwnProperty(j)) continue;
			if(((counter[j][sar("TT")]*1) <= min_tt) && (counter[j][sar("RUN")]==1)) {
				min_tt=counter[j][sar("TT")]; 
				counter_min_tt=j;
			};
		};

		if(!counter_min_tt)
			continue; //если окно для клиента не найдено, идем дальше
		i=call_ticket_counter(counter[counter_min_tt][sar("COUNTER")],i);
		i=i-1;
	
	
	};
	queue=[];//new Array();
};
function log_debug(text) {
	if(DEBUG)
		console.log(text);
	return;
};
function print_result() {

total_resultat = new Array();
if(prognoz_queue[7]!=undefined)
for (var e=1;e<=20;e++)
	{
	if(prognoz_queue[7][e]!=undefined && prognoz_queue[7][e]!=null)
		{
		total_resultat[e-1] = prognoz_wt[7][e];
		array_clients[e-1]  = prognoz_queue[7][e];
		}
	else
		{
		total_resultat[e-1] = 0;
		array_clients[e-1]  = 0;
		}
	}
else
	{
	for(var e=1;e<=20;e++)
		{
		total_resultat[e-1] = 0;
		array_clients[e-1]  = 0;
		}
	}
for(var e=1;e<=20;e++)
	{
	prognoz_queue[7][e] = null;
	var this_id = "operation-"+e+"-2";
	if(document.getElementById(this_id))
		{
		document.getElementById(this_id).innerHTML = array_clients[e-1];
		}
	this_id = "operation-"+e+"-3";
	if(document.getElementById(this_id))
		{
		//if(total_resultat[e-1]*1==1) total_resultat[e-1] = 0;
		document.getElementById(this_id).innerHTML = inttohms(total_resultat[e-1]*1);
		}
	}
};



//Вставка в СУО

function pluszero(a)
{
b="";
if(a<10)
	b="0"+a;
else
	b=a;
return b;
}
function inttohms(a)
{
if(a==1) a=0;
var time = new Date(1,1,1,0,0,a);
var out = time.getHours()+":"+pluszero(time.getMinutes()*1)+":"+pluszero(time.getSeconds()*1);
return out;
}
function inttom(a)
{
var time = new Date(1,1,1,0,0,a);
var out = Math.round(time.getHours()*60+time.getMinutes()*1+(time.getSeconds()*1)/60)
if(a<60 && a>0) out = 1;
return out;
}

