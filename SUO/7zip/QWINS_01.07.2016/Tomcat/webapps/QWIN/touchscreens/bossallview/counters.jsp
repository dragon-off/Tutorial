<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page language="java" import="java.util.Iterator,java.io.*,java.sql.*,webwork.action.ActionSupport,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%@ page import="com.qmatic.network.User,java.util.List,webwork.action.ActionContext"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>

<%@ taglib uri="mole" prefix="m" %>


 
<html>
    <head>
        <title>Настройки времени</title>
        <LINK REL="StyleSheet" HREF="style.css" TYPE="text/css">
		<LINK REL="StyleSheet" HREF="style_messages.css" TYPE="text/css">
				<script type="text/javascript" src="/lib/ajax.js"></script>  		
			<script type="text/javascript">

function kletka(n,value,type) {
str="";
	if(type==0) {
	if(value==0) {
		str="<IMG onclick=change_status("+n+",1,"+type+") SRC=yes.png border=0>";
	} else {
		str="<IMG onclick=change_status("+n+",0,"+type+") SRC=no.png border=0>";
	};
		document.getElementById('oper_status_'+n).innerHTML=str;
	} else {
	if(value==1) {
		str="<IMG onclick=change_status("+n+",1,"+type+") SRC=yes.png border=0>";
	} else {
		str="<IMG onclick=change_status("+n+",0,"+type+") SRC=no.png border=0>";
	};
		document.getElementById('oper_spec_'+n).innerHTML=str;
	};
};
function change_status(window, value,type) {
//type 0-status; 1-spec;

	httpRequest("save_settings_windows.qsp2?type="+type+"&value="+value+"&window="+window,function(req){kletka(window,req.responseText,type);}, function (){alert("Ошибка");}, null, 20000);

};
function close_salert(el)
{
var elem = parent.frames[0].document.getElementById('blockres');
elem.innerHTML=elem.innerHTML*1-1;
if(el==2) elem.innerHTML=0;
var messages = elem.innerHTML*1;
if(messages<0)
	{
	messages=0;
	elem.innerHTML=0;
	}
if(messages==0)
	parent.frames[0].document.getElementById('block').style.display = 'none';
parent.frames[1].document.getElementById('message_box_'+el+'_text').innerHTML="";
if(el==1)
	parent.frames[1].document.getElementById('message_box_3_text').innerHTML="";
}
</script>
    </head> <body >

   <div id="DopElement"></div>


<table align=center border=1>
<tr><td>ИП адрес</td><td>номер окна</td></tr>
<%



Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionUrl = "jdbc:sqlserver://127.0.0.1;" + "databaseName=Qwin;user="+db_username+";password="+db_password+";";
String result;
Connection conn = DriverManager.getConnection(connectionUrl);
ResultSet rs = null;
Statement stmt = null;
stmt = conn.createStatement(); 



if(request.getParameter("id")!= null) {
	if(request.getParameter("del")!= null) {
		rs = stmt.executeQuery("select top 1 * from is_windows; delete from is_windows WHERE id="+request.getParameter("id")+"; ");
	} else {
		rs = stmt.executeQuery("select top 1 * from is_windows; UPDATE is_windows SET counter ='"+request.getParameter("counter")+"' WHERE id="+request.getParameter("id")+"; ");
	};
};
try{

rs = stmt.executeQuery("SELECT *  FROM is_windows order by counter; ");

int i = 0;
while( rs.next() ){
%>
<tr valigna=center><td>
<%= rs.getString("ip") %><form><input name="id" type="hidden" value="<%= rs.getString("id") %>"><input name="del" type="hidden" value="1"><input type="submit" value="Удалить"></form></td><td>
<form><input name="id" type="hidden" value="<%= rs.getString("id") %>">
<input name="counter" value="<%= rs.getString("counter") %>">  <input type="submit" value="Изменить"></form>
</td></tr>

<%
i++;
}


}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();

}
%>
</table>


 


<table width='100%' height='100%' id="message_box_1" style="height:100%;width:100%;position: absolute;left:0px;top:0px;display:none;z-index:998; background-image:url('halfpixel.png');">
<tr>
<td style="text-align:center;">
<div class="error_box" >
<table cellpadding=0 cellspacing=0 border=0 style="height:100%;width:100%;">
	<tr height='58px'>
		<td>
			<div style="border-bottom:solid 1px #f43839;height: 58px;background-color: #fccac1;width:100%;">
			<table cellpadding=0 cellspacing=0 border=0 style="height:100%;width:100%;">
				<tr>
					<td style="padding:9px;">
						<img src='error.gif' border=0/>
					</td>
					<td style="padding:9px; font-family: Arial, sans-serif;font-size:14pt;text-transform:uppercase;color:#f43839;text-align:center;">
						Внимание!
					</td>
					<td style="padding:9px;text-align:right;">
						<img src='close_error.gif' style="cursor:pointer;" onClick="close_salert(1); document.getElementById('message_box_1').style.display='none';" border=0/>
					</td>
					
				</tr>
			</table>
			</div>
		</td>
	</tr>
	<tr>
		<td style="padding:5px;vertical-align:top;" id="message_box_1_text">

		</td>
	</tr>
	<tr>
		<td style="padding:5px;vertical-align:top;" id="message_box_3_text">

		</td>
	</tr>
	<tr>
		<td>
		<div style="border-top:solid 1px #f43839;height: 38px;background-color: #fccac1;width:100%;text-align:center;">
			<input type="button" value="OK" onClick="close_salert(1); document.getElementById('message_box_1').style.display='none';" style="height:35px;width:80%;">
			</div>
		</td>
	</tr>
</table>
</div>
</td>
</tr>
</table>
<table width='100%' height='100%' id="message_box_2" style="height:100%;width:100%;position: absolute;left:0px;top:0px;display:none;z-index:997;background-image:url('halfpixel.png');">
<tr>
<td style="text-align:center;">
<div class="error_box" >
<table cellpadding=0 cellspacing=0 border=0 style="height:100%;width:100%;">
	<tr height='58px'>
		<td>
			<div style="border-bottom:solid 1px #f43839;height: 58px;background-color: #fccac1;width:100%;">
			<table cellpadding=0 cellspacing=0 border=0 style="height:100%;width:100%;">
				<tr>
					<td style="padding:9px;">
						<img src='error.gif' border=0/>
					</td>
					<td style="padding:9px; font-family: Arial, sans-serif;font-size:14pt;text-transform:uppercase;color:#f43839;text-align:center;">
						Внимание!
					</td>
					<td style="padding:9px;text-align:right;">
						<img src='close_error.gif' style="cursor:pointer;" onClick="close_salert(2); document.getElementById('message_box_2').style.display='none';" border=0/>
					</td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
	<tr>
		<td style="padding:5px;vertical-align:top;" id="message_box_2_text">

		</td>
	</tr>
</table>
</div>
</td>
</tr>
</table>
<table width='100%' height='100%'  style="height:100%;width:100%;position: absolute;left:0px;top:0px;display:none;z-index:999;background-image:url('halfpixel.png');">
<tr>
<td style="text-align:center;">
<div class="error_box" >
<table cellpadding=0 cellspacing=0 border=0 style="height:100%;width:100%;">
	<tr height='58px'>
		<td>
			<div style="border-bottom:solid 1px #f43839;height: 58px;background-color: #fccac1;width:100%;">
			<table cellpadding=0 cellspacing=0 border=0 style="height:100%;width:100%;">
				<tr>
					<td style="padding:9px;">
						<img src='error.gif' border=0/>
					</td>
					<td style="padding:9px; font-family: Arial, sans-serif;font-size:14pt;text-transform:uppercase;color:#f43839;text-align:center;">
						Внимание!
					</td>
					<td style="padding:9px;text-align:right;">
						<img src='close_error.gif' style="cursor:pointer;" onClick="close_salert(3); document.getElementById('message_box_3').style.display='none';" border=0/>
					</td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
	<tr>
		<td style="padding:5px;vertical-align:top;" id="message_box_3_text">

		</td>
	</tr>
</table>
</div>
</td>
</tr>
</table></body>
</html>























