<%@ page import="webwork.action.ActionContext,
                 webwork.util.ValueStack,
                 com.qmatic.staff.direct2.StaffGroup"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
    ValueStack vs = ActionContext.getContext().getValueStackImpl();
    StaffGroup group = (StaffGroup)vs.findValue("group");

%>
<html>
    <head>
        <title>Staff Group</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <script language="JavaScript">
          <ww:if test="reload==true">
                top.navigation.location.href = "../search/result.jsp?start=0&max=10&qType=SG&reload=false";
          </ww:if>
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

        function processReqChange() {
            if (req.readyState == 4) {
                    tabString = "TABBEDPANE_TP_INDEX=<ww:property value="$TABBEDPANE_TP_INDEX"/>";
                    document.location.href='staff.staffgroup.getgroup.action?' +tabString;
                if (req.status == 200) {
                    // ...processing statements go here...
                } else {
                }
            }
        }


          function removeMember(group, member) {
                sendRequest('staff.staffgroup.removemember.action?memberId='+member);
          }

          function addMember(group, member) {
                sendRequest('staff.staffgroup.addmember.action?memberId='+member);
          }



          function addGroup(usergroup) {
            sendRequest('staff.staffgroup.addusergroupaccess.action?userGroupId='+usergroup);
          }

          function removeGroup(usergroup) {
            sendRequest('staff.staffgroup.removeusergroupaccess.action?userGroupId='+usergroup);
          }

          function setAccess(formName) {
            var query = "staff.staffgroup.setusergroupaccess.action?";
            if(document.forms[formName].APP_READ.checked)
                query+="APP_READ=ON&";
            if(document.forms[formName].APP_SET.checked)
                query+="APP_SET=ON&";
            if(document.forms[formName].APP_WRITE.checked)
                query+="APP_WRITE=ON&";
            query+="staffGroupId=" + document.forms[formName].staffGroupId.value + "&";
            query+="userGroupId=" + document.forms[formName].userGroupId.value;
            sendRequest(query);
          }

          function setPermission(){

          }
          function switchTab(a) {
                tabString = "TABBEDPANE_TP_INDEX="+a;
                //If tab1 we should save otherwise not
                form = document.getElementById("form1");
                if(form != null){
                    form.action = "staff.staffgroup.saveSoft.action?" + tabString ;
                    form.submit();
                }
                else{
                    document.location.href="staff.staffgroup.getgroup.action?" +tabString ;
                }
	        }
            function resetStatusMessage(){
                document.getElementById("statusBar").innerHTML = "";

            }
            function setHasChanged(){
                document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-alert-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="staff.staffgroupChanged"/></b>";
                document.getElementById("changed").value = "true";
            }

          </script>


    </head>
    <body>

        <ww:action name="'staff.staffgroup.tab'">
            <ww:tabbedpane id="TP" contentName="'tabs'" tabAlign="'LEFT'"/>
        </ww:action>
        <ww:if test="saved==true">
            <script language="JavaScript">
                div = document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="staff.staffgroupSaved"/></b>";
                setTimeout('resetStatusMessage();',5000);
            </script>
          </ww:if>
        <ww:if test="group/changed==true">
            <script language="JavaScript">
                div = document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-alert-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="staff.staffgroupChanged"/></b>";
            </script>
          </ww:if>


    </body>
</html>


