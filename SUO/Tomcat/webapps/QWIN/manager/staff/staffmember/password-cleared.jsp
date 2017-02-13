<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%--
  Created by IntelliJ IDEA.
  User: Jan Gabrielsson
  Date: 2005-okt-07
  Time: 16:02:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title>Password cleared</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <script language="JavaScript">

            function goBackToPassword(){
                document.form1.submit();
            }
        </script>

  </head>
  <body onload="setTimeout('goBackToPassword();',3000)">
  <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><m:text key="staff.password" default="Password"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">
                    <h2 style="margin-left: 20px; margin-top: 20px;"><m:text key="staff.passwordCleared"/></h2>
                </div>
            </td>
        </tr>
    </table>
    <form action="password-form.jsp" method="POST" name="form1" style="margin-bottom: 0px">
        <input type="hidden" name="logonName" id="logonName" value="<ww:property value="logonName"/>"/>

    </form>


</body>
</html>