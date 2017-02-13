<%@ taglib uri="webwork" prefix="ww" %>

<%--<tr><td><label for=""><ww:property value="@field/label"/></label></td><td><input id="<ww:property value="name"/>" onChange="setHasChanged(true);" size="1" type="text" value="<ww:property value="value"/>" name="<ww:property value="name"/>"></td></tr>--%>

        <tr>
            <td width="150" class="tdLeft">
                <label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" for="<ww:property value="name"/>"><ww:property value="@field/label"/></label>
            </td>
            <td width="300" class="tdRight">
                <input id="<ww:property value="name"/>" onChange="setHasChanged(true);" size="1" type="text" value="<ww:property value="value"/>" name="<ww:property value="name"/>">
            </td>
        </tr>

