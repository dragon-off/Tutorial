<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<ww:bean name="'com.qmatic.utils.Time'" id="time">
    <ww:param name="'time'" value="matter/time"/>
</ww:bean>

<html>
  <head>
    <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
    <script language="JavaScript">
			<%@ include file="../javascripts.jsp"%>

      function setTime() {
        var hh = document.FORM1.hh[document.FORM1.hh.selectedIndex].value;
        var mm = document.FORM1.mm[document.FORM1.mm.selectedIndex].value;
        var ss = document.FORM1.ss[document.FORM1.ss.selectedIndex].value;
        var s = (hh * 60 * 60) + (mm * 60) + (1 * ss);
        document.FORM1.time.value = Math.round(s/2);
      }

      <ww:if test="$reload == true">

          parent.tree.document.location.reload();
      </ww:if>
    </script>

    <style>
      .tdLabel {
          border-left: 1px solid #E0E0E0;
          border-bottom: 1px solid #E0E0E0;
          border-right: 1px solid #E0E0E0;
          padding-left: 5px;
      }
      .tdLeft {
          border-left: 1px solid #E0E0E0;
          border-bottom: 1px solid #E0E0E0;
          border-right: 1px solid #E0E0E0;
          padding-left: 5px;
          width: 150px;
      }
      .tdRight {
          border-right: 1px solid #E0E0E0;
          border-bottom: 1px solid #E0E0E0;
          padding-left: 5px;
          width: 300px;
      }
      .input {
          border: 1px solid #808080;
          width: 250 px;
       }
    </style>
  </head>
  <body>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">

      <form action="matter.savematter.action" method="POST" name="FORM1">
		    <input type="hidden" name="HARD_SAVE" value="false">
        <tr>
          <td class="boxTop"><h3 class="box"><m:text key="matter.matterCodes" default="Matter Codes"/></h3></td>
        </tr>
        <tr>
          <td class="boxMain">
            <div class="settingsGridScroll">
                <ww:if test="hasErrorMessages == true" >
                    <table class="errorMessage" style="margin-left: 20px;">
                        <ww:iterator value="errorMessages">
                            <tr><td><ww:property value="."/></td></tr>
                        </ww:iterator>
                    </table>
                </ww:if>
              <table border="0" cellspacing="0" cellpadding="0">
                <td>
                  <table>
                    <input type="hidden" name="lineId" value="<ww:property value="matter/lineId"/>">
                    <tr>
                      <td class="tdLeft"><m:text key="matter.name" default="Name"/></td>
                      <td class="tdRight"><input class="input" type="text" name="name" value="<ww:property value="matter/name"/>" onChange="setHasChanged(true);"></td>
                    </tr>
                    <tr>
                      <td class="tdLeft"><m:text key="matter.id" default="Id"/></td>
                      <td class="tdRight"><input class="input" type="text" name="id" value="<ww:property value="matter/id"/>" onChange="setHasChanged(true);"></td>
                    </tr>
                    <tr>
                      <td class="tdLeft"><m:text key="matter.time" default="Time"/></td>
                      <td class="tdRight">
                        <table border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="50"><m:text key="matter.hour" default="Hours"/></td>
                            <td width="50"><m:text key="matter.minute" default="Minutes"/></td>
                            <td width="50"><m:text key="matter.second" default="Seconds"/></td>
                          </tr>
                          <tr>
                            <td>
                              <select name="hh" onChange="setHasChanged(true);setTime();" class="sbox">
                                <ww:bean name="'webwork.util.Counter'">
                                  <ww:param name="'first'" value="0"/>
                                  <ww:param name="'last'" value="24"/>
                                  <ww:iterator>
                      
                                    <option <ww:if test="@time/hour == .">selected</ww:if> value="<ww:property/>"><m:format value="." format="00"/></option>
                                  </ww:iterator>
                                </ww:bean>
                              </select>
                            </td>
                            <td>
                              <select name="mm" onChange="setHasChanged(true);setTime();" class="sbox">
                                <ww:bean name="'webwork.util.Counter'">
                                  <ww:param name="'first'" value="0"/>
                                  <ww:param name="'last'" value="59"/>
                                  <ww:iterator>
                                    <option <ww:if test="@time/minute == .">selected</ww:if> value="<ww:property/>"><m:format value="." format="00"/></option>
                                  </ww:iterator>
                                </ww:bean>
                              </select>
                            </td>
                            <td>
                              <select name="ss" onChange="setHasChanged(true);setTime();" class="sbox">
                                <ww:bean name="'webwork.util.Counter'">
                                  <ww:param name="'interval'" value="2"/>
                                  <ww:param name="'first'" value="0"/>
                                  <ww:param name="'last'" value="59"/>
                                  <ww:iterator>
                                    <option <ww:if test="@time/second == .">selected</ww:if> value="<ww:property/>"><m:format value="." format="00"/></option>
                                  </ww:iterator>
                                </ww:bean>
                              </select>
                            </td>
                          </tr>
                        </table>
                        <input type="hidden" value="<ww:property value="matter/time"/>" name="time">
                      </td>
                    </tr>
                  </table>
                </td>
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
            <table width="*" border="0" cellpadding="0" cellspacing="0" align="right" class="buttonBar">
              <tr>
                <td>
                  <m:button label="'settings.save'" onClick="save();"/>
                </td>
                <td>
                </td>
              </tr>
            </form>
          </table>
          </td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>