<%@ page contentType="text/html; charset=windows-1251" %>
<html>
<head> 
	<meta http-equiv="X-UA-Compatible" content="IE=11" />
	<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	var type;
	var name;
	if (!window.console)
	console = {
		log : function () {},
		info : function () {},
		error : function () {},
		warn : function () {}

	}; //Если нет консоли то не обращаем внимание...
	
	function parseGetParam(param) //Чтение параметров из URL
	{
		var get_param = 0;
		var url = window.location.search.substring(1).split("&");

		if (url.length > 0) {
			for (var i = 0; i < url.length; i++) {
				var getVar = url[i].split("=");

				if (getVar[0] == param)
					get_param = getVar[1];
			}
		}

		return get_param;
	}
		function checkStart(ws,logincode)
	{
		jQuery.ajax({
		url : '/checkerPult?workstation='+ws+'&name='+name+'&mode=start',
		type : 'GET',
		cache: false,
		success : function (a) {
			console.log(a);
			setTimeout(function(){checkEnd(ws,logincode)}, 1500);
		},
		error : function(a) {
			console.log("err",a);
		}
		});
	}
	
	function checkEnd(ws,logincode)
	{
		jQuery.ajax({
		url : '/checkerPult?workstation='+ws+'&name='+name+'&mode=check',
		type : 'GET',
		cache: false,
		success : function (a) {
			a = a*1;
			console.log(a);
			if(a==0)
			{
				if(type == "queue_operator")
					document.location.href = '/sber/pult.qsp?workstation='+ws+'&logincod='+logincode;
				if(type == "queue_operatorul")
					document.location.href = '/sberUL/pult.qsp?workstation='+ws+'&logincod='+logincode;
				if(type == "queue_shiftadmin")
					document.location.href = '/touchscreens/bossallview/index.qsp2?user=1';
				if(type == "queue_shiftmoderator")
					document.location.href = '/touchscreens/bossallview/index.qsp2?moderator=1';	
			}
			else
			{
				$('.wrapper').hide();
				alert('Пульт уже открыт');
			}
		},
		error : function(a) {
			console.log("err",a);
		}
		});
	}
	$(document).ready(function(){
		var ws = parseGetParam('workstation')*1;
		var logincode = parseGetParam('logincod')*1;
		name = parseGetParam('name');
		console.log(name);
		type = parseGetParam('type');
		checkStart(ws,logincode);
		
	});
	
	</script>
    <style>
	 html,body {margin:0px;padding:0px;overflow:hidden;background-color:#808080;}
	 .wrapper {
		background-color:#808080;
		text-align:center;
		color: #fff;
		font-family: Arial;
	 }
	 .loader {
		width: 100%;
		height: 100%;
		vertical-align:middle;
		font-weight: bold;
	 }
	</style>
</head>
<body>
<table class="wrapper" border=0 cellpadding=0 cellspacing=0 width=100% height=100%>
	<tr>
		<td class="loader">
			<img src="loading.gif"/>
			<p>Загрузка</p>
		</td>
	</tr>
</table>
</body>
</html>
