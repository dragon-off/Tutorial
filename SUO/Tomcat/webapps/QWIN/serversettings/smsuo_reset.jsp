<%@ taglib uri="mole" prefix="m" %>
<%@ page import="java.io.BufferedReader,
                 java.io.InputStream,
                 java.io.InputStreamReader,
                 java.io.Serializable"%>

<%
try
{
  Runtime rt = Runtime.getRuntime();

  Process proc = rt.exec("C:/ProgramData/Q-MATIC/QWIN S/Tomcat/webapps/QWIN/serversettings/restart.bat");
  InputStream stderr = proc.getErrorStream();
  InputStreamReader isr = new InputStreamReader(stderr);
  BufferedReader br = new BufferedReader(isr);

  int exitVal = proc.waitFor();
  System.out.println("Process exitValue: " + exitVal);

  System.out.println("Работает...");
} //End try

catch (Throwable t)
{
  t.printStackTrace();
} //End catch
%>
<html>
<head>
<meta http-equiv='refresh' content='0;url=smsuo.qsp2'/>
</head>
<body>

</body>
</html>