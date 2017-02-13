var IE=false;
function browser()
{
IE='\v'=='v';
}

function start_message() {
//update('getMessages.qsp2','messages');
update('/pult?getmessage=1','messages');
setTimeout("start_message()",60000);	
};

var ticket=0;

if (!window.console) console = {log: function() {},info: function() {},error: function() {},warn: function() {}};

var timeouts = new Array();
var paper_alarm = 0;
var vip_alarm = new Array();
var vip_alarm2 = new Array();
var pause_alarm = new Array();
function find_vip_array(a)
{
var len = vip_alarm.length;
for(var i=0;i<len;i++)
	{
	if(a==vip_alarm[i])
		return true;
	}
return false;
}
function pluszero(a)
{
var out;
if(a*1<10)
	out="0"+a;
else
	out=a;
return out;
}

function close_salert(el)
{
var elem = parent.frames[0].document.getElementById('blockres');
elem.innerHTML=elem.innerHTML*1-1;
if(el==2) elem.innerHTML=0;
var messages = elem.innerHTML*1;
if(messages<0)
	{
	messages=0;
	elem.innerHTML=0;
	}
if(messages==0)
	parent.frames[0].document.getElementById('block').style.display = 'none';
parent.frames[1].document.getElementById('message_box_'+el+'_text').innerHTML="";
if(el==1)
	parent.frames[1].document.getElementById('message_box_3_text').innerHTML="";
}
function playsoundfunc()
{
 /* var thissound= eval("document.sound1");
  thissound.Play();*/
  document.all.sound.src = "beep.wav";

}
function salert(str,id)
{
var elem = document.getElementById('blockres');
var elemem = parent.frames[1].document.getElementById('message_box_'+id);
if(id==3) elemem = parent.frames[1].document.getElementById('message_box_1');
if(id!=3 && elemem.style.display=='none')
	{
	
	elem.innerHTML=elem.innerHTML*1+1;
	}
parent.frames[1].document.getElementById('message_box_'+id+'_text').innerHTML = str;
	if(BrowserDetect.browser =="Explorer" && BrowserDetect.version<10)
			elemem.style.display = 'block';
		else 
			elemem.style.display = 'inline-block';

document.getElementById('block').style.display = 'block';
playsoundfunc();

}
function add_to_journal(type,message)
{
}
var counter_marker = 1;
//var counter_vip_marker = 0;
var users_marker = 0;
var smess1_buf ="";
var smess2_buf ="";
var smess5_buf ="";
var buf_bumaga=1;

function result_messages(str)
{
str = str.split("<p>---</p>");


if(str[2]!='\n')
	{
		
	var row = str[2].split('<br>');
	var len = row.length;
	var buffer = new Array();
	var bufstr = "";
	var bufmarker=0;
	for(var i=0;i<len-1;i++)
		{
		var lrow = row[i].split('#');
		lrow[0]=lrow[0]*1;
		buffer[lrow[0]]=1;
		if(pause_alarm[lrow[0]]==0 ||pause_alarm[lrow[0]]==null)
			{
			pause_alarm[lrow[0]]=1;
			//add_to_journal(3,"В <b> Окне "+lrow[0]+"("+lrow[1]+")</b> превышено время перерыва!");
			bufstr +="В Окне "+lrow[0]+"("+lrow[1]+") превышено время перерыва!\n";
			bufmarker=1;
			//alert("В Окне "+lrow[0]+"("+lrow[1]+") превышено время перерыва!");
			}
		}
	if(bufmarker==1)
		{
		playsoundfunc();
		alert(bufstr);
		}		
	for(i=0;i<50;i++)
		{
		if(pause_alarm[i]==1 && buffer[i]==0)
			pause_alarm[i]=0;
		}

	}
if(str[5]!='\n')
	{
	
	if(smess5_buf!=str[5] || counter_marker == 0 || smess2_buf!=str[3])	
		{
		
		if(smess2_buf!=str[3]) console.log('smess2_buf!=str[3]');
		if(smess5_buf!=str[5]) console.log('smess5_buf!=str[5]');
		if(counter_marker == 0) console.log('counter_marker = 0');

		var row = str[5].split('<br>');
		smess5_buf=str[5];
		var len = row.length;
		
		if(len>1)
			{
			var out_str_5="Дальнейшее обслуживание VIP-клиентов  по категории:<br><table border=0 >";
			
			for(var i=0;i<len-1;i++)
				{
				var col = row[i].split('#');
				out_str_5+="<tr><td >(<b>"+col[0]+"</b>)</td><td ><b>"+col[1]+"</b></td></tr>";
				}
			out_str_5+="</table>невозможно ни в одном окне!";
			//add_to_journal(2,out_str_5);
			var out_str_5="Дальнейшее обслуживание VIP-клиентов  по категории:<br><table border=0 style='font-size: 14px;color: #000080;'>";
			
			for(var i=0;i<len-1;i++)
				{
				var col = row[i].split('#');
				out_str_5+="<tr><td style='font-family: verdana;font-size: 14px;color: #000080;'>(<b>"+col[0]+"</b>)</td><td style='font-family: verdana;font-size: 14px;color: #000080;'><b>"+col[1]+"</b></td></tr>";
				}
			out_str_5+="</table>невозможно ни в одном окне!";
			salert(out_str_5,3);
			
			//counter_vip_marker = 1;
			
			//timeouts[5]=setTimeout("counter_vip_marker =0;counter_marker =0;console.log('counter_vip_marker =0 counter_marker =0 (from vip)');",300000);	
			}
		if(str[3]!='\n')
		{
		row = str[3].split('<br>');
		smess2_buf=str[3];
		len = row.length;
		if(len>1)
			{
			
			var out_str_3="Дальнейшее выполнение операции:<br><table border=0 >";
			
			for(var i=0;i<len-1;i++)
				{
				var col = row[i].split('#');
				out_str_3+="<tr><td >(<b>"+col[0]+"</b>)</td><td ><b>"+col[1]+"</b></td><td ><b>"+col[2]+"</b> чел.</td></tr>";
				}
			out_str_3+="</table>невозможно ни в одном окне!";
			//add_to_journal(2,out_str_3);
			var out_str_3="Дальнейшее выполнение операции:<br><table border=0 style='font-size: 14px;color: #000080;'>";
			
			for(var i=0;i<len-1;i++)
				{
				var col = row[i].split('#');
				out_str_3+="<tr><td style='font-family: verdana;font-size: 14px;color: #000080;'>(<b>"+col[0]+"</b>)</td><td style='font-family: verdana;font-size: 14px;color: #000080;'><b>"+col[1]+"</b></td><td style='font-family: verdana;font-size: 14px;color: #000080;'><b>"+col[2]+"</b></td><td style='font-family: verdana;font-size: 14px;color: #000080;'> чел.</td></tr>";
				}
			out_str_3+="</table>невозможно ни в одном окне!";
			salert(out_str_3,1);
			}
		}
		counter_marker = 1;
		clearTimeout(timeouts[3]);

		timeouts[3]=setTimeout("counter_marker =0; console.log(' counter_marker =0 (from oper)');",300000);	
			
		}
	}
	
if(str[4]!='\n')
	{

	if(users_marker == 0 || smess1_buf!=str[4])	
		{
		var row = str[4].split('<br>');
		smess1_buf=str[4];
		var len = row.length;
		if(!(len==1 && row[0]==''))
		{
		var login = row[0].split('~~~');
		var out_str_3 = "Операционист <font style='font-weight:bold;'>"+login[1]+"</font> в окне №<font style='font-weight:bold;'>"+login[0]+"</font> не может работать ни по одной категории<br>";
		//var out_str_3="В: <font style='font-weight:bold;'>"+row[0]+"</font>";
		
		for(var i=1;i<len-1;i++)
			{
			login = row[i].split('~~~');
			out_str_3+="Операционист <font style='font-weight:bold;'>"+login[1]+"</font> в окне №<font style='font-weight:bold;'>"+login[0]+"</font> не может работать ни по одной категории<br>";
			//out_str_3+=", <font style='font-weight:bold;'>"+row[i]+"</font>";
			}
		//out_str_3+=" невозможно выполнить ни одну операцию с текущим пользователем!";
		//add_to_journal(2,out_str_3);
		/*var out_str_3="В: <font style='font-size: 14px;color: #000080;font-weight:bold;'>"+row[0]+"</font>";
		
		for(var i=1;i<len-1;i++)
			{
			
			out_str_3+=", <font style='font-size: 14px;color: #000080;font-weight:bold;'>"+row[i]+"</font>";
			}
		out_str_3+=" невозможно выполнять ни одну операцию с текущим пользователем!";*/
		salert(out_str_3,2);
		users_marker = 1;
		clearTimeout(timeouts[4]);
		timeouts[4]=setTimeout("users_marker =0;",300000);	
		}
		else
			users_marker = 0;
		}
	}
if(str[6]!='\n')
	{
//	console.log("Бумага:",str[6]*1-10);
	buf_bumaga = str[6]*1-10; //1 - есть бумага, 0 - нет бумаги
	if(buf_bumaga==0)
		{
	//	console.log("Нет бумаги");
		if(paper_alarm==0)
			{
			alert("В регистраторе талонов закончилась бумага!");
			add_to_journal(2,"В регистраторе талонов закончилась бумага!");
			paper_alarm = 1;
			}
		else
			{
		//	console.log("Сообщение уже выводилось!");
			}
		}
	else
		paper_alarm=0;
	
	}
};
function result_day(str)
{
str = str.split(';');
if(str.length>=3)
	{
	var red = str[2].split(':')[1]*1;
	var green = str[1].split(':')[1]*1;
	var all = red+green;
	var procent = all/100;
	if(procent==0) procent = 1;
	var procent_red = Math.round(red/procent);
	var procent_green = Math.round(green/procent);
	if((procent_red+procent_green)>100)
		{
		if(procent_red>0) procent_green =100-procent_red;
		if(procent_green>0) procent_red =100-procent_green;
		}
	document.getElementById('queue_red').innerHTML = red+" ("+procent_red+"%)";
	document.getElementById('queue_green').innerHTML = green+" ("+procent_green+"%)";
	}
};
function result_month(str)
{
str = str.split(';');
if(str.length>=3)
	{
	var red = str[2].split(':')[1]*1;
	var green = str[1].split(':')[1]*1;
	var all = red+green;
	var procent = all/100;
	if(procent==0) procent = 1;
	var procent_red = Math.round(red/procent);
	var procent_green = Math.round(green/procent);
	if((procent_red+procent_green)>100)
		{
		if(procent_red>0) procent_green =100-procent_red;
		if(procent_green>0) procent_red =100-procent_green;
		}
	document.getElementById('month_red').innerHTML = red+" ("+procent_red+"%)";
	document.getElementById('month_green').innerHTML = green+" ("+procent_green+"%)";
	
	}
document.getElementById('info_box_info').style.display = 'block';
document.getElementById('info_box_loading').style.display = 'none';
};
function update_result(str, type)
{

if(type=='messages')
	result_messages(str);
};

function update(http_url,type)
{
	httpRequest(http_url, function(req) { update_result(req.responseText,type) }, function(req) { }, null, 30000);
};

