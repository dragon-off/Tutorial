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

    TreeState ts = (TreeState)session.getAttribute("SettingsTreeState");

    //ValueStack vs = ActionContext.getContext().getValueStackImpl();
    //TreeDecorator decorator = (TreeDecorator)vs.findValue("decorator");
    StringBuffer spaces = new StringBuffer();
    for(int i = 0; i <= tc; i++){
        //out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
        spaces.append("&nbsp;&nbsp;&nbsp;&nbsp;");
    }
%>


<tr>
    <td>
        <%=spaces%><img border="0" src="/mole/images/cross.gif">
        <!--<font color="#808080" face="verdana" size="1"><b>-->
        <ww:if test="@node/settingsSet">
            <ww:property value="@node/settingsSet" id="ss"/>
            <a target="grid" href="serversettings.getgrid.action?id=<ww:property value="@fileId"/>&leafId=<ww:property value="@ss/id"/>&type=S">
            <ww:property value="@node/label"/></a>
        </ww:if>
        <ww:else>
            <ww:property value="@node/label"/>
        </ww:else>
        </b></font>
    </td>
</tr>
<ww:iterator value="@node/childLeafs">
    <tr>
        <td style="font-size: 12px">
            <font face="verdana" size="1"><%=spaces%>&nbsp;&nbsp;&nbsp;&nbsp; <img border="0" src="/mole/images/dot.gif"> <a target="grid" href="serversettings.getgrid.action?id=<ww:property value="@fileId"/>&leafId=<ww:property value="id"/>&type=L"><ww:property value="label"/></a></font>
        </td>
    </tr>
</ww:iterator>
<ww:iterator value="@node/childNodes"><ww:property value="." id="node"/><ww:include page="settingstreenode.jsp"/></ww:iterator>

<%request.setAttribute("tab", String.valueOf(--tc));%>

