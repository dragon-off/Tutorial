<%@ taglib uri="webwork" prefix="ww" %>

<ww:if test="errors[name]">
    <ww:property id="e" value="true"/>
    </ww:if>
<ww:else>
    <ww:property id="e" value="false"/>
</ww:else>

<tr>
  <td width="150" class="<ww:if test="@e == true">tdLeftError</ww:if><ww:else>tdLeft</ww:else>">
    <label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" for="<ww:property value="name"/>" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="@field/label"/></label>
  </td>
  <td width="300" class="<ww:if test="@e == true">tdRightError</ww:if><ww:else>tdRight</ww:else>">
    <input class="input" <ww:if test="@field/isActive == false"> disabled </ww:if> id="<ww:property value="name"/>" onChange="setHasChanged(true);" size="25" type="text" value="<ww:property value="value"/>" name="<ww:property value="name"/>">
  </td>
</tr>
