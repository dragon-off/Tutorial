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
		{
		max++;
		
		}
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
		max+=time_no-clients[i][3]*1;
		maxl++;
		}
	}
max = max/maxl;
return max;
}
function group_queue_customer_item(group,num,info,button)
{

var len = clients.length;

for(var i=0;i<len;i++)
	{
	if(clients[i][5]*1==group)
		{
		if(clients[i+num]!=null && clients[i+num][5]*1==group)
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
function button_group(button)
{
var len = clients.length;
var group=1;
for(var i=0;i<len;i++)
	{
	if(clients[i][1]*1==button)
		{

		group = clients[i][5]*1;
		//console.log("button_group",button,group);
		if(!group || group==null)group=button;
		return group;
		}
	}

return button;
}
function find_counter(counter)
{
for(var j = 0; j<massiv_okon.length;j++)
	{
	if(massiv_okon[j][0]*1==counter)
		return j+1;
	}
return 1;
}
function priority(counter)
{

var login_id = m_counters[find_counter(counter)-1][0]*1; 

var a = m_counters[find_counter(counter)-1][2];//{массив с доступностью операций по окнам}

var v = m_counters[find_counter(counter)-1][1].substr(login_id-1,1);//{массив с доступностью обслуживания вип клиентов}
var t=-1 //{макс время ожид}
var n=0 //{выбранная кнопка}
var y=1 //{уровень приориета}
var o=0 //{ITEM_TRACK}
var track=0; //чтобы найти 6666
for(var i=1;i<=15;i++)
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
			{
			//console.log("j=",j,"rwt=",button_rwt(j),"q=",q,"y=",y);
			if((button_rwt(j) > t && q==y) || q>y) //{сравниваем время и уровень}
				{
				y = q;
				t = button_rwt(j);
				/*n = j;
				console.log("n="+button_queue(j)+" "+clients.length);
				track = group_queue_customer_item(button_group(j),0,2)*1;*/
				for(var newi=0;newi<clients.length;newi++)
					{
					if(group_queue_customer_item(button_group(j),newi,1)*1!=j){n=0;track=0;}
					else {n=j;track = group_queue_customer_item(button_group(j),newi,2)*1; break;}
					}
					
				//console.log(track);
				}
			}
		j = i+20;
		
		if(button_queue(j) > 0)
			if((button_rwt(j) > t && (q+4)==y) || (q+4)>y) //{сравниваем время и уровень}
				{
				y = q+4;
				t = button_rwt(j);
				n = j;
				console.log("20n="+n);
				track = group_queue_customer_item(button_group(j),0,2)*1;
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
					console.log("n40="+n);
					track = group_queue_customer_item(button_group(j),0,2)*1;
					}
			}
		}
	}
//{поиск по переведенном, отличие в том что результатом будет item_track, так как группа 1 а клиенты могут быть с разными классами}
//{поиск клиентов по переводу в операцию НАЧАЛО}

var grque=group_queue(38);
//console.log(38,grque);
for(var j=0;j<grque;j++)
	{
	var k = group_queue_customer_item(38,j,0)*1; //ITEM_ENTER_BUTTON
	var r = time_no-group_queue_customer_item(38,j,3)*1; //ITEM_START
	var s = group_queue_customer_item(38,j,1)*1; //ITEM_BUTTON
	var p = group_queue_customer_item(38,j,2)*1; //ITEM_TRACK

	var q = a.substr(s-60-1,1)*m_buttons[s-60-1].substr(login_id-1,1);
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
				console.log("3888n="+n);
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
				console.log("388n="+n);
				o=p;
				}
			}
		if(k >= 1 && k <= 15)
			{
			if(((r > t) && (2+q == y)) || (2+q > y))
				{
				y=2+q;
				t=r;
				n=s;
				console.log("38n="+n);
				o=p;
				}
			}
		}
	if(group_queue_customer_item(38,j,0)*1 ==141)
		if((r>t) || (9 > y))
			{
			y=9;
			t=r;
			n=s;
			console.log("n38="+n);
			o=p;
			}
	}
//{поиск клиентов по переводу в операцию КОНЕЦ}
	
//{поиск клиентов по переводу в окна НАЧАЛО}

grque=group_queue(37);
//console.log(37,grque);
for(var j=0;j<grque;j++)	
	{
	if(group_queue_customer_item(37,j,1)*1 == (80+counter))
		{
		var k = group_queue_customer_item(37,j,0)*1; //ITEM_ENTER_BUTTON
		var r = time_no-group_queue_customer_item(37,j,3)*1; //ITEM_START
		var s = group_queue_customer_item(37,j,1)*1; //ITEM_BUTTON
		var p = group_queue_customer_item(37,j,2)*1; //ITEM_TRACK
		var z = arr_3000[p-1]*1;
		//console.log("z",z);
		if(z = 0)
			z = k;
		if(z >= 21 && z <= 30)
			z = z-20;
		if(z >= 41 && z <= 60)
			z = z-40;
		if(z >= 61 && z <= 80)
			z = z-60;
		var q = a.substr(z-1,1)*m_buttons[z-1].substr(login_id-1,1);
		if(q==1)
			q=2;
		else if(q==2)
			q=1;
		if(q>0)
			{
			if(q == 0) q = 2;
			if(k >= 41 && k <= 50)
				{
				if(((r > t) && (11+q == y)) || (11+q > y))
					{
					y=11+q;
					t=r;
					n=s;
					console.log("37777n="+n);
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
					console.log("377n="+n);
					o=p;
					}
				}
			if(k >= 1 && k <= 15)
				{
				if(((r > t) && (2+q == y)) || (2+q > y))
					{
					y=2+q;
					t=r;
					n=s;
					console.log("37n="+n);
					o=p;
					}
				}
			}
		if(group_queue_customer_item(37,j,0)*1 ==141)
		if(group_queue_customer_item(37,j,0)*1 ==141)
			if(((r>t) && (9==y)) || (9>y))
				{
				y=9;
				t=r;
				n=s;
				console.log("n37="+n);
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
	//res[1] = o;
	//res[0] = n;
	//res[2] = o;
	}
else //{елси нет то вызываем по кнопке}
	{
	//res[0] = button_max_wt(n);
	res[1] = n;
	res[0] = track;
	}

return res;
}
function buttobut(butt)
{
if(butt>40) return butt-40;
if(butt>20) return butt-20;
if(butt<=15) return butt;
}
function sort_clients()
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

clients[clients.length-1][0] = b.toString();
clients[clients.length-1][1] = b.toString();
clients[clients.length-1][2] = "6666";
clients[clients.length-1][3] = time_no;
clients[clients.length-1][4] = "0";
clients[clients.length-1][5] = button_group(b).toString();

}
function delete_client(track)
{
//console.log("del",track);
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
//console.log("--------------- %d---------------",butt);
change_button(butt);
var max_clients=0;
var this_id = "prognoz_chel";
var clen = clients.length;
//console.log("-----Клиенты-----");
/*for(var i=0;i<clen;i++)
	{
	console.log("Клиенты: ",clients[i]);
	}*/
for(var i=0;i<massiv_okon.length;i++)
	{
	//console.log("Окна: ",massiv_okon[i]);
	}
	
for(var i=0;i<clen;i++)
	{
	
	sort_clients();
	
	
	
	for(var j = 0; j<massiv_okon.length;j++)
		{
		
		var cur_but = priority(massiv_okon[j][0]);
		//console.log("Кли: ",clients[i]);
		//console.log(massiv_okon[j][1],massiv_okon[j][0]);
		if(cur_but[0]*1==6666)
			{
			
			console.log('Приоритет выбрал ИСКОМУЮ %d кнопку',cur_but[1]*1,butt, massiv_okon[j][1]);
			/*if(document.getElementById(this_id))
				{
				document.getElementById(this_id).innerHTML = max_clients;
				}*/
		//	console.log("Количество человек: %s",max_clients);
		/*console.log("return",t_fsn[butt][1],butt,massiv_okon[j][1]);
			if(max_clients==0 && massiv_okon[j][1]*1==0)return t_fsn[butt][1];
			else*/ return massiv_okon[j][1];
			}
		else
			{
			max_clients++;
			try{
				console.log('Приоритет выбрал %d кнопку',cur_but[1]*1,butt,"tsum=",massiv_okon[j][1],"+",t_fsn[buttobut(cur_but[1]*1)][1]*1);
				massiv_okon[j][1] = massiv_okon[j][1]+t_fsn[buttobut(cur_but[1]*1)][1]*1;
			}
			catch(e)
			{
				console.log('Ошибка на %d кнопке',butt);
			}
			delete_client(cur_but[0]);
		

			}
		}
	
	}
console.log('ИСКОМАЯ кнопка не найдена!',butt);

/*if(document.getElementById(this_id))
	{
	document.getElementById(this_id).innerHTML = max_clients;
	}*/
	
//console.log("Количество человек: %s",max_clients);

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
function inttom(a)
{
var time = new Date(1,1,1,0,0,a);
var out = Math.round(time.getHours()*60+time.getMinutes()*1+(time.getSeconds()*1)/60)

return out;
}
function start_prognoz(res)
{ 
if(!res || res==null)
{
http_url = "/touchscreens/super/get_prognoz.qsp2"; // ИЗ СУПЕР!!!
httpRequest(http_url, function(req) { start_prognoz(req.responseText); }, function(req) { }, null, 30000);
}
else
	{
	
	res = res.split('\n----\n');
	
	time_no = res[0];
	m_counters = res[1].split('\n');
	for(var i=0;i<m_counters.length;i++)
		m_counters[i] = m_counters[i].split('|');
	m_counters.length = m_counters.length-1;
	m_buttons = res[2].split('\n');
	
	clients = res[3].split('\n');
	for(var i=0;i<clients.length;i++)
		clients[i] = clients[i].split('|');

	//clients.length++;
	b_clients = new Array();
	clients[clients.length-1] = new Array();
	clients[clients.length-1][0] = "1";
	clients[clients.length-1][1] = "1";
	clients[clients.length-1][2] = "6666";
	clients[clients.length-1][3] = time_no;
	clients[clients.length-1][4] = "0";
	clients[clients.length-1][5] = "1";
	//b_clients = clients;
	for(var i=0;i<clients.length;i++)
		{
		b_clients[i] = new Array();
		b_clients[i][0] = clients[i][0];
		b_clients[i][1] = clients[i][1];
		b_clients[i][2] = clients[i][2];
		b_clients[i][3] = clients[i][3];
		b_clients[i][4] = clients[i][4];
		b_clients[i][5] = clients[i][5];
		}
	arr_3000 = res[4].split('|');
	t_fsn = res[5].split('\n');
	t_fsn.unshift("0|0")//делаем начало массива в 1
	t_fsn.length = t_fsn.length-1;
	for(var i=0;i<t_fsn.length;i++)
		t_fsn[i] = t_fsn[i].split('|');

	counters = res[6].split('\n');
	var coun_len = counters.length;
	
	for(var k=coun_len-1;k>=0;k--)
		{
		if(counters[k]==null || counters[k]=="" || counters[k].split('|').length < 3)
			{
			counters.length = counters.length-1;
			}
		}

	massiv_okon = new Array();
	b_massiv_okon = new Array();
console.log(t_fsn);
	for(var i=0;i<counters.length;i++)
		{
		counters[i] = counters[i].split('|');
		
		massiv_okon[i] = new Array();
		b_massiv_okon[i] = new Array();
		massiv_okon[i][0] = counters[i][0];
		b_massiv_okon[i][0] = counters[i][0];
		
	//console.log("t_fsn=",t_fsn,"trans_now=",counters[i][1]*1,"i=",i,"butt=",counters[i][2]*1,"buttobut",buttobut(counters[i][2]*1));
			
		var tsum =0;
		
		if(t_fsn[buttobut(counters[i][2]*1)][0]*1==0)
			{
			if(counters[i][1]*1 ==0)
				tsum = 0;
			else
				tsum = t_fsn[buttobut(counters[i][2]*1)][1]-counters[i][1]*1;
			//tsum = 0;
			console.log("marker if",counters[i][2]*1);
			}
		else
			{
			console.log("marker else",counters[i][1]*1);
			tsum = t_fsn[buttobut(counters[i][2]*1)][0]-counters[i][1]*1;
			}
		if(tsum<0) tsum=0;
		
		massiv_okon[i][1] = tsum;
	
		//console.log(massiv_okon[i],i);
		b_massiv_okon[i][1] = tsum;
		
		
		}

	var total_resultat = new Array();
	for(var i=0;i<15;i++)
		//var i = red_button*1-1;
	//	if(i==red_button*1-1)
		{

		total_resultat[i] = prognoz(i+1);
		console.log(total_resultat[i],i+1);
		for(var j=0;j< b_massiv_okon.length;j++)
			{
			massiv_okon[j][0] = b_massiv_okon[j][0];
			massiv_okon[j][1] = b_massiv_okon[j][1];
			}
		clients = "";
		clients= new Array();
		
		for(var j=0;j< b_clients.length;j++)
			{
			clients[j]= new Array();
			clients[j][0] = b_clients[j][0];
			clients[j][1] = b_clients[j][1];
			clients[j][2] = b_clients[j][2];
			clients[j][3] = b_clients[j][3];
			clients[j][4] = b_clients[j][4];
			clients[j][5] = b_clients[j][5];
			}
		change_button(i+1);
		
		this_id = "buttons-td-"+(8+9*(i));

		if(document.getElementById(this_id))
			{
			//console.log("Прогноз ",i,total_resultat[i],t_fsn[i+1][1]);
			//if(total_resultat[i]*1==0) total_resultat[i] = t_fsn[i+1][1];
			if(total_resultat[i]==-1)
				document.getElementById(this_id).innerHTML = "";
			else
				document.getElementById(this_id).innerHTML = inttohms(total_resultat[i]*1);
			}
		//console.log("Прогноз для кнопки %d: %s",(i+1),inttohms(total_resultat[i]*1));
		//alert("Кнопка №"+(i+1)+" - прогнозное время ожидания: "+inttohms(total_resultat[i]*1));
		}
	

	
	}
}