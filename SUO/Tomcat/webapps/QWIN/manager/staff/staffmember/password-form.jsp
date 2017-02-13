<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.settings.SettingsManager,
                 com.qmatic.scripting.ScriptManager,
                 com.qmatic.scripting.Script"%>
 <%--
  Created by IntelliJ IDEA.
  User: jonathan
  Date: 2005-jun-15
  Time: 21:15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<html>
  <head>
    <title>Password</title>
        <script language="JavaScript">
            function submitForm() {

                var psw0 = document.form1.newPassword.value;
                var psw1 = document.form1.newPassword1.value;
                if(psw0 != psw1) {
                    alert("'New password' and 'Re-type password' do not match each other");
                    document.form1.newPassword.value = "";
                    document.form1.newPassword1.value = "";

                } else {
                    document.form1.submit();
                }
            }
        </script>
    </head>
  <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
  <body>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><m:text key="staff.password" default="Password"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">
                    <h2 style="margin-left: 20px; margin-top: 20px;">Set password for user <ww:property value="$logonName"/></h2>
                    <ww:if test="hasErrorMessages == true" >
                        <table class="errorMessage" style="margin-left: 20px;">
                            <tr><td><b>ERROR!</b></td></tr>
                             <ww:iterator value="errorMessages">
                                <tr><td><ww:property value="."/></td></tr>
                             </ww:iterator>
                         </table>
                    </ww:if>



                    <form action="staff.staffmember.setpassword.action" name="form1" method="POST">
                        <input type="hidden" name="username" value="<ww:property value="$logonName"/>">
                        <input type="hidden" name="id" value="<ww:property value="$staffInfoNo"/>">
                        <table style="margin-left:  20px">
                            <ww:if test="@QM_USER/hasPolicy('RESET_PASSWORD') != true">
                                <tr><td>Old password</td><td><input type="password" name="oldPassword"></td></tr>
                            </ww:if>
                            <tr><td>New password</td><td><input type="password" name="newPassword"></td></tr>
                            <tr><td>Re-type password</td><td><input type="password" name="newPassword1"></td></tr>
                            <tr><td></td><td><m:button label="'staff.setpassword'" onClick="submitForm();"/></td></tr>
                        </table>
                    </form>
                    <%--
                    <ww:if test="@QM_USER/hasPolicy('RESET_PASSWORD') == true">
                    <form action="staff.staffmember.resetpassword.action" name="form2" method="POST">
                        <input type="hidden" name="username" value="<ww:property value="$logonName"/>">
                        <input type="hidden" name="id" value="<ww:property value="$staffInfoNo"/>">
                        
                            <tr><td></td><td><m:button label="'staff.resetPassword'" onClick="document.form2.submit();"/></td></tr>
                                               

                    </form>
                    </ww:if>--%>

                        </td></tr>
                        </table>
                </div>
            </td>
        </tr>
    </table>
  </body>
</html>