<script language="JavaScript">
    function createRequestObject() {
        var ro;
        var browser = navigator.appName;
        if(browser == "Microsoft Internet Explorer"){
            ro = new ActiveXObject("Microsoft.XMLHTTP");
        }else{
            ro = new XMLHttpRequest();
        }
        return ro;
    }

    var http = createRequestObject();
    var url = '';

    function sndReq(action) {
        http.open('get', action, true);

        http.onreadystatechange = handleResponse;
        http.send(null);
     }

     function handleResponse() {
        if(http.readyState == 4){
            //We don't do anything since this is just too keep the session alive
            //alert("Current Time: " + http.responseText);


            //frame.innerHtml ="Current Time: " + http.responseText;

        }
     }
     function sessionAlive(){
        sndReq(url);
        setTimeout("sessionAlive()",50000);
     }
     function keepSessionAlive(u){
        url = u;
        sessionAlive();
     }

</script>