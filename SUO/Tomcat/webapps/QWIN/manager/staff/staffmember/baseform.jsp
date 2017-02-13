<%@ page import="webwork.action.ActionContext,
                 webwork.util.ValueStack"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%
    // Remember the last selected StaffMember
    // This value is used in result.jsp
%>
<ww:property id="login" value="staffMember/login"/>

<form action="staff.staffmember.dbsave.action" method="POST" name="form1" style="margin-bottom: 0px">
<input type="hidden" name="hasChanged" value="<ww:property value="staffMember/hasChanged"/>">
<input type="hidden" name="staffInfoNo" value="<ww:property value="staffMember/id"/>">
<input type="hidden" name="TABBEDPANE_TP_INDEX" value="0">
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td align="left" valign="top" class="boxMain">
        <div class="col2BoxScroll">

            <table border="0" cellspacing="0" cellpadding="2" class="mainBody">
                <tr>
                    <td colspan="3">
                        <h2><m:text key="staff.personalsettings" default="Personal settings"/></h2>
                    </td>
                </tr>
                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="name"><m:text key="staff.name" default="Name"/>:</label></td>
                    <td align="left"  colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="name" class="textfield2" id="name" value="<ww:property value="staffMember/name"/>"/>
                    </td>
                </tr>


                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="logonName"><m:text key="staff.loginname" default="Login name"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="logonName" class="textfield2" id="logonName" value="<ww:property value="staffMember/logonName"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="loginCode"><m:text key="staff.loginCode" default="Login code"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="loginCode" class="textfield2" id="loginCode" value="<ww:property value="staffMember/loginCode"/>"/>
                        <m:button label="'staff.createLoginId'" onClick="createUniqueId();"/>
                    </td>
                </tr>

                <tr align="left" valign="top"><td colspan="2">&nbsp</td></tr>
                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="password"><m:text key="staff.password" default="Password"/>:</label></td>
                    <td align="left" colspan="2">
                    	<m:button label="'staff.setpassword'" onClick="setPassword();"/>
                    </td>
                </tr>
                <tr>
                    <td width="1%" class="label"></td>
                    <td><input onClick="setStatusHasNotBeenSaved();" type="checkbox" name="mustChangePassword" value="1" id="mustChangePassword"<ww:if test="staffMember/mustChangePassword == 1"> checked </ww:if> value="1" id="mustChangePassword"><label for="priority"><m:text key="staff.mustchangepassword" default="Must change password during next logon"/></label></td>

                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="buttonName"><m:text key="staff.buttonName" default="Button name"/>:</label></td>
                    <td align="left" colspan="2">
                        <ww:bean id="buttonList" name="'com.qmatic.web.beans.button.SimpleButtonList'"/>
                        <select name="lockedToButton" onChange="setStatusHasNotBeenSaved();">
                            <option value="0"></option>
                            <ww:iterator value="@buttonList">
                                <option
                                    <ww:if test="staffMember/lockedToButton == buttonNumber"> selected </ww:if>
                                    value="<ww:property value="buttonNumber"/>"><ww:property value="buttonName"/></option>
                            </ww:iterator>
                        </select>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="priority"><m:text key="staff.priority" default="Priority"/>:</label></td>
                    <td align="left" colspan="2">
                        <ww:bean id="priorityList" name="'com.qmatic.web.beans.priority.PriorityList'"/>
                        <select name="lockedToPriority" onChange="setStatusHasNotBeenSaved();">
                            <option value="0"></option>
                            <ww:iterator value="@priorityList">
                                <option
                                    <ww:if test="staffMember/lockedToPriority == priorityId"> selected </ww:if>
                                    value="<ww:property value="priorityId"/>"><ww:property value="priorityName"/></option>
                            </ww:iterator>
                        </select>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><m:text key="staff.loginId" default="Login id"/>:</td>
                    <td align="left" colspan="2">
                        <input disabled type="text" name="loginId" class="textfield2" id="loginId" value="<ww:property value="staffMember/id"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top"><td colspan="2"><hr></td></tr>

                <%--
                username
                login code
                password--%>


                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="address"><m:text key="staff.address" default="Address"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="address" class="textfield3" id="address" value="<ww:property value="staffMember/address"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="town"><m:text key="staff.town" default="Town"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="town" class="textfield2" id="town" value="<ww:property value="staffMember/town"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="zipCode"><m:text key="staff.zipcode" default="ZipCode"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="zipCode" class="textfield1" id="zipCode" value="<ww:property value="staffMember/zipCode"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="phone"><m:text key="staff.phone" default="Phone"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="phone" class="textfield1" id="phone" value="<ww:property value="staffMember/phone"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="email"><m:text key="staff.email" default="Email"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="email" class="textfield3" id="email" value="<ww:property value="staffMember/email"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="PINo"><m:text key="staff.pino" default="PINo"/>:</label></td>
                    <td align="left" colspan="2">
                        <input onChange="setStatusHasNotBeenSaved();" type="text" name="PINo" class="textfield1" id="PINo" value="<ww:property value="staffMember/PINo"/>"/>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="comments"><m:text key="staff.comments" default="Comments"/>:</label></td>
                    <td align="left" colspan="2"><textarea onChange="setStatusHasNotBeenSaved();" name="comments" rows="5" class="textarea3" id="comments"><ww:property value="staffMember/comments"/></textarea></td>
                </tr>

                <tr align="left" valign="top"><td colspan="2"><hr></td></tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="pager"><m:text key="staff.pager" default="Pager name"/>:</label></td>
                    <td align="left" colspan="2">
                        <ww:bean id="pagerList" name="'com.qmatic.web.beans.pager.PagerList'"/>
                        <select name="pager" onChange="setStatusHasNotBeenSaved();">
                            <option value=""></option>
                            <ww:iterator value="@pagerList">
                                <option
                                    <ww:if test="staffMember/pager == ."> selected </ww:if>
                                    value="<ww:property value="."/>"><ww:property value="."/></option>
                            </ww:iterator>
                        </select>
                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="pager"><m:text key="staff.officePrinter" default="Office printer"/>:</label></td>
                    <td align="left" colspan="2">
                        <ww:bean id="printerList" name="'com.qmatic.web.beans.printer.PrinterList'"/>
                        <select name="printer" onChange="setStatusHasNotBeenSaved();">
                            <option value=""></option>
                            <ww:iterator value="@printerList">
                                <option
                                    <ww:if test="staffMember/printer == name"> selected </ww:if>
                                    value="<ww:property value="name"/>"><ww:property value="name"/></option>

                            </ww:iterator>
                        </select>
                    </td>
                </tr>



                <tr>
                    <td><m:text key="staff.ticketButton" default="Ticket button"/></td>
                    <td colspan="2">
                        <ww:bean id="buttonList" name="'com.qmatic.web.beans.button.SimpleButtonList'"/>
                        <select name="buttonName" onChange="setStatusHasNotBeenSaved();" >
                            <option value=""></option>
                            <ww:iterator value="@buttonList">
                                <option
                                    <ww:if test="staffMember/buttonName == buttonName"> selected </ww:if>
                                    value="<ww:property value="buttonName"/>"><ww:property value="buttonName"/></option>
                            </ww:iterator>
                        </select>
                    </td>
                </tr>



                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="webPwd"><m:text key="staff.workStart" default="Work start"/>:</label></td>

                    <td align="left" valign="top" colspan="2">
                        <table cellpadding="0" cellspacing="0">
                            <tr><td valign="bottom"><m:text key="staff.from" default="From"/></td><td></td><td valign="bottom"><m:text key="staff.to" default="To"/></td></tr>
                            <tr>
                                <td valign="top">
                                    <ww:bean name="'webwork.util.Counter'" id="hours">
                                        <ww:param name="'first'" value="0"/>
                                        <ww:param name="'last'" value="23"/>
                                    </ww:bean>

                                    <ww:bean name="'webwork.util.Counter'" id="minutes">
                                        <ww:param name="'first'" value="0"/>
                                        <ww:param name="'last'" value="59"/>
                                    </ww:bean>

                                    <input type="hidden" name="workStart"><br>

                                    <select  name="workStart_hh" onChange="setDate('workStart', true);">
                                        <ww:iterator value="@hours">
                                            <option <ww:if test="staffMember/workStart/hours == ."> selected </ww:if>><ww:property value="."/></option>
                                        </ww:iterator>
                                    </select>
                                    <select name="workStart_mm" onChange="setDate('workStart', true);">
                                        <ww:iterator value="@minutes">
                                            <option <ww:if test="staffMember/workStart/minutes == ."> selected </ww:if>><ww:property value="."/></option>
                                        </ww:iterator>
                                    </select>
                                </td>
                                <td valin="top">
                                    &nbsp;<b>-</b>&nbsp;
                                </td>

                                <td valign="top">
                                    <ww:bean name="'webwork.util.Counter'" id="hours">
                                        <ww:param name="'first'" value="0"/>
                                        <ww:param name="'last'" value="23"/>
                                    </ww:bean>

                                    <ww:bean name="'webwork.util.Counter'" id="minutes">
                                        <ww:param name="'first'" value="0"/>
                                        <ww:param name="'last'" value="59"/>
                                    </ww:bean>

                                    <input type="hidden" name="workEnd"><br>
                                    <select name="workEnd_hh" onChange="setDate('workEnd', true);">
                                        <ww:iterator value="@hours">
                                            <option <ww:if test="staffMember/workEnd/hours == ."> selected </ww:if>><ww:property value="."/></option>
                                        </ww:iterator>
                                    </select>
                                    <select name="workEnd_mm" onChange="setDate('workEnd', true);">
                                        <ww:iterator value="@minutes">
                                            <option <ww:if test="staffMember/workEnd/minutes == ."> selected </ww:if>><ww:property value="."/></option>
                                        </ww:iterator>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="workMax1"><m:text key="staff.workMax1" default="Working limit 1"/>:</label></td>
                    <td align="left" valign="top"  >
                        <table cellspacing="0" cellpadding="0">
                            <tr>
                                <td><input onChange="setStatusHasNotBeenSaved();" size="3" type="text" name="workMax1" class="numfield" id="workMax2" value="<ww:property value="staffMember/workMax1"/>"/></td>
                                <td valign="middle">&nbsp;<m:text key="staff.duringWeeks" default="During weeks"/>&nbsp;</td>
                                <td><input onChange="setStatusHasNotBeenSaved();" size="3"type="text" name="workWeek1" class="numfield" id="workWeek1" value="<ww:property value="staffMember/workWeek1"/>"/></td>
                            </tr>
                        </table>

                    </td>
                    <td>

                    </td>
                </tr>

                <tr align="left" valign="top">
                    <td width="1%" class="label"><label for="workMax2"><m:text key="staff.workMax2" default="Working limit 2"/>:</label></td>
                    <td align="left" valign="top" >
                        <table cellspacing="0" cellpadding="0" >
                            <tr>
                                <td><input  onChange="setStatusHasNotBeenSaved();" size="3" type="text" name="workMax2" class="numfield" id="workMax2" value="<ww:property value="staffMember/workMax2"/>"/></td>
                                <td valign="middle">&nbsp;<m:text key="staff.duringWeeks" default="During weeks"/>&nbsp;</td>
                                <td><input onChange="setStatusHasNotBeenSaved();" size="3"type="text" name="workWeek2" class="numfield" id="workWeek2" value="<ww:property value="staffMember/workWeek2"/>"/></td>
                            </tr>
                        </table>

                     <input OnClick="setStatusHasNotBeenSaved();" type="checkbox" <ww:if test="staffMember/workMonth2==1"> checked </ww:if> name="workMonth2" value="1" id="workMonth2"> <label for="workMonth2"><m:text key="staff.usePresentMonth" default="Use present month instead of weeks"/></label>
                    </td>
                    <td >

                    </td>
                </tr>


            </table>
            <script language="JavaScript">
                setDate("workStart", false);
                setDate("workEnd", false);

                function setPassword() {
            			//document.location.href='password-form.jsp?username=<ww:property value="staffMember/logonName"/>&id=<ww:property value="staffMember/id"/>';
                        document.form1.action="staff.staffmember.getpasswdform.action";
                        document.form1.submit();
                        //document.location.href='staff.staffmember.getpasswdform.action?username=<ww:property value="staffMember/logonName"/>&id=<ww:property value="staffMember/id"/>';

            		}

            </script>
        </div>
    </td>
    </tr>
    <tr>
        <td class="col1BoxBot"style="border-top: 1px solid #BDBDBE">
            <table border=0 width="100%" cellpadding="0" cellspacing="0">
                <td>
                <div id="statusbar" class="statusbarInvisible"></div>
                </td>
                <td>
            <table width="*"  border="0" cellpadding="0" cellspacing="0" align="right" class="buttonBar">
                <tr>
                    <td>
                        <m:button label="'staff.save'" onClick="document.form1.submit();"/>
                    </td>
                    <td>
                        <m:button label="'staff.cancel'" onClick="cancel();"/>
                    </td>
                </tr>
            </table>
            </td>
            </table>
        </td>
    </tr>
</table>
</form>


