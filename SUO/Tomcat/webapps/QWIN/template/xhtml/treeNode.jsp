<%@ page import="com.qmatic.web.tree.TreeState,
                 webwork.action.ActionContext,
                 webwork.util.ValueStack,
                 com.qmatic.web.tree.TreeDecorator,
                 com.qmatic.web.tree.Node"%>
<%@ taglib uri="webwork" prefix="ww" %>

<%
    Object tabCount;
    int tc = -1;
    if((tabCount = request.getAttribute("tab")) != null){
        tc = Integer.parseInt(tabCount.toString());
        tc++;
    }

    request.setAttribute("tab", String.valueOf(tc));

    TreeState ts = (TreeState)session.getAttribute("TreeState");

    ValueStack vs = ActionContext.getContext().getValueStackImpl();
    TreeDecorator decorator = (TreeDecorator)vs.findValue("decorator");
    for(int i = 0; i <= tc; i++){
        out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
    }
%>

<ww:if test="@node/leaf == true">
    <a href="<ww:property value="@node/link/url"/>" target="main">
    <%=decorator.getLabel(ts, (Node)vs.findValue("@node"), false, false)%>
</a><br>
</ww:if>
<ww:else>
<%
    boolean isOpen = ts.isOpen(vs.findValue("@node/identifier").toString());
%>
 <b><a  href="utils.navigation.tree.settreestate.action?nodeId=<ww:property value="@node/identifier"/>">
<%=decorator.getLabel(ts, (Node)vs.findValue("@node"), isOpen, false)%>
</a></b><br>
</ww:else>
    <%
        if(ts.isOpen(vs.findValue("@node/identifier").toString())){
    %>
<ww:iterator value="@node/childs">
    <ww:property id="node" value="."/>
    <ww:include page="treeNode.jsp"/>
</ww:iterator>
    <%
        }
    %>

<%request.setAttribute("tab", String.valueOf(--tc));%>


