<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.network.User,
                 java.util.List,
                 java.util.Iterator,
                 webwork.action.ActionContext,
                 com.qmatic.staff.direct2.StaffDAO,
                 com.qmatic.staff.direct2.Member,
                 com.qmatic.web.staff.usergroup.PolicyUtils"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%
    PolicyUtils pu = new PolicyUtils();
%>
<form action="staff.usergroup.saveDBFromForm.action" method="POST" name="form1" id="form1" style="margin-bottom: 0px">
    <input type="hidden" name="changed" id="changed" value="<ww:property value="group/changed"/>">

<table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" valign="top" class="boxMain">
                <div class="col2BoxScroll">
                    <table border="0" cellspacing="0" cellpadding="0" class="mainBody">
                        <tr align="left" valign="top">
                            <td width="1%" class="label"><label for="name"><m:text key="staff.name" default="Name"/>:</label></td>
                            <td align="left">
                                <input type="text" name="name" class="textfield2" id="name" onChange="setHasChanged();"
                                    <ww:if test="group != null">
                                        value="<ww:property value="group/name"/>"
                                    </ww:if>
                                    <ww:else>
                                        value="New User Group"
                                    </ww:else>
                                    >
                            </td>
                        </tr>
                        <ww:if test="group != null">
                            <tr>
                                <td colspan="2"><h2><m:text key="staff.usergroupspolicy" default="User group policy"/></h2></td>
                            </tr>
                                <ww:iterator value="group/policy/policyGroups">
                                    <ww:property id="groupName" value="name"/>
                                    <%if(pu.hasPolicyGroup("name")){%>
                                    <tr align="left" valign="top">
                                        <td align="left" colspan="2" bgcolor="#EEEEEE">
                                            <input type="checkbox" onClick="selectAll('<ww:property value="name"/>', this.checked);" id="<ww:property value="name"/>" name="<ww:property value="name"/>" value="true" onChange="setHasChanged();"
                                                <ww:if test="enabled == true">
                                                    checked
                                                </ww:if>
                                                />

                                             <b><label for="<ww:property value="name"/>">

                                            <m:vstext key="description" default="description" /></label></b>

                                        </td>
                                    </tr>
                                    <%}%>
                                    <%
                                        int counter = 0;
                                    %>
                                    <ww:property id="groupName" value="name"/>
                                    <ww:iterator value="children">
                                        <%if(pu.hasPolicy("@groupName", "name")){%>
                                        <tr><td colspan="2">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input onClick="setParentState('<ww:property value="@groupName"/>', this.checked);" id="<ww:property value="@groupName"/>_<%=counter%>" value="true" type="checkbox" name="<ww:property value="name"/>" onChange="setHasChanged();"
                                            <ww:if test="enabled == true">
                                                checked
                                            </ww:if>
                                            />

                                            <label for="<ww:property value="@groupName"/>_<%=counter%>"><m:vstext key="description" default="description" /></label>
                                            <%counter++;%>
                                        </td></tr>
                                        <%}%>
                                    </ww:iterator>
                                   <script language="Javascript">
                                        //setInitState('<ww:property value="@groupName"/>');
                                    </script>

                                </ww:iterator>
                                <%--<tr>
                                    <td align="left" colspan="2" bgcolor="#EEEEEE">
                                        <h2>User group access</h2>
                                    </td>
                                </tr>
                                <ww:action name="'usergrouplist'">
                                    <ww:iterator>
                                        <tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"><ww:property value="name"/></td></tr>
                                    </ww:iterator>
                                </ww:action>--%>
                        </ww:if>
                    </table>
                 </div>
            </td>
        </tr>
        <tr>
            <td class="col1BoxBot">
               <table width="100%">
               <tr>
                <td><div id="statusBar" align="left" style="color: #404040;"></div></td>
                <td align="right" >
                    <table width="*"  border="0" cellpadding="0" cellspacing="0" align="right" class="buttonBar">
                    <tr>

                        <td>
                            <m:button label="'staff.save'" onClick="document.form1.submit();"/>
                        </td>
                        <td>
                            <m:button label="'staff.cancel'" onClick="document.location.href='../blank.jsp'"/>
                        </td>
                    </tr>
                </table>


                </td>

               </tr>

               </table>



            </td>
        </tr>
     </table>
     </form>
