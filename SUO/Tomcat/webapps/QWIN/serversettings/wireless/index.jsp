<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2005-mar-31
  Time: 09:35:55
  To change this template use File | Settings | File Templates.
--%>
<%
    String id = request.getParameter("id");
%>
<html>
  <head>
    <title>Wireless</title>
    <script language="JavaScript">
        var progress = 0;
        var progressMax;

        var sleepMillis = 0;
        function showProgress() {
            sleepMillis = 10000 / 100;
            document.learnForm.submit();
            var f = document.getElementById("formDiv");
            f.innerHTML = "<b><m:text key="wterminal.pressButton" default="Press a button on the wireless terminal!"/></b>";
            increaseProgress();
            sleepMillis;
        }

        function increaseProgress() {
            var pb = document.getElementById("progress");
            if(progress <= 100){
                html='<table border="0" cellspacing="0" cellpadding="0" width="100" bgcolor="#EEEEEE">';
                html+='<td>';
                html+='    <table border="0" cellspacing="0" cellpadding="0" width="'+ progress +'" bgcolor="#0000FF">';
                html+='        <td>&nbsp;</td>';
                html+='    </table>';
                html+='</td>';
                html+='</table>';
                pb.innerHTML = html;
                progress++;
                setTimeout(increaseProgress, sleepMillis);
            }
        }

    </script>
    <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />

  </head>

  <body>

        <table width="180" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><m:text key="wterminal.learnWireless" default="Learn wireless terminal"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">

                <div id="formDiv" style="margin-top: 20px; margin-left: 20px">
                    <m:text key="wterminal.learnPressButton" default="Press Learn. When the progress bar starts, press any button on your terminal."/>
                    <form name="learnForm" action="wireless.learn.action" method="GET">
                        ID <input type="hidden" size="2" value="<%=id%>" name="id"><br>
                        <input type="hidden" size="4" value="10000" name="timeout"><br>
                        <input type="button" value="Learn!" onClick="showProgress();">
                    </form>
                </div>
                <div id="progress" style="margin-top: 20px; margin-left: 20px">
                </div>


                </div>
            </td>
        </tr>
    </table>
    <script language="JavaScript">
        showProgress();
    </script>
  </body>
</html>