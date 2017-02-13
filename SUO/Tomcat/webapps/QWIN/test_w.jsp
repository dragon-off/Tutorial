<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.network.User,
                 com.qmatic.web.i18n.Language,
java.net.InetAddress,
java.net.UnknownHostException"%>
<%@ taglib uri="mole" prefix="m" %>

 <%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2005-mar-23
  Time: 13:30:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
  
  
  
  <title>Index</title>
  <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css">
  <style type="text/css">
        body { background: #A5A2A5; }
  </style>
  </head>
  <body >

        
</td>

	</table>

    <table border="0" height="80%" width="100%">

    <tr><td>

        <table  cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td colspan="3" width='498' height='78' background="images/start_top.gif">
			<table  cellpadding="0" cellspacing="0" width='498' height='78' align="center">
			<tr>
			<td width='290'></td>
			<td style='color: 72e118;text-align: right;vertical-align: top;padding-top: 3px; padding-right: 5px;'>
			        <%

            User user = (User)session.getAttribute("QM_USER");
            out.println(Language.getInstance().getText("general.user") + ": " + user.getUsername() + "<br>");
            
        %>
			</td>
			</tr>
			</table>
			</td>
          </tr>
          <tr>

            <td class="startButton" bgcolor='#ccffad'>
              <table border="0" cellpadding="0" cellspacing="0" align="center">
                  <ww:if test="@QM_USER/hasPolicy('STAFF_MANAGEMENT') == true">
                    <td>
                  </ww:if>
                  <ww:else>
                    <td>
                  </ww:else>
                  <ww:if test="@QM_USER/hasPolicy('STAFF_MANAGEMENT') == true"><a href="manager/staff"><img  border="0" src="images/start_staff_reg.gif"></a></ww:if><ww:else><img  border="0" src="images/start_staff_reg_disabled.gif"></ww:else></td>
                </table>
              </td>

            <td class="startButton" bgcolor='#ccffad'>
              <table border="0" cellpadding="0" cellspacing="0" align="center">
                  <ww:if test="@QM_USER/hasPolicy('SERVER_EDITOR') == true">
                    <td>
                  </ww:if>
                  <ww:else>
                    <td>
                  </ww:else>
                  <ww:if test="@QM_USER/hasPolicy('SERVER_EDITOR') == true"><a href="serversettings"><img border="0" src="images/start_sys_conf.gif"></a></ww:if><ww:else><img border="0" src="images/start_sys_conf_disabled.gif"></ww:else></td>
                </table>
              </td>

           
          </tr>
          <tr>

            <td class="startButton" bgcolor='#ccffad'>
              <table border="0" cellpadding="0" cellspacing="0" align="center">
                  
                    <td>
                  <a href="/touchscreens/bossallview/index.qsp2"><img border="0" src="images/start_manage.gif"></a></td>
                </table>
              </td>

            <td class="startButton" bgcolor='#ccffad'>
               <table border="0" cellpadding="0" cellspacing="0" align="center">
                  
                    <tr>
                  
                    <td>
                  <img style="cursor:pointer;" onClick="document.location.href='http://'+window.location.hostname+':8080/';" border="0" src="images/start_stat_rep.gif"></td></tr>
                </table>
              </td>

          </tr>
          <tr>
          
            <td class="startButton" bgcolor='#ccffad'>
      <table border="0" cellpadding="0" cellspacing="0" align="center">
                <td>
                 <a href="/sber/index.qsp"> <img border="0" src="<m:path src="/images/webterm.gif"/>"></a></td>
              </table>
            </td>

            <td class="startButton" bgcolor='#ccffad'>
                   <table border="0" cellpadding="0" cellspacing="0" align="center">
                  
                    <tr>
                  
                    <td>
                  <img style="cursor:pointer;" onClick="document.location.href='/logout.action';" border="0" src="images/exit.gif"></td></tr>
                </table> 
            </td>
            
          </tr>
          <tr>
            <td colspan="2" background="images/start_bottom_left.gif" height=34 >&nbsp;
			
								<%

						
						out.println(Language.getInstance().getText("general.serverVersion") + ": " + ConnectionContext.getConnection().getVersion()+"  "+request.getRemoteAddr());
					%>
</td>
          </tr>

        </table>
    </td>
    </tr>
    <tr>
    <td>

    </td>
    </tr>
    </table>
<!--<ww:if test="@QM_USER/hasPolicy('LST_USE_CALL1') == true">true</ww:if><ww:else>false</ww:else>
LST_USE_CALL1-->
    </body>
</html>

