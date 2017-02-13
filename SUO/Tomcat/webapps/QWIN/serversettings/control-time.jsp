<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<ww:bean name="'com.qmatic.utils.Time'" id="time">
    <ww:param name="'time'" value="value"/>
</ww:bean>

<input type="hidden" name="<ww:property value="name"/>" id="<ww:property value="name"/>" value="<ww:property value="value"/>">

<ww:if test="errors[name]">
    <ww:property id="e" value="true"/>
    </ww:if>
<ww:else>
    <ww:property id="e" value="false"/>
</ww:else>


<tr>
  <td width="150" class="<ww:if test="@e == true">tdLeftError</ww:if><ww:else>tdLeft</ww:else>"><label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" for="<ww:property value="name"/>" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="@field/label"/></label></td>
  <td width="300" class="<ww:if test="@e == true">tdRightError</ww:if><ww:else>tdRight</ww:else>">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>

        <td><select name="<ww:property value="name"/>_hh" id="<ww:property value="name"/>_hh" onChange="setHasChanged(true);setTime('<ww:property value="name"/>');" class="sbox">
                <ww:bean name="'webwork.util.Counter'">
                    <ww:param name="'first'" value="0"/>
                    <ww:param name="'last'" value="23"/>
                    <ww:iterator>
                        <option <ww:if test="@time/hour == .">selected</ww:if> value="<ww:property/>"><m:format value="." format="00"/></option>
                    </ww:iterator>
                </ww:bean>
            </select></td>

        <td>&nbsp;:&nbsp;</td>

        <td><select name="<ww:property value="name"/>_mm" id="<ww:property value="name"/>_mm" onChange="setHasChanged(true);setTime('<ww:property value="name"/>');" class="sbox">
                <ww:bean name="'webwork.util.Counter'">
                    <ww:param name="'first'" value="0"/>
                    <ww:param name="'last'" value="59"/>
                    <ww:iterator>
                        <option <ww:if test="@time/minute == .">selected</ww:if> value="<ww:property/>"><m:format value="." format="00"/></option>
                    </ww:iterator>
                </ww:bean>
            </select></td>

        <td>&nbsp;:&nbsp;</td>

        <td><select name="<ww:property value="name"/>_ss" id="<ww:property value="name"/>_ss" onChange="setHasChanged(true);setTime('<ww:property value="name"/>');" class="sbox">
                <ww:bean name="'webwork.util.Counter'">
                    <ww:param name="'interval'" value="2"/>
                    <ww:param name="'first'" value="0"/>
                    <ww:param name="'last'" value="59"/>
                    <ww:iterator>
                        <option <ww:if test="@time/second == .">selected</ww:if> value="<ww:property/>"><m:format value="." format="00"/></option>
                    </ww:iterator>
                </ww:bean>
            </select></td>
  
      </tr>
    </table>
  </td>
</tr>