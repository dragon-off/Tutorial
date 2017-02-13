<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<tr>
    <td class="tdLeft"></td>
    <td class="tdRight">
      <ww:if test="@field/param('ref-type') == 'raw'">
				<table width="120" border="0" cellspacing="0" cellpadding="0" class="button" onClick="rawActionButtonClicked('<ww:property value="@field/param('action-script')"/>');">
      </ww:if>
      <ww:else>
				<table width="120" border="0" cellspacing="0" cellpadding="0" class="button" onClick="actionButtonClicked('<ww:property value="name"/>');">
      </ww:else>

					<tr>
						<td width="2" align="left" valign="top"><img src="<m:path src="/images/btn_left.gif"/>" width="2" height="19" /></td>
						<td nowrap class="button" align="center" valign="middle" style="padding-left: 4px; padding-right: 4px;"><ww:property value="@field/label"/></td>
						<td width="3" align="right" valign="top"><img src="<m:path src="/images/btn_right.gif"/>" width="3" height="19" /></td>
					</tr>
				</table>
    </td>
</tr>