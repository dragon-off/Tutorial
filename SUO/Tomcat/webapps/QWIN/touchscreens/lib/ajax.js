﻿var AJAXDebug = false;

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
  if(AJAXDebug==true)
	{
	var dt = new Date();
	console.log("["+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds()+"] "+"AJAX: "+url);
	}
  
  var req = createXMLHttpRequest();
  var method = postData ? 'POST' : 'GET';
  req.open(method, url, true);
 // req.setRequestHeader('User-Agent', 'XMLHTTP/1.0');
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
    if ((req.status != 200 && req.status != 304)) { //|| req.responseText.search("Please wait")!=-1
      if (onFail) onFail(req);
      return;
    }    
    if (onSuccess) onSuccess(req);
  }
}