<%@ page import="java.util.List,
                 java.util.Iterator,
                 webwork.action.ActionContext,
                 java.util.regex.Matcher,
                 java.util.regex.Pattern"%>
                 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
  String refresh = request.getParameter("refresh");
  if(refresh != null) {
     refresh = "checked";
  } else {
     refresh = "";
  }
%>
<html>
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <title><m:text key="utilities.serverlog" default="Server log"/></title>
    </head>
    <body>
        <table width="98%" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
            <form name="theForm">
            <tr>
                <td class="boxTop"><table width="100%" border="0" cellspacing="0" cellpadding="0"><td><h3 class="box"><m:text key="utilities.serverlog" default="Server log"/></h3></td><td align="right"><input type="checkbox" value="1" name="refresh" <%=refresh%>><m:text key="utilities.serverLogRefresh" default="Refresh"/>&nbsp;</td></table></td>
            </tr>
            <tr>
                <td class="boxMain">
               			
                    <div class="serverLogGridScroll">
                      <table border="0" cellspacing="0" cellpadding="0">
                        <%
                            List lines = (List)ActionContext.getValueStack().findValue("lines");
                            for(Iterator i = lines.iterator(); i.hasNext();) {
                                String line = (String)i.next();
                                if(!line.equals("-----")) {
	                                out.println("<tr><td");
	                                Pattern pDate = Pattern.compile("^< (.)* 55.01(.)* Build:(.)* >$");
																	if(pDate.matcher(line).find()) { 
		                                out.println(" class=\"listItem_over\" style=\"color:#000000;cursor:default;padding-top:3px;padding-bottom:3px;\"");
		                               } else {
			                                out.println(" class=\"listItem\" style=\"padding:2px;border-bottom:1px solid #e0e0e0\"");
			                              }
	                                 out.println(">" + line + "</td></tr>");
																}
                            }
                        %>
                        <tr><td id="endoffile">&nbsp;</td></tr>
                      </table>
                    </div>
                </td>
            </tr>
       		</form>
        </table>
        <script language="javascript">

          var refreshTime = 5000;
          document.location="#endoffile";
          setTimeout("refreshLog();",refreshTime);

          function refreshLog() {
            if(document.theForm.refresh.checked == true) {
              document.theForm.submit();
            }
            setTimeout("refreshLog();",refreshTime);
          }

        </script>
    </body>
</html>
