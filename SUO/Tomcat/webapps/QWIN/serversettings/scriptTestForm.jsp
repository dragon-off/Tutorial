<html>
<head>

</head>
<body>
<form name="FORM1" method="POST" action="serversettings.script.compile.action">
    <input type="hidden" name="script" value="jj">
</form>
    <script language = "JavaScript">
        document.FORM1.script.value =  parent.grid.document.FORM1.<%=request.getParameter("field")%>.value;
        document.FORM1.submit();
    </script>
</body>
</html>