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