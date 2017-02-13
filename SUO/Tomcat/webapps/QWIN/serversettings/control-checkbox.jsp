<%@ taglib uri="webwork" prefix="ww" %>

<tr>
  <td width="150" class="tdLeft">
    <label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="@field/label"/></label>
  </td>
  <td width="300" class="tdRight">
    <input <ww:if test="value == 'true' || value == '1'"> checked </ww:if> class="checkbox" type="checkbox" <ww:if test="@field/isActive == false"> disabled </ww:if> id="<ww:property value="name"/>" value="1" name="<ww:property value="name"/>" onChange="setHasChanged(true);">
  </td>
</tr>
