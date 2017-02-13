function start_info_buttons() {
update('include_info_buttons.qsp2','buttons');
setTimeout("start_info_buttons()",5000);	
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
if(a!=1)
	setTimeout("show_tickets()",5000);
}
function create_svetofor(val,parent,this_id)
{
val = val.split('#');
var sum = val[0]*1+val[1]*1+val[2]*1;

if(document.getElementById('svetofor-'+this_id))
	div = document.getElementById('svetofor-'+this_id);
else
	{
	div = document.createElement('div');
	div.id = 'svetofor-'+this_id;
	document.getElementById(parent).appendChild(div);
	div.style.width='100%';
	if(this_id!="svetofor-1")
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
	tab.id = 'svetofor-'+this_id;
	document.getElementById(parent).appendChild(tab);
	
	if(this_id!="svetofor-1")
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
if(sum==0)
	tab.style.display = 'none';
else
	tab.style.display = 'block';
var td=new Array();
tbo = document.createElement('tbody');
tbo.id = 'svetofor-tbo-'+this_id;
tab.appendChild(tbo);
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
	if(val[i-1]*1!=0 && this_id=="svetofor-1")
		td[i-1].innerHTML = val[i-1];
	if(this_id!="svetofor-1")
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
function result_info_svet(str)
{
str = str.split('<br>');
document.getElementById('all_queue').innerHTML = str[0];
create_svetofor(str[1],'svetofor_place','svetofor-1');
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
		tr[i-1].style.display = 'block';
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
		if(j==1) td[j].style.width = '15px'
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

var len = str.length-1;
var tr=new Array();

for(var i=1;i<=len;i++)
	{
	if(document.getElementById('tr-b-'+i))
		{
		tr[i-1]=document.getElementById('tr-b-'+i);
		tr[i-1].style.display = 'block';
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
	
	for(var j=0;j<10;j++)
		{
		var this_id = 'buttons-td-'+((i-1)*10+j+1);
		
		if(document.getElementById(this_id))
			td[j]=document.getElementById(this_id);
		else
			{
			td[j] = document.createElement('td');
			td[j].id = this_id;
			tr[i-1].appendChild(td[j]);
			}
		
		if(j!=8)
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
		if(j==9)
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
			}
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
		tr[i-1].style.display = 'block';
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
	
	for(var j=0;j<12;j++)
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
		
		
		if(j==3)
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
			else if(j==4)
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
			else if(j==7)
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
					td[j].appendChild(imag);
					td[j].innerHTML+=j7[1];
					}
				}
			else if(j==8)
				{
				var j8 = row[j].split('#');
				if(j8.length>1)
					{
					td[j].innerHTML="<b>"+j8[0]+"</b><br>"+j8[1];
					}
				}
			else
				td[j].innerHTML=row[j];
			
			td[j].style.textAlign = 'center';

		}
	}
	hide_tr(len,'c');
};

function update_result(str, type)
{
if(type=='buttons')
	result_buttons(str);
if(type=='tickets')
	result_tickets(str);

};

function update(http_url,type)
{
	httpRequest(http_url, function(req) { update_result(req.responseText,type) }, function(req) { }, null, 3000);
};

