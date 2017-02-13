<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
    // Set this to true if text-reference for labels should be shown in server editor
    var showLabelReferences = false;

    function reloadTree() {
        parent.tree.document.location.reload();
    }


    function hideHelpMessage() {
    	if(showLabelReferences) {
				var hlayer = document.getElementById("help");
				hlayer.style.visibility = "hidden";
			} else {
				return;
			}
    }
    var helpWidth = 0;
    var helpHeight = 0;

    var helpMaxWidth = 100;
    var helpMaxHeight = 50;

    function resizeHelpWindow(){
        if(helpWidth < helpMaxWidth){
            var hlayer = document.getElementById("help");
            helpWidth+=15;
            helpHeight+=4;
            hlayer.style.width = helpWidth;
            hlayer.style.height = helpHeight;
            setTimeout('resizeHelpWindow()', 10);
        }

    }
    function openHelpMessage(id){
        top.scriptdbg.location.href = "ss.gethelp.action?helpId=" + id;
    }

    function showHelpMessage(id) {
    	if(showLabelReferences) {
	      helpWidth = 0;
	      helpHeight = 0;
	      var hlayer = document.getElementById("help");
	      hlayer.style.position = "absolute";
	      hlayer.style.top = mousePosY ;
	      hlayer.style.left = mousePosX + 20;
	      hlayer.style.width = 0;
	      hlayer.style.height = 100;
	      hlayer.style.visibility = "visible";
	      hlayer.style.background = "#FFFFCC";
	      resizeHelpWindow();
	      hlayer.innerHTML = id;
			} else {
				return;
			}
    }





    var hasChanged = false;
    function setHasChanged(hc){
        if(hc && document.getElementById("statusBar")){
            document.getElementById("statusBar").innerHTML = "<img src=\"<m:path src="/images/info-alert-icon.gif"/>\" align=\"Absmiddle\"/>&nbsp;&nbsp;<b><m:text key="settings.formChanged"/></b>";
        }

        hasChanged = hc;
    }
    function resetStatusMessage(){
        document.getElementById("statusBar").innerHTML = "";

    }

    function validate(){
        if(hasChanged){
            return false;
        }
    }
    function save(){
        setHasChanged(false);
        document.FORM1.HARD_SAVE.value = "true";
        document.FORM1.submit();
    }
    function saveTemporary(){
        if(hasChanged){
            doSave = confirm('<m:text key="general.valuesChanged" default="The values has been changed."/>'
                + '\n<m:text key="general.saveBeforeLeaving" default="Do you want to save changes before leaving?"/>');
            if(doSave){
                //alert("Saving");
                //document.FORM1.HARD_SAVE.value = "false";
                //document.FORM1.submit();
                save();
            }else{

            }
        }else{
            //alert("No changes has been made!");
        }
    }



    function openFileBrowser(field){
        //windowHandle = window.open('filesystem.getfolder.action?gridRef=<ww:property value="gridRef"/>&fieldName=' + field,'Image','toolbar=yes,resizable=yes,scrollbars=yes,left=0,top=0,screenX=0,screenY=0,width=400,height=300');
        document.location.href = 'filesystem.getfolder.action?gridRef=<ww:property value="gridRef"/>&fieldName=' + field;

    }

    function cancel(){
        alert("Cancel");
    }



    function setTime(fieldName) {
        var tf       = document.getElementById(fieldName);
        var field_hh = document.getElementById(fieldName + "_hh");
        var field_mm = document.getElementById(fieldName + "_mm");
        var field_ss = document.getElementById(fieldName + "_ss");

        var hh = field_hh[field_hh.selectedIndex].value;
        var mm = field_mm[field_mm.selectedIndex].value;
        var ss = field_ss[field_ss.selectedIndex].value;

        var s = (hh * 60 * 60) + (mm * 60) + (1 * ss);

        tf.value = Math.round(s/2);
    }




