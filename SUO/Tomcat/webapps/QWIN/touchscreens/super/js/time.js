var month = Array("января","февраля","марта","апреля","мая","июня","июля","августа","сентября","октября","ноября","декабря");
	var utcday = Array("понедельник","вторник","среда","четверг","пятница","суббота","воскресенье");
	
function pluszero(a)
{
b="";
if(a<10)
	b="0"+a;
else
	b=a;
return b;
}
function toSeconds(date)
{
var out = 0;
out+= date.getSeconds();
out+= date.getMinutes()*60;
out+= date.getHours()*3600;
return out;
}
var difference = 0;
var metka =0;
function DoSeconds()
{
var now = new Date();

var time = new Date(1,1,1,0,0,toSeconds(now)+difference);
var InputTime = document.getElementById('MyTime');
InputTime.innerHTML = pluszero(time.getHours()) + ":" + pluszero(time.getMinutes()) + ":" + pluszero(time.getSeconds());
time_update_smsuo=pluszero(time.getHours());
setTimeout("DoSeconds()",1000);
}
function ResultTime(str)
{
str = str.split('#');
var sqldate = new Array();
for(var i=0;i<str.length;i++)
	{
	sqldate[i] = str[i]*1;
	}

var sql = new Date(sqldate[2],sqldate[1]-1,sqldate[0],sqldate[3],sqldate[4],sqldate[5]);
var now = new Date();
if(metka==0)
	{
	difference = toSeconds(sql) - toSeconds(now);
	metka=1;
	DoSeconds();
	}
	
var InputDate = document.getElementById('MyDate');
InputDate.innerHTML = sql.getDate()+" "+month[sql.getMonth()]+" "+sql.getFullYear()+" года   ";
}
function UpdateTime()
{
	httpRequest("js/time.jsp", function(req) { ResultTime(req.responseText) }, null, null, 3000);
	setTimeout("UpdateTime()",600000);
	
};