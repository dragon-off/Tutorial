<%@ taglib uri="webwork" prefix="ww" %>

<tr>
  <td width="150" class="tdLeft">
    <label><ww:property value="@field/label"/></label>
  </td>
  <td width="300" class="tdRight">
    <ww:iterator value="values">
      <input <ww:if test="@field/isActive == false"> disabled </ww:if> type="radio" value="<ww:property value="value"/>" <ww:if test="value == @field/value"> checked </ww:if> id="<ww:property value="value"/>" name="<ww:property value="name"/>"><label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="description"/></label>
    </ww:iterator>
  </td>
</tr>
