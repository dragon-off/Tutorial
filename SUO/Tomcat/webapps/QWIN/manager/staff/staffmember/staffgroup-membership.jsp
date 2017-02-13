      <%@ page import="com.qmatic.staff.direct2.Member,
                       webwork.util.ValueStack,
                       webwork.action.ActionContext,
                       com.qmatic.staff.direct2.StaffGroup,
                       com.qmatic.web.staff.staffmember.StaffMemberForm,
                       java.util.List,
                       java.util.Iterator,
                       com.qmatic.web.staff.staffmember.StaffMemberForm"%>
      <%@ taglib uri="webwork" prefix="ww" %>
      <%@ taglib uri="mole" prefix="m" %>
     <form name="form1" action="staff.staffmember.dbsavepost.action"></form>
     <table border="0" cellpadding="0" cellspacing="0">
         <tr>
         <td align="left" valign="top" class="boxMain">
              <div class="col2BoxScroll">
		            <table border="0" cellspacing="0" cellpadding="2" class="mainBody">
		                <tr>
		                    <td colspan="3">
                            <h2><m:text key="staff.notmember" default="Not Member of these groups"/></h2>
                            <div style="height: 114px; overflow:auto; border: 1px #000000 solid;">

                                <table width="100%">
                                        <%--<ww:action name="'staffgrouplist'">--%>
                                        <%
                                            ActionContext context = ActionContext.getContext();
                                            ValueStack vs = context.getValueStackImpl();
                                            StaffMemberForm member = (StaffMemberForm)vs.findValue("staffMember");

                                            List list = member.getStaffGroups();

                                            Member dummyMember = new Member();
                                            dummyMember.setId(Integer.parseInt(member.getId()));
                                            for(Iterator i = list.iterator(); i.hasNext();){
                                              StaffGroup group = (StaffGroup)i.next();
                                              if(!group.isMember(dummyMember)) {
                                              //if(member !=  null && !member.isMemberOf(group)){
                                                  %>
                                                <tr onClick="addToStaffGroup(<%=group.getId()%>,<%=member.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickaddgroup" default="Click to add group"/>">
                                                    <td class="listItem_noBorder">
                                                        <%=group.getName()%>
                                                  </td>
                                                </tr>
                                                  <%
                                              }
                                            }
                                         %>
                                        <%--</ww:action>--%>
                                </table>
                                </div>
                                <p>
                            <h2><m:text key="staff.alreadymember" default="Already Member of these groups"/></h2>
                            <div style="height: 114px; overflow:auto; border: 1px #000000 solid;">

                                <table width="100%">
                                        <%--<ww:action name="'staffgrouplist'">--%>
                                        <%
                                            for(Iterator i = list.iterator(); i.hasNext();){
                                            StaffGroup group = (StaffGroup)i.next();
                                            if(group.isMember(dummyMember)){

                                            %>
                                                <tr onClick="removeFromStaffGroup(<%=group.getId()%>,<%=member.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickremovegroup" default="Click to remove group"/>">
                                                    <td class="listItem_noBorder">
                                                        <%=group.getName()%>
                                                  </td>
                                                </tr>
                                            <%
                                            }
                                            }
                                         %>
                                        <%--</ww:action>--%>
                                </table>
                                </div>
                                </td>
                                </tr>
								</table>
              </div>
            </td>
        </tr>
    <tr>
        <td class="col1BoxBot"style="border-top: 1px solid #BDBDBE">
            <table border=0 width="100%" cellpadding="0" cellspacing="0">
                <td>
                <div id="statusbar" class="statusbarInvisible"></div>
                </td>
                <td>
            <table width="*"  border="0" cellpadding="0" cellspacing="0" align="right" class="buttonBar">
                <tr>
                    <td>
                        <m:button label="'staff.save'" onClick="document.form1.submit();"/>
                    </td>
                    <td>
                        <m:button label="'staff.cancel'" onClick="cancel();"/>
                    </td>
                </tr>
            </table>
            </td>
            </table>
        </td>
    </tr>
    </table>
