<%@ page contentType="text/html; charset=windows-1251" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page import="java.util.Iterator,java.io.*,java.sql.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport"%>
<%@ taglib uri="mole" prefix="m" %>
<%
	String len="";
	String red;
	BufferedReader input = null;
	
     String fileName= "C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/settings_admin/month.sql";
	
	ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();

      Script s = sm.createScript("run", "ARRAY(491)"); 
	  
	red=s.execute();
     // out.println(red);
	  sm.killScript(s);

	
	
	
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
         len=len.replace("{red_tackt}",red.toString());
		 
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
            out.print("6 Îøèáêà: "+e);
        }
%>  
