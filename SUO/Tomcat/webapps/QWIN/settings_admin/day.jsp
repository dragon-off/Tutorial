<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>

<%@ taglib uri="mole" prefix="m" %>


<%
	String len="";
	BufferedReader input = null;
	
     String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/settings_admin/day.sql";


	
	
	
      try {
         input = new BufferedReader(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         return;
      }
      try {
         String tmp;
         while ((tmp = input.readLine()) != null)
           len+=" "+tmp;
      } catch (IOException e) {
         e.printStackTrace();
      }
        
		response.setContentType("text/html");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
        }
        try {
            Connection conn = null;
			
		// izmeni DB!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        String connectionUrl = "jdbc:sqlserver://127.0.0.1;databaseName=Msqms_db;user="+db_username+";password="+db_password+";";

        conn = DriverManager.getConnection(connectionUrl);
       Statement command = conn.createStatement();
        ResultSet rs = command.executeQuery(len);
		rs.next();
        //out.print("OK");
		out.print("ALL:"+rs.getString(1)+"; green:"+rs.getString(2)+"; red:"+rs.getString(3));
        conn.close();
        } catch (SQLException e) {
            out.print("Îøèáêà: "+e);
        }
%>
