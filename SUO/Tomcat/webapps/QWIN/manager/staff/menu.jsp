<%@ taglib uri="webwork" prefix="ww" %>
<menu name="Staff Management" link="http://localhost/user.gif">
    <node name="Staff menbers" link="http://localhost/mole/manager/staff/staffmember/list.jsp">
        <item name="New" link="http://192.168.2.17/mole/manager/staff/staffmember/member.jsp?a=a"/>
        <item name="All members" link="http://localhost/mole/manager/staff/staffmember/list.jsp?a=a"/>
        <ww:action name="'stafflist'" id="list">
            <ww:iterator value="staffMembers">
                <item name="<ww:property value="name"/>" link="http://192.168.2.17/mole/manager/staff/staffmember/staff.member.getmember.action?staffInfoNo=<ww:property value="id"/>"/>
            </ww:iterator>
        </ww:action>
    </node>
    <node name="Staff Groups" link="http://localhost/user.gif">
            <item name="New" link="http://192.168.2.17/mole/manager/staff/staffgroup/group.jsp?a=a"/>
            <item name="All groups" link="http://192.168.2.17/mole/manager/staff/staffgroup/list.jsp?a=a"/>
            <ww:action name="'staffgrouplist'">
                <ww:iterator>
                    <item name="<ww:property value="name"/>" link="http://192.168.2.17/mole/manager/staff/staffgroup/staff.staffgroup.getgroup.action?groupId=<ww:property value="id"/>"/>
                </ww:iterator>
            </ww:action>
    </node>

    <node name="User Groups" link="http://localhost/user.gif">
        <item name="New" link="http://192.168.2.17/mole/manager/staff/usergroup/group.jsp?a=a"/>    
        <item name="All groups" link="http://192.168.2.17/mole/manager/staff/usergroup/list.jsp?a=a"/>

        <ww:action name="'usergrouplist'">
            <ww:iterator>
                <item name="<ww:property value="name"/>" link="http://192.168.2.17/mole/manager/staff/usergroup/staff.usergroup.getgroup.action?groupId=<ww:property value="id"/>"/>
            </ww:iterator>
        </ww:action>
    </node>

</menu>

