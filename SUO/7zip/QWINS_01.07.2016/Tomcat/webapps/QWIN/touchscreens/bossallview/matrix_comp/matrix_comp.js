
	var items="";
	var mass_chenge = new Array();
	var mass_chenge_buttons = new Array();
	var mass_chenge_logins = new Array();
	var mass_chenges = new Array();
	var mass_chenge_out ="";
	if (!window.console) console = {log: function() {},info: function() {},error: function() {},warn: function() {}};
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

function what_happened()
{
var len1 = mass_chenge.length;
for(var i=0;i<len1;i++)
	{
	if( mass_chenge[i]!=undefined && mass_chenge[i]!=null)
		{
		var len2 = mass_chenge[i].length;
		var str  = "Пользователю "+mass_chenge_logins[i+1];
		var str1 = " Добавлена возможность обслуживать:";
		var str2 = " Убрана возможность обслуживать:";
		console.log(str1.length,str2.length);
		for(var j=0;j<len2;j++)
			{
			
			if( mass_chenge[i][j]!=undefined && mass_chenge[i][j]!=null)
				{
				if(mass_chenge[i][j]*1==0)
					{
					str2+=""+mass_chenge_buttons[j]+", ";
					
					}
				else
					str1+=""+mass_chenge_buttons[j]+", ";
				}
			}
		var out = str;
		
		if(str1.length > 35)
			{
			str1= str1.substr(0,str1.length-2)+';';
			out+=str1;
			}
		if(str2.length > 32)
			{
			str2= str2.substr(0,str2.length-2)+';';

			out+=str2;
			}
		
		if(out.length > str.length)
			mass_chenge_out+=out+"; ";
			
		}
	}
	if(mass_chenge_out.length>1)
		mass_chenge_out=mass_chenge_out.substr(0,mass_chenge_out.length-2);
	console.log(mass_chenge_out);
}
			
	function DoScript(href)
{
 var PrintedDiv;
 PrintedDiv = document.getElementById("DopElement");
 PrintedDiv.innerHTML = '';
 AddHTMLAjax(PrintedDiv,href);

function change_prior(operation)
			{
				var n = items.split('|');
				if(n.indexOf(operation)==-1)
				{
						items=items+operation+"|";
				}

				alert(n.indexOf(operation)+"   "+items);
				return;
			};
}
			function change_kletka(adres,value) {
		
					counter=adres.substring(4,adres.length);
					counter=counter.split('-');		// 0 - counter
													// 1 - button
					len=eval('operation_'+counter[0]);
					counter[1]=counter[1]*1;
					mass_chenges[counter[0]*1]=1;
					eval("operation_"+counter[0]+"= len.substring(0,(counter[1]-1))+value+len.substring(counter[1],len.length);");
					len=eval('operation_'+counter[0]);
					if(mass_chenge[counter[1]*1-1]==undefined ||mass_chenge[counter[1]*1-1]==null)
						mass_chenge[counter[1]*1-1] = new Array();
					if(mass_chenge[counter[1]*1-1][counter[0]*1-1]==null)
						mass_chenge[counter[1]*1-1][counter[0]*1-1] = value;
					else
						mass_chenge[counter[1]*1-1][counter[0]*1-1] = null;
					//console.log('login:',counter[1],'oper:',counter[0],'state',value,'mass:',mass_chenge[counter[1]*1-1][counter[0]*1-1]);
					//mass_chenge[]
					kletka(adres,value);
				//	alert(counter[1]);
					var operation=counter[1];
							var n = items.split('|');
				if(n.indexOf(operation+"")==-1)
				{
						items=items+operation+"|";
				}

			//	alert(n.indexOf(operation)+"   "+items);
				
			}
			//отображение содержимого клетки
			
			
			
			
			
			function kletka(adres,value) {
					
					var str="";
					if(value==0) {
						str+="<IMG SRC='../images/no.png' border=0 onclick=change_kletka('"+adres+"',1)>"
					} else {
						str+="<IMG SRC='../images/yes.png' border=0 onclick=change_kletka('"+adres+"',0)>";
						
						};
					//	alert(adres);
						document.getElementById(adres).innerHTML=str;
				return str;
			}
			
			
			function save_prior() {
				if(items.length >1) {
					what_happened();
					i=0;
					var array="";
					var value="";
				
					while (i< show_button.length) {
					len=eval('operation_'+show_button[i])
					//while (i<2) {
						if(mass_chenges[show_button[i]]==1) {
						len=eval('operation_'+show_button[i]);
						value+=""+len+"|";
						array+=""+(1100+show_button[i]*1)+"|";	
						};
						i++;
					};
				
					array+="142|@"
					value+="USERNAME|@"	
					rawsend('/ca/setprior.jsp?array="'+array+'"&value="'+value+'"&step=10&items="'+items+'@"');
					//console.log('/ca/setprior.qsp2?array="'+array+'"&value="'+value+'"&step=10&items="'+items+'@"');
					if(mass_chenge_out.length>1)
						{
						DoScript('/lib/1.jsp?TypeId=6&ComIndex=14&Comment=0&action='+encodeURI(mass_chenge_out)); 
						console.log('/lib/1.jsp?TypeId=6&ComIndex=14&Comment=0&action='+encodeURI(mass_chenge_out) );
						}
					mass_chenge_out="";
					for(var i=0;i<mass_chenge.length;i++)
						{
						mass_chenge[i]=null;
						}
					alert('Изменения приняты!');
				} else {
					alert('Изменений нет!');
				};
				items="";
			
				return;
			}
	function load_prior() {
		i=0;
		
		while (i <show_button.length) {
			len=eval('operation_'+show_button[i])
			for (var j = 0; j < show_login.length; j++) {
				kletka("win_"+show_button[i]+"-"+(show_login[j]-1),len.charAt(show_login[j]-2));
			}
			i += 1;
		} ;
	
		return;
	}
