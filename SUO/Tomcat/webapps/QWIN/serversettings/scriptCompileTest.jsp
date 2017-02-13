<%@ taglib uri="webwork" prefix="ww" %>
<html>
<head>
<title>Script Compiler result</title>
</head>
<body>
<script language="JavaScript">
    <ww:if test="hasErrorMessages == true">

            <ww:iterator value="errorMessages">
                alert('<ww:property/>');
            </ww:iterator>

    </ww:if>
    <ww:else>
        alert("Test succeeded!");
    </ww:else>
    </script>
</body>
</html>