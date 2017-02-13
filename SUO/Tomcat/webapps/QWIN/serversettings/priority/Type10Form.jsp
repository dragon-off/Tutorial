<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<tr>
  <td class="tdLeft">
    <label onClick="openHelpMessage('priority.category'); return true;">
    	<m:text key="priority.category" default="Category"/>:
    </label>
  </td>
  <td class="tdRight">
    <select name="category" class="sbox" onChange="setHasChanged(true);">
        <ww:bean name="'com.qmatic.web.beans.group.GroupList'">
            <ww:iterator>
                <option value="<ww:property value="ID"/>" <ww:if test="ID == @currentPriorityLine/category"> selected </ww:if>><ww:property value="groupName"/></option>
            </ww:iterator>
        </ww:bean>
    </select>
  </td>
</tr>
<tr>
  <td class="tdLeft">
    <label onClick="openHelpMessage('priority.buttonFrom'); return true;">
    	<m:text key="priority.buttonFrom" default="From Button"/>:
    </label>
  </td>
  <td class=tdRight>
    <select name="firstButton" class="sbox" onChange="setHasChanged(true);">
        <ww:bean name="'com.qmatic.web.beans.button.ButtonList'">
            <ww:iterator>
                <option value="<ww:property value="buttonNumber"/>" <ww:if test="buttonNumber == @currentPriorityLine/firstButton"> selected </ww:if>><ww:property value="buttonName"/></option>
            </ww:iterator>
        </ww:bean>
    </select>
  </td>
</tr>
<tr>
  <td class="tdLeft">
  	<label onClick="openHelpMessage('priority.buttonTo'); return true;">
    	<m:text key="priority.buttonTo" default="To Button"/>:
    </label>
  </td>
  <td class=tdRight>
    <select name="lastButton" class="sbox" onChange="setHasChanged(true);">
        <ww:bean name="'com.qmatic.web.beans.button.ButtonList'">
            <ww:iterator>
                <option value="<ww:property value="buttonNumber"/>" <ww:if test="buttonNumber == @currentPriorityLine/lastButton"> selected </ww:if>><ww:property value="buttonName"/></option>
            </ww:iterator>
        </ww:bean>
    </select>
  </td>
</tr>
