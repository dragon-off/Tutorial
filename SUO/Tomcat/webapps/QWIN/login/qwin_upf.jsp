<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="folderstore" value="C:\Program Files\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\sber" />
<jsp:setProperty name="upBean" property="overwrite" value="true" />
</jsp:useBean>
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("uploadfile");
                    if (file != null){ out.println("true"); } else { out.println("false"); } ;
                    upBean.store(mrequest, "uploadfile");
                };
	     };
      }
%>
