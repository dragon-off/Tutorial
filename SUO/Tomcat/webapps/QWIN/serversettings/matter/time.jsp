<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2005-mar-18
  Time: 09:44:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<ww:bean name="'com.qmatic.utils.Time'" id="time">
    <ww:param name="'time'" value="3722"/>
</ww:bean>

<html>
    <head>
        <title>Simple jsp page</title>
        <style type="text/css">
            .sbox {
                font-family: verdana;
                font-size: 9px;
            }
        </style>
        <script language="JavaScript">
            function setTime() {
                var hh = document.matterForm.hh[document.matterForm.hh.selectedIndex].value;
                var mm = document.matterForm.mm[document.matterForm.mm.selectedIndex].value;
                var ss = document.matterForm.ss[document.matterForm.ss.selectedIndex].value;

                var s = (hh * 60 * 60) + (mm * 60) + (1 * ss);

                document.matterForm.time.value = s;
            }
        </script>
    </head>
  <body>
    <ww:property value="@time/hour"/><br>
    <ww:property value="@time/minute"/><br>
    <ww:property value="@time/second"/><br>

    <form name="matterForm">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr><td>Hour</td><td>Min.</td><td>Sec.</td></tr>
            <tr>
                <td>
                    <select name="hh" onChange="setTime();" class="sbox">
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
                    <select name="mm" onChange="setTime();" class="sbox">
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
                    <select name="ss" onChange="setTime();" class="sbox">
                        <ww:bean name="'webwork.util.Counter'">
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
        <input type="hidden" name="time">
    </form>
  </body>
</html>