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

function setopacity(obj, percent) {
   obj.style.opacity = percent/100;
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
           printJob.status = xmlHttp.status;
           printJob.responseText = xmlHttp.responseText;
         } catch(e) {
           splash.show(strUnknownError);
           setTimeout('printJob.Stop();', timeShowErrorSplash * 1000);
           return;
         }
         switch( xmlHttp.status ) {
           case 200:
             splash.show(strTakeTicket);
             setTimeout('printJob.Stop();', timeShowTicketSplash * 1000);
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

function printTicket(obj, btn) {
   if(!printJob.Start(obj, btn))
      return false;
   return true;
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

function rawsend(url,cb) {
  var req = GetXmlHttpObject();
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
		var el;
		for(var i=1; i < respArray.length; i++) {
			if(el = document.getElementById('buttonWaiting'+i)) {
				el.innerHTML = strNoOfWaiting + ": " + respArray[i-1];
			}
		}

		//var div1c = document.getElementById("d1c");
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
  var EVENT_TYPE_CAT_REMOVE = 2;
  var EVENT_TYPE_CAT_INSERT = 3;
  var EVENT_TYPE_CALL = 4;
	var EVENT_TYPE_NEXT = 5;
	var EVENT_TYPE_CLOSE = 6;
	var EVENT_TYPE_TICKET = 8;
	var EVENT_TYPE_OPEN = 16;
  switch( parseInt(eventType)) {
    case EVENT_TYPE_CAT_REMOVE:
    case EVENT_TYPE_CAT_INSERT:
    case EVENT_TYPE_CALL:
    	update();
    	break;
    default:
    	break;
  }
}


qwin_event.setEvents = function() {
	// set which events we should listen to
	// this function needs to be called manually to set up which events to listen to
	// this function is also called once when server is up
	qwin_event.waitForEventTrig("2.3.4");
}

// the following call should be put at the end of the page/javascript
qwin_event.setEvents();

// ---------------------------------------------------------------------

if(screenSaverActive == 0) {
	loadStylesheet();
}

// ---------------------------------------------------------------------
