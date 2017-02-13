<%@ taglib uri="webwork" prefix="ww" %>

<tr>
  <td width="150" class="tdLeft"><label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" for="<ww:property value="name"/>" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="@field/label"/></label></td>
  <td width="300" class="tdRight">
    <%--CONTROL--%>
    <ww:if test="@field/param('size') != null">
      <ww:property value="@field/param('size')" id="size"/>
    </ww:if>
    <ww:else>
      <ww:property value="'1'" id="size"/>
    </ww:else>
    
    <ww:if test="@field/param('multiple') == 'true'">
      <ww:property value="'multiple'" id="multiple"/>
    </ww:if>
    <ww:else>
      <ww:property value="''" id="multiple"/>
    </ww:else>
    <select id="<ww:property value="name"/>" onChange="setHasChanged(true);" name="<ww:property value="name"/>" <ww:property value="@multiple"/> size="<ww:property value="@size"/>" class="sbox">
      <ww:iterator value="values">
        <option  <ww:if test="value == @field/value"> selected </ww:if> value="<ww:property value="value"/>">
          <ww:property value="description"/>
        </option>
      </ww:iterator>
    </select></td>
</tr>
