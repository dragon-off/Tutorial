	function setCookie(c_name, value, expiredays){
				var exdate = new Date();
				exdate.setDate(exdate.getDate() + expiredays);
				document.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toUTCString());
			}
			function getCookie(name){
				var cookie = " " + document.cookie;
				var search = " " + name + "=";
				var setStr = null;
				var offset = 0;
				var end = 0;
				if (cookie.length > 0) {
					offset = cookie.indexOf(search);
					if (offset != -1) {
						offset += search.length;
						end = cookie.indexOf(";", offset)
						if (end == -1) {
							end = cookie.length;
						}
						setStr = unescape(cookie.substring(offset, end));
					}
				}
				return(setStr);
			}
			
	function DoScript(href)
{
 var PrintedDiv;
 PrintedDiv = document.getElementById("DopElement");
 PrintedDiv.innerHTML = '';
 AddHTMLAjax(PrintedDiv,href);

}
			function change_kletka(adres,value) {
		
					counter=adres.substring(4,adres.length);
					counter=counter.split('-');		// 0 - counter
													// 1 - button
					len=eval('operation_'+counter[0]);
					counter[1]=counter[1]*1;
					eval("operation_"+counter[0]+"= len.substring(0,(counter[1]-1))+value+len.substring(counter[1],len.length);");
					len=eval('operation_'+counter[0]);
					kletka(adres,value);
				
			}
			//отображение содержимого клетки
			function kletka(adres,value) {
					
					var str="";
					if(value==0) {
						str+="<IMG SRC=no.png border=0 onclick=change_kletka('"+adres+"',1)>"
					} else {
						str+="<IMG SRC=yes.png border=0 onclick=change_kletka('"+adres+"',0)>";
						
						};
					//	alert(adres);
						document.getElementById(adres).innerHTML=str;
				return str;
			}
			
			
			function save_prior() {
				i=0;
				var array="";
				var value="";
			
				while (i< show_button.length) {
				len=eval('operation_'+show_button[i])
				//while (i<2) {
					len=eval('operation_'+show_button[i]);
					value+=""+len+"|";
					array+=""+(1100+show_button[i]*1)+"|";	
					i++;
				};
				array+="@"
				value+="@"	
				rawsend('/ca/!setarray.qsp2?array="'+array+'"&value="'+value+'"&step=10');
				return;
			}
	function load_prior() {
		i=0;
		
		while (i <show_button.length) {
			len=eval('operation_'+show_button[i])
			for (var j = 0; j < show_login.length; j++) {
				kletka("win_"+show_button[i]+"-"+show_login[j],len.charAt(show_login[j]-1));
			}
			i += 1;
		} ;
	
		return;
	}
