<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<form action="staff.staffgroup.saveDBFromForm.action" method="POST" name="form1" id="form1" style="margin-bottom: 0px">

    <input type="hidden" name="changed" id="changed" value="<ww:property value="group/changed"/>">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" valign="top" class="boxMain">
                <div class="col2BoxScroll">

                    <table border="0" cellspacing="0" cellpadding="2" class="mainBody">
				                <tr>
				                    <td colspan="3">
				                        <h2><m:text key="staff.groupinformation" default="Group Information"/></h2>
				                    </td>                
				                </tr>
                        <tr align="left" valign="top">
                            <td width="1%" class="label"><label for="name"><m:text key="staff.name" default="Name"/>:</label></td>
                            <td align="left">
                                <input type="text" name="name" class="textfield2" id="name" onChange="setHasChanged();" value="<ww:property value="group/name"/>"/>
                            </td>
                        </tr>
                      <tr align="left" valign="top">
                        <td width="1%" class="label"><label for="canBook"><m:text key="staff.canbookapp" default="Can book appointments"/>: </label></td>
                        <td align="left"><input type="checkbox" name="canBook" value="true" class="checkbox" id="mail" onChange="setHasChanged();"
                            <ww:if test="group/availableForAppointments == true">
                                checked
                            </ww:if>
                            />
                        </td>
                      </tr>

                    </table>


                </div>
            </td>
        </tr>

        <tr>
            <td class="col1BoxBot">
                <table width="100%">
               <tr>
                <td><div id="statusBar" align="left" style="color: #404040;"></div></td>
                <td align="right" >
                <table width="*"  border="0" cellpadding="0" cellspacing="0" align="right" class="buttonBar">
                    <tr>
                        <td>
                            <m:button label="'staff.save'" onClick="document.form1.submit();"/>
                        </td>
                        <td>
                            <m:button label="'staff.cancel'" onClick="document.location.href='../blank.jsp'"/>

                        </td>
                    </tr>
                </table>
                </td>
                </tr>
                </table>
            </td>
        </tr>
    </table>
</form>