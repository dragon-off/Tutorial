<%@ taglib uri="webwork" prefix="ww" %>

<html>
    <head>
        <title>Groups</title>
        <LINK REL="StyleSheet" HREF="<%=request.getContextPath()%>/style.css" TYPE="text/css">
    </head>
    <body>

    <h1>Staff group management</h1>

        <table border="0">
            <tr><th>Name</th> <th>Can book</th><th>Remove</th></tr>
            <ww:action name="'staffgrouplist'">
                <ww:iterator>
                    <tr>
                        <td>
                            <a href="staff.staffgroup.getgroup.action?groupId=<ww:property value="id"/>"><ww:property value="name"/></a>
                        </td>
                        <td>
                            <ww:if test="availableForAppointments==true">Yes</ww:if><ww:else>No</ww:else>
                        </td>
                        <td>
                            <a href="staff.staffgroup.remove.action?groupId=<ww:property value="id"/>">Remove</a>
                        </td>
                    <tr>
                </ww:iterator>
            </ww:action>
        </table>
    </body>
</html>


