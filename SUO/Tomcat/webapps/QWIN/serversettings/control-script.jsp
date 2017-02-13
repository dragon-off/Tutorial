<%@ page import="com.qmatic.ConnectionContext,
                 com.qmatic.scripting.TemplateManager,
                 java.util.List,
                 java.util.Iterator,
                 com.qmatic.scripting.TemplateSection"%>
<%@ taglib uri="webwork" prefix="ww" %>

<tr>
  <td colspan="2" class="tdLabel">
    <label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" for="<ww:property value="name"/>" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="@field/label"/></label>
  </td>
</tr>
<tr>
  <td colspan="2" style="padding-left: 0px;">
    <div id="<ww:property value="name"/>_FRAME"  style="padding: 5px;">
      <textarea
             ONSELECT="storeCaret(this);"
             ONCLICK="storeCaret(this);"
             ONKEYUP="storeCaret(this);"
             onChange="setHasChanged(true);"
             style="height: 40px; width: 450px;" name="<ww:property value="name"/>" id="<ww:property value="name"/>" onFocus="showScriptPanel('<ww:property value="name"/>',true);"><ww:property value="value"/></textarea><br>
      <div style="position: absolute; margin-bottom: 10px; margin-right:0px;margin-left:0px; margin-top:0px; padding:5px; visibility: hidden; width: 450px;" id="<ww:property value="name"/>_PANEL">
        <input value="Done" type="button" onClick="showScriptPanel('<ww:property value="name"/>',false);">
      </div>
    </div>
  </td>
</tr>




