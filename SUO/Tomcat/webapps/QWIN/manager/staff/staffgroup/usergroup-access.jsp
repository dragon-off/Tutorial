<%@ page import="webwork.util.ValueStack,
               webwork.action.ActionContext,
                 java.util.Iterator,
                 java.util.List,
                 com.qmatic.staff.direct2.*"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%
    ValueStack vs = ActionContext.getContext().getValueStackImpl();
    StaffGroup sg = (StaffGroup)vs.findValue("group");
%>
    <ww:action name="'usergrouplist'">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="left" valign="top" class="boxMain">
                    <div class="col2BoxScroll">
                        <table border="0" cellspacing="0" cellpadding="0" class="mainBody">
                            <td>
                                <h2><m:text key="staff.nonmembersofgroup" default="Non-members of this group"/></h2>
                                <div style="height: 115px; overflow:auto; border: 1px #000000 solid;">

                                        <table width="100%">

                                            <%
                                            //Iterator list = (java.util.Iterator)vs.findValue(".");
                                            List l = (List)vs.findValue("list");
                                            //Iterator list = (Iterator)vs.findValue(".");
                                            Iterator list = l.iterator();

                                            for(; list.hasNext();){
                                                UserGroup group = (UserGroup)list.next();
                                                if(!sg.isAccessableFrom(group)){
                                                %>
                                                    <tr onClick="addGroup(<%=group.getId()%>);" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickaddmember" default="Click to add Staff Member"/>">
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

                            <h2><m:text key="staff.alreadymembersofgroupaccess" default="Members and access"/></h2>
                            <div style="height: 115px; overflow:auto; border: 1px #000000 solid;">

                                    <table width="100%">
                                        <%
                                        ACL acl = sg.getAcl();
                                        int i = 0;

                                        //Iterator list = (Iterator)vs.findValue(".");
                                        list = l.iterator();
                                        for(; list.hasNext();){
                                            UserGroup group = (UserGroup)list.next();
                                            if(sg.isAccessableFrom(group)){
                                                int scheduleFlag = 0;
                                                int applointmentFlag = 0;

                                                List entries = acl.getEntries();
                                                for(Iterator e = entries.iterator(); e.hasNext();){
                                                    ACLEntry entry = (ACLEntry)e.next();
                                                    if(entry.getUserGroup().getId() == group.getId()){
                                                        scheduleFlag = entry.getSchedFlag();
                                                        applointmentFlag = entry.getApptFlag();
                                                    }
                                                }

                                                boolean appCanRead = false, appCanSet = false, appCanWrite = false;
                                                boolean staffCanRead = false, staffCanWrite = false;

                                                appCanRead  = ((applointmentFlag & ACL.CALENDAR_READ) == ACL.CALENDAR_READ);
                                                appCanSet   = ((applointmentFlag & ACL.CALENDAR_SET_STATUS) == ACL.CALENDAR_SET_STATUS);
                                                appCanWrite = ((applointmentFlag & ACL.CALENDAR_WRITE)== ACL.CALENDAR_WRITE);
                                                %>

                                                <tr onClick="removeGroup(<%=group.getId()%>)" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="staff.clickremovemember" default="Click to remove Staff Member"/>">
                                                    <td class="listItem_header"><a name="<%=sg.getId()%>_<%=group.getId()%>"></a>
                                                        <%=group.getName()%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%--<form action="staff.staffgroup.setusergroupaccess.action?#<%=sg.getId()%>_<%=group.getId()%>" method="GET" name="f_<%=sg.getId()%>_<%=group.getId()%>">--%>
                                                     <form method="GET" name="f_<%=sg.getId()%>_<%=group.getId()%>">
                                                        <td class="listItem_noBorder">
                                                            <input type="hidden" name="staffGroupId" value="<%=sg.getId()%>">
                                                            <input type="hidden" name="userGroupId" value="<%=group.getId()%>">
                                                            &nbsp;&nbsp;&nbsp;<input type="checkbox"  onClick="setAccess('f_<%=sg.getId()%>_<%=group.getId()%>');" value="ON" name="APP_READ" <%=appCanRead?"CHECKED":""%> <%=appCanSet?"disabled=\"true\"":""%>><m:text key="staff.canbookapp" default="Can read appointments"/><br>
                                                            &nbsp;&nbsp;&nbsp;<input type="checkbox" onClick="setAccess('f_<%=sg.getId()%>_<%=group.getId()%>');" value="ON" name="APP_SET"  <%=appCanSet?"CHECKED":""%> <%=appCanWrite?"disabled=\"true\"":""%>><m:text key="staff.cansetapp" default="Can set appointment status to arrived"/><br>
                                                            &nbsp;&nbsp;&nbsp;<input type="checkbox" onClick="setAccess('f_<%=sg.getId()%>_<%=group.getId()%>');" value="ON" name="APP_WRITE" <%=appCanWrite?"CHECKED":""%>><m:text key="staff.cancreateapp" default="Can create appointments"/>
                                                        </td>
                                                    </form>
                                                <tr>

                                                <%
                                            }
                                        }

                                        %>

                                    </table>
                            </div>
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
                                <td align="center" ></td>
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
</ww:action>
