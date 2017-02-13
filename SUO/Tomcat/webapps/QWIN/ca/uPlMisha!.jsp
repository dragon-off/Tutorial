<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*,com.qmatic.ConnectionContext,com.qmatic.QwinFactory.QWinFactory,com.qmatic.scripting.Script,com.qmatic.scripting.ScriptManager,webwork.action.ActionSupport" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@ page import ="java.sql.*" %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="overwrite" value="true" />
<jsp:setProperty name="upBean" property="folderstore" value="/ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update" />
</jsp:useBean>

<head>
<title></title>
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
		 String query= null;
		 
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				ScriptManager sm = ConnectionContext.getQWinFactory().getScriptManager();
				Script s;
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
				}
                else
                {
					out.println("<li>No uploaded files");
                }
		 
		 
		 //CARDLIST IF!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//	if (mrequest.getParameter("RunAt") != null  ) 
			
                
	     }
//         else out.println("<BR> todo="+todo);
      }
%>
</ul>
<form method="post" action="uPl!.jsp" name="upform" enctype="multipart/form-data">
    <input type="file" name="uploadfile" size="5" value=""> 
	<input type="hidden" name="todo" value="upload">
    <input type="submit" name="Submit" value="Upload">
</form>
</body>
</html>
