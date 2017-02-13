<%@ page import="java.util.*" %>

<%@ page contentType="text/html;charset=windows-1251"%>
<%@ include file="/login/userpass.jsp" %>
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
String id= db_username;
String pass = db_password;
try{

Class.forName("net.sourceforge.jtds.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}

//request.setCharacterEncoding("utf-8");
//String sql = "select TOP(200) id,UserName,type_id,convert(varchar(20),datetime,13) as datetime,comment from journal order by datetime ";
String eventstr = request.getParameter("event");

String userstr = request.getParameter("user");
String dd = request.getParameter("day");
String mm = request.getParameter("month");
String yy = request.getParameter("year");
String hh = request.getParameter("hour");
String mi = request.getParameter("min");
String ss = request.getParameter("sec");
String hh2 = request.getParameter("tohour");
String mi2 = request.getParameter("tomin");
String ss2 = request.getParameter("tosec");
String dd2 = request.getParameter("today");
String mm2 = request.getParameter("tomonth");
String yy2 = request.getParameter("toyear");
int wh = 0;
//String foo;
if(eventstr!=null)
	{
	wh++;
	//eventstr = eventstr.replace("|","&");
	//eventstr = eventstr.replace("~","#");
	eventstr = eventstr.replace("*","%");
	//foo = new String(eventstr);
	}
if(userstr!=null)
	{
	wh++;
	userstr = userstr.replace("*","%");
	}
if(dd!=null) wh++;
if(mm!=null) wh++;
if(yy!=null) wh++;
if(dd2!=null) wh++;
if(mm2!=null) wh++;
if(yy2!=null) wh++;
if(hh!=null) wh++;
if(mi!=null) wh++;
if(ss!=null) wh++;
if(hh2!=null) wh++;
if(mi2!=null) wh++;
if(ss2!=null) wh++;



String sql = "select TOP 100 id,UserName,type_id,convert(varchar(20),datetime,13) as datetime,datetime as datetime2,comment,action from journal";
if(wh>0)
	{
	int isfirst=0;
	sql+= " where ( ";
	if(eventstr!=null)
		{
		if(isfirst==0) isfirst=1; 
		else sql+="and ";
		sql+="([comment] like '"+eventstr+"' "+" or [action] like '"+eventstr+"' )";
		}
	if(userstr!=null)
		{
		if(isfirst==0) isfirst=1; 
		else sql+="and ";
		sql+="[UserName] like '"+userstr+"' ";
		}
	if(dd!=null)
		{
		if(isfirst==0) isfirst=1; 
		else sql+="and ";
		if(dd2==null)
			{
			sql+="DATEPART(dd, [datetime]) like "+dd+" ";
			sql+="and DATEPART(mm, [datetime]) like "+mm+" ";
			sql+="and DATEPART(yy, [datetime]) like "+yy+" ";
			}
		else
			{
			sql+="( datetime BETWEEN '"+dd+"."+mm+"."+yy+"' AND '"+dd2+"."+mm2+"."+yy2+"') ";
			}
		}
	if(hh!=null)
		{
		if(isfirst==0) isfirst=1; 
		else sql+="and ";
		if(hh2==null)
			{
			sql+="DATEPART(hh, [datetime]) like "+hh+" ";
			sql+="and DATEPART(mi, [datetime]) like "+mi+" ";
			if(ss!=null && ss!="70" && Integer.parseInt(ss)<70)
				sql+="and DATEPART(ss, [datetime]) like "+ss+" ";
			}
		else
			{
		sql+="( (DATEPART(hh, [datetime])*10000+DATEPART(mi, [datetime])*100+DATEPART(ss, [datetime])) BETWEEN "+(Integer.parseInt(hh)*10000+Integer.parseInt(mi)*100+Integer.parseInt(ss))+" AND "+(Integer.parseInt(hh2)*10000+Integer.parseInt(mi2)*100+Integer.parseInt(ss2))+") ";
			}
		}
	sql+=" )";
	}
sql+=" order by datetime2 DESC";
//out.print(sql);
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>
<br>
<%
int i = 0;
while( rs.next() ){
%>
<%= rs.getString("id") %>|
<%= rs.getString("UserName") %>|
<%= rs.getString("datetime") %>|
<%= rs.getString("action") %> |
<%= rs.getString("comment") %> 
<br>

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