
// *****************************************************************************
// XMLHttpRequest
// 
// See also, article on HTTP requests and ready state:
// http://www.ibm.com/developerworks/web/library/wa-ajaxintro3/
//
//  // Test
//  httpRequest(
//    "http://example.com/",
//    function(req) {alert("success - " + req.responseText)},
//    function(req) {alert("fail " + req.responseText)},
//    null, 5000);
//
// *****************************************************************************
var gold;
var sberbank;
var nolable;
var plusbutton=0;
function createXMLHttpRequest() {
  try { return new XMLHttpRequest(); } catch(e) {}
  try { return new ActiveXObject('Msxml2.XMLHTTP'); } catch (e) {}
  try { return new ActiveXObject('Microsoft.XMLHTTP'); } catch (e) {}
  throw 'XMLHttpRequest not supported';
}
 
var HTTP_TIMEOUT = 5; // default to 20s
 
// Sends an asynchronous XMLHttpRequest.
// onSuccess:function(req)
//    Function to be fired on completion.
// onFail : function(req)
//    Function to be fired on failure or timeout.  Note the req parameter
//    may be null.
// timeout: milliseconds
//    Request will be aborted if it hasn't completed within the timeout
//    period.  If not specified, default HTTP_TIMEOUT will be used.
//    Pass in -1 for infinite.
function httpRequest(url, onSuccess, onFail, postData, timeout) {
  // Prepare a new XMLHttpRequest instance
  var req = createXMLHttpRequest();
  var method = postData ? 'POST' : 'GET';
  req.open(method, url, true);
  req.setRequestHeader('User-Agent', 'XMLHTTP/1.0');
  if (postData) {
    req.setRequestHeader('Content-type','application/x-www-form-urlencoded');
  }
  
  // Set up a timeout monitor if requested
  var timer = null;
  if (!timeout) timeout = HTTP_TIMEOUT;
  if (timeout != -1) {
    timer = setTimeout(httpTimeoutClosure(req, onFail), timeout);
  }

  // Hook status change event
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
btext=resp
startpage();
}
function update_split(resp)
{
	var line_split;
	var el_g;
	var system_type = '';
	line_split = resp.split('#');
	for (var r=0; r <= line_split.length-1; r++) {
		obj_split = line_split[r].split('^');
		if(obj_split.length>1) {
					curbut=r+1;
					el_g = document.getElementById("bu"+curbut);
					el_g.innerHTML = obj_split[0];
					el_g = document.getElementById("sbu"+curbut);
					if(obj_split[1]!="none")
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
	httpRequest(http_url, function(req) { getbuttontext(req.responseText) }, function(req) { /*update (http_url)*/}, null, 1000);
	
};
var wtime=20000;
var metkatime=0;
function DoRefresh()
{

location.reload(true);
}
function refreshf(a)
{
if(a==0) setTimeout("refreshf(1)",wtime);
else metkatime=1;

}
function loadcardlist()
{

http_url="cardlist.qsp";
httpRequest(http_url, function(req) { loadcardlist2(req.responseText) }, function(req) { /*loadcardlist()*/}, null, 1000);
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
http_url="get_qwin.qsp?printer="+p;
httpRequest(http_url, function(req) { cardfunc(req.responseText) }, function(req) { /*Cardholder()*/}, null, 1000);
}

function GoHome()
{
el = document.getElementById('alert1');
el.style.display="none";
el = document.getElementById('alert2');
el.style.display="none";
}
function alertfunc(a)
{
el = document.getElementById('alert'+a);
el.style.display="block";
if(metkatime==1)
	setTimeout("DoRefresh()",3000);
else
	setTimeout("GoHome()",3000);
}
function resultat(resp)
{
  line_split = resp.split('#');
  el_g = document.getElementById('result');
  el_g.innerHTML=line_split[0];
  if(el_g.innerHTML=="GOOD") alertfunc(1);
  else alertfunc(2);
}		
function printer(printer,button)
{   
	button=button+plusbutton;
	//alert(button);
	http_url="print.qsp?printer="+printer+"&button="+button;
	httpRequest(http_url, function(req) { resultat(req.responseText) }, function(req) { /*printer (printer,button)*/}, null, 1000);
	plusbutton=0;
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
//alert("mon("+mon+")="+cardmon+" year("+year+")="+cardyer);
}
function cardfunc(str1)
{

	line_split = str1.split('^');
	var user;
var real;
var god;
var srok=0;
//alert(line_split[0]+"=="+line_split[1]+"!!!"+);
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

function closecardfunc()
{
	document.getElementById("usercard").style.display='none';
}	
function redtaktika(button,value)
{
	if(plusbutton<41) {
		if(value=="none") {
			http_url="redtakt.qsp?but="+button;
			httpRequest(http_url, function(req) { redtaktika(button,req.responseText) }, function(req) { /*redtaktika(button,"none")*/}, null, 1000);
		} else {
			line_split = value.split('^');
			if(line_split[0]=="1")
			{
				document.getElementById("redprognoz").innerHTML=line_split[1];
				document.getElementById("redqueue").innerHTML=line_split[2];
				openred(button);
			} else
				printer(p,button);
		}
	} else
		printer(p,button);
}
		
function startpage() {
	
	update_split(btext);

};