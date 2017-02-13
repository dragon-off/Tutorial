<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- select.jsp
  --
  -- Required Parameters:
  --   * label  - The description that will be used to identfy the control.
  --   * name   - The name of the attribute to put and pull the result from.
  --              Equates to the NAME parameter of the HTML SELECT tag.
  --   * list   - Iterator that will provide the options for the control.
  --              Equates to the HTML OPTION tags in the SELECT and supplies
  --              both the NAME and VALUE parameters of the OPTION tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * size            - SIZE parameter of the HTML SELECT tag.
  --   * disabled        - DISABLED parameter of the HTML SELECT tag.
  --   * tabindex        - tabindex parameter of the HTML SELECT tag.
  --   * onchange        - onkeyup parameter of the HTML SELECT tag.
  --   * size            - SIZE parameter of the HTML SELECT tag.
  --   * multiple        - MULTIPLE parameter of the HTML SELECT tag.
  --   * headerKey       - Combined with headerValue parameter specifies the top of select list
  --   * headerValue     - see above
  --
  --%>
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ include file="controlheader.jsp" %>
<select name="<webwork:property value="parameters['name']"/>"
  <webwork:push value="parameters['id']">
    <webwork:if test=".">id="<webwork:property value="."/>"</webwork:if>
  </webwork:push>
  <webwork:if test="parameters['disabled'] == true">disabled="disabled"</webwork:if>
  <webwork:push value="parameters['size']">
   <webwork:if test=".">size="<webwork:property value="."/>"</webwork:if>
  </webwork:push>
  <webwork:push value="parameters['tabindex']">
    <webwork:if test=".">tabindex="<webwork:property value="."/>"</webwork:if>
  </webwork:push>
  <webwork:push value="parameters['onchange']">
    <webwork:if test=".">onchange="<webwork:property value="."/>"</webwork:if>
  </webwork:push>
  <webwork:if test="parameters['multiple'] == true">multiple="multiple"</webwork:if>
>
<webwork:if test="parameters['headerKey'] != null && parameters['headerValue'] != null">
   <option value="<webwork:property value="parameters['headerKey']"/>">
      <webwork:property value="parameters['headerValue']"/>
   </option>
</webwork:if>
<webwork:push value="parameters['nameValue']">
<webwork:iterator value="parameters['list']">
  <option value="<webwork:property value="."/>"
  <webwork:if test="../../memberOf(..,.) == true">selected="selected"</webwork:if>>
  <webwork:property value="."/>
  </option>
</webwork:iterator>
</webwork:push>    
</select>
<%@ include file="controlfooter.jsp" %>