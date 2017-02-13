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

Class.forName("net.sourceforge.jtds.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql = "SELECT DAY (GETDATE()) as [day], MONTH (GETDATE()) as [month], YEAR (GETDATE()) as [year], DATEPART ( hh , GETDATE()) as [hour], DATEPART ( minute , GETDATE()) as [min], DATEPART ( ss , GETDATE()) as [second];";
try{
s = con.createStatement();
rs = s.executeQuery(sql);
while( rs.next() ){
%>
<%=  rs.getString("day") %>
<% out.print("#");%>
<%=  rs.getString("month")%>
<% out.print("#");%>
<%=  rs.getString("year")%>
<% out.print("#");%>
<%=  rs.getString("hour")%>
<% out.print("#");%>
<%=  rs.getString("min")%>
<% out.print("#");%>
<%=  rs.getString("second")%>
<% }
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

%>
