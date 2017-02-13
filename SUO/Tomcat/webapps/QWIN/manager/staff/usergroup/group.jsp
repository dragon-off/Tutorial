<%@ page import="webwork.action.ActionContext,
                 webwork.util.ValueStack,
                 com.qmatic.staff.direct2.UserGroup"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
    ValueStack vs = ActionContext.getContext().getValueStackImpl();
    UserGroup group = (UserGroup)vs.findValue("group");
%>

<html>
    <head>
        <title>User Group</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
          <ww:if test="reload==true">
                <script language="JavaScript">
                    top.navigation.location.href = "../search/result.jsp?start=0&max=10&qType=UG&reload=false";
                </script>
          </ww:if>
          <script language="JavaScript">
            function sendRequest(url) {
                req = false;
                if(window.XMLHttpRequest) {
                    try {
                        req = new XMLHttpRequest();
                    } catch(e) {
                        req = false;
                    }
                } else if(window.ActiveXObject) {
                    try {
                        req = new ActiveXObject("Msxml2.XMLHTTP");
                     } catch(e) {
                        try {
                            req = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch(e) {
                            req = false;
                        }
                    }
                }
                if(req) {
                    req.onreadystatechange = processReqChange;
                    req.open("GET", url, true);
                    req.send("");
                }
            }

            function setInitState(groupName) {
                var counter = 0;
                var select = true;
                while((chkBox = document.getElementById(groupName + "_" + counter++)) != null){
                    if(!chkBox.checked) {
                        select = false;
                        break;
                    }
                }
                document.getElementById(groupName).checked = select;
            }

            //Selectes and deselectds all childs
            function selectAll(groupName, selected) {
                var counter = 0;
                while((chkBox = document.getElementById(groupName + "_" + counter++)) != null){
                    chkBox.checked = selected;
                }
            }

            function setParentState(parent, ischecked){
                if(ischecked){
                    var p = document.getElementById(parent);
                    if(p) {
                        p.checked = true;
                    }
                }
            }

            function addMember(groupId,memberId){
                sendRequest('staff.usergroup.addmember.action?memberId='+memberId);
            }
            function removeMember(groupId,memberId){
                sendRequest('staff.usergroup.removemember.action?memberId='+memberId);
            }
            function processReqChange() {

                if (req.readyState == 4) {
                    tabString = "TABBEDPANE_TP_INDEX=<ww:property value="$TABBEDPANE_TP_INDEX"/>";
                    a = req.responseText;
                    document.location.href='staff.usergroup.getgroup.action?' +tabString;
                    if (req.status == 200) {
                        // ...processing statements go here...
                    } else {
                    }
                }
            }
          function switchTab(a) {
                tabString = "TABBEDPANE_TP_INDEX="+a;
                <%
                    String ti = request.getParameter("TABBEDPANE_TP_INDEX");
                    if(ti == null)
                        ti = "0";
                %>
                if(<%=ti%> == 0){
                    document.getElementById("form1").action = "staff.usergroup.saveSoft.action?" + tabString ;
                    document.form1.submit();
                }

                if(<%=ti%> == 1){
                    document.location.href="staff.usergroup.getgroup.action?" + tabString;
                }

                if(<%=ti%> == 2){
                    document.UGACCESSFORM.action="staff.usergroup.saveAclSoft.action";
                    document.UGACCESSFORM.TABBEDPANE_TP_INDEX.value = a;
                    document.UGACCESSFORM.submit();
                }


	        }
            function resetStatusMessage(){
                document.getElementById("statusBar").innerHTML = "";

            }
            function setHasChanged(){
                document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-alert-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="staff.usergroupChanged"/></b>";
                document.getElementById("changed").value = "true";
            }


          </script>

    </head>
    <body>
        <ww:action name="'staff.usergroup.tab'">
            <ww:tabbedpane id="TP" contentName="'tabs'" tabAlign="'LEFT'"/>
        </ww:action>
        <ww:if test="saved==true">
            <script language="JavaScript">
                div = document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="staff.usergroupSaved"/></b>";
                setTimeout('resetStatusMessage();',5000);
            </script>
          </ww:if>
          <ww:if test="group/changed==true">
            <script language="JavaScript">
                div = document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-alert-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="staff.usergroupChanged"/></b>";
            </script>
          </ww:if>
    </body>
</html>


