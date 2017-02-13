var queue = {};

queue.options = null;
queue.timer = null;

function byId(id){
    return document.getElementById(id);
}

function byClass(clName, parent){
	parent = parent || document;
	
	return parent.getElementsByClassName ?  parent.getElementsByClassName(clName) :
	   parent.querySelectorAll ? parent.querySelectorAll('.'+clName) : 
	   (function(){
			var elems = parent.getElementsByTagName('*'), lng = elems.length, result = [];
			for(var i = 0; i < lng; i++) if( elems[i].className == clName ) result.push(elems[i]);
			return result;
	   })();
}

function hoverLoader(){
    var hoverDir = 'images/hover/';

    for(var i = 0; i < queue.options.length; i++){
        if(!queue.options[i]) continue;

        (function(id){
			bufid = id.split('_');
			if(bufid.length>1) id="id"+bufid[1];
            var img = document.createElement('img')
            img.src = hoverDir + id + '.png';
            
        })(queue.options[i].id);
    }
}

function init(){

	var body = byId('body'),
        wrapper = byId('wrapper');

	queue.options = byClass('option');
	
	for(var i = 0; i < queue.options.length; i++){
		queue.options[i].innerHTML = '<div class="wrap"><div class="hover"></div>' + queue.options[i].innerHTML + '</div>';
	}

    if(!byId('div_9') && !byId('div_10')) body.className += ' smart';
    if(!byId('div_13')) wrapper.className += ' n13';
    if(!byId('div_14')) wrapper.className += ' n14';
   
    setTimeout(hoverLoader, 1);
}

function click_menu(id,el){

   var talon = byId('talon'),
      text = byId('taketext');
      document.getElementById('blockDo').style.display = "block";
	  if(id==997)
		{
		setTimeout(function(){
		
		if(red_button>0)
			httpRequest("eject.qsp2?printer="+p, function(req) {  }, function(req) { startsession(req.responseText);document.getElementById('blockDo').style.display = "none"; }, null, 3000);
		red_button=0;
		document.getElementById('blockDo').style.display = "none";
		if(MarkerRefresh)
			{	
			
			var Rhttp_url="ping.qsp2";
			httpRequest(Rhttp_url, function(req) { RequestRefresh(req.responseText) }, function(req) {RequestRefresh('')}, null, 3000);				
			}
		document.getElementById('RedVSP').style.display = "none";
		document.getElementById('div_998').style.top = "877px";
		document.getElementById('div_997').style.top = "877px";
		document.getElementById('vsp_plato').style.display = 'block';
		clearTimeout(timeoutID);

		plusbutton = 0;
		},600); 
		}
	 else
		{
		if(id==998)
			{
			setTimeout(function(){
			printer(p,red_button,0);
			
			red_button=0;
			document.getElementById('RedVSP').style.display = "none";
			document.getElementById('div_998').style.top = "877px";
			document.getElementById('div_997').style.top = "877px";
			document.getElementById('vsp_plato').style.display = 'block';
			clearTimeout(timeoutID);
			},600); 
			plusbutton = 0;
			}
		else
			{
			printer(p,id,1);
			}
		talon.className += ' animate';	
		}
	el.className += ' active';
	
	
	clearTimeout(queue.timer);	
	
	setTimeout(function(){
		el.className = 'option';
	},400);     
}