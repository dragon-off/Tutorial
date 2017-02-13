<%@ page import="com.qmatic.staff.direct2.Member,
                 webwork.util.ValueStack,
                 webwork.action.ActionContext,
                 com.qmatic.staff.direct2.UserGroup"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
    ValueStack vs = ActionContext.getContext().getValueStackImpl();
    UserGroup group = (UserGroup)vs.findValue("group");
%>
<%--
<h1>Not Members of this groups</h1>
<IFRAME name="nonmembers" SRC="staff.usergroup.getexclmembers.action?groupId=<%=group.getId()%>" WIDTH=400 HEIGHT=150></IFRAME>

<p>
<h1>Already Members of this groups</h1>
<IFRAME name="members" SRC="staff.usergroup.getinclmembers.action?groupId=<%=group.getId()%>" WIDTH=400 HEIGHT=150></IFRAME>

<p>
    --%>
 <table border="0" cellpadding="0" cellspacing="0">
     <tr>
     <td align="left" valign="top" class="boxMain">
        <div class="col2BoxScroll">
	         <table border="0" cellspacing="0" cellpadding="0" class="mainBody">
	             <td>

                        <ww:action name="'stafflist'">
                        <h2><m:text key="staff.nonmembersofgroup" default="Non Members of this group"/></h2>
                        <div style="height: 115px; overflow:auto; border: 1px #000000 solid;">
	                    <table width="100%">


                                <ww:iterator value="staffMembers">

                                    <%
                                    Member member = (Member)vs.findValue(".");
                                    if( group != null && !group.isMember(member)){
                                    %>
				                        <tr onClick="addMember(<%=group.getId()%>,<%=member.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickaddmember" default="Click to add Staff Member"/>">
				    	                    <td class="listItem_noBorder">
                                                <ww:property value="name"/>
                                            </td>
                                        </tr>
                                <%  }%>
                                </ww:iterator>

                        </table>
                        </div>
	                    <p>
                        <h2><m:text key="staff.alreadymembersofgroup" default="Already Members of this group"/></h2>
                        <div style="height: 115px; overflow:auto; border: 1px #000000 solid;">
	                    <table width="100%">
                            <ww:iterator value="staffMembers">
                                <%
                                Member member = (Member)vs.findValue(".");
                                if(group != null && group.isMember(member)) {
                                %>
							        <tr onClick="removeMember(<%=group.getId()%>,<%=member.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickremovemember" default="Click to remove Staff Member"/>">
							    	    <td class="listItem_noBorder">
											    <ww:property value="name"/>
										</td>
									</tr>

                                <%  }%>
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
                                    <m:button label="'staff.save'" onClick="document.location.href='staff.usergroup.saveDB.action?TABBEDPANE_TP_INDEX=0'"/>
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
