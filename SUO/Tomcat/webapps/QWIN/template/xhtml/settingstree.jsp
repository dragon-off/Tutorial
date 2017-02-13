<%@ page import="com.qmatic.web.tree.TreeState"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%
    TreeState ts = (TreeState)session.getAttribute("SettingsTreeState");
    if(ts == null)
        session.setAttribute("SettingsTreeState", (ts = new TreeState()));
%> 
<table border="0" width="100%" cellspacing="0" cellpadding="0">
    <font face="verdana" size="1">
        <ww:property id="fileId" value="id"/>
        <ww:property id="root" value="rootNodes"/>
        <ww:iterator value="@root">

           <ww:property id="node" value="."/>
            <ww:include page="settingstreenode.jsp"/>
        </ww:iterator>
    </font>
</table>