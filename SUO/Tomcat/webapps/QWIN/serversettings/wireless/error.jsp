<%@ taglib uri="mole" prefix="m" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2005-mar-31
  Time: 10:46:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title>Learn error</title>
      <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />

  </head>
  <body>
  	
  	<script language="javascript">
  		function learnRetry() {
  			document.location.href="index.jsp?id=<ww:property value="id"/>";
  		}
  	</script>
          <table width="180" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><m:text key="wterminal.error" default="Error"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">
                    <div style="margin-top: 20px; margin-left: 20px">
                    <m:text key="wterminal.learnError" default="Unable to learn serial number!"/><br><br>
                    	<m:button label="'wterminal.learnErrorRetry'" onClick="learnRetry();"/>
                    </div>

                </div>
            </td>
        </tr>
    </body>
</html>