<%@ taglib uri="webwork" prefix="ww" %>
<ww:property value="settingsSet" id="set"/>
<ww:iterator value="@set/settings">
    <ww:property value="selectedValue"/><br>
</ww:iterator>