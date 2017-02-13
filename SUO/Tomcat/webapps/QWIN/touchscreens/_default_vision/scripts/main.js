// ---------------------------------------------------------------------
//
// Q-MATIC Javascript to be used with TP3115/TP3155 printers.
//
// Do not modify this file!
// To edit a specific setting or string, modify the file settings.js
//
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// User defined stylesheet, strings and settings
// Do NOT edit these values in this file
// Modify the file settings.js if you want to change a value
// ---------------------------------------------------------------------

if(css === undefined)                    var css                    = 'style-qmatic';

if(strUnknownError === undefined)        var strUnknownError        = 'Unknown error';
if(strInternalServerError === undefined) var strInternalServerError = 'Internal server error';
if(strPageNotFound === undefined)        var strPageNotFound        = 'Page not found';
if(strConnectionTimeout === undefined)   var strConnectionTimeout   = 'Connection timeout';
if(strPleaseWait === undefined)          var strPleaseWait          = 'Please wait...';
if(strTimeout === undefined)             var strTimeout             = 'Timeout';
if(strTakeTicket === undefined)          var strTakeTicket          = 'Please take your ticket';
if(strScreenSaverActive === undefined)   var strScreenSaverActive   = 'System is currently disabled.';
if(strServerDown === undefined)          var strServerDown          = 'System is currently disabled.';

if(timeShowTicketSplash === undefined)   var timeShowTicketSplash   = 2;

if(buttonUpOpacity === undefined)        var buttonUpOpacity        = 100;
if(buttonDownOpacity === undefined)      var buttonDownOpacity      = 25;

// ---------------------------------------------------------------------
// Common settings
// Do NOT modify these values!
// ---------------------------------------------------------------------

// how long should "error" splash be visible (seconds)
var timeShowErrorSplash = 4;

// Flag to indicate if screensaver is activated or not
// to avoid loading the custom stylesheet with background image
if(screenSaverActive === undefined) var screenSaverActive = 0;

var updating = false;

// ---------------------------------------------------------------------
// Functions
// ---------------------------------------------------------------------

function loadStylesheet() {
	document.write('<link rel="stylesheet" type="text/css" href="css/'+css+'.css">');
}

function pageLoaded() {
	var w = window.innerWidth;
	var h = window.innerHeight;
	var buttonWidth = 453;
	var buttonHeight = 206;
	var space = (w-(buttonWidth*2))/3; // space between the 2 buttons, and between buttons and margin
	
	if(bg = document.getElementById('mainbackground')) {
		bg.innerHTML = '<img src="images/background.png" width="'+w+'" height="'+h+'"></img>';
	}

	if(lbut = document.getElementById('buttonLeft')) {
		//lbut.style.left = (w-(buttonWidth*2))/3;
		lbut.style.left = space;
		lbut.style.top = (h/2) - (buttonHeight/2);
	}
	
	if(rbut = document.getElementById('buttonRight')) {
		rbut.style.left = w-space-buttonWidth;
		rbut.style.top = (h/2) - (buttonHeight/2);
	}

	if(buttonCenter = document.getElementById('buttonCenter')) {
		buttonCenter.style.left = (w/2) - (buttonWidth/2);
		buttonCenter.style.top = (h/2) - (buttonHeight/2);
	}

	if(flag = document.getElementById('flag')) {
		flag.style.width = 300;
		flag.style.left = w-space-parseInt(flag.style.width,10);
	}
	
	if(header1 = document.getElementById('h1')) {
		header1.style.left = space;
	}
	if(header2 = document.getElementById('h2')) {
		header2.style.left = space;
	}
	
	
}

function setopacity(obj, percent) {
   obj.style.opacity = percent/100;
}

function dimObject(obj) {
	setopacity(obj, buttonDownOpacity);
}

function getInt(arg) {
  var n=parseInt(arg);
  if(isNaN(n)) return 0; else return n;
}

// -------------------------------------------------------------------
// Start page
// -------------------------------------------------------------------

var redirectToStartPage_timer;
redirectToStartPage = new Object();
redirectToStartPage.start = function(timeoutSeconds) {
	if(timeoutSeconds === undefined) var timeoutSeconds = timeShowTicketSplash;
	clearTimeout(redirectToStartPage_timer);
	redirectToStartPage_timer = setTimeout( "redirectToStartPage.go();", timeoutSeconds*1000);
}
redirectToStartPage.go = function() {
	clearTimeout(redirectToStartPage_timer);
	loadPage('index.qsp');
}


// ---------------------------------------------------------------------
// print job
// ---------------------------------------------------------------------

printJob = new Object();

printJob.Start= function(obj,btn) {
   if(!printJob.done)
      return false;
   setopacity(obj, buttonDownOpacity);
   this.done = false;
   this.obj = obj;
   this.status = 0;
   var xmlHttp = GetXmlHttpObject();
   xmlHttp.onreadystatechange = function() {
      if(xmlHttp.readyState == 4) {
         try {
	         	if(xmlHttp.status !== undefined && xmlHttp.status != 0){
	         		httpStatus = xmlHttp.status;
	         	} else {
	         		httpStatus = 13030;
	         	}
         } catch(e) {
	        	// 13030 is the custom code to indicate the condition -- in Mozilla/FF --
	        	// when the o object's status and statusText properties are
	        	// unavailable, and a query attempt throws an exception.
        		httpStatus = 13030;
         }
         try {
           printJob.status = httpStatus;
           printJob.responseText = xmlHttp.responseText;
         } catch(e) {
           splash.show(strUnknownError);
           setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
           return;
         }
         switch( httpStatus ) {
           case 200:
             //splash.show(strTakeTicket);
             //setTimeout('printJob.Stop();', timeShowTicketSplash * 1000);
             loadPage(printJob.page);
             break;
           case 500:
             splash.show(strInternalServerError);
             setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
             break;
           case 404:
             splash.show(strPageNotFound);
             setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
             break;
           case 0: // on connection timeout Opera ends up here
             splash.show(strConnectionTimeout);
             setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
             break;
           case 13030: // on connection timeout Opera ends up here
             break;
           default:
             splash.show(strUnknownError);
             setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
             break;
         }
      }
   }
   this.timer = setTimeout('printJob.Timedout();', 15*1000);
   xmlHttp.open('GET','print.qsp?button='+btn,true);
   xmlHttp.send(null);
   return true;
}

printJob.Timedout = function() {
   // on connection timeout Firefox ends up here
   splash.show(strTimeout);
   setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
}

printJob.Stop = function() {
   clearTimeout(this.timer);

   switch( this.status ) {
     case 200: break;      // All OK -> do nothing

     case 404:   // The webserver should return a valid HTML body with fault handling for these two.
     case 500:   // If not, uncomment these lines so the default trap will be used.
       if( this.responseText ) {
         document.open();
         document.write(this.responseText);
         document.close();
       }
       else                // Bug in Opera/lighttpd??
         window.home();    // xmlHttp returns empty responseText when status is 500
       break;
    
     case 0:  // Connection problems
     default:
       window.home();
   }

   setopacity(this.obj, buttonUpOpacity);
   splash.hide();
   this.done = true;
}

printJob.done = true;
printJob.page = '';

function printTicket(obj, btn, page) {
	printJob.page = page;
	if(!printJob.Start(obj, btn))
		return false;
	return true;
}

// ---------------------------------------------------------------------
// load new page
// ---------------------------------------------------------------------

function loadPage(page) {
	if(page.length > 0)
		document.location.href = page;
}

// ---------------------------------------------------------------------
// splash screen
// ---------------------------------------------------------------------

splash = new Object();
splash.show = function(txt) {
   this.getEl();
   this.el.style.visibility = 'visible';
   document.getElementById('splashText').innerHTML = txt;
}
splash.hide = function() {
   this.getEl();
   this.el.style.visibility = 'hidden';
}
splash.getEl = function() {
   if(!this.el) this.el = document.getElementById('splash');
}
splash.el = false;

// ---------------------------------------------------------------------
// error splash screen
// ---------------------------------------------------------------------

splashError = new Object();
splashError.show = function(txt) {
   this.getEl();
   this.el.style.visibility = 'visible';
   document.getElementById('splashErrorText').innerHTML = txt;
}
splashError.hide = function() {
   this.getEl();
   this.el.style.visibility = 'hidden';
}
splashError.getEl = function() {
   if(!this.el) this.el = document.getElementById('splashError');
}
splashError.el = false;

// ---------------------------------------------------------------------

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

function removeNL(s) { 
  return s.replace(/[\n\r\t]/g,''); 
}

// ---------------------------------------------------------------------

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
          //alert("ok resp:"+req.responseText+" cb:"+cb);
          if(cb!=null) cb(req.responseText);	
        } else if (req.readyState == 4  && req.status != 200) {                     
          //alert("Error: status:" + req.status+" url:"+url+" resp:"+req.responseText);
      }
    }
  }
  req.open("get",  url, true);
  req.send(null);
}
function update() {
	parseQwinInfo = function(resp) {
		var respArray = resp.split('\n');
		var qWaitingTime = 0;
		var qWaitingCustomers = 0;
		
		qWaitingCustomers = getInt(respArray[0]);
		qWaitingTime = respArray[1];

		var div1c = document.getElementById("d1c");
		if(lang == "en") {
			div1c.innerHTML = strNoOfWaiting_en + ": "+qWaitingCustomers;
		} else if(lang == "se") {
			div1c.innerHTML = strNoOfWaiting_se + ": "+qWaitingCustomers;
		}
		updating = false;
	}
	getStandardInfo = function() {
	  var url = 'getqwininfo.qsp';
	  return rawsend(url,parseQwinInfo);
	}
	if(!updating) {
		updating = true;
		getStandardInfo();
	}
}

// ---------------------------------------------------------------------

qwin_event.watchdogTrig = function() {
	// this function is run for every watchdog trig,
	// every 60 seconds as default.
}
qwin_event.watchdogServerDown = function() {
	// this function is run once when watchdog trig is gone (server is down)

	// hide buttons on touch screen
	var el = document.getElementById('main');
	el.style.visibility = 'hidden';

	// popup 'server down' message
	splashError.show(strServerDown);
	
}
qwin_event.watchdogServerUp = function() {
	// this function is run once when server is up

	// make buttons visible
	var el = document.getElementById('main');
	el.style.visibility = 'visible';
	
	// hide 'server down' message
	splashError.hide();
	
}

qwin_event.trig = function(eventType, unit, payload) {
	// this function is run when event is received
	var EVENT_TYPE_NEXT = 5;
	var EVENT_TYPE_CLOSE = 6;
	var EVENT_TYPE_TICKET = 8;
	var EVENT_TYPE_OPEN = 16;
  switch( parseInt(eventType)) {
    case EVENT_TYPE_NEXT:
    	update();
    	break;
    case EVENT_TYPE_CLOSE:
    	break;
    case EVENT_TYPE_TICKET:
    	update();
    	break;
    case EVENT_TYPE_OPEN:
    	break;
    default:
    	break;
  }
}

qwin_event.setEvents = function() {
	// set which events we should listen to
	// this function needs to be called manually to set up which events to listen to
	// this function is also called once when server is up
	qwin_event.waitForEventTrig("5.6.8.16");
}

// the following call should be put at the end of the page/javascript
qwin_event.setEvents();

// ---------------------------------------------------------------------

if(screenSaverActive == 0) {
	loadStylesheet();
}

// ---------------------------------------------------------------------
