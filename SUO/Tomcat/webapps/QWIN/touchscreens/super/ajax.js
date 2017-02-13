

var gold;
var sberbank;
var nolable;
var plusbutton=0;

function parseGetParam(param) { 
		   
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
function createXMLHttpRequest() {
  try { return new XMLHttpRequest(); } catch(e) {}
  try { return new ActiveXObject('Msxml2.XMLHTTP'); } catch (e) {}
  try { return new ActiveXObject('Microsoft.XMLHTTP'); } catch (e) {}
  throw 'XMLHttpRequest not supported';
}
 
var HTTP_TIMEOUT = 5;

function httpRequest(url, onSuccess, onFail, postData, timeout) {


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
var btext;
function getbuttontext(resp)
{
btext=resp;
startpage();
}
function update_split(resp)
{
	
	var super_split;
	var list = new Array();
	super_split = resp.split('<br>*<br>');
	var super_line;
	super_line = super_split[0].split('#');
	for(var i=0;i<10;i++)
		{
		super_line[i] = super_line[i]*1;
		if(super_line[i] == 0 || super_line[i]>10)
			super_line[i] = i+1;
		}
	
	var line_split;
	var el_g;
	var system_type = '';
	line_split = super_split[1].split('#');
	
	for (var r=0; r <= line_split.length-1 && r<10; r++) {
		
		obj_split = line_split[super_line[r]-1].split('^');
		if(obj_split.length>1) {
					curbut=r+1;
					var ins_but = document.getElementById("ins_b"+curbut);
					
					el_g = document.getElementById("bu"+curbut);
					el_g.innerHTML = obj_split[0];
					el_g = document.getElementById("sbu"+curbut);
					if(obj_split[1]!="none" && obj_split[1]!="0")
						{
							el_g.innerHTML = obj_split[1];
						}
					else
						{
							el_g.style.display="none";
						}
				}
	}
};
function update(http_url)
{
	httpRequest(http_url, function(req) { getbuttontext(req.responseText) }, null, null, 3000);
	
};
var wtime=20000;
var metkatime=0;

function DoRefresh()
{
location.reload(true);
}
function RequestRefresh(res)
{

if(res)
	res=res.split('|');
if(res && res[0]=="good")
	{

	DoRefresh();
	}
else
	{
	http_url="/login/ping.txt";
setTimeout("httpRequest(http_url, function(req) {requestsession(req.responseText) }, function(req) {requestsession('')}, null, 3000)",3000);
	
	}
}
function requestsession(res)
{

if(res=="good")
	{
	http_url="/login/login.action?username=Administrator&page=/touchscreens/super/ping.qsp2";
	setTimeout("httpRequest(http_url, function(req) {DoRefresh() }, function(req) {refreshf(0)}, null, 3000)",3000);
	}
else
	{
	setTimeout("GoHome()",3000);
	refreshf(0);
	}
}
function wtimerefresh() //Перегружает в 7 утра
{
el = document.getElementById('MyTime');
str = el.innerHTML.split(':');
metkatime=1;
}
function refreshf(a)
{

setTimeout("wtimerefresh()",180000); 
}
//new method BEGIN
//БУМАГА


//new method END
/*function check_paper_result(payload)
{

}*/

function bumaga()
{
GoHome();
}

function startcheckprint()
{
http_url="printer_status.jsp?printer="+p;
setTimeout("bumaga()",30000);
httpRequest(http_url, function(req) {console.log('Проверка бумаги:',req.responseText)}, null, null, 3000);
}
//END of БУМАГА
function loadcardlist()
{

http_url="cardlist.html";
httpRequest(http_url, function(req) { loadcardlist2(req.responseText) }, function(req) { startsession()}, null, 3000);
}
function loadcardlist2(str)
{
line_split = str.split('\n');
line1=line_split[0].split(':');
gold=line1[1].split(',');
line2=line_split[1].split(':');
sberbank=line2[1].split(',');
line3=line_split[2].split(':');
nolable=line3[1].split(',');

}
function Cardholder()
{
//alert(1);
http_url="get_qwin.qsp2?printer="+p;
httpRequest(http_url, function(req) { cardfunc(req.responseText) }, null, null, 3000);
}
var hprint = 0;
function hideprint()
{
document.getElementById('mess_print').style.display = 'none';
startcheckprint();
}
function checkprint(str)
{
line_split = str.split('#');
hprint=1;

if(line_split[2]=="BAD")
	alertfunc(2,"BAD4",line_split[1]);
}

function GoHome()
{
el = document.getElementById('alert1');
el.style.display="none";
el = document.getElementById('alert2');
el.style.display="none";
}
function alertfunc(a,b,c)
{
if(a==2)
	{
	el2 = document.getElementById('bad');
	if(b=="BAD3")
		{
		b="Уважаемые клиенты, выдача талонов по данной операции<br>временно не производится!";
		el2.innerHTML = b;
		}
	if(b=="BAD4")
		{
		if(c=="" || c=="0")
			c="Уважаемые клиенты, дача талонов временно не производится!<br>Закончилась бумага!";
		el2.innerHTML = c;
		}
	else el2.innerHTML = b;
	}	
if(a==1)
	{

	 document.getElementById('mess_print').style.display = 'block';
	 if(metkatime==1)
		{
		http_url="ping.qsp2"; 
		setTimeout("httpRequest(http_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000)",3000);
		}
	 setTimeout('hideprint()',3000);
	}
else{
el = document.getElementById('alert'+a);
el.style.display="block";
if(metkatime==1)
	{
	http_url="ping.qsp2";
	setTimeout("httpRequest(http_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000)",3000);

	}
else
	{
	if(b!="BAD4")
		setTimeout("GoHome()",3000);
	}
}
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
function resultat(resp)
{
 
  sres= resp.split('||');
  reees = sres[0].split('<br>');
  
 if(reees[1]*1 == 2)
		{

		for(var i=1;i<sres.length;i++)
			{
			vres = sres[i].split('&&');
			document.getElementById('red_vsp_'+i).style.display = 'block';
			document.getElementById('red_vsp_num_'+i).innerHTML = vres[0];
			document.getElementById('red_vsp_adres_'+i).innerHTML = vres[1];
			document.getElementById('red_vsp_que_'+i).innerHTML = vres[2];
			var time = new Date(1,1,1,0,0,vres[3]*1);
			
			document.getElementById('red_vsp_time_'+i).innerHTML = pluszero(time.getHours()) + ":" + pluszero(time.getMinutes()) + ":" + pluszero(time.getSeconds());
			}
		if(reees[2]*1>40) reees[2]=reees[2]*1-40;
		if(reees[2]*1>20) reees[2]=reees[2]*1-20;
		openred(reees[2]*1);
		}
	else
		{
		plusbutton=0;
		
		line_split = reees[0].split('#');
		 el_g = document.getElementById('result');
		 el_g.innerHTML=line_split[0];
		
		if(el_g.innerHTML=="GOOD") alertfunc(1,"","");
		else {
		alertfunc(2,line_split[0],"");
		}
  }
}		
function printer(p,button,r)
{   
  
//alert(plusbutton+" "+r);
	button=button+plusbutton;
	//http_url="print.qsp2?printer="+p+"&button="+button+"&red="+r;
	
	httpRequest("print.qsp2?printer="+p+"&button="+button+"&red="+r, function(req) { resultat(req.responseText) }, function(req) { startsession(req.responseText) }, null, 3000);
	//plusbutton=0;
};		
function proverka(inx,nomer)
{
var mass;
var num;
if(nomer[0]=='\n') num=nomer.slice(1,nomer.length);
else num=nomer;

if(inx==1)mass=gold;
if(inx==2)mass=sberbank;
if(inx==3)mass=nolable;


var march=0;
for(var i=0;i<mass.length;i++)
	if(mass[i].search(num)>=0) march=1;
return march;
}
function srok_godnosti(inp,year,mon)
{

buf=year.slice(1,3);
year=buf;
cardyer=inp.slice(0,2);
cardmon=inp.slice(2,4);
var metka=0;
if(cardyer>year) metka=1;
else
	if(cardyer==year)
		if(cardmon>mon) metka=1;
return metka;

}
function cardfunc(str1)
{

	line_split = str1.split('^');
	var user;
var real;
var god;
var srok=0;

if(proverka(3,line_split[2])==0 )
{
if(line_split.length>5) 
	{
	user=line_split[4];
	real=user.slice(0,user.indexOf("  "));
	}
else 
	{
	user=line_split[3];
	var max=user.lastIndexOf("0");
	var li=0;
	li=user.lastIndexOf("1");
	if(li>max) max=li;
	li=user.lastIndexOf("2");
	if(li>max) max=li;
	li=user.lastIndexOf("3");
	if(li>max) max=li;
	li=user.lastIndexOf("3");
	if(li>max) max=li;
	li=user.lastIndexOf("4");
	if(li>max) max=li;
	li=user.lastIndexOf("5");
	if(li>max) max=li;
	li=user.lastIndexOf("6");
	if(li>max) max=li;
	li=user.lastIndexOf("7");
	if(li>max) max=li;
	li=user.lastIndexOf("8");
	if(li>max) max=li;
	
	real=user.slice(max+1,user.length);
	user=real;
	real=user.slice(0,user.indexOf("  "));
	}
}
else
real="Клиент";
if(real.search("CARDHOLDER")>=0)
real="Клиент";
if(line_split.length>5)
srok=srok_godnosti(line_split[5],line_split[0],line_split[1]);
else
srok=srok_godnosti(line_split[4],line_split[0],line_split[1]);
if(srok==1)
{
if(proverka(1,line_split[2])==1)
	plusbutton=40;
else
	{
	if(proverka(2,line_split[2])==1)
	plusbutton=20;
	else plusbutton=0;
	}
}
else
plusbutton=0;
var finals=real.split('/');
if(finals.length>1)
str1="Уважаемый<br>"+finals[0]+" "+finals[1]+" мы рады приветствовать Вас в нашем банке<br>Выберите цель обращения.";
else
str1="Уважаемый "+real+" мы рады приветствовать Вас в нашем банке<br>Выберите цель обращения.";
document.getElementById("usertext").innerHTML=str1;
document.getElementById("usercard").style.display='block';
setTimeout("closecardfunc()",3000);
}

function startRequestRefresh(res)
{
if(res)
	res=res.split('|');
if(res && res[0]=="good")
	{
	var qqq=1
	}
else
	{

	http_url="/login/ping.txt";
setTimeout("httpRequest(http_url, function(req) {startrequestsession(req.responseText) }, function(req) {startrequestsession('')}, null, 3000)",3000);
}
}	
	
function startrequestsession(res)
{

if(res=="good")
	{

	http_url="/login/login.action?username=Administrator&page=/touchscreens/super/ping.qsp2";
	setTimeout("httpRequest(http_url, function(req) {DoRefresh()}, null, null, 3000)",3000);
	}
else
	{

	setTimeout("GoHome()",3000);
	
	}
}
function startsession()
{
http_url="ping.qsp2";
setTimeout("httpRequest(http_url, function(req) { startRequestRefresh(req.responseText) }, function(req) {startRequestRefresh('')}, null, 3000)",3000);
}
function closecardfunc()
{
	document.getElementById("usercard").style.display='none';
}	
function redtaktika(button,value)
{
	/*if(plusbutton<41) {*/
		/*if(value=="none") {
			http_url="redtakt.qsp2?but="+button;
			httpRequest(http_url, function(req) { redtaktika(button,req.responseText) }, function(req) { startsession()}, null, 3000);
		} else {
			line_split = value.split('^');
			if(line_split[0]=="1")
			{*/
				/*document.getElementById("redprognoz").innerHTML=line_split[1];
				
				document.getElementById("redqueue").innerHTML=line_split[2];
				rm=line_split[3].split('N');
				document.getElementById("rm1").innerHTML=rm[0];
				document.getElementById("rm2").innerHTML=rm[1];
				if(line_split.length>5)
				{ var str="";
				for(i=5;i<line_split.length;i++)
					{
					if(line_split[i]!=0 || line_split[i]!='0')
					str+="Время ожидания в "+line_split[i];
					}
				document.getElementById("redqueue2").innerHTML=str;
				}
				openred(button);*/
			/*} else
				printer(p,button);*/
		/*}*//*
	} else*/
		printer(p,button,1);
}
		
function startpage() {
	
	update_split(btext);

}