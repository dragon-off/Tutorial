<%@ page import="java.util.*" %>

<%@ page contentType="text/html;charset=utf-8"%>
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
String id= "qmatic";
String pass = "qmatic";
try{

Class.forName("net.sourceforge.jtds.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}

//request.setCharacterEncoding("utf-8");
//String sql = "select TOP(200) id,UserName,type_id,convert(varchar(20),datetime,13) as datetime,comment from journal order by datetime ";
String eventstr = request.getParameter("event").toString();

String userstr = request.getParameter("user");
String dd = request.getParameter("day");
String mm = request.getParameter("month");
String yy = request.getParameter("year");
String hh = request.getParameter("hour");
String mi = request.getParameter("min");
String ss = request.getParameter("sec");
int wh = 0;
//String foo;
if(eventstr!=null)
	{
	wh++;

	}
	//eventstr=eventstr+"\u043F";
	//out.print(new String(eventstr.toString()));
	//eventstr=new String(eventstr.toString());
if(userstr!=null)
	{
	wh++;
	userstr = userstr.replace("*","%");
	}
if(dd!=null) wh++;
if(mm!=null) wh++;
if(yy!=null) wh++;
if(hh!=null) wh++;
if(mi!=null) wh++;
if(ss!=null) wh++;



String sql = "select id,UserName,type_id,convert(varchar(20),datetime,13) as datetime,comment from journal";
if(wh>0)
	{
	int isfirst=0;
	sql+= " where ( ";
	if(eventstr!=null)
		{
		if(isfirst==0) isfirst=1; 
		else sql+="and ";
		sql+="[comment] like '"+eventstr+"' ";
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
		sql+="DATEPART(dd, [datetime]) like "+dd+" ";
		sql+="and DATEPART(mm, [datetime]) like "+mm+" ";
		sql+="and DATEPART(yy, [datetime]) like "+yy+" ";
		}
	if(hh!=null)
		{
		if(isfirst==0) isfirst=1; 
		else sql+="and ";
		sql+="DATEPART(hh, [datetime]) like "+dd+" ";
		sql+="and DATEPART(mi, [datetime]) like "+mi+" ";
		if(ss!=null)
			sql+="and DATEPART(ss, [datetime]) like "+ss+" ";
		}
	sql+=" )";
	}
sql+=" order by datetime DESC";
out.print(sql);
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
<%= rs.getString("comment") %><br>

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