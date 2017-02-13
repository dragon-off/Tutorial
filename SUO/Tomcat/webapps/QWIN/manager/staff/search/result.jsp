<%@ taglib uri="mole" prefix="m" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%
    String s = request.getParameter("start");
    String m = request.getParameter("max");

    int start = 0;
    if(s != null){
        start = Integer.parseInt(s) + Integer.parseInt(m);
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script language="JavaScript">

            var preSelected;
            var reload = true;
            <ww:if test="$reload == 'false'">
                reload = false;
            </ww:if>
            function showNewForm() {
                <ww:if test="$qType == 'SG'">
                    if(confirm("<m:text key="staff.confirm.createNewStaffGroup" default="Create a new Staff Group?"/>")){
                        document.location.href = "staff.staffgroup.add.action";
                    }

                </ww:if>
                <ww:if test="$qType == 'SM'">
                    if(confirm("<m:text key="staff.confirm.createNewStaffMember" default="Create a new Staff Member?"/>")){
                        document.location.href = "staff.staffmember.dbcreate.action";
                    }

                </ww:if>
                <ww:if test="$qType == 'UG'">
                    if(confirm("<m:text key="staff.confirm.createNewUserGroup" default="Create a new User Group?"/>")){
                        document.location.href = "staff.usergroup.add.action";
                    }

                </ww:if>
            }

            function reloadPage() {
                document.location.href=document.location.href;
            }

            function setFormLabel(item) {
                // clear all selections
                document.getElementById("SM").className = 'listItem';
                document.getElementById("SG").className = 'listItem';
                document.getElementById("UG").className = 'listItem';
                item.className = 'listItem_selected';
                document.sf.qType.value=item.id;
                top.main.document.location.href = "../blank.jsp";
                document.sf.submit();
            }

            function selectResult(item) {
                if(preSelected)
                    preSelected.className = 'listItem';
                item.className = 'listItem_selected';
                preSelected = item;
            }

            function deleteSelected() {
                if(preSelected) {
                    if(confirm("<m:text key="staff.confirm.deleteSelected" default="Delete selected item?"/>")){
                        <ww:if test="$qType == 'UG'">
                            document.location.href = "staff.dbdelete.action?type=UG&id=" + preSelected.id
                        </ww:if>

                        <ww:if test="$qType == 'SG'">
                            document.location.href = "staff.dbdelete.action?type=SG&id=" + preSelected.id
                        </ww:if>

                        <ww:if test="$qType == 'SM'">
                            document.location.href = "staff.dbdelete.action?type=SM&id=" + preSelected.id
                        </ww:if>

                        //document.location.href = "staff.remove.action?type=<ww:property value="$qType"/>&id=" + preSelected.id
                        top.main.document.location.href = "../blank.jsp";
                    }else{
                        
                    }
                }
            }

            function setClassByState(item, over, selectedId) {
            	if(over==1 && item.id != selectedId) {
            		item.className = 'listItem_over';
            	} else {
            		if(item.id == selectedId) {
                        item.className = 'listItem_selected';
                    } else {
	            		item.className = 'listItem';
	            	}
            	}
            }

            function listOver(item, over) {
            	setClassByState(item, over, '<ww:property value="$qType"/>');
            }

            function resultOver(item, over) {
            	setClassByState(item, over, preSelected?preSelected.id:0);
            }

            function loadSM(id) {
                if(id) {
                    selectActive(id);
                    if(reload)
                        parent.main.location.href='../staffmember/staff.staffmember.dbload.action?id='+id;
                    reload = true;
                }
            }

            function loadSG(id) {
                if(id) {
				    selectActive(id);
                    if(reload)
					    parent.main.location.href='../staffgroup/staff.staffgroup.getgroupfromdb.action?groupId='+id;
                    reload = true;
			    }
            }
            function loadUG(id) {
                if(id) {
                    selectActive(id);
                    if(reload)
                        parent.main.location.href='../usergroup/staff.usergroup.getgroupfromdb.action?groupId='+id;
                    reload = true;
                }
            }

            function selectActive(id) {
	            preSelected = document.getElementById(id);
            }
        </script>


    </head>
    <body>
        <table width="780"  border="0" cellspacing="0" cellpadding="0">
            <tr align="left" valign="top">
                <td width="208">
                    <table width="208" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
                        <tr>
                            <td class="boxTop"><h3 class="box"><m:text key="staff.search.type" default="Type"/></h3></td>
                        </tr>
                        <tr>
                            <td class="boxMain">
                                <div>

                                    <div id="SM" class="listItem" onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);" onClick="javascript:setFormLabel(this);">&nbsp;&nbsp;<img src="<ww:if test="$qType == 'SM'"><m:path src="/images/folder-open.gif"/>"></ww:if><ww:else><m:path src="/images/folder-closed.gif"/>"></ww:else><label for="SM"> <m:text key="staff.staffmembers" default="Staff Members"/></label></div>
                                    <div id="SG" class="listItem" onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);" onClick="javascript:setFormLabel(this);">&nbsp;&nbsp;<img src="<ww:if test="$qType == 'SG'"><m:path src="/images/folder-open.gif"/>"></ww:if><ww:else><m:path src="/images/folder-closed.gif"/>"></ww:else><label for="SG"> <m:text key="staff.staffgroups" default="Staff Groups"/></label></div>
                                    <div id="UG" class="listItem" onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);" onClick="javascript:setFormLabel(this);">&nbsp;&nbsp;<img src="<ww:if test="$qType == 'UG'"><m:path src="/images/folder-open.gif"/>"></ww:if><ww:else><m:path src="/images/folder-closed.gif"/>"></ww:else><label for="UG"> <m:text key="staff.usergroups" default="User Groups"/></label></div>

                                    <script language="JavaScript">
                                        document.getElementById('<ww:property value="$qType"/>').className = 'listItem_selected';
                                    </script>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <table width="780"  border="0" cellspacing="0" cellpadding="0">
            <tr align="left" valign="top">
                <td width="208">
                    <table width="208" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
                        <tr>
                            <td class="boxTop">
                                <h3 class="box">
                                    <ww:if test="$qType == 'SM'"><m:text key="staff.staffmembers" default="Staff Members"/></ww:if>
                                    <ww:if test="$qType == 'UG'"><m:text key="staff.usergroups" default="User Groups"/></ww:if>
                                    <ww:if test="$qType == 'SG'"><m:text key="staff.staffgroups" default="Staff Groups"/></ww:if>
                                </h3>
                            </td>
                        </tr>
                        <tr>
                            <td class="searchBox">
                                <table cellspacing="0" cellpadding="0">
                                    <form name="sf" action="result.jsp">
                                        <input type="hidden" name="start" value="0"/>
                                        <input type="hidden" name="max" value="1000"/>

                                        <input type="hidden" name="qType" value="<ww:property value="$qType"/>"/>

                                        <tr><td>&nbsp;&nbsp;<input type="text" value="<ww:property value="$q"/>" size="15" name="q"></td><td><m:button label="'staff.find'" onClick="document.sf.submit();"/></td></tr>
                                    </form>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="boxMain">
                                <div class="resultBoxScroll">
                                    <form name="rsForm">

                                        <ww:if test="$qType == 'SM'">
                                            <ww:action name="'stafflist'" id="list">
                                                <ww:param name="'filter'" value="$q"/>
                                                <ww:param name="'max'" value="$max"/>
                                                <ww:param name="'start'" value="$start"/>
                                                <ww:iterator value="staffMembers">
                                                    <a name="ID_<ww:property value="id"/>"></a>
                                                    <div id="<ww:property value="id"/>" class="listItem<ww:if test="@SM_LastSelected == id">_selected</ww:if>" onMouseOver="javascript:resultOver(this,1);" onMouseOut="javascript:resultOver(this,0);" onClick="selectResult(this); loadSM(<ww:property value="id"/>);">&nbsp;&nbsp;<img border="0" src="<m:path src="/images/staff-member.gif"/>"> <ww:property value="name"/></div>
                                                    <ww:if test="@SM_LastSelected == id">
                                                    	<script language=javascript>
                                                    		loadSM(<ww:property value="id"/>);
                                                    	</script>
                                                    </ww:if>
                                                </ww:iterator>
                                            </ww:action>
                                        </ww:if>

                                        <ww:if test="$qType == 'SG'">
                                            <ww:action name="'staffgrouplist'">
                                                <ww:param name="'filter'" value="$q"/>
                                                <ww:param name="'max'" value="$max"/>
                                                <ww:param name="'start'" value="$start"/>

                                                <ww:iterator>
                                                    <div id="<ww:property value="id"/>" class="listItem<ww:if test="@SG_LastSelected == id">_selected</ww:if>" onMouseOver="javascript:resultOver(this,1);" onMouseOut="javascript:resultOver(this,0);" onClick="selectResult(this); loadSG(<ww:property value="id"/>);">&nbsp;&nbsp;<img border="0" src="<m:path src="/images/staff-group.gif"/>"> <ww:property value="name"/></div>
                                                    <ww:if test="@SG_LastSelected == id">
                                                    	<script language=javascript>
                                                    		loadSG(<ww:property value="id"/>);
                                                    	</script>
                                                    </ww:if>
                                                </ww:iterator>
                                            </ww:action>
                                        </ww:if>

                                        <ww:if test="$qType == 'UG'">
                                            <ww:action name="'filteredusergrouplist'">
                                                <ww:param name="'filter'" value="$q"/>
                                                <ww:param name="'max'" value="$max"/>
                                                <ww:param name="'start'" value="$start"/>

                                                <ww:iterator>
                                                    <div id="<ww:property value="id"/>" class="listItem<ww:if test="@UG_LastSelected == id">_selected</ww:if>" onMouseOver="javascript:resultOver(this,1);" onMouseOut="javascript:resultOver(this,0);" onClick="selectResult(this); loadUG(<ww:property value="id"/>);">&nbsp;&nbsp;<img border="0" src="<m:path src="/images/user-group.gif"/>"> <ww:property value="name"/></div>
                                                    <ww:if test="@UG_LastSelected == id">
                                                    	<script language=javascript>
                                                    		loadUG(<ww:property value="id"/>);
                                                    	</script>
                                                    </ww:if>
                                                </ww:iterator>
                                            </ww:action>
                                        </ww:if>


                                    </form>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1BoxBot"><table width="*"  border="0" cellpadding="0" cellspacing="0" class="buttonBar">
                        <tr>
                            <td>
                                <m:button label="'staff.add'" onClick="showNewForm();"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>

