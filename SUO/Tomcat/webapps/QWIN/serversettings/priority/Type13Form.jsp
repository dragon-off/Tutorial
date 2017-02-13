<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<tr>
  <td class="tdLeft">
  	<label onClick="openHelpMessage('priority.basedOn'); return true;">
	    <m:text key="priority.basedOn" default="Based on"/>:
	   </label>
  </td>
  <td class="tdRight">
    <select name="basedOn" class="sbox" onChange="setHasChanged(true);">
      <option <ww:if test="@currentPriorityLine/basedOn == 1">  selected </ww:if> value="1"><m:text key="priority.basedOn.custWaiting" default="Customer waiting"/></option>
      <option <ww:if test="@currentPriorityLine/basedOn == 2">  selected </ww:if> value="2"><m:text key="priority.basedOn.estWaitingTime" default="Estimated Waiting time"/></option>
      <option <ww:if test="@currentPriorityLine/basedOn == 3">  selected </ww:if> value="3"><m:text key="priority.basedOn.actWaitingTime" default="Actual Waiting time"/></option>
      <option <ww:if test="@currentPriorityLine/basedOn == 4">  selected </ww:if> value="4"><m:text key="priority.basedOn.openWorkstations" default="Number of open workstations"/></option>
      <option <ww:if test="@currentPriorityLine/basedOn == 5">  selected </ww:if> value="5"><m:text key="priority.basedOn.waitingPerWorkstation" default="Waiting/Workstation"/></option>
      <option <ww:if test="@currentPriorityLine/basedOn == 10"> selected </ww:if> value="10"><m:text key="priority.basedOn.custWaitringCanCall" default="Customer waiting can be called"/></option>
      <option <ww:if test="@currentPriorityLine/basedOn == 11"> selected </ww:if> value="11"><m:text key="priority.basedOn.actWaitingCanCall" default="Actual waiting time can be called"/></option>
    </select>
  </td>
</tr>
<tr>
  <td class="tdLeft">
  	<label onClick="openHelpMessage('priority.buttonsAndLevels'); return true;">
	    <m:text key="priority.buttonsAndLevels" default="Buttons and levels"/>:
	  </label>
  </td>
  <td class=tdRight>
    <div class="scroll" id="btnList"></div>
  </td>
</tr>
<tr>
  <td class="tdLeft">&nbsp;</td>
  <td class="tdRight">

    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
          <select name="availableButtons" class="sbox">
              <ww:bean name="'com.qmatic.web.beans.button.ButtonList'">
                  <ww:iterator>
                      <option value="<ww:property value="buttonNumber"/>" <ww:if test="buttonNumber == @currentPriorityLine/firstButton"> selected </ww:if>><ww:property value="buttonName"/></option>
                        <script language="Javascript">
                            addButtonName('<ww:property value="buttonName"/>');


                        </script>
               </ww:iterator>
              </ww:bean>
          </select>
          <input type="hidden" name="btnMapping">
        </td>
        <td valign="center">
          <m:button label="'priority.add'" onClick="addButton(document.lineForm.availableButtons[document.lineForm.availableButtons.selectedIndex].value, 1);"/>
        </td>
      </tr>
    </table>

  </td>
</tr>
<SCRIPT LANGUAGE="JavaScript">
    <ww:iterator value="@currentPriorityLine/buttonMappings">
        addButton(<ww:property value="button"/>, <ww:property value="level"/>);
    </ww:iterator>
</SCRIPT>
