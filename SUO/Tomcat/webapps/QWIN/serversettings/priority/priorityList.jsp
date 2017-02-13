<%@ taglib uri="webwork" prefix="ww" %>
<html>
    <head>
        <title>Priority</title>
    </head>
    <body>
        <ww:property value="priorities" id="p"/>
        <h3>Priorities</h3>
        x<UL>
        <ww:iterator value="@p">
            <LI><A HREF="priority.get.action?priorityNo=<ww:property value="priorityId"/>"><ww:property value="priorityName"/></A></LI>
        </ww:iterator>
        </UL>
    </body>
</html>