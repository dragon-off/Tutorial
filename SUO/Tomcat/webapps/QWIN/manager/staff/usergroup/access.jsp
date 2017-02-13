<%--
  Created by IntelliJ IDEA.
  User: jonathan
  Date: 2005-nov-10
  Time: 13:01:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td align="left" valign="top" class="boxMain">
        <div class="col2BoxScroll">
            <table border="0" cellspacing="0" cellpadding="0" class="mainBody">
                <td>
                <form name="UGACCESSFORM" action="staff.usergroup.saveDBFromAccess.action">
                    <input type="hidden" name="TABBEDPANE_TP_INDEX" value="2">
                    <h2><m:text key="staff.adminByGroupMembers" default="This group can be administrated by members of the following groups"/></h2>
                        <ww:property value="group/userGroupACL" id="acl"/>
                        <ww:action name="'usergrouplist'">
                            <ww:iterator>
                                <ww:property value="id" id="ugid"/>
                                <input type="checkbox" name="UGACC" value="<ww:property value="id"/>" id="UGACC_<ww:property value="id"/>"
                                <ww:if test="@acl/contains(@ugid) == true">
                                    checked
                                </ww:if>
                                ><label for="UGACC_<ww:property value="id"/>"><ww:property value="name"/></label>
                                <br>
                            </ww:iterator>
                        </ww:action>
                    </form>
                </td>
            </table>
        </div>
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
                                    <m:button label="'staff.save'" onClick="document.UGACCESSFORM.submit();"/>
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