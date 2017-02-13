<%@ page import="com.qmatic.web.misc.ActiveSessionsList" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Mattiask
  Date: 2008-maj-22
  Time: 13:58:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;" language="java" %>
<html>
  <head><title>Active web sessions</title></head>
  <LINK REL="StyleSheet" HREF="/manager/info/style.css" TYPE="text/css">
  <meta http-equiv="refresh" content="15">

  <body>

  <table class=tableMain cellpadding=5 cellspacing=0 width=10>
      <tr>
          <td class=headerBar align=left colspan=2>
             Active Web Sessions
          </td>
      </tr>

      <tr>
          <td valign="top" colspan="2">

              <table class=tableSection cellpadding=0 cellspacing=0>
                  <tr>
                      <td nowrap class=tdHeaderSection> </td>
                      <td nowrap class=tdHeaderSection>IP address</td>
                      <td nowrap class=tdHeaderSection>User name</td>
                      <td nowrap class=tdHeaderSection>Session id</td>
                  </tr>

                  <% List sessions = ActiveSessionsList.getSessions();
                        for (int i = 0; i < sessions.size(); i++ )
                        {
                            HttpSession s = (HttpSession)sessions.get(i);
                    %>

                      <tr class=trDataRow >
                          <td nowrap class=tdDataRow> <%=i+1%></td>
                          <td nowrap class=tdDataRow> <%=s.getAttribute("IP")%></td>
                          <td nowrap class=tdDataRow> <%=s.getAttribute("USERNAME")%></td>
                          <td nowrap class=tdDataRow> <%=s.getAttribute("SESSION_ID")%></td>
                      </tr>
                  <%}%>
               </table>
          </td>
      </tr>
  <tr>
      <td class=tdCopyright>
          Q-MATIC AB
      </td>
      <td class=tdVersion>
          1.0a
      </td>
  </tr>


  </table>

  </body>
</html>
