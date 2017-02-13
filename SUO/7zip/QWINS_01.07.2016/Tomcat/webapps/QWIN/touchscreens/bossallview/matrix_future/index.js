var buf_mass_chenge = new Array();
var mass_chenge = new Array();
var mass_chenge_buttons = new Array();
var mass_chenge_counters = new Array();
var mass_chenge_out ="";

var matrix;
var buf_matrix;
var moder=1;
var chel_arr = new Array();
if (!window.console) console = {log: function() {},info: function() {},error: function() {},warn: function() {}};
function parseGetParam(param) 
{ 
var get_param=1;
var url = window.location.search.substring(1).split("&");

if(url.length>0) 
{
for(var i=0; i<url.length; i++) 
	{ 
	var getVar = url[i].split("="); 
	
	if(getVar[0]=="cat" &&(getVar[1].substring(0,3)=="%22" || getVar[1].substring(0,1)=="\""))
		get_param=getVar[1];
	else
	if(getVar[0]==param) 
		get_param=getVar[1]*1;
	} 
}


return get_param;
}

moder = parseGetParam('user');
var changed_window = new Array();
var changed_window_inx=0;


function what_happened()
{

console.log(mass_chenge_counters);

var len1 = mass_chenge.length;
for(var i=0;i<len1;i++)
	{
	if( mass_chenge[i]!=undefined && mass_chenge[i]!=null)
		{
		console.log(i,mass_chenge_counters[i],mass_chenge[i]);
		var len2 = mass_chenge[i].length;
		var str  = ""+mass_chenge_counters[i];
		var str1 = " Добавлена/Изменена возможность обслуживать:";
		var str2 = " Убрана возможность обслуживать:";
		
		for(var j=0;j<len2;j++)
			{
			
			if( mass_chenge[i][j]!=undefined && mass_chenge[i][j]!=null && mass_chenge[i][j]*1!=buf_mass_chenge[i][j]*1)
				{
			
				if(mass_chenge[i][j]*1==0)
					{
					str2+=""+mass_chenge_buttons[j]+", ";
					
					}
				else
					str1+=""+mass_chenge_buttons[j]+"("+mass_chenge[i][j]+" пр.), ";
				}
			}
		var out = str;
		
		if(str1.length > 44)
			{
			str1= str1.substr(0,str1.length-2)+';';
			out+=str1;
			}
		if(str2.length > 32)
			{
			str2= str2.substr(0,str2.length-2)+';';

			out+=str2;
			}
		
		if(out.length > str.length)
			mass_chenge_out+=out+"; ";
			
		}
	}
	if(mass_chenge_out.length>1)
		mass_chenge_out=mass_chenge_out.substr(0,mass_chenge_out.length-2);
	console.log(mass_chenge_out);
}

function execute_matrix()
{
var par1="";
var par2="";
var par3="";

for(var i=0;i<changed_window_inx;i++)
	{
	
	if(matrix[changed_window[i]-1] && matrix[changed_window[i]-1]!=null)
		{
		
		var buf = matrix[changed_window[i]-1];
		console.log(buf.length);
		if(buf.length>=33)
			buf = buf.substr(0,32); //Длина строки 32 - без пробела в конце
		
		
		par1+=buf;
		if(changed_window[i]<10)
			par2+="0"+changed_window[i];
		else
			par2+=changed_window[i];
		
		}
	}

par3 = changed_window_inx;
var out_str="";
out_str="run.qsp2?matrix=\""+par1+"\"&nums=\""+par2+"\"&len="+par3;
console.log("Применяем настройки...");

 what_happened();
  if(mass_chenge_out.length>1)
	{
	httpRequest('/lib/1.jsp?TypeId=6&ComIndex=13&Comment=0&action='+encodeURI(mass_chenge_out),null,null,null,3000);
	console.log('/lib/1.jsp?TypeId=6&ComIndex=13&Comment=0&action='+encodeURI(mass_chenge_out) );
	}
mass_chenge_out="";
for(var i=0;i<mass_chenge.length;i++)
	{
	mass_chenge[i]=null;
	}


httpRequest(out_str, function(req) { console.log(req.responseText); console.log("Изменения приняты!");document.location.reload(true);}, function() {console.log("Ошибка применения");}, null, 30000);

//document.location.href=out_str;
}

function hadmin()
{

console.log(moder);
if(moder!=2)
	{
	document.getElementById("do_exec").setAttribute("disabled","1");
	}
}

function find_have_change(counter)
{	

for(var i=0;i<changed_window.length;i++)
	{
	if(changed_window[i]*1==counter*1)
		{
		
		return i;
		}
	}

return (-1);
}
function change_kletka(adres,value) 
{

		
		var arradres = adres.split('-');
		var change_button = arradres[1]*1-1;
		var change_counter = counters[arradres[2]*1-4]-1;
		console.log("Кнопка:",change_button+1,"Окно:",change_counter+1,"Значение:",value);
		console.log("Старая строка:\t",matrix[change_counter]);
		if(change_button==0)
			{
			matrix[change_counter] = value+matrix[change_counter].substr(1,matrix[change_counter].length-1);
			}
		else
			{
			matrix[change_counter] = matrix[change_counter].substr(0,change_button)+value+matrix[change_counter].substr(change_button+1,matrix[change_counter].length-(change_button+1));
			}
		console.log("Новая строка:\t",matrix[change_counter]);
		var have_inx = find_have_change(change_counter+1);
		if(have_inx<0)
			{
			changed_window[changed_window_inx] = change_counter+1;
			changed_window_inx++;
			}
		if(mass_chenge[arradres[2]*1-3]==undefined ||mass_chenge[arradres[2]*1-3]==null)
			mass_chenge[arradres[2]*1-3] = new Array();
		mass_chenge[arradres[2]*1-3][change_button+1] = value;
		console.log("Измененные строки ["+changed_window_inx+"]:",changed_window);
		/*counter=adres.substring(4,adres.length);
		counter=counter.split('-');		// 0 - counter
										// 1 - button
		len=getCookie('operation_'+counter[0]);
		counter[1]=counter[1]*1;
		setCookie('operation_'+counter[0], len.substring(0,(counter[1]-1))+value+len.substring(counter[1],len.length),900);
		len=getCookie('operation_'+counter[0]);*/
		kletka(adres,value);
	
} 

function kletka(adres,value) 
{
	
value=value*1;
var str="";
if(value==0) {
	str+="<img src='../images/no.png' border=0 onclick=change_kletka('"+adres+"',1)>"
} else {
	str+="<select name=menu1 onchange=change_kletka('"+adres+"',this.options[this.selectedIndex].value)>";
	for(var i=0	; i<3; i++) {
		if(i==value) {
			str+="<option selected value="+i+">"+i+"</option>";
		} else {
			str+="<option value="+i+">"+i+"</option>"
		};
	};
	str+="</select>";
	};
	document.getElementById(adres).innerHTML=str;
return str;
}
var inx_buttons = new Array();
var inx_buttons_len = 0;
var matrix_logins = new Array();
var counters = new Array();

function result_future(str)
{
str = str.split('\n***\n');
counters = str[0].split('|');
counters.length = counters.length-1;
var operations = str[1].split('\n');
operations.length = operations.length-1;
matrix = str[2].split('\n');
matrix.length = matrix.length-1;
buf_matrix = str[2].split('\n');
buf_matrix.length = buf_matrix.length-1;
matrix_logins = str[3].split('\n');

var matrix_logins_length = matrix_logins.length;
for(var i=matrix_logins_length-1;i>=0;i--)
	{
	if(matrix_logins[i]=="")
		matrix_logins_length--;
	else
		{
		matrix_logins[i] = matrix_logins[i].split('|');
		}
	}
if(matrix_logins_length>0)
	matrix_logins.length = matrix_logins_length;
else
	matrix_logins.length = 0;


var main_table = document.getElementById('MainTableBody');
var counters_tr;
if(document.getElementById('counters'))
	counters_tr = document.getElementById('counters');
else
	counters_tr = document.createElement('tr');
counters_tr.id = 'counters';
main_table.appendChild(counters_tr);
var counters_td = new Array();
if(counters.length>1)
	{
	var typ=document.createAttribute("colspan");
	typ.nodeValue=counters.length;
	document.getElementById('counters_head').attributes.setNamedItem(typ);
	}
for(var i=0;i<counters.length;i++)
	{
	if(document.getElementById('counter-'+i))
		counters_td[i] = document.getElementById('counter-'+i);
	else
		counters_td[i] = document.createElement('td');
	counters_td[i].id = 'counter-'+i;
	counters_tr.appendChild(counters_td[i]);
	counters_td[i].className = "boxTopBlue";
	counters_td[i].setAttribute("align", "center"); 
	console.log("окно",counters[i]);
	counters_td[i].innerHTML = "<center><div id=\"counter_div_"+i+"\" class=\"listItem\" style=\"width:100%;\"><b><font size=\"+1\">"+counters[i]+"</font></b></div></center>";
	
	mass_chenge_counters[i+1] = "Окно "+counters[i];
	}
//-------------------КОНЕЦ ЗАГОЛОВКА-------------------------
var operation_tr = new Array;

for(var i=0;i<operations.length;i++)
	{
	if(document.getElementById('operation-'+i))
		operation_tr[i] = document.getElementById('operation-'+i);
	else
		operation_tr[i] = document.createElement('tr');
	operation_tr[i].id = 'operation-'+i;
	main_table.appendChild(operation_tr[i]);
	operations[i] = operations[i].split('|');
	if(i%2==0)
		operation_tr[i].style.backgroundColor="#E2E2E2";
	var operation_td = new Array;
	var oplen =operations[i].length;
	for(var j=0;j<oplen;j++)
		{
		if(document.getElementById('operation-'+operations[i][0]+'-'+j))
			operation_td[j] = document.getElementById('operation-'+operations[i][0]+'-'+j);
		else
			operation_td[j] = document.createElement('td');
		operation_td[j].id = 'operation-'+operations[i][0]+'-'+j;
		operation_tr[i].appendChild(operation_td[j]);
		operation_td[j].innerHTML = operations[i][j];
		if(j==2) chel_arr[operations[i][0]*1] = operations[i][j];
		if(j!=1)
			operation_td[j].style.textAlign="center";
		if(j==0)
			{
			inx_buttons[inx_buttons_len] = operations[i][j]*1; 
			inx_buttons_len++;
			}
		if(j==1)
			mass_chenge_buttons[operations[i][0]*1] = operations[i][j].substr(2,operations[i][j].length);
		}
	for(var j=oplen;j<counters.length+oplen;j++)
		{
		if(document.getElementById('operation-'+operations[i][0]+'-'+j))
			operation_td[j] = document.getElementById('operation-'+operations[i][0]+'-'+j);
		else
			operation_td[j] = document.createElement('td');
		operation_td[j].id = 'operation-'+operations[i][0]+'-'+j;
		operation_tr[i].appendChild(operation_td[j]);
		operation_td[j].style.textAlign="center";
		
		var res = matrix[counters[j-oplen]-1].substr(operations[i][0]*1-1,1)*1;
		
		if(buf_mass_chenge[j-3]==undefined || buf_mass_chenge[j-3]==null)
			buf_mass_chenge[j-3] = new Array();
		buf_mass_chenge[j-3][i+1] = res*1;
		if(res == 0)
			{
			var imag;
			if(document.getElementById('operation-'+operations[i][0]+'-'+j+'-img'))
				imag = document.getElementById('operation-'+operations[i][0]+'-'+j+'-img');
			else
				imag = document.createElement('img');
			imag.id = 'operation-'+operations[i][0]+'-'+j+'-img';
			operation_td[j].appendChild(imag);
			imag.setAttribute("src", "../images/no.png"); 
			imag.setAttribute("border", "0"); 
			imag.setAttribute("width", "21px"); 
			imag.setAttribute("height", "20px");
			imag.onclick = function() {  change_kletka(this.id.substr(0,this.id.length-4),1); }
			}
		else
			{
			
			var rstr= "<select name=\"menu1\" onchange=\"change_kletka('"+'operation-'+operations[i][0]+'-'+j+"',this.options[this.selectedIndex].value)\">";
			for(var k=0;k<3;k++)
				{
				rstr+="\n<option value='"+k+"'";
				if(k==res) rstr+=" selected ";
				rstr+=">"+k+"</option>";
				}
			rstr+="</select>";
			operation_td[j].innerHTML = rstr;
			}
	//	<img src="no.png" border="0" onclick="change_kletka('win_12-12',1)">
		
		}
	}
load_pi();
}
function create_message(str,inx)
{
var mess_pl = document.getElementById("message_place");
var mess_td;
var mess_tr;
if(document.getElementById('mess-'+inx))
	mess_tr = document.getElementById('mess-'+inx);
else
	mess_tr = document.createElement('tr');
mess_tr.id = 'mess-'+inx;
mess_pl.appendChild(mess_tr);

if(document.getElementById('mess-td-'+inx))
	mess_td = document.getElementById('mess-td-'+inx);
else
	mess_td = document.createElement('td');
mess_td.id = 'mess-td-'+inx;
mess_tr.appendChild(mess_td);
mess_td.style.padding = '3px';
mess_td.innerHTML = str;
}

function findcounterlogin(a)
{
for(var i=0;i<counters.length;i++)
	{
	if(counters[i]*1==a) return true;
	}
return false;
}
function future_messages()
{
var mess_pl = document.getElementById("message_place");

var new_tbody = document.createElement('tbody');
new_tbody.id = "message_place";
mess_pl.parentNode.replaceChild(new_tbody, mess_pl);

//mess_pl.innerHTML="";
var mess_inx = 0;
var marker_all = false;
//------операции
console.log("Дальнейшее выполнение операции:"); 
create_message("Дальнейшее выполнение операции:",9000);

for(var i=0;i<inx_buttons.length;i++)
	{
	var marker = false;
	for(var j=0;j<matrix.length;j++)
		{
		
		if(matrix_logins[j]!=undefined && matrix[counters[j]-1]!=undefined)
		{
		if(matrix_logins[j][1].charAt(inx_buttons[i]-1)*1==1 && matrix[counters[j]-1].charAt(inx_buttons[i]-1)*1>=1)
			{
			marker=true;
			console.log(marker,inx_buttons[i]);
			}
		}
		}
	if(marker==false)
		{
		marker_all = true;
		var mess_but = document.getElementById("operation-"+inx_buttons[i]+"-1").innerHTML;
		var mess_str="<b>("+mess_but.substr(0,1)+") "+mess_but.substr(2,mess_but.length-2)+" \t"+chel_arr[inx_buttons[i]*1]+" </b>чел.";
		console.log(mess_str);
		create_message(mess_str,mess_inx);
		mess_inx++;
		}
	}
console.log("невозможно ни в одном окне!");
create_message("невозможно ни в одном окне!<hr>",9001);
if(marker_all==false)
	{
	var m9 = document.getElementById('mess-9000');
	var new_9000 = document.createElement('tr');
	new_9000.id = "mess-9000";
	m9.parentNode.replaceChild(new_9000, m9);
	var m91 = document.getElementById('mess-9001');
	var new_9001 = document.createElement('tr');
	new_9001.id = "mess-9001";
	m91.parentNode.replaceChild(new_9001, m91);
	}
//----VIP
console.log("Дальнейшее обслуживание VIP-клиентов по категории:"); 
create_message("Дальнейшее обслуживание VIP-клиентов по категории:",9002);
marker_all = false;
for(var i=0;i<inx_buttons.length;i++)
	{
	var marker = false;
	for(var j=0;j<matrix_logins.length;j++)
		{
		if(matrix_logins[j]!=undefined && matrix[counters[j]-1]!=undefined)
			{
			//console.log(j,counters[j]-1,matrix_logins[j][3]);
			if(matrix_logins[j][2].charAt(inx_buttons[i]-1)*1==1 && matrix[counters[j]-1].charAt(inx_buttons[i]-1)*1>=1)
				{
				marker=true;
				
				}
			}
		}
	if(marker==false)
		{
		marker_all=true;
		var mess_but = document.getElementById("operation-"+inx_buttons[i]+"-1").innerHTML;
		var mess_str="<b>(Я) "+mess_but.substr(2,mess_but.length-2);
		console.log(mess_str);
		create_message(mess_str,mess_inx);
		mess_inx++;
		}
	}
console.log("невозможно ни в одном окне!");
create_message("невозможно ни в одном окне!<hr>",9003);
if(marker_all==false)
	{
	var m92 = document.getElementById('mess-9002');
	var new_9002 = document.createElement('tr');
	new_9002.id = "mess-9002";
	m92.parentNode.replaceChild(new_9002, m92);
	var m93 = document.getElementById('mess-9003');
	var new_9003 = document.createElement('tr');
	new_9003.id = "mess-9003";
	m93.parentNode.replaceChild(new_9003, m93);
	}
	
//----Okno

for(var i=0;i<matrix_logins.length;i++)
	{
	var marker = false;
	for(var j=0;j<inx_buttons.length;j++)
		{
		
		if(matrix_logins[i]!=undefined && matrix[counters[i]-1]!=undefined)
			{
		if((matrix_logins[i][1].charAt(inx_buttons[j]-1)*1==1 && matrix[counters[i]-1].charAt(inx_buttons[j]-1)*1>0) || findcounterlogin(matrix_logins[i][0])==false)
				{
				marker=true;
				
				}
			}
			else marker=true;
		}
	if(marker==false)
		{
		
		var mess_str= "Операционист <b>"+matrix_logins[i][3]+"</b> в <b>окне №"+matrix_logins[i][0]+"</b> не может работать ни по одной категории<hr>";
		console.log(mess_str);
		create_message(mess_str,mess_inx);
		mess_inx++;
		}
	}

}
function start_future()
{
	httpRequest("data.qsp2", function(req) { result_future(req.responseText) }, null, null, 30000);
};

