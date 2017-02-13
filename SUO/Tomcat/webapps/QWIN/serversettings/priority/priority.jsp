<%@ taglib uri="webwork" prefix="ww" %>
<html>
    <head>
        <title>Priority</title>
    </head>
    <body>
        <ww:property value="priority" id="p"/>
        <h2><ww:property value="@p/priorityName"/></h2>
        <h3>Lines</h3>
        <A HREF="priority.createline.action?priorityNo=<ww:property value="@p/priorityId"/>">Add line</A><br>
        <UL>
        <ww:iterator value="@p/lines">
            <LI>
            <ww:if test="type == 0">
                Unsupported type (<ww:property value="orginType"/>)
            </ww:if>
            <ww:else>
                <A HREF="priority.getline.action?lineNo=<ww:property value="lineNumber"/>&priorityNo=<ww:property value="@p/priorityId"/>"><ww:property value="type"/></A>
            </ww:else>
            <A HREF="priority.remline.action?line=<ww:property value="lineNumber"/>&priorityId=<ww:property value="@p/priorityId"/>">Rem</A>
            </LI>
        </ww:iterator>
        </UL>
    </body>
</html>