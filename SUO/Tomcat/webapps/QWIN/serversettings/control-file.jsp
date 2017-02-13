<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<tr>
  <td width="150" class="tdLeft">
    <label onClick="openHelpMessage('<ww:property value="@field/helpId"/>'); return true;" for="<ww:property value="name"/>" onMouseOut="hideHelpMessage(); return true;" onMouseOver="showHelpMessage('<ww:property value="@field/helpId"/>');return true;"><ww:property value="@field/label"/></label>
  </td>
  <td width="300" class="tdRight">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><input class="input" size="25"  id="<ww:property value="name"/>" name="<ww:property value="name"/>"  type="text" value="<ww:property value="value"/>"></td>
        <td valign="bottom">
          <table width="80"  border="0" cellspacing="0" cellpadding="0" class="button" onClick="openFileBrowser('<ww:property value="name"/>');">
            <tr>
              <td width="2" align="left" valign="top"><img src="/images/btn_left.gif" width="2" height="19" /></td>
              <td class="button" align="center" valign="middle"><m:text key="file.browse" default="Browse"/></td>
              <td width="3" align="right" valign="top"><img src="/images/btn_right.gif" width="3" height="19" /></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </td>
</tr>
