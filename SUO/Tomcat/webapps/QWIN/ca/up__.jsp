<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%@ include file="/login/userpass.jsp" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@ page import ="java.sql.*" %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="overwrite" value="false" />

  <jsp:setProperty name="upBean" property="folderstore" value="/ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update" />
</jsp:useBean>

<head>
<title>Samples : Simple Upload</title>
<style TYPE="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<ul class="style1">
<%
if (MultipartFormDataRequest.isMultipartFormData(request))
{
	MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
	String todo = null;
	String name_file= null;

	
	if (mrequest != null) todo = mrequest.getParameter("todo");
	if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	{
		Hashtable files = mrequest.getFiles();
		if ( (files != null) && (!files.isEmpty()) )
		{
			UploadFile file = (UploadFile) files.get("uploadfile");
			if (file != null) out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
			upBean.store(mrequest, "uploadfile");
			UploadParameters up = (UploadParameters) upBean.getHistory().elementAt(0);
			name_file=up.getAltFilename();
			if(name_file==null) {
				name_file=file.getFileName();
			};
			out.println("uploadfile"+name_file);
		} else {
			out.println("<li>No uploaded files");
		}
		//CARDLIST IF!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//	if (mrequest.getParameter("RunAt") != null  ) 
			
	     }
//         else out.println("<BR> todo="+todo);
      }
%>
</ul>
<form method="post" action="up__.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
    <tr>
      <td align="left"><b>Select a file to upload :</b></td>
    </tr>
    <tr>
      <td align="left">
      
        <input type="file" name="uploadfile" size="5" value="123"> 
        </td>
    </tr>
    <tr>
      <td align="left">
		<input type="hidden" name="todo" value="upload">
		<br><br>
		<input type="text" name="RunAt" value="01.02.2012">
		<input type="text" name="ZipFilename" value="paket1.zip">
		<input type="text" name="State" value="1">
		<br><br>
		<input type="hidden" name="patchdir" value="c:\dupload">
        <input type="submit" name="Submit" value="Upload">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
  <br>
  <br>
  <table border="0" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td bgcolor="#666666">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" align="center" class="style1">
          <tr>
            <td bgcolor="#FFFFFF"><b><font color="#0000FF">&nbsp;
              HTML tags used in this form : </font></b></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF">&nbsp;&lt;<b>form</b>
              <b>method</b>=&quot;<b><font color="#FF0000">post</font></b>&quot;
              <b>action</b>=&quot;<b><font color="#FF0000">SimpleUpload.jsp</font></b>&quot;
              name=&quot;upload&quot; <b>enctype</b>=&quot;<b><font color="#FF0000">multipart/form-data</font></b>&quot;&gt;</td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF">&nbsp;&lt;<b>input</b>
              <b>type</b>=&quot;<b><font color="#FF0000">file</font></b>&quot;
              <b>name</b>=&quot;<font color="#FF0000"><b>uploadfile</b></font>&quot;
              size=&quot;50&quot;&gt;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
</form>
</body>
</html>
