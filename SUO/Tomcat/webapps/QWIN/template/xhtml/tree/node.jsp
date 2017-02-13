<%
    // Get the current tab depth
    Integer i = (Integer)request.getAttribute("TAB_DEPTH");
    int d = i.intValue();

    StringBuffer tabs = new StringBuffer();
    for(int c = 0; c < d; c++){
        tabs.append("&nbsp;&nbsp;&nbsp;&nbsp;");
    }
    d++;

    request.setAttribute("TAB_DEPTH", new Integer(d));
    int divId = ((Integer)request.getAttribute("DIVID")).intValue();
    request.setAttribute("DIVID", new Integer(divId+1));


%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<ww:if test="gridReference != null" id="hasGrid"/>
<div id="Item_<%=divId%>" class="TreeItem"><%=tabs%><NOBR> <img align="center" src="/mole/<ww:property value="image"/>">

<ww:if test="@hasGrid == true">
    <a target="grid"

    <ww:if test="hasActionReference == true">
        onClick="showAction(true, '<ww:property value="actionReference"/>');"
    </ww:if>
    <ww:else>
        onClick="showAction(false, 'no-action.jsp');makeItemActive('Item_<%=divId%>');"
    </ww:else>
    <ww:if test="gridReference/referenceType == 'normal'">href="ss.getgrid.action?gridRef=<ww:property value="gridReference"/>"></ww:if>
    <ww:else>
        href="<ww:property value="gridReference"/>">
    </ww:else>
</ww:if>

<ww:property value="label"/><ww:if test="@hasGrid == true"></a></ww:if></NOBR></div>
<ww:iterator value="childNodes">
    <ww:include page="node.jsp"/>
</ww:iterator>


<%
    // decreses the tab depth
    d--;
    request.setAttribute("TAB_DEPTH", new Integer(d));

%>