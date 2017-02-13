var IE=false;
function browser()
{
IE='\v'=='v';
}
function start_info_buttons() {
update('include_info_buttons.qsp2?button='+ticket,'buttons');
update('/settings_admin/day.jsp','day');
setTimeout("start_info_buttons()",30000);	
};
function start_message() {
update('getMessages.qsp2','messages');
setTimeout("start_message()",35000);	
};

var ticket=0;
function setTicket(a)
{

if(ticket==0)
	{
	ticket=a;
	show_tickets(0);
	}
else
	{
	ticket=a;
	show_tickets(1);
	}
}
function show_tickets(a)
{

update('getTickets.qsp2?button='+ticket,'tickets');

}
function create_svetofor(val,parent,this_id)
{
val = val.split('#');
var sum = val[0]*1+val[1]*1+val[2]*1;

if(document.getElementById('svetofor-div-'+this_id))
	div = document.getElementById('svetofor-div-'+this_id);
else
	{
	div = document.createElement('div');
	div.id = 'svetofor-div-'+this_id;
	document.getElementById(parent).appendChild(div);
	div.style.width='100%';
	if(this_id!="1")
		{
		
		div.style.height='12px';
		div.style.fontSize='9px';
		div.style.padding='0px';
		div.style.marginBottom='-10px';
		}
	else
		{
		div.style.height='30px';
		div.style.fontSize='11px';
		div.style.padding='0px';
		}
	div.style.overflowY = 'hidden';
	div.style.border='none';
	}
if(document.getElementById('svetofor-table-'+this_id))
	tab = document.getElementById('svetofor-table-'+this_id);
else
	{
	tab = document.createElement('table');
	tab.id = 'svetofor-table-'+this_id;
	div.appendChild(tab);
	
	if(this_id!="1")
		{
		tab.style.width='100%';
		tab.style.fontSize='9px';
		tab.style.marginTop='-12px';
		}
	else
		{
		
		tab.style.width='100%';
		tab.style.fontSize='16px';
		tab.style.fontWeight='bold';
		tab.style.height='30px';
		tab.style.marginTop='0px';
		}
	div.appendChild(tab);
	tab.style.paddingTop='0px';
	tab.style.border='none';
	}
if(sum==0 && this_id!="1")
	tab.style.display = 'none';
else
	tab.style.display = 'block';
var td=new Array();
if(document.getElementById('svetofor-tbo-'+this_id))
	tbo = document.getElementById('svetofor-tbo-'+this_id);
else
	tbo = document.createElement('tbody');

tbo.id = 'svetofor-tbo-'+this_id;
tab.appendChild(tbo);
if(document.getElementById('svetofor-tr-'+this_id))
	tr = document.getElementById('svetofor-tr-'+this_id);
else
	tr = document.createElement('tr');
tr.id = 'svetofor-tr-'+this_id;
tbo.appendChild(tr);
for(var i=1;i<=3;i++)
	{
	var thistd_id = 'svetofor-'+this_id+'-td-'+i;
	if(document.getElementById(thistd_id))
		td[i-1]=document.getElementById(thistd_id);
	else
		{
		td[i-1] = document.createElement('td');
		td[i-1].id = thistd_id;
		}
	tr.appendChild(td[i-1]);
	if(this_id=="1")
		{
		td[i-1].innerHTML = val[i-1];
		}
	if(val[i-1]*1==0 && this_id!="1")
		td[i-1].innerHTML ="";
	if(this_id!="1")
		td[i-1].style.fontSize='9px';
	var precent = (val[i-1]*100)/sum;
	if(precent>0)
		precent = precent+'%';
	else
		precent = '1px';
	
	td[i-1].style.width = precent;
	td[i-1].style.padding ='0px';
	td[i-1].style.margin ='0px';
	td[i-1].style.textAlign = 'center'
	if(i==1)
		{
		td[i-1].style.backgroundColor='green';
		td[i-1].style.color="white";
		}
	if(i==2)
		{
		td[i-1].style.backgroundColor='yellow';
		td[i-1].style.color="black";
		}
	if(i==3)
		{
		td[i-1].style.backgroundColor='red';
		td[i-1].style.color="white";
		}
	}

}

function show_infobox()
{
document.getElementById('info_box_info').style.display = 'none';
document.getElementById('info_box_loading').style.display = 'block';
document.getElementById('info_box').style.display = 'block';
update('/settings_admin/month.jsp','month');

};
function result_info_svet(str)
{
str = str.split('<br>');
document.getElementById('all_queue').innerHTML = str[0];
create_svetofor(str[1],'svetofor_place','1');
el = document.getElementById('svetofor_eye_place');
el.style.textAlign = 'right';
var imag;
if(document.getElementById('eye'))
	imag=document.getElementById('eye');
else
	{
	imag = document.createElement('img');
	imag.id = 'eye';
	}

imag.setAttribute('src', 'big_'+str[2]+'.jpg');

el.appendChild(imag);
};
function result_tickets(str)
{
str = str.split('<br>');
var len = str.length-1;
var tr=new Array();
if(len==0) hide_tr(len,'t');
for(var i=1;i<=len;i++)
	{
	if(document.getElementById('tr-t-'+i))
		{
		tr[i-1]=document.getElementById('tr-t-'+i);
		if(BrowserDetect.browser =="Explorer" && BrowserDetect.version<10)
			tr[i-1].style.display = 'block';
		else 
			tr[i-1].style.display = 'table-row';
		koltrt++; 
		}
	else
		{
		tr[i-1] = document.createElement('tr');
		tr[i-1].id = 'tr-t-'+i;
		koltrt++; 
		}
	var row = str[i].split('|');
	tr[i-1].style.textAlign='center';
	if(row[0]=='1')
		{
		tr[i-1].style.backgroundColor="green";
		tr[i-1].style.color='white';
		}
	else if(row[0]=='2')
		{
		tr[i-1].style.backgroundColor="yellow";
		tr[i-1].style.color='#000080';
		}
	else
		{
		tr[i-1].style.backgroundColor="red";
		tr[i-1].style.color='white';
		}
	var td=new Array();
	document.getElementById('info_tickets').appendChild(tr[i-1]);	
	for(var j=1;j<4;j++)
		{

		var this_id = 'tickets-td-'+((i-1)*4+j+1);
		if(document.getElementById(this_id))
			td[j]=document.getElementById(this_id);
		else
			{
			td[j] = document.createElement('td');
			td[j].id = this_id;
			tr[i-1].appendChild(td[j]);
			}
		if(j==1) td[j].style.width = '27px'
		if(j==2) td[j].style.width = '60px'
		if(j==3) td[j].style.width = '60px'
		td[j].innerHTML=row[j];
		}
	}
	hide_tr(len,'t');
};
function result_buttons(str)
{
str = str.split('<p>---<p>');
result_info_svet(str[0]);
result_info_buttons_table(str[1]);
result_info_counters_table(str[2]);
};

var koltr = 0;
var koltrc = 0;
var koltrt = 0;
function hide_tr(a,b)
{

if(b=='c')
	{
	if(a< koltr)
		{
		for(var i=a+1;i<=koltr;i++)
			{
			if(!document.getElementById('tr-'+b+'-'+i)) koltr=i-1;
		else
			document.getElementById('tr-'+b+'-'+i).style.display = 'none';
			}
		koltr = a;
		}
	}
else if(b=='b')
{
if(a< koltrc)
	{
	for(var i=a+1;i<=koltrc;i++)
		{
		if(!document.getElementById('tr-'+b+'-'+i)) koltrc=i-1;
		else
		document.getElementById('tr-'+b+'-'+i).style.display = 'none';
		}
	koltrc = a;
	}
}
else if(b=='t')
{

 if(a< koltrt)
	{
	
	for(var i=a+1;i<=koltrt;i++)
		{
		if(!document.getElementById('tr-'+b+'-'+i)) koltrt=i-1;
		else
		document.getElementById('tr-'+b+'-'+i).style.display = 'none';
		
		}
	koltrt = a;
	}
}
}
function result_info_buttons_table(str)
{
str = str.split('<br>');

var len = str.length-2;
var tr=new Array();

for(var i=1;i<=len;i++)
	{
	if(document.getElementById('tr-b-'+i))
		{
		tr[i-1]=document.getElementById('tr-b-'+i);
		if(BrowserDetect.browser =="Explorer" && BrowserDetect.version<10)
			tr[i-1].style.display = 'block';
		else 
			tr[i-1].style.display = 'table-row';
		koltr++; 
		}
	else
		{
		tr[i-1] = document.createElement('tr');
		tr[i-1].id = 'tr-b-'+i;
		koltr++; 
		}
	if(i%2==0)
		tr[i-1].style.backgroundColor = "#eeeeee";
	document.getElementById('info_buttons').appendChild(tr[i-1]);	
	var row = str[i].split('|');
	var td=new Array();
	
	for(var j=1;j<=9;j++)
		{
		var this_id = 'buttons-td-'+((i-1)*9+j+1);
		
		if(document.getElementById(this_id))
			td[j]=document.getElementById(this_id);
		else
			{
			td[j] = document.createElement('td');
			td[j].id = this_id;
			tr[i-1].appendChild(td[j]);
			}
		if(j==1) 
		{ 
		row[1]=row[0]+". "+row[1];
		}
		
		if(j!=9)
			td[j].innerHTML=row[j];
		else
			{
			var imag;
			if(document.getElementById('yesno-'+i))
				imag=document.getElementById('yesno-'+i);
			else
				{
				imag = document.createElement('img');
				imag.id = 'yesno-'+i;
				}
			if(row[j]*1==1)
				{
				imag.setAttribute('src', 'yes.png');
				}
			else
				{
				imag.setAttribute('src', 'no.png');
				}
			td[j].appendChild(imag);
			}
		/*if(j==9)
			{
			if(!document.getElementById('show-'+i))
				{	
				var td_sh = document.createElement('td');
				td_sh.id = 'show-'+i;
				tr[i-1].appendChild(td_sh);
				var show_button;
				show_button = document.createElement('input');
				show_button.id ='show-button-'+i;
				show_button.setAttribute('type', 'radio');
				show_button.setAttribute('name', 'radiobutton');
				
				show_button.onclick=new Function("setTicket("+row[10]+")");
				
				td_sh.appendChild(show_button);
				td_sh.style.textAlign = 'center';
				}
			}*/
		if(j==1)
			{
			td[j].style.paddingLeft = '5px';
			create_svetofor(row[2],td[j].id,td[j].id);
			j++;
			}
		else 
			{
			td[j].style.textAlign = 'center';
			
			}
		}
	}
	hide_tr(len,'b');
	var vsego = str[len+1].split('|');
	document.getElementById('allWaiting').innerHTML = vsego[0];
	document.getElementById('allGood').innerHTML = vsego[1];
};

function result_info_counters_table(str)
{
str = str.split('<br>');

var len = str.length-1;
var tr=new Array();

for(var i=1;i<=len;i++)
	{
	if(document.getElementById('tr-c-'+i))
		{
		tr[i-1]=document.getElementById('tr-c-'+i);
		
		if(BrowserDetect.browser =="Explorer" && BrowserDetect.version<10)
			tr[i-1].style.display = 'block';
		else 
			tr[i-1].style.display = 'table-row';
		koltrc++; 
		}
	else
		{
		tr[i-1] = document.createElement('tr');
		tr[i-1].id = 'tr-c-'+i;
		koltrc++; 
		}
	if(i%2==0)
		tr[i-1].style.backgroundColor = "#eeeeee";
	document.getElementById('info_counters').appendChild(tr[i-1]);	
	var row = str[i].split('|');
	var td=new Array();
	
	for(var j=0;j<11;j++)
		{
		var this_id = 'counters-td-'+((i-1)*12+j+1);
		
		if(document.getElementById(this_id))
			td[j]=document.getElementById(this_id);
		else
			{
			td[j] = document.createElement('td');
			td[j].id = this_id;
			tr[i-1].appendChild(td[j]);
			}
		
		if(j==0)
			{
			
			if(row[2]=='&nbsp;')
				{
				td[j].style.backgroundColor = '#ff0000';
				td[j].style.color='white';
				}
			else
				{
				if(i%2==0)
					td[j].style.backgroundColor = "#eeeeee";
				else
					td[j].style.backgroundColor = "#f4f4f5";
				td[j].style.color='#000080';
				}
			}
		/*if(j==9)
			{
			var imag;
			if(document.getElementById('takt-c-'+i))
				imag=document.getElementById('takt-c-'+i);
			else
				{
				imag = document.createElement('img');
				imag.id = 'takt-c-'+i;
				}
			if(row[j]=='r')
				{
				imag.setAttribute('src', 'red.png');
				}
			else
				{
				if(row[j]=='g')
					{
					imag.setAttribute('src', 'green.png');
					}
				else
					imag.setAttribute('src', 'yellow.png');
				}
				imag.setAttribute('width', '20');
				imag.setAttribute('height', '20');
			td[j].appendChild(imag);
			}
			else*/ if(j==3)
				{
				
				td[j].style.fontSize = '9px';
				if(row[j]*1==0)
					{
					td[j].style.backgroundColor = '#ff0000';
					td[j].style.color='white';
					td[j].innerHTML='Закрыто';
					}
				if(row[j]*1==1)
					{
					td[j].style.backgroundColor = '#009900';
					td[j].style.color='white';
					td[j].innerHTML='Открыто';
					}
				if(row[j]*1==2)
					{
					td[j].style.backgroundColor = 'orange';
					td[j].style.color='#000080';
					td[j].innerHTML='Перерыв';
					}
				}
			else if(j==6)
				{
				var j7 = row[j].split('#');
				if(j7.length>1)
					{
					td[j].innerHTML="";
					var imag2;
					if(document.getElementById('takt-vrem-c-'+i))
						imag2=document.getElementById('takt-vrem-c-'+i);
					else
						{
						imag = document.createElement('img');
						imag.id = 'takt-vrem-c-'+i;
						}
					if(j7[0]=='r')
					{
					imag.setAttribute('src', 'red.png');
					}
				else
					{
					if(j7[0]=='g')
						{
						imag.setAttribute('src', 'green.png');
						}
					else
						imag.setAttribute('src', 'yellow.png');
					}
					imag.setAttribute('width', '20');
					imag.setAttribute('height', '20');
					imag.style.float = 'left';
				

					td[j].appendChild(imag);
					td[j].innerHTML+=j7[1];
					}
					else td[j].innerHTML="&nbsp;";
				}
			else if(j==7)
				{
				var j8 = row[j].split('#');
				if(j8.length>1)
					{
					td[j].innerHTML="<b>"+j8[0]+"</b><br>"+j8[1];
					}
				else td[j].innerHTML="&nbsp;";
				}
			else
				td[j].innerHTML=row[j];
			
			td[j].style.textAlign = 'center';

		}
	}
	hide_tr(len,'c');
};
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
{/*
var tr = document.createElement('tr');
if(type==1)
	tr.className = 'info_message';
if(type==2)
	tr.className = 'error_message';
if(type==3)
	tr.className = 'warning_message';
parent.frames[2].document.getElementById('journal').appendChild(tr);

var td = new Array();
td[0] = document.createElement('td');
td[0].style.verticalAlign = "top";
//td[0].style.padding
tr.appendChild(td[0]);
var imag = document.createElement('img');
if(type==1)
	imag.setAttribute('src', 'info.gif');
if(type==2)
	imag.setAttribute('src', 'error.gif');
if(type==3)
	imag.setAttribute('src', 'warning.gif');
td[0].appendChild(imag);
td[0].style.width="46px";
td[0].style.textAlign="center";
td[1] = document.createElement('td');
td[1].style.verticalAlign = "top";
tr.appendChild(td[1]);
var time = new Date()
td[1].innerHTML=pluszero(time.getHours())+":"+pluszero(time.getMinutes())+":"+pluszero(time.getSeconds());
td[1].style.textAlign="center";
td[1].style.width="80px";
td[2] = document.createElement('td');
td[2].style.verticalAlign = "top";
tr.appendChild(td[2]);
td[2].innerHTML=message;*/
}
var counter_marker = 0;
var counter_vip_marker = 0;
var users_marker = 0;
var smess1_buf ="";
var smess2_buf ="";
var smess5_buf ="";


function result_messages(str)
{
str = str.split("<p>---</p>");


if(str[1]!='\n')
	{
		
	var row = str[1].split('<br>');
	var len = row.length;
	
	for(var i=0;i<len-1;i++)
		{
		var row_attr = row[i].split('|');
		
		if(find_vip_array(row_attr[0])==false)
			{
			//add_to_journal(1,"В очереди появился VIP клиент с номером: <b>"+row_attr[0]+"</b> , по операции: <b>\""+row_attr[1]+"\"</b>!");
			playsoundfunc();
			//alert("В очереди появился VIP клиент с номером: "+row_attr[0]+" , по операции: \""+row_attr[1]+"\"!");
			////add_to_journal(1,"В зале VIP-клиент");
			alert("В зале VIP-клиент");
			
			}
		vip_alarm[i]=row_attr[0];
		}
	for(var i=len-1;i<50;i++)
		{
		if(vip_alarm[i] || vip_alarm[i]!=null)
			vip_alarm[i]=null;
		}
	}
	
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
	if(counter_vip_marker == 0 || smess5_buf!=str[5] || counter_marker == 0)	
		{
		
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
			counter_vip_marker = 1;
			setTimeout("counter_vip_marker =0;",300000);	
			}
		}
	}
if(str[3]!='\n')
	{
	if(counter_vip_marker == 0 || counter_marker == 0 || smess2_buf!=str[3])	
		{
		
		var row = str[3].split('<br>');
		smess2_buf=str[3];
		var len = row.length;
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
				out_str_3+="<tr><td style='font-family: verdana;font-size: 14px;color: #000080;'>(<b>"+col[0]+"</b>)</td><td style='font-family: verdana;font-size: 14px;color: #000080;'><b>"+col[1]+"</b></td><td style='font-family: verdana;font-size: 14px;color: #000080;'><b>"+col[2]+"</b> чел.</td></tr>";
				}
			out_str_3+="</table>невозможно ни в одном окне!";
			salert(out_str_3,1);
			counter_marker = 1;
			setTimeout("counter_marker =0;",300000);	
			}
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
		setTimeout("users_marker =0;",300000);	
		}
		else
			users_marker = 0;
		}
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
if(type=='buttons')
	{
	var mega = str.split("<p>*****</p>");
	result_tickets(mega[0]);
	result_buttons(mega[1]);
	}
if(type=='tickets')
	result_tickets(str);
if(type=='messages')
	result_messages(str);
if(type=='day')
	result_day(str);
if(type=='month')
	result_month(str);
};

function update(http_url,type)
{
	httpRequest(http_url, function(req) { update_result(req.responseText,type) }, function(req) { }, null, 30000);
};

