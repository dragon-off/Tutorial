<%@ page import="java.util.GregorianCalendar,
                 java.util.Calendar,
                 webwork.action.ActionContext,
                 java.text.SimpleDateFormat,
                 com.qmatic.schedule.TimeSet"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<ww:bean name="'com.qmatic.web.serversettings.scheduler.Months'" id="months"/>
<html>
  <head>
    <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />

    <SCRIPT LANGUAGE="JavaScript" SRC="../../javascript/PopupWindow.js"></SCRIPT>
  <SCRIPT LANGUAGE="JavaScript" SRC="../../javascript/AnchorPosition.js"></SCRIPT>
  <SCRIPT LANGUAGE="JavaScript" SRC="../../javascript/date.js"></SCRIPT>
  <SCRIPT LANGUAGE="JavaScript" SRC="../../javascript/CalendarPopup.js"></SCRIPT>

  <STYLE>
	.cpYearNavigation,
	.cpMonthNavigation
			{
			background-color:#DDDDDD;
			text-align:center;
			vertical-align:center;
			text-decoration:none;
			color:#000000;
			font-weight:bold;
			}
	.cpDayColumnHeader,
	.cpYearNavigation,
	.cpMonthNavigation,
	.cpCurrentMonthDate,
	.cpCurrentMonthDateDisabled,
	.cpOtherMonthDate,
	.cpOtherMonthDateDisabled,
	.cpCurrentDate,
	.cpCurrentDateDisabled,
	.cpTodayText,
	.cpTodayTextDisabled,
	.cpText
			{
			font-family:arial;
			font-size:8pt;
			}
	TD.cpDayColumnHeader
			{
			text-align:right;
			border:solid thin #BDBDBE;
			border-width:0 0 1 0;
			}
	.cpCurrentMonthDate,
	.cpOtherMonthDate,
	.cpCurrentDate
			{
			text-align:right;
			text-decoration:none;
			}
	.cpCurrentMonthDateDisabled,
	.cpOtherMonthDateDisabled,
	.cpCurrentDateDisabled
			{
			color:#D0D0D0;
			text-align:right;
			text-decoration:line-through;
			}
	.cpCurrentMonthDate
			{
			color:#5D5D5E;
			font-weight:bold;
			}
	.cpCurrentDate
			{
			color: #FFFFFF;
			font-weight:bold;
			}
	.cpOtherMonthDate
			{
			color:#808080;
			}
	TD.cpCurrentDate
			{
			color:#000000;
			background-color: #BDBDBE;
			border-width:1;
			border:solid thin #000000;
			}
	TD.cpCurrentDateDisabled
			{
			border-width:1;
			border:solid thin #FFAAAA;
			}
	TD.cpTodayText,
	TD.cpTodayTextDisabled
			{
			border:solid thin #BDBDBE;
			border-width:1 0 0 0;
			}
	A.cpTodayText,
	SPAN.cpTodayTextDisabled
			{
			height:20px;
			}
	A.cpTodayText
			{
			color:#5D5D5E;
			font-weight:bold;
			}
	SPAN.cpTodayTextDisabled
			{
			color:#D0D0D0;
			}
	.cpBorder
			{
			border:solid thin #FFFFFF;
			}
</STYLE>

    <ww:property value="@currentTimeSet" id="ts"/>
    <ww:property value="@ts/selectedDate" id="sd"/>

      <script language="JavaScript">
  
          <%@ include file="../javascripts.jsp"%>
          <ww:if test="reload == true">
              reloadTree();
          </ww:if>
  
          <ww:if test="$type == null">
              var selectedType = 1;
          </ww:if>
          <ww:else>
              var selectedType = <ww:property value="timeSet/type"/>;
          </ww:else>
          var cal = new CalendarPopup("calendar");

          cal.setMonthNames('<m:text key="month.january" default="January" />',
                            '<m:text key="month.february" default="February" />',
                            '<m:text key="month.march" default="March" />',
                            '<m:text key="month.april" default="April" />',
                            '<m:text key="month.may" default="May" />',
                            '<m:text key="month.june" default="June" />',
                            '<m:text key="month.july" default="July" />',
                            '<m:text key="month.august" default="August" />',
                            '<m:text key="month.september" default="September" />',
                            '<m:text key="month.october" default="October" />',
                            '<m:text key="month.november" default="November" />',
                            '<m:text key="month.december" default="December" />');


          cal.setDayHeaders('<m:text key="scheduler.day.sundayAbbr" default="Sun" />',
                            '<m:text key="scheduler.day.mondayAbbr" default="Mo" />',
                            '<m:text key="scheduler.day.tuesdayAbbr" default="Tue" />',
                            '<m:text key="scheduler.day.wednesdayAbbr" default="We" />',
                            '<m:text key="scheduler.day.thursdayAbbr" default="Thu" />',
                            '<m:text key="scheduler.day.fridayAbbr" default="Fr" />',
                            '<m:text key="scheduler.day.saturdayAbbr" default="Sat" />');
          cal.setWeekStartDay(1);
          cal.setTodayText("<m:text key="scheduler.today" default="Today" />");
          cal.offsetY = 2;
          cal.offsetX = 10;
          cal.setSize(200,175);
          cal.setReturnFunction("setDateInForm");
          cal.autoHide();
          function setDateInForm(y,m,d){
            var dt = new Date(y,m-1,d,0,0,0);
            document.forms['DateForm'].selectedDateDispl.value = formatDate(dt,'yyyy-MM-dd');
            document.DateForm.selectedYear.value     = y;
            document.DateForm.selectedMonth.value    = m-1;

            document.DateForm.selectedDate.value     = d;
            setHasChanged(true);
          }
          function showCalendar(){
            if(selectedType == 1){
                cal.select(document.forms['DateForm'].selectedDateDispl,'calendarAnchor', 'yyyy-MM-dd');
            }

          }
          function checkEnxcludeWeeks(field) {
            excl = document.DateForm[field].value;

            if(excl > 52 || excl < 0) {
                alert("Value must be a numeric value between 0 and 52");
                document.DateForm[field].focus();
            }
          }

          function disableAll(){
              //document.DateForm.dayInMonthFrom.disabled = true;
              //document.DateForm.dayInMonthEnd.disabled = true;
              //document.DateForm.dayInWeek.disabled = true;
          }
          function changeType(type, clicked) {
              selectedType = type;
              document.DateForm.dateType[type].checked = "1";
              disableAll();
              document.DateForm.type.value = type;
              switch(type){
                  case 0: break;
                  case 1:
                      //document.DateForm.selectedDateDispl.disabled = false;
                      break;
                  case 2:
                      document.DateForm.dayInMonthFrom.disabled = false;
                      document.DateForm.dayInMonthEnd.disabled = false;
                      if(document.DateForm.dayInMonthEnd.selectedIndex < document.DateForm.dayInMonthFrom.selectedIndex) {
                      	document.DateForm.dayInMonthEnd.selectedIndex = document.DateForm.dayInMonthFrom.selectedIndex;
                      }
                      break;
                  case 3:
                      document.DateForm.dayInWeek.disabled = false;
                      break;
                  case 4: break;
                  default: alert("Unknown component");
              }
              if(clicked == 1){
                setHasChanged(true);
              }

          }


      </script>

    </head>

    <body>

      <%
          pageContext.setAttribute("selectedYear", ActionContext.getValueStack().findValue("@sd/year"));
          pageContext.setAttribute("selectedMonth", ActionContext.getValueStack().findValue("@sd/month"));
          pageContext.setAttribute("selectedDate", ActionContext.getValueStack().findValue("@sd/date"));
  
          String year;
          String month;
  
          if(request.getParameter("y") != null){
              year = (String)request.getParameter("y");
          }else{
              year = pageContext.getAttribute("selectedYear").toString();
          }
  
          if(request.getParameter("m") != null){
              month = (String)request.getParameter("m");
          }else{
              month = pageContext.getAttribute("selectedMonth").toString();
          }
  
          pageContext.setAttribute("y", year);
          pageContext.setAttribute("m", month);
  
      %>
    <ww:if test="hasErrorMessages == true">
        <div class="control">
            <table width="300">
                <tr>
                    <td colspan="2">
                        <div class="errorMessage">
                             <ww:iterator value="errorMessages">
                                <ww:property value="."/><br>
                             </ww:iterator>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </ww:if>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
      <form action="scheduler.saveset.action" method="get" name="DateForm" id="DateForm">

        <input type="hidden" name="itemId" value="<ww:property value="itemId"/>">
        <input type="hidden" name="setId"  value="<ww:property value="setId"/>">
        <input type="hidden" name="selectedYear"  value="<ww:property value="@ts/selectedDate/year"/>">
        <input type="hidden" name="selectedMonth" value="<ww:property value="@ts/selectedDate/month"/>">
        <input type="hidden" name="selectedDate"  value="<ww:property value="@ts/selectedDate/date"/>">
        <!--<input type="hidden" name="m">-->
        <!--<input type="hidden" name="y">-->
        <input type="hidden" name="showCal" value="false">
        <input type="hidden" name="kalleTest" value="false">
        <input type="hidden" name="type" value="<ww:property value="@ts/type"/>">
        <input type="hidden" name="doSubmit" value="true">

	      <tr>
	        <td class="boxTop"><h3 class="box"><m:text key="scheduler.scheduleItem" default="Schedule item"/></h3></td>
	      </tr>
	      <tr>
	        <td class="boxMain">
	          <div class="settingsGridScroll">
	    
	            <ww:bean name="'webwork.util.Counter'" id="years">
	                <ww:param name="'first'" value="1980"/>
	                <ww:param name="'last'" value="2010"/>
	            </ww:bean>
    
              <table border="0" width="480" cellspacing="0" cellpadding="0">



                <tr>
                  <td colspan="4" class="separator">
                  	<m:text key="scheduler.include" default="Include"/>
                  </td>
                </tr>

                <tr>
                  <td class="tdLeft" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input value="0" <ww:if test="timeSet/type == 0">checked</ww:if> onClick="changeType(0,1);" type="radio" checked name="dateType"></td>
                  		<td><NOBR><label for="dateType" onClick="changeType(0,1);"><m:text key="scheduler.type.everyDay" default="Every day"/></label></NOBR></td>
                  	</table>
                  <td class="tdRight" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td class="tdLeft" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input value="1" <ww:if test="timeSet/type == 1">checked</ww:if> onClick="changeType(1,1);" type="radio" name="dateType"></td>
                  		<td><NOBR><label for="dateType" onClick="changeType(1,1);"><m:text key="scheduler.type.byDate" default="By date"/></label></NOBR></td>
                  	</table>
                  </td>
                  <td class="tdRight" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input onChange="changeType(1,1);" name="selectedDateDispl" id="selectedDateDispl"  type="text" size="10" disabled value="<ww:property value="@ts/selectedDate"/>"></td>
                  		<td width="380"><div id="point"><m:button label="'scheduler.showCalendar'"  onClick="showCalendar();"/></div><div id="calendarAnchor" name="calendarAnchor"></div></td>
                  	</table>
                  </td>
                </tr>
                <tr>
                  <td class="tdLeft" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input value="2" <ww:if test="timeSet/type == 2">checked</ww:if> onClick="changeType(2,1);" type="radio" name="dateType"></td>
                  		<td><NOBR><label for="dateType" onClick="changeType(2,1);"><m:text key="scheduler.type.dayInMonth" default="Day in month"/></label></NOBR></td>
                  	</table>
                  </td>
                  <td class="tdRight" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td>
		                    <select onChange="changeType(2,1);" name="dayInMonthFrom">
		                      <option <ww:if test="@ts/firstDayInMonth == 1"> selected </ww:if> value="1">1</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 2"> selected </ww:if> value="2">2</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 3"> selected </ww:if> value="3">3</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 4"> selected </ww:if> value="4">4</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 5"> selected </ww:if> value="5">5</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 6"> selected </ww:if> value="6">6</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 7"> selected </ww:if> value="7">7</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 8"> selected </ww:if> value="8">8</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 9"> selected </ww:if> value="9">9</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 10"> selected </ww:if> value="10">10</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 11"> selected </ww:if> value="11">11</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 12"> selected </ww:if> value="12">12</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 13"> selected </ww:if> value="13">13</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 14"> selected </ww:if> value="14">14</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 15"> selected </ww:if> value="15">15</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 16"> selected </ww:if> value="16">16</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 17"> selected </ww:if> value="17">17</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 18"> selected </ww:if> value="18">18</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 19"> selected </ww:if> value="19">19</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 20"> selected </ww:if> value="20">20</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 21"> selected </ww:if> value="21">21</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 22"> selected </ww:if> value="22">22</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 23"> selected </ww:if> value="23">23</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 24"> selected </ww:if> value="24">24</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 25"> selected </ww:if> value="25">25</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 26"> selected </ww:if> value="26">26</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 27"> selected </ww:if> value="27">27</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 28"> selected </ww:if> value="28">28</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 29"> selected </ww:if> value="29">29</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 30"> selected </ww:if> value="30">30</option>
		                      <option <ww:if test="@ts/firstDayInMonth == 31"> selected </ww:if> value="31">31</option>
		                    </select>
											</td>
                  		<td>&nbsp;-&nbsp;</td>
                  		<td>
		                    <select onChange="changeType(2,1);" name="dayInMonthEnd">
		                      <option <ww:if test="@ts/lastDayInMonth == 1"> selected </ww:if> value="1">1</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 2"> selected </ww:if> value="2">2</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 3"> selected </ww:if> value="3">3</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 4"> selected </ww:if> value="4">4</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 5"> selected </ww:if> value="5">5</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 6"> selected </ww:if> value="6">6</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 7"> selected </ww:if> value="7">7</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 8"> selected </ww:if> value="8">8</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 9"> selected </ww:if> value="9">9</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 10"> selected </ww:if> value="10">10</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 11"> selected </ww:if> value="11">11</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 12"> selected </ww:if> value="12">12</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 13"> selected </ww:if> value="13">13</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 14"> selected </ww:if> value="14">14</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 15"> selected </ww:if> value="15">15</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 16"> selected </ww:if> value="16">16</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 17"> selected </ww:if> value="17">17</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 18"> selected </ww:if> value="18">18</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 19"> selected </ww:if> value="19">19</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 20"> selected </ww:if> value="20">20</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 21"> selected </ww:if> value="21">21</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 22"> selected </ww:if> value="22">22</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 23"> selected </ww:if> value="23">23</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 24"> selected </ww:if> value="24">24</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 25"> selected </ww:if> value="25">25</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 26"> selected </ww:if> value="26">26</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 27"> selected </ww:if> value="27">27</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 28"> selected </ww:if> value="28">28</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 29"> selected </ww:if> value="29">29</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 30"> selected </ww:if> value="30">30</option>
		                      <option <ww:if test="@ts/lastDayInMonth == 31"> selected </ww:if> value="31">31</option>
		                    </select>
                  		</td>
                  	</table>
                  </td>
                </tr>
                <tr>
                  <td class="tdLeft" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input value="3" <ww:if test="timeSet/type == 3">checked</ww:if> onClick="changeType(3,1);" type="radio" name="dateType"></td>
                  		<td><label for="dateType" onClick="changeType(3,1);"><m:text key="scheduler.type.dayInWeek" default="Day in week"/></label></NOBR></td>
                  	</table>
                  </td>
                  <td class="tdRight" colspan="2">
                    <select onChange="changeType(3,1);" name="dayInWeek">
                      <option <ww:if test="@ts/dayInWeek == 1"> selected </ww:if> value="1"><m:text key="scheduler.day.monday" default="Monday"/></option>
                      <option <ww:if test="@ts/dayInWeek == 2"> selected </ww:if> value="2"><m:text key="scheduler.day.tuesday" default="Tuesday"/></option>
                      <option <ww:if test="@ts/dayInWeek == 3"> selected </ww:if> value="3"><m:text key="scheduler.day.wednesday" default="Wednesday"/></option>
                      <option <ww:if test="@ts/dayInWeek == 4"> selected </ww:if> value="4"><m:text key="scheduler.day.thursday" default="Thursday"/></option>
                      <option <ww:if test="@ts/dayInWeek == 5"> selected </ww:if> value="5"><m:text key="scheduler.day.friday" default="Friday"/></option>
                      <option <ww:if test="@ts/dayInWeek == 6"> selected </ww:if> value="6"><m:text key="scheduler.day.saturday" default="Saturday"/></option>
                      <option <ww:if test="@ts/dayInWeek == 7"> selected </ww:if> value="7"><m:text key="scheduler.day.sunday" default="Sunday"/></option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="tdLeft" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input value="4" <ww:if test="timeSet/type == 4">checked</ww:if>  onClick="changeType(4,1);" type="radio" name="dateType"></td>
                  		<td><NOBR><label for="dateType" onClick="changeType(4,1);"><m:text key="scheduler.type.firstDayInMonth" default="First day in month"/></label></NOBR></td>
                  	</table>
                  </td>
                  <td class="tdRight" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td class="tdLeft" colspan="2"><m:text key="scheduler.timeRange" default="Time range"/>:</td>
                  <td class="tdLeft" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input type="text" size="4" name="firstMinute" onchange="setHasChanged(true);" value="<ww:property value="@ts/formatedTime(@ts/firstMinute)"/>"></td>
                  		<td>&nbsp;-&nbsp;</td>
                  		<td><input name="lastMinute" type="text" size="4" onchange="setHasChanged(true);" value="<ww:property value="@ts/formatedTime(@ts/lastMinute)"/>"></td>
                  	</table>
                  </td>
                </tr>
                
                
                <tr>
                  <td colspan="4" class="separator">
                    <m:text key="scheduler.exclude" default="Exclude"/>
                  </td>
                </tr>
                <tr>
                  <td colspan="4" class="tdLeft">
                    <table border="0">
                      <td>

                      <ww:iterator value="@months">
                          <ww:property id="month"/>
                          <input name="excludedMonths" id="month<ww:property value="@month/num"/>" onchange="setHasChanged(true);" value="<ww:property value="@month/num"/>" type="checkbox" <ww:if test="@ts/excludesMonth(@month/num) == true"> checked </ww:if>><label for="month<ww:property value="@month/num"/>"><ww:property value="@month"/></label><br>
                          <ww:if test="@month/num  == 5"></td><td></ww:if>
                      </ww:iterator>
                      </td>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="tdLeft" colspan="2"><m:text key="scheduler.weekRange" default="Exclude weeks"/>:</td>
                  <td class="tdRight" colspan="2">
                  	<table border="0" cellspacing="0" cellpadding="0">
                  		<td><input type="text" size="4" name="excludedStartWeek" onchange="setHasChanged(true);" onBlur="checkEnxcludeWeeks('excludedStartWeek');" value="<ww:property value="@ts/excludedStartWeek"/>"></td>
											<td>&nbsp;-&nbsp;</td>
                      <td><input type="text" size="4" name="excludedEndWeek" onchange="setHasChanged(true);" onBlur="checkEnxcludeWeeks('excludedEndWeek');" value="<ww:property value="@ts/excludedEndWeek"/>"></td>
                    </table>
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
                  <m:button label="'scheduler.save'" onClick="document.getElementById('DateForm').submit();"/>
                </td>
              </tr>
            </table>
            </td>
            </tr>
            </table>
          </td>
        </tr>
      </form>
    </table>
    <DIV ID="calendar" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
  </body>
	            <SCRIPT language="JavaScript">
	              changeType(<ww:property value="timeSet/type"/>,0);
	            </SCRIPT>
	      

</html>

