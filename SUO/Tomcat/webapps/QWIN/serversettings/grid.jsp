<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<ww:property value="form" id="form"/>
<ww:property value="@form/fields" id="fields"/>

<html>
<head>
<script language="JavaScript">

    <ww:if test="form/scriptForm == true">
        <%@ include file="javascripts-script.jsp"%>
    </ww:if>
    <%@ include file="javascripts.jsp"%>
    <ww:if test="reload == true">
        reloadTree();
    </ww:if>
    
    function rawActionButtonClicked(ref) {
        document.location.href = ref;
    }

    function setFocusOnField(field){
        document.getElementById(field).focus();
    }


</script>
<link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
<style type="text/css">
    .control {
        border-bottom: 1px solid #E0E0E0;

    }
    .helpdialog {
        list-style-type : none;

        padding: 4px;
        border-top: 1px dotted #000000;
        border-right: 1px dotted #000000;
        border-bottom: 1px dotted #000000;
        border-left: 1px dotted #000000;
        background-color : #FFFFCC;
        visibility: hidden;
        position: absolute;
    }


    .errorMessage {
        color: #000000;
        width: 480px;
        background-color: #FFFF80;
        border-bottom: 1px solid #FF0000;
        border-left: 1px solid #FF0000;
        border-right: 1px solid #FF0000;

    }

    .errorMessageTop {
        color: #000000;
        width: 480px;
        padding: 5px;
        background-color: #FFFF80;
        border: 1px solid #FF0000;

    }

    .script {
        list-style-type : none;
        width: 480px;
        padding: 0px;
        border-top: 1px solid #FFFFFF;
        border-right: 1px solid #676767;
        border-bottom: 1px solid #676767;
        border-left: 1px solid #FFFFFF;
        background-color : #EFEFEF;
    }
    .scriptButton {
        list-style-type : none;

        padding: 0px;
        border-top: 1px solid #FFFFFF;
        border-right: 1px solid #676767;
        border-bottom: 1px solid #676767;
        border-left: 1px solid #FFFFFF;
        background-color : #EFEFEF;

    }

    .checkbox {
        background: #EEEEEE;
    }
    .input {
        border: 1px solid #808080;
        width: 250 px;
     }
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
    }
    .tdLeftError {
        border-left: 1px solid #FF0000;
        border-bottom: 1px solid #FF0000;
        border-right: 1px solid #E0E0E0;
        border-top: 1px solid #FF0000;
        padding-left: 5px;
    }

    .tdRight {
        border-right: 1px solid #E0E0E0;
        border-bottom: 1px solid #E0E0E0;
        padding-left: 5px;
    }
    
    .tdRightError {
        border-right: 1px solid #FF0000;
        border-bottom: 1px solid #FF0000;
        border-top: 1px solid #FF0000;
        padding-left: 5px;
    }

    .sbox {
    	margin-top: 1px;
    	margin-bottom: 1px;
    }

</style>
</head>

<body>
<div id="help" class="helpdialog"></div>
<form action="ss.saveform.action" name="FORM1" method="POST">
    <input type="hidden" name="HARD_SAVE" value="false">

    <input type="hidden" value="<ww:property value="gridRef"/>" name="gridRef">
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><ww:property value="@form/label"/>
                        </h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsGridScroll">

                    <ww:if test="hasErrorMessages == true">
                        <div class="control">
                            <table width="300">
                               <tr>
                                   <td colspan="2">
                                       <div class="errorMessageTop">
                                           <ww:iterator value="errorMessages">
                                               <b><ww:property value="."/></b>
                                           </ww:iterator>
                                           <ul>
                                           <ww:iterator value="@fields">
                                               <ww:property id="field"/>
                                               <ww:property value="errors[name]">
                                                   <ww:if test=".">
                                                       <li>  <a href="javascript:setFocusOnField('<ww:property value = "@field/name"/>')"><ww:property value = "@field/label"/></a> <ww:property value="."/></li>
                                                   </ww:if>
                                               </ww:property>
                                           </ww:iterator>
                                           </ul>

                                       </div>
                                   </td>
                               </tr>
                            </table>
                        </div>
                    </ww:if>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <ww:iterator value="@fields">
                           <ww:property id="field"/>
                               <ww:if test="type == 'text'">
                                    <jsp:include page="control-text.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'file'">
                                    <jsp:include page="control-file.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'button'">
                                    <jsp:include page="control-button.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'script'">
                                    <jsp:include page="control-script.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'terminalscript'">
                                    <jsp:include page="control-terminalscript.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'list'">
                                    <jsp:include page="control-list.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'checkbox'">
                                    <jsp:include page="control-checkbox.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'radio'">
                                    <jsp:include page="control-radio.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'number'">
                                    <jsp:include page="control-number.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'char'">
                                    <jsp:include page="control-char.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'time'">
                                    <jsp:include page="control-time.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'separator'">
                                    <jsp:include page="control-separator.jsp"/>
                                </ww:if>


                                <ww:if test="type == 'seperator'">
                                    <jsp:include page="control-separator.jsp"/>
                                </ww:if>

                        </ww:iterator>

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
                            <m:button label="'settings.save'" onClick="save();"/>
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
</body>
</html>