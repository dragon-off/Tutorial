<%@ taglib uri="webwork" prefix="ww" %>

<html>
    <head>
    <title></title>
    </head>
    <body>
        <form action="scheduler.saveitem.action"  method="get">
            <input type="hidden" name="itemId" value="<ww:property value="scheduleItem/id"/>">
            <input type="text" name="name" value="<ww:property value="scheduleItem/name"/>">
            <input type="submit" value="Save">
        </form>
    </body>
</html>