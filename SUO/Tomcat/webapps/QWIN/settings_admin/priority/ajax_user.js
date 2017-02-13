// *****************************************************************************
//  // Test
//  httpRequest(
//    "http://example.com/",
//    function(req) {alert("success - " + req.responseText)},
//    function(req) {alert("fail " + req.responseText)},
//    null, 5000);

// *****************************************************************************
function hide_top_msg(val)
{
	if(val==1) {
		document.getElementById('msg_top').style.display='block';
	}else{
		document.getElementById('msg_top').style.display='none';	
	};
}

function createXMLHttpRequest() {
  try { return new XMLHttpRequest(); } catch(e) {}
  try { return new ActiveXObject('Msxml2.XMLHTTP'); } catch (e) {}
  try { return new ActiveXObject('Microsoft.XMLHTTP'); } catch (e) {}
  throw 'XMLHttpRequest not supported';
}
 
var HTTP_TIMEOUT = 10; // default to 20s
 
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

  var req = createXMLHttpRequest();
  var method = postData ? 'POST' : 'GET';
  req.open(method, url, true);
  req.setRequestHeader('User-Agent', 'XMLHTTP/1.0');
  if (postData) {
    req.setRequestHeader('Content-type','application/x-www-form-urlencoded');
  }

  var timer = null;
  if (!timeout) timeout = HTTP_TIMEOUT;
  if (timeout != -1) {
    timer = setTimeout(httpTimeoutClosure(req, onFail), timeout);
  }

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

function update_split(resp)
{
	var line_split;
	line_split = resp.split('#');
	document.getElementById('msg_timeout').style.display='none';
	for (var r=0; r <= line_split.length-1; r++) {
		obj_split = line_split[r].split('^');

					if(obj_split[0]=='lc')
						if(obj_split[1]==0)
							alert("Перезапустите программу");
					if(obj_split[0]=='display' || obj_split[0]=='custitemcard')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='cst')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='vseg')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='oper')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='att')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='takt')
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='es') 
						error_state = obj_split[1]*1;
					if(obj_split[0]=='ctt') 
						counter_transaction_time = obj_split[1]*1;
					if(obj_split[0]=='obsl') 
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
					if(obj_split[0]=='cp') 
						customer_present = obj_split[1]*1;
					if(obj_split[0]=='co') 
						counter_open = obj_split[1]*1; 
					if(obj_split[0]=='ci_ib')
						counter_item_button = obj_split[1]*1;
					if(obj_split[0]=='msg_top') {
						document.getElementById(obj_split[0]).innerHTML = obj_split[1];
						hide_top_msg(1);
					};
					if(obj_split[0]=='blink' & blink_a==0) {
						if(counter_item_button!=(221+ws)) {
							type_avalible(2);
							blink_a=array_500;
							blink_b=0;
							blink();
						};
					};
					
					if(error_state==3)
						type_avalible(3);
	}	
};

function run_qwin(command,value) 
{
	if(command=='call_number') {
		gro=value.substr(0,2);
		value=value.substr(3,4);
		httpRequest('run.qsp?type="'+command+'"&workstation='+ws+'&value='+value*1+'&group='+gro*1, function(req) { update_split(req.responseText) }, function(req) { document.getElementById('msg_timeout').style.display='block';}, null, 3000);
	} else {
		httpRequest('run.qsp?type="'+command+'"&workstation='+ws+'&value='+value, function(req) { update_split(req.responseText) }, function(req) {  document.getElementById('msg_timeout').style.display='block';}, null, 3000);
	};
};

var updateTimer;
updateTimer_reset = function() {
	clearTimeout(updateTimer);
	updateTimer = setTimeout(function() {run_qwin('update',0); },3000);
}
function update() {
	updateTimer_reset();
	setTimeout('update()', 5000);
};

