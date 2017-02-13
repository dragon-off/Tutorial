<%@ page import="com.qmatic.staff.direct2.Member,
                  webwork.util.ValueStack,
                  webwork.action.ActionContext,
                 com.qmatic.staff.direct2.UserGroup,
                 java.util.List,                 
                 com.qmatic.web.staff.staffmember.StaffMemberForm,
                 com.qmatic.staff.direct2.StaffDAO,
                 com.qmatic.network.User"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%
    Member me = new StaffDAO().getMember(((User)session.getAttribute("QM_USER")).getUsername());
%>
<form name="form1" action="staff.staffmember.dbsavepost.action"></form>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left" valign="top" class="boxMain">
            <div class="col2BoxScroll">
                <table border="0" cellspacing="0" cellpadding="2" class="mainBody">
                    <tr>
                        <td colspan="3">
                            <%--<ww:action name="'usergrouplist'">--%>
                            <h2><m:text key="staff.notmember" default="Not Member of these groups"/></h2>
                            <div style="height: 114px; overflow:auto; border: 1px #000000 solid;">
                            <table width="100%">
                                <%
                                    ActionContext context = ActionContext.getContext();
                                    ValueStack vs = context.getValueStackImpl();
                                    StaffMemberForm member = (StaffMemberForm)vs.findValue("staffMember");
                                    List l = (List)member.getUserGroups();
                                    java.util.Iterator list = l.iterator();
                                    Member dummyMember = new Member();
                                    StaffDAO dao = new StaffDAO();
                                    dummyMember.setId(Integer.parseInt(member.getId()));
                                    List acl = dao.getAccessableUserGroupIds(me);
                                    for(; list.hasNext();){
                                      UserGroup group = (UserGroup)list.next();
                                      if(!group.isMember(dummyMember) && acl.contains(new Integer(group.getId()))){
                                        %>
                                            <tr onClick="addToUserGroup(<%=group.getId()%>,<%=member.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickaddgroup" default="Click to add group"/>">
                                                <td class="listItem_noBorder">
                                                    <%=group.getName()%>
                                                </td>
                                            </tr>
                                        <%
                                      }
                                    }
                                %>
                            </table>
                            </div>
                            <p>
                            <h2><m:text key="staff.alreadymember" default="Already Member of these groups"/></h2>
                            <div style="height: 114px; overflow:auto; border: 1px #000000 solid;">
                            <table width="100%">

                                <%
                                  list = l.iterator();
                                  for(; list.hasNext();){
                                    UserGroup group = (UserGroup)list.next();
                                      if(group.isMember(dummyMember)){
                                        if(!acl.contains(new Integer(group.getId()))){
                                        %>
                                        <tr  class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickremovegroup" default="Click to remove group"/>">
                                            <td style="text-decoration: line-through;" class="listItem_noBorder"><%=group.getName()%></td>
                                        </tr>

                                        <%
                                        } else{
                                        %>
                                        <tr onClick="removeFromUserGroup(<%=group.getId()%>,<%=member.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickremovegroup" default="Click to remove group"/>">
                                            <td class="listItem_noBorder"><%=group.getName()%></td>
                                        </tr>

                                        <%
                                        }
                                      %>
                                      <%
                                    }
                                  }
                                %>

                            </table>
                            </div>
                        <%--</ww:action>--%>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
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



