<!DOCTYPE HTML PUBLIC  "loose.dtd">
<html>
<head>
<title>Journal</title>
<LINK REL="StyleSheet" HREF="style.css" TYPE="text/css">
<script language='javascript'>
function close_salert(el)
{
var elem = parent.frames[0].document.getElementById('blockres');
elem.innerHTML=elem.innerHTML*1-1;
if(el==2) elem.innerHTML=0;
var messages = elem.innerHTML*1;
if(messages==0)
	parent.frames[0].document.getElementById('block').style.display = 'none';
}
</script>
</head>
<body style="margin:0px;padding:0px;">

<table cellpadding=0 cellspacing=0 width="100%">
<tr height="30px">
	<td class="tableHead" width="20px" style="width:20px;text-align:center;">#</td>
	<td class="tableHead" width="200px" style="width:200px;text-align:center;"><% out.print("\u041F\u043E\u043B\u044C\u0437\u043E\u0432\u0430\u0442\u0435\u043B\u044C"); %></td>
	<td class="tableHead" width="250px" style="width:250px;text-align:center;"><% out.print("\u0414\u0430\u0442\u0430\u002F\u0412\u0440\u0435\u043C\u044F"); %></td>
	<td class="tableHead" style="text-align:center;border-right-color:#E0E0E1;"><% out.print("\u0421\u043E\u0431\u044B\u0442\u0438\u0435"); %></td>
</tr>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*;" %>
<% 

java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;

con=null;
s=null;
pst=null;
rs=null;

// Remember to change the next line with your own environment 
String url= 
"jdbc:jtds:sqlserver://localhost/qwin";
String id= "journal";
String pass = "journal";
try{

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con = DriverManager.getConnection("jdbc:odbc:qwin5501");

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql = "select * from WORKSTA";
try{
s = con.prepareStatement();
rs = s.executeQuery(sql);
%>

<%
int i = 0;
while( rs.next() ){
if(i%2==0) out.print("<tr style='height:30px;'>");
else
	out.print("<tr style='background-color:#eeeeee;height:30px;'>");
%>
<td width="20px" class="tableBody" align="center"><%= rs.getString("BranchNo") %></td>
<td width="200px" class="tableBody"><%= rs.getString("WStation") %></td>
<td width="250px" class="tableBody"><%= rs.getString("Contents") %></td>

</tr>
<%
i++;
}
%>

<%

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
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
</table>
</body>
</html>