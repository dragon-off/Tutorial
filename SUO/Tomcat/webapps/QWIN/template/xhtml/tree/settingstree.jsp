<%@ page import="webwork.action.ActionContext"%>
<%
    // This page recirsivly renders a tree.
    // It uses the session to store the depth information
    request.setAttribute("TAB_DEPTH", new Integer(0));
    request.setAttribute("DIVID", new Integer(0));


%>

<%@ taglib uri="webwork" prefix="ww" %>
<ww:property value="tree" id="tree"/>
<%session.setAttribute("CURRENT_TREE", request.getAttribute("tree"));%>

<table>
    <tr><td><ww:property value="@tree/label"/></td></tr>
    <tr><td>
    <ww:iterator value="@tree/childNodes">
        <ww:include page="node.jsp"/>
    </ww:iterator>
    </td></tr>
</table>