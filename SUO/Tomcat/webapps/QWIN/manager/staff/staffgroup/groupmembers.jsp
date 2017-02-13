<%@ page import="com.qmatic.staff.direct2.Member,
                 webwork.util.ValueStack,
                 webwork.action.ActionContext,
                 com.qmatic.staff.direct2.StaffGroup"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%
    ValueStack vs = ActionContext.getContext().getValueStackImpl();
    StaffGroup group = (StaffGroup)vs.findValue("group");
%>
 <table border="0" cellpadding="0" cellspacing="0">
     <tr>
     <td align="left" valign="top" class="boxMain">
        <div class="col2BoxScroll">
         <table border="0" cellspacing="0" cellpadding="0" class="mainBody">
             <td>
                <ww:action name="'stafflist'">
                <h2><m:text key="staff.nonmembersofgroup" default="Non Members of this group"/></h2>
                <div style="height: 115px; overflow:auto; border: 1px #000000 solid;">
                    <table width="100%" cellspacing=0 cellpadding=0>
                        <th class="listHeader" align=left><m:text key="staff.name" default="Name"/></th>
                        <th class="listHeader"><m:text key="staff.loginname" default="Login name"/></th>
                        <ww:iterator value="staffMembers">
                            <%
                                Member sm = (Member)vs.findValue(".");
                                if(!group.isMember(sm)){
                                %>
                                  <tr onClick="addMember(<%=group.getId()%>,<%=sm.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickaddmember" default="Click to add Staff Member"/>">
                                    <td class="listItem_noBorder">
                                        <ww:property value="name"/>
                                    </td>
                                    <td class="listItem_noBorder">
                                        <ww:property value="logonName"/>
                                    </td>
                                  </tr>
                                <%
                            }
                            %>
                        </ww:iterator>
                    </table>
                </div>
                <p>
                <h2><m:text key="staff.alreadymembersofgroup" default="Already Members of this group"/></h2>
                <div style="height: 115px; overflow:auto; border: 1px #000000 solid;">
                    <table width="100%" cellspacing=0 cellpadding=0>
                        <th class="listHeader"><m:text key="staff.name" default="Name"/></th>
                        <th class="listHeader"><m:text key="staff.loginname" default="Login name"/></th>

                            <ww:iterator value="staffMembers">
                                <%
                                Member sm = (Member)vs.findValue(".");
                                    if(group.isMember(sm)){
                                    %>
                                      <tr onClick="removeMember(<%=group.getId()%>,<%=sm.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickremovemember" default="Click to remove Staff Member"/>">
                                        <td class="listItem_noBorder">
                                            <ww:property value="name"/>
                                        </td>
                                        <td class="listItem_noBorder">
                                            <ww:property value="logonName"/>
                                        </td>
                                      </tr>
                                    <%
                                  }
                                  %>

                            </ww:iterator>
                 </table>
                 </div>
                 </ww:action>
                </td>
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
                        <table width="*"  border="0" cellpadding="0" cellspacing="0" align="right" class="buttonBar">
                            <tr>
                                <td>
                                    <m:button label="'staff.save'" onClick="document.location.href='staff.staffgroup.saveDB.action?TABBEDPANE_TP_INDEX=0'"/>
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
        </td>
    </tr>
</table>
