<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<ww:property value="form" id="form"/>
<ww:property value="@form/fields" id="fields"/>

<html>
<head>
<script language="JavaScript">
<%@ include file="javascripts.jsp"%>
    function actionButtonClicked(name){
        document.FORM1.action = "ss.invokeAction.action";
        document.FORM1.ACTION_REF.value = name;
        document.FORM1.returnUrl.value = parent.tree.document.location.href;
        document.FORM1.submit();

    }

    function rawActionButtonClicked(ref) {
        top.grid.document.location.href = ref;
    }
    
    <ww:if test="reload == true">
        reloadTree();
    </ww:if>
</script>
<link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
<style type="text/css">
    .control {
        list-style-type : none;
        width: 480px;
        padding: 0px;
        border-top: 2px solid #FFFFFF;
        border-right: 1px solid #676767;
        border-bottom: 1px solid #676767;
        border-left: 1px solid #FFFFFF;

        background-color : #EFEFEF;
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
        color: #FF0000;
        width: 450px;
        padding: 5px;
        background-color: #FFFF66;
        border: 1px solid #FF0000;

    }
    .separator {
        background: #E0E0E0;
        border-top: 1px solid #808080;
        border-left: 1px solid #808080;
        border-right: 1px solid #808080;
        border-bottom: 1px solid #808080;
        padding: 2px;

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
    .tdLeft {
        padding-left: 5px;
    }

    .tdRight {
        padding-left: 5px;
    }

</style>
</head>

<body>

<div id="help" class="helpdialog"></div>
<form action="ss.saveform.action" name="FORM1" method="POST">
    <input type="hidden" name="HARD_SAVE" value="false">
    <input type="hidden" name="ACTION_REF" value="">
    <input type="hidden" name="returnUrl" value="">
    <input type="hidden" value="<ww:property value="gridRef"/>" name="gridRef">
    <table border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><ww:property value="@form/label"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="actionGridScroll">

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
                    <table border="0" cellpadding="0" cellspacing="0">

                        <ww:iterator value="@fields">
                           <ww:property id="field"/>

                               <ww:if test="type == 'text'">
                                    <jsp:include page="control-text.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'file'">
                                    <jsp:include page="control-file.jsp"/>
                                </ww:if>

                                <ww:if test="type == 'script'">
                                    <jsp:include page="control-script.jsp"/>
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

                                <ww:if test="type == 'button'">
                                    <jsp:include page="control-button.jsp"/>
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

                                <ww:if test="type == 'hidden'">
                                    <jsp:include page="control-hidden.jsp"/>
                                </ww:if>

                        </ww:iterator>

                    </table>
                </div>
            </td>
        </tr>
    </table>
</form>
</body>
</html>