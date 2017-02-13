
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2005-apr-15
  Time: 09:49:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
    <title>Database validation rule</title>
    <script language="JavaScript">
        function selectColumn(column) {
            for(i = 0; i < document.ruleForm.column.length; i++){
                if(document.ruleForm.column[i].value == column){
                    document.ruleForm.column[i].selected = true;
                    break;
                }
            }
        }
    </script>
  </head>
  <body>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box">Database validation rule</h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">
                <table style="margin-left:20px">
                <td>

                    <a href="validation.createrule.action">Create new rule</a>
                    <%--<table>
                        <ww:action name="'com.qmatic.web.serversettings.dbvalidation.RuleListAction'">
                            <ww:iterator value="rules">
                                <tr>
                                    <td><a href="validation.getrule.action?id=<ww:property value="id"/>"><ww:property value="id"/></A></td>
                                    <td><ww:property value="table"/>     </td>
                                    <td><ww:property value="column"/>    </td>
                                    <td><ww:property value="filterType"/></td>

                                </tr>
                            </ww:iterator>
                        </ww:action>
                    </table>--%>
                    <form name="ruleForm" action="validation.saverule.action" method="GET">
                        <input type="hidden" name="table" value="CUSTINFO">
                        <input type="hidden" name="id" value="<ww:property value="rule/id"/>">
                        <h2>Database validation rule</h2>
                        <table>
                            <tr><td>Column</td><td>
                                <select name="column">
                                    <option value="Name">Name</option>
                                    <option value="Address">Address</option>
                                    <option value="Town">Town</option>
                                    <option value="ZIPCode">ZIPCode</option>
                                    <option value="State">State</option>
                                    <option value="Country">Country</option>
                                    <option value="Phone">Phone</option>
                                    <option value="Phone2">Phone2</option>
                                    <option value="EMail">EMail</option>
                                    <option value="PINo">PINo</option>
                                    <option value="AccountNo">AccountNo</option>
                                    <option value="CardNum">CardNum</option>
                                    <option value="Title">Title</option>
                                    <option value="RegDate">RegDate</option>
                                    <option value="Born">Born</option>
                                    <option value="VipLevel">VipLevel</option>
                                    <option value="Gender">Gender</option>
                                    <option value="Social">Social</option>
                                    <option value="Family">Family</option>
                                    <option value="Class">Class</option>
                                    <option value="Comments">Comments</option>
                                </select>
                                <SCRIPT LANGUAGE="JavaScript">
                                    selectColumn('<ww:property value="rule/column"/>');
                                </SCRIPT>
                            </td></tr>
                            <tr><td>Filter type</td><td>
                                <select name="filterType">
                                    <option value="1" <ww:if test="rule/filterType == 1"> selected </ww:if>>Mask</option>
                                    <option value="2" <ww:if test="rule/filterType == 2"> selected </ww:if>>Filter</option>
                                    <option value="3" <ww:if test="rule/filterType == 3"> selected </ww:if>>Range</option>
                                </select>
                            </td></tr>

                            <tr><td>Filter value</td><td> <input type="text" name="filterValue" value="<ww:property value="rule/filterValue"/>"></td></tr>
                            <tr><td>Max length  </td><td> <input type="text" name="minLength"   value="<ww:property value="rule/minLength"/>" size="2"></td></tr>
                            <tr><td>Comment     </td><td> <input type="text" name="comment"     value="<ww:property value="rule/comment"/>"   size="30" ></td></tr>
                        </table>
                        <input type="submit" value="Save">
                    </form>

                </td>
                </table>
                </div>
            </td>
        </tr>
    </table>

  </body>
</html>