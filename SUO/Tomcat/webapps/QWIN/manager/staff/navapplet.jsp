<%@ taglib uri="webwork" prefix="ww" %>
<html>
<head>
<LINK REL="StyleSheet" HREF="<%=request.getContextPath()%>/style.css" TYPE="text/css">
</head>
<body bgcolor="#EEEEEE">
<%--
<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
    width="200" height="400" align="middle"
    codebase="http://java.sun.com/products/plugin/1.2/
         jinstall-12-win32.cab#Version=1,2,0,0">
    <PARAM NAME="code" VALUE="NavigationApplet.class">
    <PARAM NAME="archive" VALUE="sNav.jar">
    <PARAM NAME="XMLFILE" VALUE = "http://192.168.2.17/mole/manager/staff/menu.jsp">
    <PARAM NAME="target" VALUE="main">
  </OBJECT>

    --%>


<h1>Staff Management</h1>
   <h1><a target="main" href="http://localhost/mole/manager/staff/staffmember/list.jsp">Staff members</a></h1>
       <a target = "main" href="http://192.168.2.17/mole/manager/staff/staffmember/member.jsp">New</a><br>

        <ww:action name="'stafflist'" id="list">
            <ww:iterator value="staffMembers">
                <a target="main" href="http://192.168.2.17/mole/manager/staff/staffmember/staff.member.getmember.action?staffInfoNo=<ww:property value="id"/>"><ww:property value="name"/></a><br>
            </ww:iterator>
        </ww:action>
<hr>
    <h1><a target="main" href="http://192.168.2.17/mole/manager/staff/staffgroup/list.jsp">Staff Groups</a></h1>
    <a target="main" href="http://192.168.2.17/mole/manager/staff/staffgroup/group.jsp?a=a"/>New</a><br>

            <ww:action name="'staffgrouplist'">
                <ww:iterator>
                    <a target="main" href="http://192.168.2.17/mole/manager/staff/staffgroup/staff.staffgroup.getgroup.action?groupId=<ww:property value="id"/>"><ww:property value="name"/></a><br>
                </ww:iterator>
            </ww:action>
    </node>
    <hr>
    <h1><a target="main" href="http://192.168.2.17/mole/manager/staff/usergroup/list.jsp">User Groups</a></h1>
        <a target="main" href = "http://192.168.2.17/mole/manager/staff/usergroup/group.jsp">New</a><br>


        <ww:action name="'usergrouplist'">
            <ww:iterator>
                <a target="main" href="http://192.168.2.17/mole/manager/staff/usergroup/staff.usergroup.getgroup.action?groupId=<ww:property value="id"/>"><ww:property value="name"/></a><br>
            </ww:iterator>
        </ww:action>
    </node>




</body>
</html>

