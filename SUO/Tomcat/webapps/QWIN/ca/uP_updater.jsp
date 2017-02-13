<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="overwrite" value="true" />
  <jsp:setProperty name="upBean" property="folderstore" value="/ProgramData\Q-MATIC\QWIN S" />
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
 out.println(request);
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
		





				out.println(todo);		 
                Hashtable files = mrequest.getFiles();

                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("uploadfile");
                    if (file != null) out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.


                    upBean.store(mrequest, "uploadfile");
                }
                else
                {
                  out.println("<li>No uploaded files");
                }
	     }
//         else out.println("<BR> todo="+todo);
      }
%>
</ul>
<form method="post" action="uP_updater.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
    <tr>
      <td align="left"><b>Select a file to upload :</b></td>
    </tr>
    <tr>
      <td align="left">
        <input type="file" name="uploadfile" size="50">
        </td>
    </tr>
    <tr>
      <td align="left">
		<input type="hidden" name="todo" value="upload">
		<input type="hidden" name="patchdir" value="c:\dupload">
        <input type="submit" name="Submit" value="Upload">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
</body></html>