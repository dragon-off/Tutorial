
var time;
var plusbutton = 0;
var p=1;
var gold;
var timeoutID;
var sberbank;
var nolable;
var glob_pos;
var MarkerRefresh = false;
var cardTimer;//таймер вставленой карточки
if (!window.console) console = {log: function() {},info: function() {},error: function() {},warn: function() {}};
setTimeout(function(){
				MarkerRefresh = true;		 
				}, 600000);
				
var buttons_absolute = false;
var buttons_left = new Array();
var buttons_top = new Array();

function findClass(str,id)
{
 
str = str.split("}");
var out="";
for(var i=0;i<str.length;i++)
	{
	
		str[i] = "#div_"+id+" "+str[i];
	out+=str[i]+"}\n";
	}
return out;
}
function understart()
{
if(document && document!=null && document.defaultView && document.defaultView!=null)
{if(document.defaultView.getComputedStyle(document.getElementById('div_13'), '').getPropertyValue("position")=="absolute")
	{
	buttons_absolute=true;
	for(var i=0;i<3;i++)
		{
		buttons_left[i]=document.defaultView.getComputedStyle(document.getElementById('div_'+(13+i)), '').getPropertyValue("left").split('px')[0]*1;
		if(!buttons_left[i]) buttons_left[i]=0;
		buttons_top[i]=document.defaultView.getComputedStyle(document.getElementById('div_'+(13+i)), '').getPropertyValue("top").split('px')[0]*1;
		if(!buttons_top[i]) buttons_top[i]=0;
		
		}
	}
}
else
	{
	console.log("Проблема с dafaultView!");
	startsession();
	}
	

}

function addStyle(str)
{
str = str.split("<br>");
var out = "";

for(var i=0;i<=14&&str[i].length>1;i++)
	{

	if(str[i].substr(str[i].lastIndexOf('}')-1,1)=='}')
		str[i] = str[i].substr(0,str[i].lastIndexOf('}')-1); //Убираем последнюю фигурную скобку
	str[i] = str[i].replace('#div_№','');
	str[i] = str[i].replace('{','');
	str[i] = findClass(str[i],glob_pos[i]);
	str[i] = str[i].replace(/;/g,';\n');
str[i] = str[i].replace(/{/g,'{\n');
	/*console.log("---------"+"Стиль кноки "+glob_pos[i]+" ("+(i+1)+")---------");
	console.log(str[i]);*/
	out=out+"\n"+str[i];
	
	}


var sheet = document.createElement('style');
sheet.innerHTML = out;
document.body.appendChild(sheet);

//Поиск стиля position:absolute;


}

function but_sort(arr)
{
var len = arr.length;
for (var i = 0; i < len-1; i++)
  for (var j = i+1; j < len; j++)
    {
     if (arr[i]==arr[j] || arr[j]>arr.length)
		arr[j]=0;

    }
for (var i = 0; i < len; i++)
  {
	if(arr[i]==0)
		{
		var marker=true;
		for (var j = 0; j < len; j++)
			{
			if(arr[j]==(i+1))
				marker=false;
			}
		if(marker==true)
			arr[i] = i+1;
		}
  }
for (var i = 0; i < len; i++)
  {
	if(arr[i]==0)
		{
		
		for (var j = 1; j <= len; j++)
			{
			var marker = true;
			
			for (var k = 0; k < len; k++)
				{
				if(arr[k]==j)
					{
					marker=false;
					break;
					}
				}
			if(marker==true)
				{
				arr[i] = j;
				break
				}
			}
		
		}
  }
return arr;
}
function resort(arr,mask)
{
var arr2 = new Array();

var len  = arr.length;
for(var i=0;i<len;i++)
	{
	arr2[mask[i]-1] = arr[i];
	}

return arr2;
}
function start_style()
{

httpRequest("style.qsp2", function(req) {addStyle(req.responseText) }, function(req) { startsession()}, null, 3000);
}

	
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
		
p = parseGetParam('printer');
load_pi();		
function update(http_url,type)
{
httpRequest(http_url, function(req) { ajax_result(req.responseText,type) }, function(req) { startsession()}, null, 3000);	
};
function animation_print()
{
var talon = document.getElementById('talon'),
      text = document.getElementById('taketext');
talon.className += ' animate';	
	text.style.visibility = 'visible';	 
clearTimeout(time);	
setTimeout(function(){
		document.getElementById('blockDo').style.display = "none";
	},4000); 
	
	if (navigator.userAgent.match(/MSIE\s(?!8.0)/) && navigator.userAgent.match(/MSIE\s(?!9.0)/)) {
		talon.className += ' animate';	
		time = setTimeout(function(){
			talon.className = 'talon';
			text.style.visibility = 'hidden';
		}, 4000);
	} else {
		function talonAnimation(step) {
			var step = step ? step : 1;		
			talon.className = 'talon animate-' + step + ' animation-start';
			step++
			if (step < 6) {
				setTimeout(function(){			
					talonAnimation(step)
				}, 100);
			} else {
				time = setTimeout(function(){
					talon.className = 'talon';
					text.style.visibility = 'hidden';
					document.getElementById('taketext').style.visibility = 'hidden';
					
				}, 4000);
				clearTimeout(animation);	
			}	
		}
		
		animation = setTimeout(function(){			
			talonAnimation(1);
		}, 100);		
	} 
}
function startsession()
{
cccombo = 0;
console.log('Проверяем наличие сессии');
var buf_date = new Date();
var buf_sec = buf_date.getMinutes()*buf_date.getSeconds();
console.log("ping.qsp2?sec="+buf_sec);
setTimeout(function() {httpRequest("ping.qsp2?sec="+buf_sec, function(req) { startRequestRefresh(req.responseText);console.log('Сессия открыта'); }, function(req) {startRequestRefresh('');console.warn('Сессия ЗАКРЫТА');}, null, 3000)},3000);
}
function ajax_result(str,type)
{
if(type=="buttons")
	load_buttons(true,str);
}

function startcheckprint()
{
http_url3="printer_status.jsp?printer="+p;
console.log("Запуск проверки бумаги...")
httpRequest(http_url3, function(req) {bumaga_is_lost(req.responseText.split("#")[3],req.responseText.split("#")[2]); },null, null, 3000);
}
function resultat(resp)
{
clearTimeout(cardTimer);  
console.info('Результат печати: '+resp);
bedresp = resp.split('#');

if(bedresp.length==3)
{
if(bedresp[0]=="BAD3")
	{
	var buf_date = new Date();
	var buf_sec = buf_date.getMinutes()*buf_date.getSeconds();
	var Rhttp_url="ping.qsp2?sec="+buf_sec;
	
	httpRequest(Rhttp_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000)		
	
	}
else
	{
	document.getElementById("usertextbad").innerHTML=bedresp[0];
	document.getElementById("bad").style.display='block';
	setTimeout("closebadfunc()",3000);
	plusbutton=0;
	if(MarkerRefresh)
		{
		var buf_date = new Date();
		var buf_sec = buf_date.getMinutes()*buf_date.getSeconds();
		var Rhttp_url="ping.qsp2?sec="+buf_sec;
		setTimeout(function(){
			httpRequest(Rhttp_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000)		
			}, 4000);
		}
	}
}
else
{
prognoz_resp = resp.split('<|>');

if(prognoz_resp.length>1)
	{
	/*prognozz = prognoz_resp[1].split('||');
	this_id = "prognoz_minut";
	if(document.getElementById(this_id))
		{
		//console.log("Прогноз ",r_butt,total_resultat[buttobut(r_butt)-1],t_fsn[buttobut(r_butt)][1]);
		//if(total_resultat[i]*1==0) total_resultat[i] = t_fsn[i+1][1];
		if(prognozz[0]==-1)
			document.getElementById(this_id).innerHTML = "";
		else
			document.getElementById(this_id).innerHTML = (prognozz[0]*1);
		}
	this_id = "prognoz_chel";
	if(document.getElementById(this_id))
		{
		document.getElementById(this_id).innerHTML = prognozz[1];
		}*/
	}
 sres= prognoz_resp[0].split('||');
	
  reees = sres[0].split('<br>');
  red_button = reees[2]*1;
 if(reees[1]*1 == 2)
		{
		if(sres.length==1)
			{
			document.getElementById('vsp_plato').style.display = 'none';
			document.getElementById('div_998').style.top = "400px";
			document.getElementById('div_997').style.top = "400px";
			}
		for(var i=1;i<sres.length;i++)
			{
			
			vres = sres[i].split('&&');
			
			document.getElementById('red_vsp_'+i).style.display = 'table-row';	
			document.getElementById('red_vsp_adres_'+i).innerHTML = vres[1];
			vres[3] = vres[3].split("|*|");
			var minu = 0;
			for(var j=0;j<vres[3].length-1;j++)
				{
				var jres = vres[3][j].split('!');
				if(jres.length>1)
					{
					if(jres[0]*1==vres[2]*1)
						{
						console.log(jres[0]*1,vres[2]*1);
						minu = jres[2]*1;
						break;
						}
					}
				}
			
			minu = Math.round(minu/60)*60;
			var time = new Date(1,1,1,0,0,minu);
			
			document.getElementById('red_vsp_time_'+i).innerHTML = time.getMinutes();
			}
		if(reees[2]*1>40) reees[2]=reees[2]*1-40;
		if(reees[2]*1>20) reees[2]=reees[2]*1-20;
		 document.getElementById('RedVSP').style.display = "block";
		
		timeoutID = setTimeout(function(){
		httpRequest("eject.qsp2?printer="+p, function(req) {  }, function(req) { startsession(req.responseText);document.getElementById('blockDo').style.display = "none"; }, null, 3000);
		red_button=0;
		document.getElementById('vsp_plato').style.display = 'block';
		document.getElementById('blockDo').style.display = "none";
		document.getElementById('RedVSP').style.display = "none";
		document.getElementById('div_998').style.top = "877px";
		document.getElementById('div_997').style.top = "877px";
		plusbutton=0;	
		},10000);
		//console.log(red_button,prognoz(red_button));
		
		}
	else
		{
		plusbutton=0;
		if(MarkerRefresh)
			{
			var buf_date = new Date();
			var buf_sec = buf_date.getMinutes()*buf_date.getSeconds();
			var Rhttp_url="ping.qsp2?sec="+buf_sec;
			setTimeout(function(){
				httpRequest(Rhttp_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000)		
				}, 4000);
			}
		animation_print();

		setTimeout(function(){	startcheckprint();	}, 3000);
		
		line_split = reees[0].split('#');
		 el_g = document.getElementById('result');
		 el_g.innerHTML=line_split[0];
		
		/*if(el_g.innerHTML=="GOOD") alertfunc(1,"","");
		else {
		//alertfunc(2,line_split[0],"");
		}*/
  }
}
}	

function printer_after_prognoz(p,button,r)	
{
if(button>0)
	{
	console.info('Печать кнопки: %d. Красная тактика: %d',button,r);
	//http_url2="/get?print&printer="+p+"&button="+button+"&red="+r;
	http_url2="print.qsp2?printer="+p+"&button="+button+"&red="+r;
	
	httpRequest(http_url2, function(req) { resultat(req.responseText) }, function(req) { startsession(req.responseText);document.getElementById('blockDo').style.display = "none"; }, null, 3000);
	}
else
	{
	console.warn('Печать кнопки: 0 невозможна!');
	startsession();
	document.getElementById('blockDo').style.display = "none";
	}
}
function printer(p,button,r)
{  

if(r==0)
	{
	printer_after_prognoz(p,red_button,r);
	}
else
	{
	button=button+plusbutton;
	red_button = button;
	console.log("red0=",r);
	array_red=r;
	//show_red(red_button,r);
	//start_prognoz(null,r);
	load_pi(r);
	}

};
//----CARD functons

function firstsession()
{

console.warn('Проверяем сессию');
var buf_date = new Date();
var buf_sec = buf_date.getMinutes()*buf_date.getSeconds();
		var Rhttp_url="ping.qsp2?sec="+buf_sec;
		httpRequest(Rhttp_url, function(req) { result_firstsession(req.responseText) }, function(req) {result_firstsession('')}, null, 7000);		
		
}
function result_firstsession(res)
{
console.log("Получен ответ от первой сессии!",res);
if(res)
	res=res.split('|');
if(res && res[0].search("Please wait")==-1)
	{
	console.log("Первая сессия есть!");
	understart();
	load_buttons();
	loadcardlist();
	}
else
	{
http_url6="/logout.action";
console.log(res);
console.log("Завершаем сессию!");
	httpRequest(http_url6, function(req) {}, function(req) {}, null, 5000);
setTimeout("httpRequest(\"/login/ping.txt\", function(req) {first_requestsession(req.responseText) }, function(req) {first_requestsession('')}, null, 3000)",3000);
	
	}
}
function first_waitreload()
{
setTimeout("httpRequest(\"/login/ping.txt\", function(req) {first_requestsession(req.responseText) }, function(req) {first_requestsession('')}, null, 3000)",10000);
}
function waitreload()
{
setTimeout("httpRequest(\"/login/ping.txt\", function(req) {startrequestsession(req.responseText); }, function(req) {startrequestsession('');}, null, 3000)",10000);
}
function loadcardlist()
{

http_url="cardlist.qsp";
httpRequest(http_url, function(req) { loadcardlist2(req.responseText) }, function(req) { startsession()}, null, 3000);
}
var strr;
function loadcardlist2(str)
{

if(str!=undefined)
	{
	line_split = str.split('\r\n');
	}
else
	line_split=null; 
if(line_split!=null && line_split.length >=1)
	{
		for(var j=0;j<line_split.length-1;j++) {
			elem=line_split[j].split(":");
			if(elem[0]=="gold")
				gold=elem[1].split(",");
			if(elem[0]=="sberbank")
				sberbank=elem[1].split(",");
			if(elem[0]=="nolable")
				nolable=elem[1].split(",");
		};
	};
/*
if(str!=undefined)
	{
	str = str.replace(/\r/g,"");
	line_split = str.split('\n');
	}
else
	line_split=null; 
if(line_split!=null && line_split.length >=3)
	{
	line1=line_split[0].split(':');
	gold=line1[1].split(',');
	line2=line_split[1].split(':');

	sberbank=line2[1].split(',');
	line3=line_split[2].split(':');
	if(line3.length>1)
		nolable=line3[1].split(',');
	}
	*/

}
function closecardfunc()
{
	document.getElementById("usercard").style.display='none';
}
function closebadfunc()
{
	document.getElementById("bad").style.display='none';
	document.getElementById('blockDo').style.display = "none";
}
function cardfunc(str1)
{

	line_split = str1.split('^');
	strr=line_split;
console.log("Вставлена карточка!",line_split);	
	var user;
var real;
var god;
var srok=0;
console.log("line_split.length",line_split.length);
if(line_split.length>1)
{
/*if(proverka(3,line_split[2])==0 )
{*/
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
	console.log(real,user);
	user=real;
	real=user.slice(0,user.indexOf("  "));
	}
/*}
else
	real="Клиент";*/
if(real.search("CARDHOLDER")>=0 || real.search("MOMENTUM")>=0)
real="Клиент";
if(line_split.length>5)
srok=srok_godnosti(line_split[5],line_split[0],line_split[1]);
else
srok=srok_godnosti(line_split[4],line_split[0],line_split[1]);
}
else
	{
	console.log("Некорректно считана карточка!");
	srok=0;
	real="Клиент";
	}
if(srok==1)
{
console.log(line_split[2]);
if(proverka(3,line_split[2])==0)
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
}
else
plusbutton=0;
console.log("plusbutton=="+plusbutton);
var finals=real.split('/');
if(finals.length>1)
str1="Здраствуйте, уважаемый(-ая)<br>"+finals[0]+" "+finals[1]+", выберите интересующую Вас услугу.";
else
str1="Здраствуйте, уважаемый<br>"+real+", выберите интересующую Вас услугу.";
document.getElementById("usertext").innerHTML=str1;
document.getElementById("usercard").style.display='block';
setTimeout("closecardfunc()",3000);

cardTimer = setTimeout(function(){plusbutton=0;console.log("Карточкой не воспользовались!");},30000);
}
function proverka(inx,nomer)
{
var mass=[];
var march=0;
var num;

if(nomer==undefined || nomer==null) return 0;
if(nomer.length<=1 && inx==3) march=1;

if(nomer.length>1)
{

if(nomer[0]=='\n') num=nomer.slice(1,nomer.length);
else num=nomer;

if(inx==1)mass=gold;
if(inx==2)mass=sberbank;
if(inx==3)mass=nolable;



if(mass!=undefined)
	{
	for(var i=0;i<mass.length;i++)
		{
			
			//a=(mass[i]*1)+"";
			//b=(num*1)+"";
			a=mass[i];
			b=num;
			console.log(b+" ? "+a+"  =  "+b.indexOf(a));
		if(num.indexOf(a)==0) march=1;
		//if(num==mass[i]) march=1;
		}
	}
}
//console.log("march="+march);
return march;
}
var last_buttons_left = 0;
function srok_godnosti(inp,year,mon)
{
/*
buf=year.slice(1,3);
year=buf;*/
var metka=0;
if(inp!=undefined && inp!=null && inp.length>=4)
	{

	cardyer=inp.slice(0,2);
	cardmon=inp.slice(2,4);


	if(cardyer>year) metka=1;
	else
		 if(cardyer==year)
			if(cardmon>mon) metka=1;
	}
return metka;

}

function bumaga_is_lost(talonov,message_bumaga)
{
console.log("Осталось талонов: ",talonov);
if(talonov*1<=0)
	{
	document.getElementById("usertextbad").innerHTML=message_bumaga;
	document.getElementById("bad").style.display='block';
	setTimeout("closebadfunc()",3000);
	plusbutton=0;
	if(MarkerRefresh)
		{
		var buf_date = new Date();
		var buf_sec = buf_date.getMinutes()*buf_date.getSeconds();
		var Rhttp_url="ping.qsp2?sec="+buf_sec;
		setTimeout(function(){
			httpRequest(Rhttp_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000)		
			}, 4000);
		}
	}
}
function find_pos_id(pos,smsuo_id)
{
var len1 = pos.length;
console.log('Порядок отображения (из СМСУО)\t\t\t',pos);
for(var i = 0;i<len1;i++)
	{
	var len2 = smsuo_id.length;
	var marker=0;
	for(var j = 0;j<len2;j++)
		{
		if(pos[i]==smsuo_id[j]) marker=1;
		}
	if(marker==0) pos[i]=0;
	}
console.log('Порядок отображения (чистка)\t\t\t',pos);
return pos;
}
function find_smsuo_id(smsuo_id,id)
{
var len = smsuo_id.length-1;
for(var i = 0;i<len;i++)
	{
	if(smsuo_id[i]==id) return i+1;
	}
return 0;
}

var ymarker=0;
function load_buttons(marker,result)
{

if(marker!=true)
	{
	
	update("includes/get.qsp2","buttons");
	}
else
	{
	if(result.split('||<p>||').length<2)
		{
		console.log("Y detected!");
		setTimeout("load_buttons();",1000*ymarker+50);
		if(ymarker<10)
			ymarker++;
		return;
		}
	ymarker=0;

	var smsuo_id = result.split('||<p>||')[1].split('*<br>*');
	result = result.split('||<p>||')[0].split('*<br>*');
	var pos = new Array();
	var buf_pos = new Array();
	for(var i=1;i<result.length&&i<=15&&i>0;i++)
		{
		var spl = result[i-1].split('*|*');
		buf_pos[i-1] = spl[2]*1;
		
		}
	buf_pos = find_pos_id(buf_pos,smsuo_id);
	for(var i=1;i<result.length&&i<=15&&i>0;i++)
		{
	
		var find_id = find_smsuo_id(smsuo_id,buf_pos[i-1]);
		if(find_id>0)
			pos[find_id-1] = i;
		}
	for(var i=1;i<result.length&&i<=15&&i>0;i++)
		{
		if(pos[i-1]==undefined || pos[i-1]==null)
			pos[i-1]=0;
		
		}
	
pos[15] = 0;

	console.log("Порядок отображения (преобразованный)\t",pos);
	pos = but_sort(pos)
	glob_pos = pos;
	console.log("Порядок отображения (заполненый)\t\t",pos);
	start_style();
	/*for(var i=0;i<15;i++)
		{
		console.log(i,result[i]);
		}*/
		
	result = resort(result,pos);
	
	for(var i=1;i<result.length&&i<=15&&i>0;i++)
		{
		//console.log(i-1,result[i-1]);
		result[i-1] = result[i-1].split('*|*');
		
		el = document.getElementById('div_'+i);
		el2 = document.getElementById('div_'+(i+1));
		el3 = document.getElementById('div_'+(i-1));
		if(result[i-1][1]=="")
				{
				console.warn("Внимание! В коде кнопки #"+i+"("+result[i-1][3]+") ничего нет! Выключаем кнопку!");  //ВНИМАНИЕ!!
				result[i-1][0]=1;
				}
		if(result[i-1][0]*1==0)
			{
			
			if(el==null)
				console.error('div_'+i+' = '+el);
			el.style.display = "block";
			el.style.backgroundImage = "url('images/options/id"+i+".png')";
			result[i-1][1]='<div class="wrap"><div class="hover"></div>' + result[i-1][1] + '</div>';
			/*if(result[i-1][1].search('hover')==-1)
				{
				console.warn("Внимание! В коде кнопки #"+i+" не найден div класса hover! Добавляем hover!");	//ВНИМАНИЕ!!
				result[i-1][1]="<div class=\"hover\"></div>"+result[i-1][1];
				}*/
			/*if(result[i-1][1].search('option_')!=-1)
				{
				console.warn("Внимание! В коде кнопки #"+i+" найден старый класс option_! Заменяем класс!");	//ВНИМАНИЕ!!		
				result[i-1][1]=result[i-1][1].replace(/option_/g,'');
				}*/
	
			el.innerHTML = result[i-1][1];
			el.onmouseup = new Function("click_menu("+result[i-1][3]+",this)");
			//Антон
			/*if((i==3 && result[i-2][0]*1==1) || (i==8 && result[i-2][0]*1==1) || (i==10 && result[i-2][0]*1==1))
				{
				result[i-1][0]="1";
				el.innerHTML = "";
				el.style.backgroundImage = "none";
				el.onmouseup=null;
				}*/
			}
		else
			{
			//Антон
			/*if(i==3 || i==8 || i==10)
				{
				
				el3.innerHTML = "";
				el3.style.backgroundImage = "none";
				el3.onmouseup=null;
				}
			if(i<=12)
				{
				el.innerHTML = "";
				el.style.backgroundImage = "none";
				el.onmouseup=null;
				}
			else
				{
*/
				el.style.display="none";
				//Антон (ниже фигурная скобка)
				//}
			}		
		}
	if(buttons_absolute)
		{
		if(result[9][0]*1==0)
			{
			if((result[12][0]*1==1) && (result[13][0]*1==0) && (result[14][0]*1==0)) 
				{
				document.getElementById('div_14').style.left = buttons_left[0]+"px";
				document.getElementById('div_15').style.left = buttons_left[1]+"px";
				}
			if((result[12][0]*1==1) && (result[13][0]*1==0) && (result[14][0]*1==1)) 
				{
				document.getElementById('div_14').style.left = buttons_left[0]+"px";
				}
			if((result[12][0]*1==0) && (result[13][0]*1==1) && (result[14][0]*1==0)) 
				{
				document.getElementById('div_15').style.left = buttons_left[1]+"px";
				}
			
			}
		else
			{
			if(document && document!=null && document.defaultView && document.defaultView!=null)
			{
			if((result[12][0]*1==0) && (result[13][0]*1==0) && (result[14][0]*1==1)) 
				{
				document.getElementById('div_14').style.top = document.defaultView.getComputedStyle(document.getElementById('div_9'), '').getPropertyValue("top");
				document.getElementById('div_14').style.left = buttons_left[0]+"px";
				}
			if((result[12][0]*1==0) && (result[13][0]*1==0) && (result[14][0]*1==0)) 
				{
				document.getElementById('div_15').style.top = document.defaultView.getComputedStyle(document.getElementById('div_9'), '').getPropertyValue("top");
				document.getElementById('div_15').style.left = buttons_left[0]+"px";
				document.getElementById('div_14').style.top = document.defaultView.getComputedStyle(document.getElementById('div_9'), '').getPropertyValue("top");
				document.getElementById('div_14').style.left = buttons_left[1]+"px";
				}
			if((result[12][0]*1==0) && (result[13][0]*1==1) && (result[14][0]*1==0)) 
				{
				document.getElementById('div_15').style.top = document.defaultView.getComputedStyle(document.getElementById('div_9'), '').getPropertyValue("top");
				document.getElementById('div_15').style.left = buttons_left[0]+"px";
				}
			if((result[12][0]*1==0) && (result[13][0]*1==1) && (result[14][0]*1==1)) 
				{
				document.getElementById('div_13').style.top = document.defaultView.getComputedStyle(document.getElementById('div_9'), '').getPropertyValue("top");
				document.getElementById('div_13').style.left = buttons_left[0]+"px";
				}
			}
			else
				{
				console.log("Проблема с dafaultView!");
				startsession();
				}
			}
		}
	httpRequest("eject.qsp2?printer="+p, function(req) {  }, function(req) {  }, null, 3000);
	}
}
//----END of CARD functons
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

setTimeout("httpRequest(\"/login/ping.txt\", function(req) {requestsession(req.responseText) }, function(req) {requestsession('')}, null, 3000)",3000);
	
	}
}
function startRequestRefresh(res)
{

if(res)
	res=res.split('|');
if(res && res[0]=="good")
	{
	var qqq=1
	DoRefresh();
	}
else
	{
console.warn('Проверяем, есть ли связь с сервером');
setTimeout("httpRequest(\"/login/ping.txt\", function(req) {startrequestsession(req.responseText); }, function(req) {startrequestsession('');}, null, 3000)",3000);
}
}
function startrequestsession(res)
{

if(res=="good")
	{
	console.warn('Связь есть! Открываем сессию');
	setTimeout(function(){
				http_url6="/login/login.action?username=Administrator&page=/touchscreens/super/ping.qsp2";	
				httpRequest(http_url6, function(req) {DoRefresh()}, function(req) {waitreload()}, null, 3000)				
				}, 3000);

	}
else
	{
	console.warn('Связи НЕТ');
	setTimeout(function(){
				startRequestRefresh('')		
				}, 20000);
	
	}
}
function refreshf(a)
{
setTimeout(function(){
				MarkerRefresh = true;
				console.info('Маркер перезагрузки страницы установлен');
				}, 600000);
}
function requestsession(res)
{
console.log("Связь с сервером!",res);
if(res=="good")
	{
	setTimeout(function(){
	http_url5="/login/login.action?username=Administrator&page=/touchscreens/super/ping.qsp2";
	httpRequest(http_url5, function(req) {DoRefresh();}, function(req) {refreshf(0)}, null, 3000);
	}, 30000);
	}
else
	{
	//setTimeout("GoHome()",3000);
	refreshf(0);
	}
}

function first_requestsession(res)
{
console.log("Связь с сервером!",res);
if(res=="good")
	{
	setTimeout(function(){
	
	http_url5="/login/login.action?username=Administrator&page=/touchscreens/super/ping.qsp2";
	httpRequest(http_url5, function(req) {setTimeout(function(){DoRefresh();},3000);}, function(req) {first_waitreload()}, null, 5000);
	}, 3000);
	}
else
	{
	//setTimeout("GoHome()",3000);
	//refreshf(0);
	first_waitreload();
	}
}