<%@ taglib uri="mole" prefix="m" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    </head>
    <body>
        <form name="sf" action="result.jsp" target="result">
            <input type="hidden" name="start" value="0"/>
            <input type="hidden" name="max" value="10"/>
            <input type="radio" name="qType" checked value="SM" id="SM"/><label for="SM">Staff Members</label><br/>
            <input type="radio" name="qType" value="SG" id="SG"/><label for="SG">Staff Groups</label><br/>
            <input type="radio" name="qType" value="UG" id="UG"/><label for="UG">User Groups</label><p/>
            <input type="text" size="22" name="q"> <input value="Find!" name="smt" type="submit"/>
        </form>
    </body>
</html>
