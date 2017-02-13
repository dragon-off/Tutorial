 <%@ taglib uri="webwork" prefix="ww" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2005-mar-31
  Time: 13:42:10
  To change this template use File | Settings | File Templates.
--%>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Simple jsp page</title>
        <script language="javascript">
        function insertCode(){
            alert(window.getSelection().getRangeAt(0).startOffset);
        }
        </script>
    </head>
    <body>
        <form name="scriptForm">
            <textarea onKeyUp="insertCode();" name="scriptSource" rows="10" cols="50"></textarea><br>
            <select onChange="insertCode();" name="functions">
                <ww:bean name="'com.qmatic.web.beans.ScriptCodes'" id="codes"/>
                <ww:iterator value="@codes">
                    <option><ww:property/></option>
                    </ww:iterator>
            </select>
            <textarea onmouseup="window.status=event.rangeOffset">
            hello world
            </textarea>


        </form>
    </body>
</html>
--%>
<HTML>
     <HEAD>
     <SCRIPT>
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
     </SCRIPT>

        <form name="scriptForm">
            <textarea name="scriptSource" rows="10" cols="50"
               ONSELECT="storeCaret(this);"
               ONCLICK="storeCaret(this);"
               ONKEYUP="storeCaret(this);"></textarea><br>

            <select name="functions">
                <ww:bean name="'com.qmatic.web.beans.ScriptCodes'" id="codes"/>
                <ww:iterator value="@codes">
                    <option value="<ww:property/>"><ww:property/></option>
                    </ww:iterator>
            </select> <input value="Insert" type="button" onClick="insertAtCaret(this.form.scriptSource, this.form.functions[this.form.functions.selectedIndex].value);">
        </form>
     </BODY>
