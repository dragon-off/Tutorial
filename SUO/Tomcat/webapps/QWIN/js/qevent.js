document.write("<script type='text/javascript' src='/dwr/engine.js'></script>"); 
document.write("<script type='text/javascript' src='/dwr/interface/QWinEventClient.js'> </script>"); 
document.write("<script type='text/javascript' src='/dwr/util.js'> </script>"); 

var qwin_event = {

   watchdogTimer: false,
   watchdogTimer_interval: 60 * 1000,
   serverCheckTimer: false,
   serverCheckTimer_interval: 30 * 1000,
   serverCheckStatus: 1,

   waitForEventTrig: function(ev_trig) {
      dwr.engine.setActiveReverseAjax(true); 
      QWinEventClient.waitForEventTrig(ev_trig);
   },

   cancel: function() {
      QWinEventClient.cancel();
   },
   
   // Called by server periodically at watchdog_interval seconds interval.
   // watchdog_interval is default 60 seconds
   // This value may be changed in file /Tomcat/webapps/QWIN/WEB-INF/web.xml
   watchdog: function(watchdog_interval) {
      this.watchdogTimer_interval = watchdog_interval * 1000;
      this.watchdogTimer_restart();
      this.serverCheckStatus = 1;
      if(this.watchdogTrig !== undefined) {
      	this.watchdogTrig();
      }
   },
   watchdogTimer_restart: function() {
   	  clearTimeout(this.watchdogTimer);
      this.watchdogTimer = setTimeout(function() { qwin_event.watchdogTimer_trig(); }, this.watchdogTimer_interval + 5000);
   },
   watchdogTimer_trig: function() {
      this.serverCheckStatus = 0;
      dwr.engine.setActiveReverseAjax(false);
      if(this.watchdogServerDown !== undefined) {
      	this.watchdogServerDown();
      }
   },
   
   serverCheckTimer_restart: function() {
      clearTimeout(this.serverCheckTimer);
      qwin_event.serverCheckTimer_trig();
      this.serverCheckTimer = setTimeout(function() { qwin_event.serverCheckTimer_restart(); }, this.serverCheckTimer_interval);
   },
   serverCheckTimer_trig: function() {
      if(this.serverCheckStatus == 0) {
			  var req;
			  if(navigator.appName == "Microsoft Internet Explorer") {
			      req = new ActiveXObject("Microsoft.XMLHTTP");
			  } else {
			      req = new XMLHttpRequest();
			  }
			  req.onreadystatechange = function () {  
			  	  try {
				      if(req.readyState == 4) {        
				        if( req.status == 200) {
				          qwin_event.serverCheckStatus = 1;
				          if(qwin_event.setEvents !== undefined) {
				             qwin_event.setEvents();
				          }
				          if(qwin_event.watchdogServerUp !== undefined) {
				             qwin_event.watchdogServerUp();
				          }
                                          dwr.engine.setActiveReverseAjax(true);

				        }
				      }
				    } catch(e) {
				    	return false;
				    }
			  }
			  req.open("get", "/", true);
			  req.send(null);
      }
   }

};

qwin_event.watchdogTimer_restart();
qwin_event.serverCheckTimer_restart();
