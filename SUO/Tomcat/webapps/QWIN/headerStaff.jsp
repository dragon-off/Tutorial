<%@ taglib uri="mole" prefix="m" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@include file="headerHeader.jsp"%>
<td background="<m:path src="/images/bkg_main-toolbar.gif"/>" class="toolbar">
	<table border="0" cellspacing="0" cellpadding="0">
		<td><img src="<m:path src="/images/toolbar-handle.gif"/>" width="15" height="37" /></td>
		

        <td class="toolbarButton" onMouseOver="this.className='toolbarButton_over';" onMouseOut="this.className='toolbarButton';">
            <img align="top" border="0" height="36" src="<m:path src="/images/staff-management-1.gif"/>">
        </td>




		<ww:if test="@QM_USER/hasPolicy('SERVER_EDITOR') == true">
            <td class="toolbarButton" onMouseOver="this.className='toolbarButton_over';" onMouseOut="this.className='toolbarButton';">
                <a href="<m:path src="/serversettings"/>" target="_top"><img align="top" border="0" height="36" src="<m:path src="/images/settings-editor-0.gif"/>"></a>
            </td>
        </ww:if>
        <ww:else>
            <td>
                <img align="top" border="0" height="36" src="<m:path src="/images/settings-editor-disabled.gif"/>">
            </td>
        </ww:else>


        <ww:if test="@QM_USER/hasPolicy('STATISTICAL_REPORTS') == true">
            <td class="toolbarButton" onMouseOver="this.className='toolbarButton_over';" onMouseOut="this.className='toolbarButton';">
                <a href="<m:path src="/statistics"/>" target="_top"><img align="top" border="0" height="36" src="<m:path src="/images/statistical-reports-0.gif"/>"></a>
            </td>
        </ww:if>
        <ww:else>
            <td>
                <img align="top" border="0" height="36" src="<m:path src="/images/statistical-reports-disabled.gif"/>">
            </td>
        </ww:else>

        <ww:if test="@QM_USER/hasPolicy('MANAGEMENT_SCREENS') == true">
            <td class="toolbarButton" onMouseOver="this.className='toolbarButton_over';" onMouseOut="this.className='toolbarButton';">
                <a href="<m:path src="/manager/info"/>" target="_top"><img align="top" border="0" height="36" src="<m:path src="/images/management-screens-0.gif"/>"></a>
            </td>
        </ww:if>
        <ww:else>
            <td>

                <img align="top" border="0" height="36" src="<m:path src="/images/management-screens-disabled.gif"/>">
            </td>
        </ww:else>



		<td class="toolbarButton" onMouseOver="this.className='toolbarButton_over';" onMouseOut="this.className='toolbarButton';"><a href="<m:path src="/help/Q-WIN.htm"/>" target="_blank"><img align="top" border="0" height="36" src="<m:path src="/images/help-0.gif"/>"></a></td>
        <td width="100%"></td>
        <td align="right"><a href="<m:path src="/logout.action"/>" target="_top" style="color: #000000;text-decoration:none;"><h2><m:text key="logout"/></h2></a></td>
        <td><img src="<m:path src="/images/toolbar-handle.gif"/>" width="15" height="37" /></td>
	</table>
</td>
<%@include file="headerFooter.jsp"%>