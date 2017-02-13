<%@ page import="webwork.action.ActionContext,
               webwork.util.ValueStack"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<html>
  <head>
      <title>Staff Member</title>
      <script language="JavaScript">
        function setDate(id, update) {

            var time = document.form1.elements[id + "_hh"].selectedIndex * 60 * 60;
            time    += document.form1.elements[id + "_mm"].selectedIndex * 60;
            document.form1.elements[id].value = time;
            if(update)
                setStatusHasNotBeenSaved();

        }

        function createUniqueId() {
            document.form1.action = "staff.staffmember.createlogincode.action";
            document.form1.submit();
        }

        function cancel() {
            document.location.href="../blank.jsp";
        }

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
                    a = req.responseText;
                    //document.location.reload();
                    <%
                        String tpIndex = request.getParameter("TABBEDPANE_TP_INDEX");
                        if(tpIndex == null)
                            tpIndex = "0";
                    %>
                    document.location.href="staff.staffmember.softload.action?TABBEDPANE_TP_INDEX=<%=tpIndex%>";
                if (req.status == 200) {
                    // ...processing statements go here...
                } else {
                }
            }
        }

        function removeFromUserGroup(group, member) {
            sendRequest('staff.staffmember.usergroup.remove.action?userGroupId='+group+'&staffMemberId='+member);
        }

        function addToUserGroup(group, member) {
            sendRequest('staff.staffmember.usergroup.add.action?userGroupId='+group+'&staffMemberId='+member);
        }

        function removeFromStaffGroup(group, member) {
            sendRequest('staff.staffmember.staffgroup.remove.action?staffGroupId='+group+'&staffMemberId='+member);
        }

        function addToStaffGroup(group, member) {
            sendRequest('staff.staffmember.staffgroup.add.action?staffGroupId='+group+'&staffMemberId='+member);
        }

    	function switchTab(a) {
            //alert("staff.staffmember.softload.action?TABBEDPANE_TP_INDEX=" + a);
            <%
                if(request.getParameter("TABBEDPANE_TP_INDEX") == null ||
                        request.getParameter("TABBEDPANE_TP_INDEX").equals("0")){
            %>
                document.form1.action = "staff.staffmember.softsave.action";
                document.form1.TABBEDPANE_TP_INDEX.value = a;
                document.form1.submit();
            <%
                } else {
            %>
	    	    document.location.href="staff.staffmember.softload.action?TABBEDPANE_TP_INDEX=" + a;
            <%
                }
            %>
	    }

		function hideDialog() {
			var d = document.getElementById('statusbar');
			d.innerHTML="";
		}
        function setStatusHasBeenSaved() {            
            var d = document.getElementById('statusbar');
            d.innerHTML = "<img align='top' src='<m:path src="/images/info-icon.gif"/>'>&nbsp;&nbsp;<b><m:text key="staff.staffMemberSaved" default="Staff Member has been saved"/></b>";
            setTimeout("hideDialog()", 5000);
        }

        function setStatusHasNotBeenSaved() {
            var d = document.getElementById('statusbar');
            d.innerHTML = "<img align='top' src='<m:path src="/images/info-alert-icon.gif"/>'>&nbsp;&nbsp;<b><m:text key="staff.staffMemberNotSaved" default="Staff Member has not been saved"/></b>";

            if(document.form1) {
                if(document.form1.hasChanged){
                    document.form1.hasChanged.value = "true";
                }
            }

        }




      </script>
	<style type="text/css">
		.statusbarVisible {


		}

		.statusbarInvisible {
            color: #808080;
		}
		.dialogTable {
			border-left: 1px solid #FFFFFF;
			border-bottom: 1px solid #404040;
			border-top: 1px solid #FFFFFF;
			border-right: 1px solid #404040;
		}


      </style>
      <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
  </head>
  <body>

    <ww:if test="hasErrorMessages == true">
        <div class="control">
            <table width="300">
                <tr>
                    <td colspan="2">
                        <div class="errorMessage">
                             <ww:iterator value="errorMessages">
                                <ww:property value="."/><br>
                             </ww:iterator>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </ww:if>
      <ww:action name="'staff.member.tab'">
          <ww:param name="'staffInfoNo'" value="staffMember/id"/>
          <ww:tabbedpane id="TP" contentName="'tabs'" tabAlign="'LEFT'"/>
      </ww:action>


      <ww:if test="staffMember/hasChanged==true">
            <script language="JavaScript">
                setStatusHasNotBeenSaved();
            </script>
      </ww:if>

      <ww:if test="isSaved==true">
            <script language="JavaScript">
                top.navigation.location.href = "../search/result.jsp?start=0&max=10&qType=SM&reload=false#ID_<ww:property value="staffMember/id"/>";
                //setStatusbarText("Staff Member has been saved", 5000);
                setStatusHasBeenSaved();

            </script>
      </ww:if>


  </body>
</html>


