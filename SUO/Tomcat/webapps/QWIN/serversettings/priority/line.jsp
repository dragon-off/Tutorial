<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<html>
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <title>Priority line</title>
        <style type="text/css">

            .scroll {
                overflow:auto;
                width: 300px;
                height: 200px;

                margin:1px;
                background: #F4F4F5;


                list-style-type : none;
                padding: 0px;
                border-bottom: 2px solid #FFFFFF;
                border-left: 1px solid #676767;
                border-top: 1px solid #676767;
                border-right: 1px solid #FFFFFF;

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
				    .sbox {
				    	margin-top: 1px;
				    	margin-bottom: 1px;
				    }

        </style>

        <Script language="JavaScript">
            <%@ include file="../javascripts.jsp"%>
            var includedButtons = new Array();
            var selectedLevels  = new Array();
            var buttonNames = new Array();

            <%
                String rld = request.getParameter("reloadTree");
                if(rld != null && rld.equalsIgnoreCase("true")){
                    %>
                    top.tree.document.location.href = top.tree.document.location.href;
                    <%
                }
            %>
            var levels = 5;
            function addButtonName(name){
                buttonNames[buttonNames.length]   = name;

            }
            function setRelations(){
                var rel = "";
                for(a = 0; a < includedButtons.length; a++){
                    rel+=selectedLevels[a] + "," + includedButtons[a] + ",";
                }
                document.lineForm.btnMapping.value = rel;
            }

            function getButtonRow(button, level, index) {

                var html = "<tr ><td >"+buttonNames[button-1] + " </td><td>";
                html+="<select onChange=\"setLevel(" + index + ",this.selectedIndex+1)\">";

                for(j = 1; j <= levels; j++){
                    html+="<option value=\"" + j + "\"";
                    if(j == level){
                        html+=" selected";
                    }
                    html+=">Level " + j + "</option>\n";
                }

                html+="</select>";
                html+='</td><td valign="top">';
                html+='<table width="60" border="0" cellspacing="0" cellpadding="0" class="button" onClick="javascript:removeButton(' + index + ');">';
                html+='<tr>';
                html+='<td width="2" align="left" valign="top"><img src="<m:path src="/images/btn_left.gif"/>" width="2" height="19"/></td>';
                html+='<td class="button" align="center" valign="middle">Remove</td>';
                html+='<td width="3" align="right" valign="top"><img src="<m:path src="/images/btn_right.gif"/>" width="3" height="19"/></td>';
                html+='</tr>';
                html+='</table>';
                html+='</td></tr>';
                return html;
            }


            function moveUp(index){
                if(index < includedButtons.length - 1){
                    var tmpB = includedButtons[index + 1];
                    var tmpL = selectedLevels[index  + 1];

                    includedButtons[index + 1] = includedButtons[index];
                    selectedLevels[index  + 1] = selectedLevels[index];

                    includedButtons[index]  = tmpB;
                    selectedLevels[index]   = tmpL;

                    drawList();
                    setRelations();
                    setHasChanged(true);
                }
            }

            function moveDown(index){
                if(index >0){
                    var tmpB = includedButtons[index - 1];
                    var tmpL = selectedLevels[index  - 1];

                    includedButtons[index - 1] = includedButtons[index];
                    selectedLevels[index  - 1] = selectedLevels[index];

                    includedButtons[index]  = tmpB;
                    selectedLevels[index]   = tmpL;

                    drawList();
                    setRelations();
                    setHasChanged(true);
                }
            }

            function addButton(button, level) {
                includedButtons[includedButtons.length]   = button;
                selectedLevels[selectedLevels.length]     = level;
                drawList();
                setRelations();

                if(document.getElementById("statusBar")){
                    setHasChanged(true);
                }
            }


            function setLevel(index, level) {
                selectedLevels[index] = level;
                setRelations();
            }

            function removeIndexAt(a, index){
                var temp = new Array();
                var tIndex = 0;
                for(k = 0; k < a.length; k++){
                    if(k != index){
                        temp[tIndex++] = a[k];
                    }
                }
                return temp;
                setHasChanged(true);
            }

            function drawList() {
                var btnList = document.getElementById("btnList");
                var ihtml = '<table>';
                for(i = 0; i < includedButtons.length; i++){
                    ihtml+=getButtonRow(includedButtons[i], selectedLevels[i], i);
                }
                ihtml+="</table>"
                btnList.innerHTML=ihtml;

            }

            function removeButton(index){
                includedButtons = removeIndexAt(includedButtons, index);
                selectedLevels  = removeIndexAt(selectedLevels, index);

                drawList();
                setRelations();
                setHasChanged(true);
            }

            function changeType() {
                /*var scriptArea=document.getElementById("priorityProgram");
                if(scriptArea != null){
                    scriptArea.value="";
                    alert("ScriptARea erased");
                } */

                document.location.href = "priority.settype.action?type=" + document.lineForm.type[document.lineForm.type.selectedIndex].value;



            }
		function openHelpMessage(id){
		    top.scriptdbg.location.href = "../ss.gethelp.action?helpId=" + id;
	    }

    </Script>

  </head>
  <body>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
      <form name="lineForm" action="priority.saveline.action">
        <tr>
          <td class="boxTop"><h3 class="box"><m:text key="priority.line" default="Line"/></h3></td>
        </tr>
        <tr>
          <td class="boxMain">
            <div class="settingsGridScroll">
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <input type="hidden" name="lineNo" value="<ww:property value="@currentPriorityLine/lineNumber"/>">
                  <input type="hidden" name="priorityNo" value="<ww:property value="@currentPriority/priorityId"/>">
                  <td class="tdLeft"><label onClick="openHelpMessage('priority.type'); return true;"><m:text key="priority.type" default="Type"/>:</label></td>
                  <td class="tdRight">
                    <select name="type" onChange="changeType()" class="sbox">
                      <option <ww:if test="@currentPriorityLine/type == 10">selected</ww:if> value="10"><m:text key="priority.type.selectFromCategory" default="Select a customer from a category"/></option>
                      <option <ww:if test="@currentPriorityLine/type == 13">selected</ww:if> value="13"><m:text key="priority.type.byLevel" default="Select by level"/></option>
                      <option <ww:if test="@currentPriorityLine/type == 14">selected</ww:if> value="14"><m:text key="priority.type.highestValueByLevel" default="Select the highest value by level"/></option>
                      <option <ww:if test="@currentPriorityLine/type == 18">selected</ww:if> value="18"><m:text key="priority.type.buttonByScript" default="Select a button by script"/></option>
                    </select>
                  </td>
                </tr>
                <div id="typeSection">
                <ww:if test="@currentPriorityLine/type == 18">
                    <tr>
                      <td class="tdLeft"><label onClick="openHelpMessage('priority.script'); return true;" ><m:text key="priority.script" default="Script"/>:</label></td>
                      <td class="tdRight"><textarea class ="sbox" id="priorityProgram" classname="priorityProgram" cols="54" rows="16" name="priorityProgram" onChange="setHasChanged(true);"><ww:property value="@currentPriority/priorityProgram"/></textarea></td>
                    </tr>
                </ww:if>
        
                <ww:if test="@currentPriorityLine/type == 10">
                  <jsp:include page="Type10Form.jsp"/>
                </ww:if>
            
                <%-- NOTE: Same file is used for type 13 & 14 --%>
                <ww:if test="@currentPriorityLine/type == 13">
                    <jsp:include page="Type13Form.jsp"/>
                </ww:if>
                <ww:if test="@currentPriorityLine/type == 14">
                    <jsp:include page="Type13Form.jsp"/>
                </ww:if>
                </div>
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
                  <m:button label="'priority.save'" onClick="document.lineForm.submit();"/>
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
    <ww:if test="changed==true">
            <script language="JavaScript">
                setHasChanged(true);
            </script>
          </ww:if>
  </body>
</html>