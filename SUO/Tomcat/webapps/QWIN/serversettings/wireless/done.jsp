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
          <table width="180" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><m:text key="wterminal.learnDone" default="Done"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">
                   <div style="margin-top: 20px; margin-left: 20px">
                    <h2><m:text key="wterminal.learnDone" default="Done"/></h2>
                    Terminal: <ww:property value="id"/>
                    Serial: <ww:property value="serial"/>
                    </div>
                </div>
            </td>
        </tr>
    </body>
</html>