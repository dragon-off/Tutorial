<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="/exttags.tld" prefix="dscat" %>
<%@ page import = "xbcat.util.*" %>

<dscat:pageheader>All Customers</dscat:pageheader>
<jsp:useBean id="pagescroll" class="ru.view.bean.ScrollPage" scope="session">
</jsp:useBean>
<jsp:setProperty name="pagescroll" property="PageSize" param="psize" />
<html><body>
<%
 Vector menu=pagescroll.getMenu();
 if( pagescroll.page.size() > 0 ) {
%>
<table width="100%" border="0">
<tr>
<td>
 <%= pagescroll.getTotalPages() %>
</td>
<td align="right">
<% if(!pagescroll.isSinglePage()) {
  for(int i=0; i<menu.size(); i++) {
  String href = ((ScrollMenu)menu.elementAt(i)).m_Href;
  String name = ((ScrollMenu)menu.elementAt(i)).m_Name;
  if( href != null ) { %>
  <a href="<%= href %>"><%= name %></a>
<% } else { %>
  <%= name %>
<% }
  }
 } %>
</td>
</tr>
</table></body></html>
