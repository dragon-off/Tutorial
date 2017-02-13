// ---------------------------------------------------------------------
//
// Q-MATIC Javascript to enable screensaver for TP3115/TP3155 printers.
//
// Do not modify this file!
// To edit a specific setting or string, add and/or modify the 
// parameter in the file settings.js
//
// To include this file, edit index.qsp and add the following line
// AFTER the line where main.js is included:
//
// <script type="text/javascript" src="scripts/screensaver.js"></script>
//
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// User defined settings
// Do NOT edit these values in this file
// Modify the file settings.js if you want to change a value
// ---------------------------------------------------------------------

// use screensaver or not, controlled by specified Q-WIN SCHEDULE
// set to 0 to disable screensaver
// Important note:
// Selected SCHEDULE must be available in the system before enabling
// it here, otherwise there will be an error message on the printer.
if(useScreenSaverSchedule === undefined) var useScreenSaverSchedule = 0;

// ---------------------------------------------------------------------
// Common settings
// Do NOT modify these values!
// ---------------------------------------------------------------------

// how often should system schedule be checked for screensaver (seconds)
// Do not change this value!
// If this value is set too low, it will increase the load on Q-WIN.
var timeScheduleCheck = 60;

// ---------------------------------------------------------------------
// screensaver
// ---------------------------------------------------------------------

screenSaver = new Object();
screenSaver.check = function() {
  var xmlHttp = GetXmlHttpObject();
  this.status= 0;
  xmlHttp.onreadystatechange = function() {
    if(xmlHttp.readyState == 4) {
      try {
        screenSaver.status = xmlHttp.status;
        screenSaver.responseText = xmlHttp.responseText;
      } catch(e) {
        splash.show(strUnknownError);
        setTimeout( "splash.hide();", timeShowErrorSplash * 1000);
        return;
      }
      switch( xmlHttp.status ) {
        case 200:
          if(removeNL(xmlHttp.responseText) == 'OFF') {
            document.location.href = 'screensaver.qsp?check=0&schedule=' + useScreenSaverSchedule + '&timer=' + timeScheduleCheck;
          }
          break;
        case 500:
          splash.show(strInternalServerError);
          setTimeout( "splash.hide();", timeShowErrorSplash * 1000);
          break;
        case 404:
          splash.show(strPageNotFound);
          setTimeout( "splash.hide();", timeShowErrorSplash * 1000);
          break;
        case 0: // on connection timeout Opera ends up here
          splash.show(strConnectionTimeout);
          setTimeout( "splash.hide();", timeShowErrorSplash * 1000);
          break;
        default:
          splash.show(strUnknownError);
          setTimeout( "splash.hide();", timeShowErrorSplash * 1000);
          break;
      }
    }
  }
  xmlHttp.open('GET','screensaver.qsp?check=1&schedule=' + useScreenSaverSchedule,true);
  xmlHttp.send(null);
	setTimeout( 'screenSaver.check();', timeScheduleCheck * 1000);
}

screenSaver.showSplash = function() {
	splash.show(strScreenSaverActive);
	this.timer= setTimeout( "screenSaver.hideSplash();", timeShowErrorSplash * 1000);
}
screenSaver.hideSplash = function() {
	clearTimeout(this.timer);
	splash.hide();
}

if(screenSaverActive == 0) {
  setTimeout( 'screenSaver.check();', 5000);
}

// ---------------------------------------------------------------------
