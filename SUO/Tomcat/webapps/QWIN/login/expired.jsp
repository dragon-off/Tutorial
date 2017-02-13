<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="mole" prefix="m" %>
<%@ taglib uri="webwork" prefix="ww" %>
<html>
    <head>
        <title>Password expired</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css">

        <script language="JavaScript">
            function submitForm() {

                var psw0 = document.form1.newPassword.value;
                var psw1 = document.form1.newPassword1.value;
                var old = document.form1.oldPassword.value;
                if(psw0 != psw1) {
                    alert("'New password' and 'Re-type password' do not match each other");
                    document.form1.newPassword.value = "";
                    document.form1.newPassword1.value = "";

                } else if(old == psw0){
                    alert("The new password cannot be the same as the old password");
                    document.form1.newPassword.value = "";
                    document.form1.newPassword1.value = "";
                }
                else{
                    document.form1.submit();
                }
            }
        </script>
    </head>
    <body>

    <table width="100%" height="100%">
        <td valign="top">
            <table style="margin-top:50px" align="center" width="300" border="0" cellspacing="0" cellpadding="0"  class="borderedbox">
                <tr>
                    <td class="boxTop"><h3 class="box">Password expired</h3></td>
                 </tr>
                 <tr>
                    <td class="boxMain">
                        <div class="changePasswordBox">
                            <div style="margin-left: 10px; margin-top: 10px">
                                <center><i></i></center>
                                Your password has expired and needs to be reset.
                                <br>
                                <a href="../logout.action">Logout</a>

                                <ww:if test="hasErrorMessages == true">
                                    <br>
                                    <br>
                                    <h2>Error</h2>
                                    <font color="#FF0000">
                                    <ww:iterator value="errorMessages">
                                        <ww:property value="."/><br>
                                    </ww:iterator>
                                    </font>
                                </ww:if>

                                <form action="staff.setpassword2.action" name="form1" method="post">
                                    <input type="hidden" name="username" value="<%=request.getParameter("username")%>">
                                    <table>
                                        <tr><td>Old password:</td><td><input type="password" name="oldPassword"/></td></tr>
                                        <tr><td>New Password:</td><td><input type="password" name="newPassword"/></td></tr>
                                        <tr><td>Re-type password</td><td><input type="password" name="newPassword1"></td></tr>
                                        <tr><td></td><td><m:button label="'staff.setpassword'" onClick="submitForm();"/></td></tr>
                                    </table>
                                    <br>
                                </form>
                            </div>
                        </div>
                    </td>
                  </tr>
              </table>
          </td>
      </table>
    </body>
</html>