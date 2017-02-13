// ---------------------------------------------------------------------
// This file must/should be UTF-8 encoded for national characters to
// work correctly.
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// User defined stylesheet
// ---------------------------------------------------------------------

var css = 'style-qmatic';
//var css = 'style-sand';
//var css = 'style-green';
//var css = 'style-blue';
//var css = 'style-silver';

// ---------------------------------------------------------------------
// User defined strings
// ---------------------------------------------------------------------

var strUnknownError        = 'Unknown error';
var strInternalServerError = 'Internal server error /<br>qsp page not found or script error';
var strPageNotFound        = 'Page not found';
var strConnectionTimeout   = 'Connection timeout';
var strPleaseWait          = 'Please wait...';
var strTimeout             = 'Timeout';
var strTakeTicket          = 'Please take your ticket and be seated in the waiting area';
var strScreenSaverActive   = 'No service available';
var strServerDown          = 'System is currently disabled.';
var strNoOfWaiting         = 'Waiting customers';

// ---------------------------------------------------------------------
// User defined settings
// ---------------------------------------------------------------------

// how long should "take ticket" splash be visible (seconds)
var timeShowTicketSplash   = 3;

// use screensaver or not, controlled by specified Q-WIN SCHEDULE
// set to 0 to disable screensaver
// Important note 1:
//   Selected SCHEDULE must be available in the server before enabling
//   it here, otherwise there will be an error message on the printer.
// Important note 2:
//   After editing this value the start page has to be reloaded.
var useScreenSaverSchedule = 0;

// Set opacity for the button images
// 0 = invisible
// 100 = fully visible
var buttonUpOpacity = 100;
var buttonDownOpacity = 25;

// ---------------------------------------------------------------------
