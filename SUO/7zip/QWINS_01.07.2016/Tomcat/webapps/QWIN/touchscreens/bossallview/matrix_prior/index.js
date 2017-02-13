var matrix;
var buf_matrix;
var buf_mass_chenge = new Array();
var mass_chenge = new Array();
var mass_chenge_buttons = new Array();
var mass_chenge_counters = new Array();
var mass_chenge_out ="";

var moder=1;
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
function hadmin()
{


if(moder!=2)
	{
	document.getElementById("doing").style.display = "none"
	}
}
moder = parseGetParam('user');
var changed_window = new Array();
var changed_window_inx=0;
function reset_matrix()
{
mass_chenge_out ="Сброс всех настроек";
httpRequest('/lib/1.jsp?TypeId=6&ComIndex=13&Comment=0&action='+encodeURI(mass_chenge_out),null,null,null,3000); 

console.log('/lib/1.jsp?TypeId=6&ComIndex=14&Comment=0&action='+encodeURI(mass_chenge_out) );
mass_chenge_out="";
for(var i=0;i<mass_chenge.length;i++)
	{
	mass_chenge[i]=null;
	}
var out_str="run.qsp2?matrix=1&nums=1&len=0&reset=1";
httpRequest(out_str, function(req) { console.log(req.responseText); document.location.reload(true); console.log("Матрица обнулена!");}, function() {console.log("Ошибка применения");}, null, 30000);
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
console.log("Применяем настройки...");

alert("Изменения приняты!");
httpRequest(out_str, function(req) { console.log(req.responseText); document.location.reload(true); console.log("Изменения приняты!");}, function() {console.log("Ошибка применения");}, null, 30000);

//document.location.href=out_str;
}

function what_happened()
{

//console.log(buf_mass_chenge[1],mass_chenge[1]);

var len1 = mass_chenge.length;
//console.log(mass_chenge,buf_mass_chenge);
for(var i=0;i<len1;i++)
	{
	if( mass_chenge[i]!=undefined && mass_chenge[i]!=null)
		{
		var len2 = mass_chenge[i].length;
	
		var str  = mass_chenge_counters[i];
		//console.log(mass_chenge_counters[i],str);
		var str1 = " Добавлена/Изменена возможность обслуживать:";
		var str2 = " Убрана возможность обслуживать:";
		//console.log(mass_chenge);
		for(var j=0;j<len2;j++)
			{
			
			if( mass_chenge[i][j]!=undefined && mass_chenge[i][j]!=null)
			{
			//console.log(mass_chenge[i],buf_mass_chenge[i],i);
			if( mass_chenge[i][j]*1!=buf_mass_chenge[i][j]*1)
				{
				
				if(mass_chenge[i][j]*1==0)
					{
					str2+=""+mass_chenge_buttons[j]+", ";
					
					}
				else
					str1+=""+mass_chenge_buttons[j]+"("+mass_chenge[i][j]+" пр.), ";
				}
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
if(moder==2)
	{
		
		var arradres = adres.split('-');
		var change_button = arradres[1]*1-1;
		var change_counter = arradres[2]*1-4;
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
		if(mass_chenge[change_counter+1]==undefined ||mass_chenge[change_counter+1]==null)
			mass_chenge[change_counter+1] = new Array();
		mass_chenge[change_counter+1][change_button+1] = value;
		
		//console.log("Измененные:",change_counter+1,change_button+1,mass_chenge[change_counter+1][change_button+1],buf_mass_chenge[change_counter+2][change_button+2]);
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
	else 
	{
		alert("Нет прав. Для изменения Вы должны быть модератором.");
		document.location.reload(true);
	};
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

function result_future(str)
{
str = str.split('\n***\n');
var counters = str[0].split('|');
counters.length = counters.length-1;
var operations = str[1].split('\n');
operations.length = operations.length-1;
matrix = str[2].split('\n');
matrix.length = matrix.length-1;
buf_matrix = str[2].split('\n');
buf_matrix.length = buf_matrix.length-1;
var main_table = document.getElementById('MainTableBody');
var counters_tr;
if(document.getElementById('counters'))
	counters_tr = document.getElementById('counters');
else
	counters_tr = document.createElement('tr');
counters_tr.id = 'counters';
main_table.appendChild(counters_tr);
var counters_td = new Array();
var typ=document.createAttribute("colspan");
typ.nodeValue=counters.length;
document.getElementById('counters_head').attributes.setNamedItem(typ);
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
	counters_td[i].innerHTML = "<center><div id=\"counter_div_"+i+"\" class=\"listItem\" style=\"width:100%;\"><b><font size=\"+1\">"+counters[i]+"</font></b></div></center>";
	mass_chenge_counters[counters[i]] = "Окно "+counters[i];
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
		//console.log(operation_td[j].id);
		operation_tr[i].appendChild(operation_td[j]);
		operation_td[j].innerHTML = operations[i][j];
		if(j==1)
			mass_chenge_buttons[operations[i][0]*1] = operations[i][j].substr(2,operations[i][j].length);
		if(j!=1)
			operation_td[j].style.textAlign="center";
		}
	for(var j=oplen;j<counters.length+oplen;j++)
		{
		var coun4 = counters[j-oplen]*1+3;
		if(document.getElementById('operation-'+operations[i][0]+'-'+coun4))
			operation_td[j] = document.getElementById('operation-'+operations[i][0]+'-'+coun4);
		else
			operation_td[j] = document.createElement('td');
		
		operation_td[j].id = 'operation-'+operations[i][0]+'-'+coun4;
		//console.log('operation-'+operations[i][0]+'-'+coun4,coun4);
		operation_tr[i].appendChild(operation_td[j]);
		operation_td[j].style.textAlign="center";
		var res = matrix[counters[j-oplen]-1].substr(operations[i][0]*1-1,1)*1;
		if(buf_mass_chenge[counters[j-oplen]*1]==undefined || buf_mass_chenge[counters[j-oplen]*1-3]==null)
			buf_mass_chenge[counters[j-oplen]*1] = new Array();
		buf_mass_chenge[counters[j-oplen]*1][i+1] = res*1;
		if(res == 0)
			{
			var imag;
			if(document.getElementById('operation-'+operations[i][0]+'-'+coun4+'-img'))
				imag = document.getElementById('operation-'+operations[i][0]+'-'+coun4+'-img');
			else
				imag = document.createElement('img');
			imag.id = 'operation-'+operations[i][0]+'-'+coun4+'-img';
			operation_td[j].appendChild(imag);
			imag.setAttribute("src", "../images/no.png"); 
			imag.setAttribute("border", "0"); 
			imag.setAttribute("width", "21px"); 
			imag.setAttribute("height", "20px");
			imag.onclick = function() {  change_kletka(this.id.substr(0,this.id.length-4),1); }
			}
		else
			{
			
			var rstr= "<select name=\"menu1\" onchange=\"change_kletka('"+'operation-'+operations[i][0]+'-'+coun4+"',this.options[this.selectedIndex].value)\">";
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
}
function start_future()
{
	httpRequest("data.qsp2", function(req) { result_future(req.responseText) }, null, null, 30000);
};

