function getVarValueFromURL(url, varName) {
	var query = url.substring(url.indexOf('?') + 1);
	var vars = query.split("&");
	for (var i=0;i<vars.length;i++) {
		var pair = vars[i].split("=");
		if (pair[0] == varName) {
			return pair[1];
		}
	}
	return null;
} ;




		var updating = false;
		function GetXmlHttpObject() {
		   var xmlHttp = null;
		   try {
		      // Firefox, Opera 8.0+, Safari
		      xmlHttp = new XMLHttpRequest();
		   } catch (e) {
		      // Internet Explorer
		      try {
		         xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
		      } catch (e) {
		         xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
		      }
		   }
		   if (xmlHttp.overrideMimeType) {
		      xmlHttp.overrideMimeType('text');
		   }
		   return xmlHttp;
		}
		function createXMLHttpRequest() {
		  if(navigator.appName == "Microsoft Internet Explorer"){
		      req = new ActiveXObject("Microsoft.XMLHTTP");
		  }else{
		      req = new XMLHttpRequest();
		  }
		  return req;  
		}
		function rawsend(url,cb) {
		  var req = createXMLHttpRequest();
		  req.onreadystatechange = function () {                
		      if(req.readyState == 4) {        
		        if( req.status == 200) {
 
		          if(cb!=null) cb(req.responseText);	
		        } else if (req.readyState == 4  && req.status != 200) {                     
		    
		      }
		    }
		  }
		  req.open("get",  url, true);
		  req.send(null);
		}
	
		function getInt(arg) {
		  var n=parseInt(arg);
		  if(isNaN(n)) return 0; else return n;
		}
		function spyflash(a,b)
		{

		el=document.getElementById("spytablo")
		//alert(el.getAttribute("name"));
		if(a==0 && b==1) el.style.display='block';
		if(a>0)
		{
		if(b==1) {el.style.display='block'; b=0;}
		else {el.style.display='none'; b=1;}
		a=a-1;
		setTimeout('spyflash('+a+','+b+')', 500);
		}
		}
		var bufspy='0';
		var timeper=0;
		function stopper()
		{
		if(timeper>0){
			timeper=timeper-1;
			setTimeout('stopper()', 1000);
			}
		}

function press(event,command,value) //обработчик нажатия клавиши Enter (только Enter) на выделенном объекте
{
	if(event.keyCode==13) { //если нажат Enter...
		if (command=="callcustomer") {
			call_customer1();
		}
		else {
			if (command=="perevod_msg") {
				hide_show(perevod_msg);
			}
			else {
				run_qwin(command,value);
				
			}
		}		
	} 
}
function show_div(name)
{

    name.style.display='block';

}

function img_usluga()
{
usluga.border=3;
    setTimeout('img_usluga_no()', 500);

}
function img_usluga_no()
{

usluga.border=0;

    setTimeout('img_usluga()', 500);
}
function alert1()
 {
  if(insert_msg.style.display=='none')
   {
    insert_msg.style.display='block';
    setTimeout('close()', 5000);
   }
  else 
   {
   insert_msg.style.display='none';
   }
 }
 function call_customer1()
 {
 if(butaval==0) {
 if(call_customers.style.display=='none')
 {
    call_customers.style.display='block';
 } else {
 	call_customers.style.display='none';
};
}
 }
 function walk_direct()
 {

    walk_directs.style.display='block';
  
 }
function alert2()
 {
  if(next.style.display=='none')
   {
    next.style.display='block';
   
   }
  else 
   {
   next.style.display='none';
   }
 }

function close()
 {
  insert_msg.style.display='none';
  next.style.display='none';
 }
 
 function flash_light(selobj,num)
 {
 if(selobj.style.color=='#676767')
 {
  	selobj.style.color='#676767';
  } else {
	selobj.style.color='#171717';  	
  }
  setTimeout(flash_light(selobj), 1);
 }
 function flash_light1(selobj)
 {
 if(selobj.style.color=='#676767')
 {
  	selobj.style.color='#676767';
  } else {
	selobj.style.color='#171717';  	
  }
  setTimeout(flash_light(selobj), 1);
 }

function unavalible(type)
{
if(type==0)
	{
	document.getElementById("nextbutton").style.backgroundImage="url(images/pult_new_1b_08.jpg)";
	document.getElementById("nextbutton1").style.cursor="default";
	document.getElementById("recallbutton").style.backgroundImage="url(images/pult_new_1_09.jpg)";
	document.getElementById("recallbutton1").style.cursor="pointer";
	document.getElementById("bufferbutton").style.backgroundImage="url(images/pult_new_1b_10.jpg)";
	document.getElementById("bufferbutton1").style.cursor="default";
	document.getElementById("nubercallbutton").style.backgroundImage="url(images/pult_new_1b_11.jpg)";
	document.getElementById("nubercallbutton1").style.cursor="default";
	document.getElementById("walkbutton").style.backgroundImage="url(images/pult_new_1b_12.jpg)";
	document.getElementById("walkbutton1").style.cursor="default";
	document.getElementById("hide_showbutton").style.backgroundImage="url(images/pult_new_1b_13.jpg)";
	document.getElementById("hide_showbutton1").style.cursor="default";
	document.getElementById("endbutton").style.backgroundImage="url(images/pult_new_1b_14.jpg)";
	document.getElementById("endbutton1").style.cursor="default";
	recallb(0);
	butaval=1;
	}
if(type==1){
	document.getElementById("nextbutton").style.backgroundImage="url(images/pult_new_1_08.jpg)";
	document.getElementById("nextbutton1").style.cursor="pointer";
	document.getElementById("recallbutton").style.backgroundImage="url(images/pult_new_1b_09.jpg)";
	document.getElementById("recallbutton1").style.cursor="default";
	document.getElementById("bufferbutton").style.backgroundImage="url(images/pult_new_1_10.jpg)";
	document.getElementById("bufferbutton1").style.cursor="pointer";
	document.getElementById("nubercallbutton").style.backgroundImage="url(images/pult_new_1_11.jpg)";
	document.getElementById("nubercallbutton1").style.cursor="pointer";
	<% IF(ARRAY(7000+W) GT 0) BEGIN 
	"document.getElementById('walkbutton').style.backgroundImage='url(images/pult_new_1_12.jpg)';"
	"document.getElementById('walkbutton1').style.cursor='pointer';" 
	END ELSE BEGIN
	"document.getElementById('walkbutton').style.backgroundImage='url(images/pult_new_1b_12.jpg)';"
	"document.getElementById('walkbutton1').style.cursor='default';" 
	END
	%>
	document.getElementById("hide_showbutton").style.backgroundImage="url(images/pult_new_1_13.jpg)";
	document.getElementById("hide_showbutton1").style.cursor="pointer";
	document.getElementById("endbutton").style.backgroundImage="url(images/pult_new_1_14.jpg)";
	document.getElementById("endbutton1").style.cursor="pointer";
	butaval=0;
	}
if(type==2){
	document.getElementById("nextbutton").style.backgroundImage="url(images/pult_new_1b_08.jpg)";
	document.getElementById("nextbutton1").style.cursor="default";
	document.getElementById("recallbutton").style.backgroundImage="url(images/pult_new_1b_09.jpg)";
	document.getElementById("recallbutton1").style.cursor="default";
	document.getElementById("bufferbutton").style.backgroundImage="url(images/pult_new_1b_10.jpg)";
	document.getElementById("bufferbutton1").style.cursor="default";
	document.getElementById("nubercallbutton").style.backgroundImage="url(images/pult_new_1b_11.jpg)";
	document.getElementById("nubercallbutton1").style.cursor="default";
	document.getElementById("walkbutton").style.backgroundImage="url(images/pult_new_1b_12.jpg)";
	document.getElementById("walkbutton1").style.cursor="default";
	document.getElementById("hide_showbutton").style.backgroundImage="url(images/pult_new_1b_13.jpg)";
	document.getElementById("hide_showbutton1").style.cursor="default";
	butaval=2;
	}
if(type==3){
	document.getElementById("nextbutton").style.backgroundImage="url(images/pult_new_1_08.jpg)";
	document.getElementById("nextbutton1").style.cursor="pointer";
	document.getElementById("recallbutton").style.backgroundImage="url(images/pult_new_1b_09.jpg)";
	document.getElementById("recallbutton1").style.cursor="default";
	document.getElementById("bufferbutton").style.backgroundImage="url(images/pult_new_1b_10.jpg)";
	document.getElementById("bufferbutton1").style.cursor="default";
	document.getElementById("nubercallbutton").style.backgroundImage="url(images/pult_new_1_11.jpg)";
	document.getElementById("nubercallbutton1").style.cursor="pointer";
	document.getElementById("walkbutton").style.backgroundImage="url(images/pult_new_1b_12.jpg)";
	document.getElementById("walkbutton1").style.cursor="default";
	document.getElementById("hide_showbutton").style.backgroundImage="url(images/pult_new_1b_13.jpg)";
	document.getElementById("hide_showbutton1").style.cursor="default";
	butaval=0;
	}
}

var bufspy='0';

function perer()
{

if(butaval==0 &&  timeper==0)
	{ 
	run_qwin('pereriv',butaval);
	unavalible(2);
	}
else if(butaval==2 &&  timeper==0)
	{ 
	run_qwin('pereriv',butaval);
	unavalible(0);
	}
	timeper=3;
	stopper();
}
function run_qwin(command,value) {
var gro="0";

	if((command!="alert" && butaval==0) || (command=="alert" && butaval!=0) || command=='pereriv' || butaval==3) {
	if(command=="next" && value==0) unavalible(0);
	
	//if( command=='pereriv') {alert(value);}
	if(command=='call_number') {

	gro=value.substr(0,2);
	value=value.substr(3,4);

	}
	
	update('runl.qsp?type=\"'+command+"\"&workstation="+getVarValueFromURL(document.URL ,'workstation')+"&value="+value+"&group="+gro*1);
	if(command!='perevod') pereodrnon();
//if( command=='pereriv') alert('runl.qsp?type=\"'+command+"\"&workstation="+getVarValueFromURL(document.URL ,'workstation')+"&value="+value);	
}
}