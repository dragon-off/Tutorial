<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
    // Remember the last array range
    String s = request.getParameter("start");
    if(s != null){
		    session.setAttribute("A_start", request.getParameter("start"));
		    session.setAttribute("A_length", request.getParameter("length"));
    }
%>

<ww:if test="@A_start == null">
	  <ww:property value="'1'" id="start"/>
	  <ww:property value="'100'" id="length"/>
</ww:if>
<ww:else>
    <ww:property value="@A_start" id="start"/>
    <ww:property value="@A_length" id="length"/>
</ww:else>


<html>
    <head>

        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />

        <style>

          .tdLeft {
              padding-left: 5px;
          }
      
          .tdRight {
              padding-left: 5px;
          }

        </style>
        
        <script language="JavaScript">
            var lastId  = null;
            var lastVal = null;

            function saveArrayValue(value, index) {
                document.location.href="array.setvalue.action?index=" + index + "&value=" + value + "&start=<ww:property value="@start"/>&length=<ww:property value="@length"/>#" + index;
            }

            function edit(index, val) {
                if(lastId != null && lastId != index) {
                    ld = document.getElementById("index" + lastId);
                    ld.innerHTML = lastVal;
                }
                if(lastId == null || lastId != index) {
		                var el = document.getElementById("index" + index);
		                var html = '<form style="margin-top:0px;margin-bottom:0px;" name="editForm" method="get" action="array.setvalue.action#' + index + '">';
		                html += '<table border="0" cellspacing="0" cellpadding="0">';
		                html += '<tr><td><input id="aiv" type="text" size="50" name="value" value="' + val + '"></td>';
		                html += '<td><m:button label="'array.save'" onClick="saveArrayValue(document.editForm.value.value,' + index +');"/></td>';
		                html += '<input type="hidden" name="index" value="' + index + '">';
		                html += '<input type="hidden" name="start" value="<ww:property value="@start"/>">';
		                html += '<input type="hidden" name="length" value="<ww:property value="@length"/>">';
		                html += '</tr></table></form>';
		                lastVal = val;
		                lastId  = index;
		                el.innerHTML = html;
		                document.editForm.value.select();
		                document.editForm.value.focus();
								}
            }

            function isNumeric(sText) {
               var ValidChars = "0123456789";
               var IsNumber=true;
               var Char;


               for (i = 0; i < sText.length && IsNumber == true; i++)  {
                  Char = sText.charAt(i);
                  if (ValidChars.indexOf(Char) == -1) {
                     IsNumber = false;
                    }
                }
                return IsNumber;
               }


            function checkBounds() {
                var v = document.FORM1.length.value;
                if(isNumeric(v)) {
                    if(v > 500 || v < 1){
                        alert("Length must be > 0 and < 500");
                    } else {
                        document.FORM1.submit();    
                    }
                }else{
                    alert("Length must be a numeric value!");
                }

            }
        </script>
    </head>

  <body>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
      <tr>
        <td class="boxTop"><h3 class="box"><m:text key="array.array" default="Array"/></h3></td>
      </tr>
      <tr>
        <td class="boxMain">

          <div>
            <table style="margin-left:10px;margin-top:5px;">
              <td>
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <form action="list.jsp" method="get" name="FORM1">
                      <td class="tdLeft"><m:text key="array.startIndex" default="Start index"/>:</td>
                      <td class="tdRight"><input type="text" value="<ww:property value="@start"/>"  name="start" size="3"></td>
                      <td class="tdLeft"><m:text key="array.length" default="Length"/>:</td>
                      <td class="tdRight"><input type="text" value="<ww:property value="@length"/>" name="length" size="3"></td>
                      <td> <m:button label="'array.showRange'" onClick="checkBounds();"/></td>
                    </form>
                  </tr>
                </table>
              </td>
            </table>
          </div>
            
          <div>
            <table width="100%">
              <td class="listItem_selected" style="cursor: default;">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                    <td width="10">&nbsp;</td>
                    <td width="80" class="headerItem">
                      <b>
                        <m:text key="array.index" default="Index"/>
                      </b>
                    </td>
                    <td width="360" class="headerItem">
                      <b>
                        <m:text key="array.value" default="Value"/>
                      </b>
                    </td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
              </td>
            </table>
          </div>

          <div class="arrayGridScroll">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
              <ww:bean name="'com.qmatic.web.beans.array.ScriptArrayList'" id="array">
                <ww:param name="'start'" value="@start"/>
                <ww:param name="'length'" value="@length"/>
              </ww:bean>
              <ww:iterator value="@array">
                <tr onClick="javascript:edit('<ww:property value="index"/>', '<ww:property value="value"/>');" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="array.clickEdit" default="Click to edit value"/>">
                  <td width="10" class="listItem_noBorder"><a name="<ww:property value="index"/>"></a>&nbsp;</td>
                  <td width="80" class="listItem_noBorder"><ww:property value="index"/></td>
                  <td nowrap width="360" class="listItem_noBorder"><div id="index<ww:property value="index"/>"><ww:property value="value"/></div></td>
                  <td class="listItem_noBorder">&nbsp;</td>
                </tr>
              </ww:iterator>
            </table>
          </div>

        </td>
      </tr>
    </table>
  </body>
</html>