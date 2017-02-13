<%@ page import="java.util.Date"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%
    String ref;
    if((ref = (String)request.getParameter("gridRef")) != null){
        session.setAttribute("current-gridRef", ref);
    } else {
        ref = (String)session.getAttribute("current-gridRef");
    }
%>

<html>
  <head>
    <title>Select file</title>
    <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
    
    <script language="JavaScript">
      function selectFile(file) {
      	file = file.replace(/\\\\/g,"\\");
        document.location.href="selectfile.action?gridRef=<%=ref%>&field=<ww:property value="$fieldName"/>&file=" + file;
      }
      function listOver(item, over) {
        if(over==1) {
          item.className = 'listItem_over';
        } else {
          item.className = 'listItem';
        }
      }
    </script>
    
  </head>
<body>
  <form>
    <input type="hidden" name="fieldName" value="<ww:property value="$fieldName"/>">
    <input type="hidden" name="gridRef" value="<ww:property value="$gridRef"/>"/>
    
    <ww:property value="directory" id="dir"/>
    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
    
      <tr>
        <td class="boxTop">
          <h3 class="box"><m:text key="file.filebrowser"/> ( <b><ww:property value="@dir/path" escape="false" /></b> )</h3>
        </td>
      </tr>
      <tr>
        <td class="boxMain" width="100%">
          <div class="fileBrowserScroll">
            <table width="100%" border=0 cellspacing=0 cellpadding=0>
            
              <ww:if test="directoryPath">

                  <tr class="listItem_selected">
                    <td class="listItem_noBorder" width="100%" align="left">
                      <a href="filesystem.getfolder.action?directoryPath=<ww:property escape="false" value="parentPathURLEncoded"/>&fieldName=<ww:property value="$fieldName"/>" class="listItem_noBorder" style="text-decoration: none;"><img src="<m:path src="/images/browse_parent_active.gif"/>" border="0" align="Absmiddle">
                      <b><m:text key="file.parentfolder"/></b></a>
                    </td>
                  </tr>
                  <ww:iterator value="@dir/directories">

                  <tr class="listItem" onMouseOver="listOver(this,1)" onMouseOut="listOver(this,0)">
                    <td class="listItem_noBorder" width="100%" align="left" >
                     <a href="filesystem.getfolder.action?directoryPath=<ww:property escape="false" value="pathURLEncoded"/>&fieldName=<ww:property value="$fieldName"/>" class="listItem_noBorder" style="text-decoration: none;"><img src="<m:path src="/images/folder-closed.gif"/>" border="0" align="Absmiddle">
                      <ww:property value="directoryName"/></a>
                    </td>
                  </tr>

              </ww:iterator>

              <ww:iterator value="@dir/files">
                <tr class="listItem" onMouseOver="listOver(this,1)" onMouseOut="listOver(this,0)" onClick="selectFile('<m:bse><ww:property value="@dir/pathURLEncoded"/>\<ww:property value="fileName"/></m:bse>')">
                  <td class="listItem_noBorder" width="100%" align="left">
                    &nbsp;<img src="<m:path src="/images/file.gif"/>">
                    <ww:property value="fileName"/>
                  </td>
                </tr>

              </ww:iterator>

              </ww:if>

              <ww:else>
              <ww:iterator value="drives">
                <tr class="listItem_noBorder">
                    <td class="listItem_noBorder">
                      <a href="filesystem.getfolder.action?directoryPath=<ww:property value="."/>&fieldName=<ww:property value="$fieldName"/>"  class="listItem_noBorder" style="text-decoration: none;"><img src="<m:path src="/images/drive.gif" />" border="0" align="Absmiddle">

                      <b><ww:property value="."/></b></a>
                    </td>
                </tr>
                </ww:iterator>
              </ww:else>


            </table>
          </div>
        </td>
      </tr>
    </table>
  </form>
</body>

</html>