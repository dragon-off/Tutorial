var time_no=0;
var m_counters;	//матрица окон 0-логин код 1-вип(1111) 2-600 массив с доступностью операций по окнам
var m_buttons;	//матрица кнопок
var clients;	//все ожидающие
var b_clients;	//все ожидающие ВСЕГДА
var arr_3000;
var t_fsn;		//Tfs, Tnorm
var counters;	//номер окна,тек. время обслуживания
var massiv_okon;
var b_massiv_okon;
function button_queue(button)
{
var len = clients.length;
var max=0;
for(var i=0;i<len;i++)
	{
	if(clients[i][1]*1==button)
		max++;
	}
return max;
}
function group_queue(group)
{
var len = clients.length;
var max=0;
for(var i=0;i<len;i++)
	{
	if(clients[i][5]*1==group)
		max++;
	}
return max;
}
function button_rwt(button)
{
var len = clients.length;
var max=0, maxl=0;
for(var i=0;i<len;i++)
	{
	if(clients[i][1]*1==button)
		{
		max+=time_no-clients[i][1]*1;
		maxl++;
		}
	}
max = max/maxl;
return max;
}
function group_queue_customer_item(group,num,info)
{
var len = clients.length;

for(var i=0;i<len;i++)
	{
	if(clients[i][5]*1==group)
		{
		if(clients[i+num][5]*1==group)
			{
			return clients[i+num][info];
			}
		else
			return 0;
		}

	}
return 0;
}
function button_max_wt(button)
{
var len = clients.length;
var min = time_no,minl=9999;
for(var i=0;i<len;i++)
	{
	if(clients[i][1]*1==button)
		{

		if(clients[i][3]*1<=min)
			{
			min = clients[i][3]*1;
			minl = clients[i][2]*1;
			}
		}
	}

return minl;
}
function priority(counter)
{
var login_id = m_counters[counter-1][0]*1; 

var a = m_counters[counter-1][2];//{массив с доступностью операций по окнам}
var v = m_counters[counter-1][1].substr(login_id-1,1);//{массив с доступностью обслуживания вип клиентов}
var t=0 //{макс время ожид}
var n=0 //{выбранная кнопка}
var y=1 //{уровень приориета}
var o=0 //{ITEM_TRACK}

for(var i=1;i<=10;i++)
	{
	//{получаем доступность и уровень операции в этом окне для тек. сотрудника}

	var q =a.substr(i-1,1)*m_buttons[i-1].substr(login_id-1,1);

	//{переварачиваем уровень 1=2 и 2=1}
	if(q==1)
		q=2;
	else if(q==2)
		q=1;
	//{если операции может быть обслуженна}
	if(q>0)
		{

		var j=i;
		if(button_queue(j) > 0)
		
			if((button_rwt(j) > t && q==y) || q>y) //{сравниваем время и уровень}
				{
				y = q;
				t = button_rwt(j);
				n = j;
				}
				
		j = i+20;
		
		if(button_queue(j) > 0)
			if((button_rwt(j) > t && (q+4)==y) || (q+4)>y) //{сравниваем время и уровень}
				{
				y = q+4;
				t = button_rwt(j);
				n = j;
				}
		if(v=="1") // {проверяем доступность вызова вип клиентов для сотрудника}
			{
			j = i+40;
			if(button_queue(j) > 0)
				if((button_rwt(j) > t && (q+9)==y) || (q+9)>y) //{сравниваем время и уровень}
					{
					y = q+9;
					t = button_rwt(j);
					n = j;
					}
			}
		}
	}
//{поиск по переведенном, отличие в том что результатом будет item_track, так как группа 1 а клиенты могут быть с разными классами}
//{поиск клиентов по переводу в операцию НАЧАЛО}

var grque=group_queue(34);
for(var j=0;j<grque;j++)
	{
	var k = group_queue_customer_item(34,j,0)*1; //ITEM_ENTER_BUTTON
	var r = time_no-group_queue_customer_item(34,j,3)*1; //ITEM_START
	var s = group_queue_customer_item(34,j,1)*1; //ITEM_BUTTON
	var p = group_queue_customer_item(34,j,2)*1; //ITEM_TRACK

	var q = a.substr(s-180-1,1)*m_buttons[s-180-1].substr(login_id-1,1);
	if(q==1)
		q=2;
	else if(q==2)
		q=1;
	if(q>0)
		{
		if(k >= 41 && k <= 50)
			{
			if(((r > t) && (11+q == y)) || (11+q > y))
				{
				y=11+q;
				t=r;
				n=s;
				o=p;
				}
			}
		if(k >= 21 && k <= 30)
			{
			if(((r > t) && (6+q == y)) || (6+q > y))
				{
				y=6+q;
				t=r;
				n=s;
				o=p;
				}
			}
		if(k >= 1 && k <= 10)
			{
			if(((r > t) && (2+q == y)) || (2+q > y))
				{
				y=2+q;
				t=r;
				n=s;
				o=p;
				}
			}
		}
	if(group_queue_customer_item(34,j,4)*1 >100)
		if((r>t) || (9 > y))
			{
			y=9;
			t=r;
			n=s;
			o=p;
			}
	}
//{поиск клиентов по переводу в операцию КОНЕЦ}
	
//{поиск клиентов по переводу в окна НАЧАЛО}

grque=group_queue(31);
for(var j=0;j<grque;j++)	
	{
	if(group_queue_customer_item(31,j,1)*1 == (60+counter))
		{
		var k = group_queue_customer_item(31,j,0)*1; //ITEM_ENTER_BUTTON
		var r = time_no-group_queue_customer_item(31,j,3)*1; //ITEM_START
		var s = group_queue_customer_item(31,j,1)*1; //ITEM_BUTTON
		var p = group_queue_customer_item(31,j,2)*1; //ITEM_TRACK
		var z = arr_3000[p-1]*1;
		if(z = 0)
			z = k;
		if(z >= 21 && z <= 30)
			z = z-20;
		if(z >= 41 && z <= 60)
			z = z-40;
		if(z >= 181 && z <= 190)
			z = z-180;
		var q = a.substr(z-1,1)*m_buttons[z-1].substr(login_id-1,1);
		if(q==1)
			q=2;
		else if(q==2)
			q=1;
		if(q>0)
			{
			if(q == 0) q = 1;
			if(k >= 41 && k <= 50)
				{
				if(((r > t) && (11+q == y)) || (11+q > y))
					{
					y=11+q;
					t=r;
					n=s;
					o=p;
					}
				}
			if(k >= 21 && k <= 30)
				{
				if(((r > t) && (6+q == y)) || (6+q > y))
					{
					y=6+q;
					t=r;
					n=s;
					o=p;
					}
				}
			if(k >= 1 && k <= 10)
				{
				if(((r > t) && (2+q == y)) || (2+q > y))
					{
					y=2+q;
					t=r;
					n=s;
					o=p;
					}
				}
			}
		if(group_queue_customer_item(31,j,4)*1 >100)
			if((r>t) || (9>y))
				{
				y=9;
				t=r;
				n=s;
				o=p;
				}
		
		}
	}
//{поиск клиентов по переводу в окна КОНЕЦ}

//{если был найден переведенный с отличаюшимся и высшем уровнем то вызваем его по треку}
var res = new Array;


if(o > 0)
	{
	res[0] = o;
	res[1] = n;
	}
else //{елси нет то вызываем по кнопке}
	{
	res[0] = button_max_wt(n);
	res[1] = n;
	}

return res;
}
function buttobut(butt)
{
if(butt>40) return butt-40;
if(butt>20) return butt-20;
if(butt<=10) return butt;
}
function sort()
{
var buf = new Array();

for(var i = 0; i < massiv_okon.length - 1; i++)
{
    for(var j = i + 1; j < massiv_okon.length; j++)
    {
        if (massiv_okon[i][1] < massiv_okon[j][1])
        {
            buf[0] = massiv_okon[i][0];
			buf[1] = massiv_okon[i][1];
            massiv_okon[i][0] = massiv_okon[j][0];
			massiv_okon[i][1] = massiv_okon[j][1];
            massiv_okon[j][0] = buf[0];
			massiv_okon[j][1] = buf[1];
        }
    }

}

}
function change_button(b)
{

clients[clients.length-1][0] = b;
clients[clients.length-1][1] = b;
clients[clients.length-1][2] = 6666;
clients[clients.length-1][3] = time_no;
clients[clients.length-1][4] = 0;
clients[clients.length-1][5] = b;

}
function delete_client(track)
{
var find =-1;
for(var i=0;i<clients.length;i++)
	{
	if(clients[i][2]*1==track)
		{
		find = i;
		break;
		}
	}
if(find < clients.length-1 && find >= 0)
	{
	for(var i=find;i<clients.length;i++)
		{
		clients[i] = clients[i+1];
		}
	}
var l = clients.length-1;
if(find>=0)
	clients.length = l;
}
function prognoz(butt)
{
change_button(butt);
for(var i=0;i<clients.length;i++)
	{
	
	sort();
	for(var j = 0; j<massiv_okon.length;j++)
		{
		
		var cur_but = priority(massiv_okon[j][0]);
		
		if(cur_but[0]==6666)
			{

			return massiv_okon[j][1];
			}
		else
			{

			massiv_okon[j][1] += t_fsn[buttobut(cur_but[1]*1)][1]*1;
			delete_client(cur_but[0]);
			}
		}
	
	}
return 0;
}
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
var time = new Date(1,1,1,0,0,a);
var out = time.getHours()+":"+pluszero(time.getMinutes()*1)+":"+pluszero(time.getSeconds()*1);
return out;
}
function start_prognoz(res)
{ 
if(!res || res==null)
{
http_url = "get_prognoz.qsp2";
httpRequest(http_url, function(req) { start_prognoz(req.responseText); }, function(req) { }, null, 30000);
}
else
	{
	alert("prognoz");
	res = res.split('\n----\n');
	time_no = res[0];
	m_counters = res[1].split('\n');
	for(var i=0;i<m_counters.length;i++)
		m_counters[i] = m_counters[i].split('|');
	m_buttons = res[2].split('\n');
	
	clients = res[3].split('\n');
	for(var i=0;i<clients.length;i++)
		clients[i] = clients[i].split('|');

	clients.length++;
	b_clients = new Array();
	clients[clients.length-1] = new Array();
	clients[clients.length-1][0] = 1;
	clients[clients.length-1][1] = 1;
	clients[clients.length-1][2] = 6666;
	clients[clients.length-1][3] = time_no;
	clients[clients.length-1][4] = 0;
	clients[clients.length-1][5] = 1;
	b_clients = clients;

	arr_3000 = res[4].split('|');
	t_fsn = res[5].split('\n');
	t_fsn.unshift("0|0")//делаем начало массива в 1
	for(var i=0;i<t_fsn.length;i++)
		t_fsn[i] = t_fsn[i].split('|');

	counters = res[6].split('\n');
	massiv_okon = new Array();
	b_massiv_okon = new Array();

	for(var i=0;i<counters.length-2;i++)
		{
		counters[i] = counters[i].split('|');
		
		massiv_okon[i] = new Array();
		b_massiv_okon[i] = new Array();
		massiv_okon[i][0] = counters[i][0];
		b_massiv_okon[i][0] = counters[i][0];
		
		var tsum = t_fsn[buttobut(counters[i][2]*1)][0]-counters[i][1]*1;
		if(tsum<0) tsum=0;
		massiv_okon[i][1] = tsum;
		b_massiv_okon[i][1] = tsum;
		
		}

	var total_resultat = new Array();
	for(var i=0;i<10;i++)
		{
		
		total_resultat[i] = prognoz(i+1);
		for(var j=0;j< b_massiv_okon.length;j++)
			{
			massiv_okon[j][0] = b_massiv_okon[j][0];
			massiv_okon[j][1] = b_massiv_okon[j][1];
			}
		for(var j=0;j< b_clients.length;j++)
			{
			clients[j][0] = b_clients[j][0];
			clients[j][1] = b_clients[j][1];
			clients[j][2] = b_clients[j][2];
			clients[j][3] = b_clients[j][3];
			clients[j][4] = b_clients[j][4];
			}
		change_button(i+1);
		this_id = "buttons-prognoz-"+(i+1);
		if(document.getElementById(this_id))
			{
			document.getElementById(this_id).innerHTML = inttohms(total_resultat[i]*1);
			}
		//alert("Кнопка №"+(i+1)+" - прогнозное время ожидания: "+inttohms(total_resultat[i]*1));
		}
	

	
	}
}