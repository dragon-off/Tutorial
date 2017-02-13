<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<html>
    <head>
        <style type="text/css">
            .ScheduleItem {
                color: #000000;

                font-family: verdana;
                border: 1px;
                height: 25px;
                border-color: #000000;
                border-style: solid;
                background: #F0F0F0;
                font-size: 12px;
            }
            .ScheduleItem A:link {
                font-size: 12px;
                color: #000000;
                text-decoration: none;
            }
            .ScheduleItem A:visited {
                font-size: 12px;
                color: #000000;
                text-decoration: none;
            }

            .TimeSetItem {
                font-family: verdana;
                font-size: 12px;
                background: #F5F5F5;
            }

            .TimeSetItem A:link {
                font-size: 12px;
                color: #0000FF;
            }
            .TimeSetItem A:visited {
                font-size: 12px;
                color: #0000FF;
            }

        </style>
    </head>
    <body>
        <table width="400">
            <ww:property value="scheduler" id="scheduler"/>
            <ww:iterator value="@scheduler/items">
                <ww:property value="id" id="itemId"/>
                <tr><td class="ScheduleItem" colspan="2">
                    <table border="0" width="100%">
                        <tr>
                            <td>
                                <b><a href="scheduler.getitem.action?itemId=<ww:property value="@itemId"/>"><ww:property value="name"/></a></b>

                            </td>
                            <td width="70">
                                <font size="2"><a href="scheduler.createTimeSet.action?itemId=<ww:property value="@itemId"/>">Add item</a></font>
                            </td>

                        </tr>
                    </table>
                    </td>

                </tr>

                <ww:iterator value="timeSets">
                    <tr class="TimeSetItem"><td>&nbsp;&nbsp;
                    <a href="scheduler.getset.action?itemId=<ww:property value="@itemId"/>&setId=<ww:property value="id"/>">
                    <ww:if test="type == 1"><m:text key="scheduler.type.everyDay" default="Every day"/></ww:if>
                    <ww:if test="type == 2"><m:text key="scheduler.type.byDate" default="By date"/></ww:if>
                    <ww:if test="type == 3"><m:text key="scheduler.type.dayInMonth" default="Day in month"/></ww:if>
                    <ww:if test="type == 4"><m:text key="scheduler.type.dayInWeek" default="Day in week"/></ww:if>
                    <ww:if test="type == 5"><m:text key="scheduler.type.lastDayInMonth" default="Last day in month"/></ww:if>
                    </a> </td><td align="right"><a href="scheduler.removetset.action?itemId=<ww:property value="@itemId"/>&setId=<ww:property value="id"/>"><img src="<m:path src="/images/schedule_minus.gif"/>" border="0"></a>&nbsp;&nbsp;</td></tr>

                </ww:iterator>

            </ww:iterator>
        </table>
        <hr>
        <a href="scheduler.createitem.action">Add item</a><br>
        <a href="scheduler.removeitem.action">Remove last</a>

    </body>
</html>


