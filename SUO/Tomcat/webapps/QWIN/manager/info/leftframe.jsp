<%@ page import="java.io.File,
                 com.qmatic.network.*,
                 com.qmatic.ConnectionContext"%><html>
<%@ page import="webwork.action.ActionContext"%>
<%@ page import="javax.servlet.ServletContext"%>
<%@ taglib uri="mole" prefix="m" %>

    <head>
        <LINK REL="StyleSheet" HREF="style.css" TYPE="text/css">

    </head>

<script language=javascript>
	function openPage(p) {
		parent.contents.location.href=p;
	}
    function createRequestObject() {
        var ro;
        var browser = navigator.appName;
        if(browser == "Microsoft Internet Explorer"){
            ro = new ActiveXObject("Microsoft.XMLHTTP");
        }else{
            ro = new XMLHttpRequest();
        }
        return ro;
   }

    var http = createRequestObject();

    function sndReq(action) {
        http.open('get', action, true);

        http.onreadystatechange = handleResponse;
        http.send(null);
    }

    function handleResponse() {
        if(http.readyState == 4){
            //We don't do anything since this is just too keep the session alive
            //document.getElementById("time").innerHTML = "Current Time: " + http.responseText;

        }
    }
    function keepSessionAlive(){
        sndReq('../../time.jsp');
        setTimeout("keepSessionAlive()",600000);

    }
</script>
<%
        if(((Boolean)session.getAttribute("QWIN_CLIENT_SESSION")).booleanValue()){
        out.println("<body onLoad=\"keepSessionAlive()\">");
    }
        else{
            out.println("<body>");

    }

    %>
<table class=tableMain width=170 cellpadding=4 cellspacing=0>
	<tr>
		<td class=headerBar>
			<m:text key="management.qwinManagement" default="Q-WIN Management"/>
		</td>
	</tr>

    <%
    User user = (User)request.getSession().getAttribute("QM_USER");
    %>
    <%
    com.qmatic.network.Policy p = user.getPolicy("QWIN");
    if(p == null || (p != null && p.isEnabled())){
    %>
        <tr><td onClick="javascript:openPage('qwin.smanagement');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><m:text key="management.qwinManagement" default="Q-WIN Management"/></td></tr>
    <%
    }
    %>

    <%
    p = user.getPolicy("CATEGORYINFORMATION");
    if(p == null || (p != null && p.isEnabled())){
    %>
        <tr><td onClick="javascript:openPage('categoryInformation.smanagement');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><m:text key="management.categoryInformation" default="Category Information"/></td></tr>
    <%
    }
    %>

    <%
    p = user.getPolicy("WORKSTATIONINFORMATION");
    if(p == null || (p != null && p.isEnabled())){
    %>
        <tr><td onClick="javascript:openPage('workstationInformation.smanagement');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><m:text key="management.workstationInformation" default="Workstation Information"/></td></tr>
    <%
    }
    //boolean[] bits = ConnectionContext.getSession().getSlotBits();
    boolean hasCustom = true;
    //if(bits != null)
    //    hasCustom = bits[(96 + 19) - 1];

    if(hasCustom) {
        String directory = getServletConfig()
                .getServletContext().getRealPath("/manager/info/custom");

        File customDirectory = new File(directory);
        File [] customFiles = customDirectory.listFiles();

        if(customFiles != null)
            for(int i = 0; i < customFiles.length; i++) {
                String fileName=customFiles[i].getName();
                if(!fileName.endsWith("management"))
                    continue;
                if(fileName.indexOf('.')!=-1) {
                    String dispName = fileName.substring(0,fileName.indexOf('.'));
                    p = user.getPolicy(dispName.toUpperCase());
                    if(p == null || (p != null && p.isEnabled())){

    %>
                        <tr><td onClick="javascript:openPage('<%=fileName%>?virtual=true');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><%=dispName%></td></tr>
    <%
                    }
                }
            }
        }
%>
	<tr>
		<td class=headerBar>
			Settings
		</td>
	</tr>

	<tr><td onClick="javascript:openPage('settingsGeneral.child.smanagement');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><m:text key="management.generalSettings" default="General Settings"/></td></tr>
	<tr><td onClick="javascript:openPage('settingsCategory.child.smanagement?useCategory=true');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><m:text key="management.categorySettings" default="Category Settings"/></td></tr>
	<tr><td onClick="javascript:openPage('settingsWorkstation.child.smanagement?useWorkstation=true');" class=tdMenuItem onmouseover="javascript:this.className='tdMenuItemOver';" onmouseout="javascript:this.className='tdMenuItem';"><m:text key="management.workstationSettings" default="Workstation Settings"/></td></tr>
</table>
</body>
</html>