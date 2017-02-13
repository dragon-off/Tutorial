<%@ page import="com.qmatic.scripting.TemplateSection,
                 java.util.Iterator,
                 java.util.List,
                 com.qmatic.ConnectionContext,
                 com.qmatic.scripting.TemplateManager,
                 com.qmatic.scripting.TemplateScript"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
        TemplateManager tm = ConnectionContext.
                getQWinFactory().getTemplateManager();
        List sections = tm.getTemplateSections();
        out.println("\tvar sectionDesc    = new Array(" + sections.size() + ");");
        out.println("\tvar sectionScripts = new Array(" + sections.size() + ");");
        out.println("\tvar scriptDescs    = new Array(" + sections.size() + ");");

        int counter = 0;
        for(Iterator i = sections.iterator(); i.hasNext();){
            TemplateSection ts = (TemplateSection)i.next();
            out.println("\tsectionDesc[" + counter + "]='" + ts.getDescription().replaceAll("'", "\\\\'") + "';");
            List s = ts.getScripts();
            out.println("\tsectionScripts[" + counter + "] = new Array(" + s.size() +  ");");
            out.println("\tscriptDescs[" + counter + "] = new Array(" + s.size() +  ");");

            int counter2 = 0;
            for(Iterator j = s.iterator(); j.hasNext();){
                TemplateScript script = (TemplateScript)j.next();
                out.println("\tsectionScripts[" + counter +"]["+ counter2 +"]='" + script.getPrg().replaceAll("\\\\", "\\\\\\\\").replaceAll("'", "\\\\'") +"';");
                out.println("\tscriptDescs[" + counter +"]["+ counter2 +"]='" + script.getName().replaceAll("'", "\\\\'") +"';");
                counter2++;
            }
            counter++;
        }
%>
    // Detect if the browser is IE or not.
    // If it is not IE, we assume that the browser is NS.
    var IE = document.all?true:false
    var mousePosX = 0;
    var mousePosY = 0;
    var isRunning = false;

    // If NS -- that is, !IE -- then set up for mouse capture
    if (!IE) document.captureEvents(Event.MOUSEMOVE)

    // Set-up to use getMouseXY function onMouseMove
    document.onmousemove = getMouseXY;

    // Temporary variables to hold mouse x-y pos.s
    var tempX = 0
    var tempY = 0

    // Main function to retrieve mouse x-y pos.s

    function getMouseXY(e) {
      if (IE) { // grab the x-y pos.s if browser is IE
        tempX = event.clientX + document.body.scrollLeft
        tempY = event.clientY + document.body.scrollTop
      } else {  // grab the x-y pos.s if browser is NS
        tempX = e.pageX
        tempY = e.pageY
      }
      // catch possible negative values in NS4
      if (tempX < 0){tempX = 0}
      if (tempY < 0){tempY = 0}
      // show the position values in the form named Show
      // in the text fields named MouseX and MouseY
      //document.Show.MouseX.value = tempX
      //document.Show.MouseY.value = tempY
      mousePosX = tempX;
      mousePosY = tempY;
      return true
    }


    function showScripts(sid, layerId, taid){
        var box = document.getElementById(sid);
        var layer = document.getElementById(layerId);
        var taid = document.getElementById(taid);
        buildScriptCtrlPanel(layer, taid, box.selectedIndex);
    }

    function insertScript(layer, taid){
        var cmb1 = document.getElementById(layer + "_S");
        var cmb2 = document.getElementById(layer + "_S1");
        var tbox = document.getElementById(taid);

        var val = sectionScripts[cmb1.selectedIndex][cmb2.selectedIndex];

        re=/\{\}/gi;

        tbox.value = val.replace(re, "\n");
    }

    function buildScriptCtrlPanel(layer, tarea, sel){
        var cid  = layer.id + "_S";
        var cid1 = layer.id + "_S1";
        var taid = tarea.id;
        var lid  = layer.id;


        var secs = "<tr><td><b><m:text key="script.templates" default="Templates"/></b></td></tr>";
        eventStr = 'onChange=drawSubScripts(this.selectedIndex, "'+ cid1 + '")';
        secs += '<tr><td><select class="select4" name="' + cid + '" onChange=drawSubScripts("'+ cid1 +'",this.selectedIndex)>';
        for(i = 0; i < sectionDesc.length; i++){
            if(sel == i)
                secs += "<option selected>" + sectionDesc[i] + "</option>";
            else
                secs += "<option>" + sectionDesc[i] + "</option>";
        }
        secs += "</select></td></tr>";

        var scripts = scriptDescs[sel];
        secs +='<tr><td><select class="select4" name="'+ cid1 +'">'
        for(i = 0; i < scripts.length; i++){
            secs += "<option>" + scripts[i] + "</option>";
        }
        secs += "</select></td>";
        secs += '<td valign="top"><m:button label="'script.insertScript'" onClick="insertScript(\"' + lid + '\",\"' + taid + '\");"/></td></tr>';
        secs += '<tr><td colspan="2"><hr size="1"></td></tr>';
        secs += '<tr><td><m:button label="'script.test'" onClick="testScript(\"' + taid + '\");"/></td>';
        secs += '<td><m:button label="'script.done'" onClick="showScriptPanel(\"' + taid + '\",false);"/></td></tr>';
        return '<table border="0" cellpadding="0" cellspacing="0">' + secs + '</table>';
    }

    function drawSubScripts(boxId, sel) {
        var box = document.getElementById(boxId);
        for(i = box.options.length; i >=0 ; i--){
            box.options[i] = null;
        }
        var scripts = scriptDescs[sel];
        //var secs = "";
        for(i = 0; i < scripts.length; i++){
            var option = new Option(scripts[i]);
            box.options[i] = option;
        }
    }

    function buildTerminalScriptCtrlPanel(tarea){
        var taid = tarea.id;
        var secs = '<tr><td width="360">&nbsp;</td>';
        secs += '<td><m:button label="'script.done'" onClick="showTerminalScriptPanel(\"' + taid + '\",false);"/></td></tr>';
        return '<table border="0" cellpadding="0" cellspacing="0">' + secs + '</table>';
    }

    function testScript(field){
        parent.scriptdbg.document.location.href='scriptTestForm.jsp?field=' + field;
    }

    function expand(id){
        var tarea = document.getElementById(id);
        var ctrpnl = document.getElementById("CTRPNL_" + id);


        tarea.style.height = 300;
        tarea.style.width = 450;

        ctrpnl.style.visibility = "visible";
        expanded = true;

        buildScriptCtrlPanel(ctrpnl, tarea, 0);
    }

    function collapse(id){
        var tarea = document.getElementById(id);
        var ctrpnl = document.getElementById("CTRPNL_" + id);

        tarea.style.height = 50;
        tarea.style.width = 350;

        ctrpnl.style.visibility = "hidden";
        expanded = false;
    }

     function storeCaret (textEl) {
       if (textEl.createTextRange)
         textEl.caretPos = document.selection.createRange().duplicate();
     }
     function insertAtCaret (textEl, text) {
       if (textEl.createTextRange && textEl.caretPos) {
         var caretPos = textEl.caretPos;
         caretPos.text =
           caretPos.text.charAt(caretPos.text.length - 1) == ' ' ?
             text + ' ' : text;
       }
       else
         textEl.value  = text;
     }


    function getScriptCodes(id) {
        var scriptCodes = "<tr><td><b><m:text key="script.functions" default="Functions"/></b></td></tr>";
        scriptCodes+='<tr><td><select class="select4" name="' + id + '_functions">';
            <ww:bean name="'com.qmatic.web.beans.ScriptCodes'" id="codes"/>
            <ww:iterator value="@codes">
                scriptCodes+='<option value="<ww:property/>"><ww:property/></option>';
            </ww:iterator>
        scriptCodes+='</select></td>';
				scriptCodes += '<td valign="top"><m:button label="'script.insertFunction'" onClick="insertAtCaret('+ id + ', '+ id +'_functions['+ id +'_functions.selectedIndex].value);"/></td></tr>';
        return '<table border="0" cellpadding="0" cellspacing="0">' + scriptCodes + '</table>';
    }

    function showScriptPanel(id, visible) {
        //var tdbox  = document.getElementById(id + "_TD");
        var tbox  = document.getElementById(id + "_PANEL");
        var frame  = document.getElementById(id + "_FRAME");
        var box = document.getElementById(id);
        if(visible){
            box.style.height = "200";
            tbox.style.height = "30";
            box.style.visibility = "visible";
            tbox.style.visibility = "visible";
            tbox.style.position = "relative";

            tbox.innerHTML = getScriptCodes(id)+  "<br>" + buildScriptCtrlPanel(tbox, box, 0)
            //tdbox.style.border = "1px solid #000000";

            frame.style.border="1px solid #000000";
            frame.style.background="#EEEEEE";


        } else {
            //tdbox.style.background = "#FFFFFF";
            tbox.style.position = "absolute";
            tbox.style.height = "0";
            tbox.style.visibility = "hidden";
            box.style.height = "50";

            frame.style.border="0px solid #000000";
            frame.style.background="#FFFFFF";
            box.style.background = "#FFFFFF";

        }

    }


    function showTerminalScriptPanel(id, visible) {
        var tbox  = document.getElementById(id + "_PANEL");
        var frame  = document.getElementById(id + "_FRAME");
        var box = document.getElementById(id);
        if(visible){
            box.style.height = "200";
            tbox.style.height = "30";
            box.style.visibility = "visible";
            tbox.style.visibility = "visible";
            tbox.style.position = "relative";
//            tbox.innerHTML = getTerminalScriptCodes(id)+  "<br>" + buildTerminalScriptCtrlPanel(box)
            tbox.innerHTML = buildTerminalScriptCtrlPanel(box)
            frame.style.border="1px solid #000000";
            frame.style.background="#EEEEEE";
        } else {
            tbox.style.position = "absolute";
            tbox.style.height = "0";
            tbox.style.visibility = "hidden";
            box.style.height = "50";
            frame.style.border="0px solid #000000";
            frame.style.background="#FFFFFF";
            box.style.background = "#FFFFFF";
        }
    }