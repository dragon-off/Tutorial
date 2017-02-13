<%--
  Created by IntelliJ IDEA.
  User: jonathan
  Date: 2005-jun-30
  Time: 10:59:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="mole" prefix="m" %>
<html>
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <title>Upload font</title>
    </head>
    <body>
        <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
            <tr>
                <td class="boxTop"><h3 class="box"><m:text key="utilities.uploadDisplayFonts" default="Upload display fonts"/></h3></td>
            </tr>
            <tr>
                <td class="boxMain">
                    <div class="settingsGridScroll">
                        <form action="ss.font.upload.action">
										        <table border="0" cellspacing="0" cellpadding="0" style="margin-left: 10px; margin-top: 10px;">
										        	<td>
		                            <m:button label="'utilities.uploadFonts'" onClick="submit();"/>
                            	</td>
                            </table>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>