<%@ page import="com.qmatic.web.tree.TreeState"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%
    TreeState ts = (TreeState)session.getAttribute("TreeState");
    if(ts == null)
        session.setAttribute("TreeState", (ts = new TreeState()));
%>
<SCRIPT LANGUAGE="JavaScript">
    function setToolBar(id){
        alert(id);
    }

</SCRIPT>

<form name="treeForm">
    <input type="hidden" name="selectedId"/>
</form>
<font face="verdana" size="1">
    <ww:property id="root" value="root"/>
    <ww:iterator value="@root/childs">
        <ww:property id="node" value="."/>
        <ww:include page="treeNode.jsp"/>
    </ww:iterator>
</font>