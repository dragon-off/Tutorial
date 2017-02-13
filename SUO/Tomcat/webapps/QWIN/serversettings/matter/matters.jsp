<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>

<%
    String SORT_BY = "sortBy";
    String SORT_METHOD = "sortMethod";

    String sortBy = request.getParameter(SORT_BY);
    if(sortBy == null){
        sortBy = (String)session.getAttribute(SORT_BY);
        if(sortBy == null) {
            sortBy = "1";
        }
    }

    String sortMethod = request.getParameter(SORT_METHOD);
    if(sortMethod == null){
        sortMethod = (String)session.getAttribute(SORT_METHOD);
        if(sortMethod == null){
            sortMethod = "asc";
        }
    }

    session.setAttribute(SORT_BY, sortBy);
    session.setAttribute(SORT_METHOD, sortMethod);
%>
<ww:property value="@sortBy" id="sortBy"/>
<ww:property value="@sortMethod" id="sortMethod"/>

<ww:bean name="'com.qmatic.web.beans.matter.MatterList'" id="matters"/>
<ww:bean name="'com.qmatic.web.serversettings.matter.MatterCodeSorter'" id="sorter">
    <ww:param name="'sortBy'" value="@sortBy"/>
</ww:bean>


    



<html>
  <head>
      <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <ww:if test="@sortMethod=='asc'">
        <ww:property value="'desc'" id="NSortMethod"/>
        <ww:property value="@sorter/ascending" id="comparator"/>
    </ww:if>
    <ww:else>
        <ww:property value="'asc'" id="NSortMethod"/>
        <ww:property value="@sorter/descending" id="comparator"/>
    </ww:else>

    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
      <tr>
          <td class="boxTop"><h3 class="box"><m:text key="matter.matterCodes" default="Matter Codes"/></h3></td>
      </tr>
      <tr>
        <td class="boxMain">
          <div>
            <table width="100%">
              <td class="listItem_selected">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                    <td width="10">&nbsp;</td>
                    <td width="60" class="headerItem" onMouseOver="this.className='headerItem_over'" onMouseOut="this.className='headerItem'" onClick="document.location.href='matters.jsp?sortBy=2&sortMethod=<ww:property value="@NSortMethod"/>';" title="<m:text key="matter.sortOnId" default="Sort on id"/>"><b><m:text key="matter.id" default="Id"/>
                      <ww:if test="@sortBy=='2'">
                        <ww:if test="@sortMethod=='asc'">
                          <img border="0" src="<m:path src="/images/sort_asc.gif"/>">
                        </ww:if>
                        <ww:else>
                          <img border="0" src="<m:path src="/images/sort_desc.gif"/>">
                        </ww:else>
                      </ww:if>
                      </b></td>
                    <td width="250" class="headerItem" onMouseOver="this.className='headerItem_over'" onMouseOut="this.className='headerItem'" onClick="document.location.href='matters.jsp?sortBy=1&sortMethod=<ww:property value="@NSortMethod"/>';" title="<m:text key="matter.sortOnName" default="Sort on name"/>"><b><m:text key="matter.name" default="Name"/>
                      <ww:if test="@sortBy=='1'">
                        <ww:if test="@sortMethod=='asc'">
                          <img border="0" src="<m:path src="/images/sort_asc.gif"/>">
                        </ww:if>
                        <ww:else>
                          <img border="0" src="<m:path src="/images/sort_desc.gif"/>">
                        </ww:else>
                      </ww:if>
                      </b></td>
                    <td width="60" class="headerItem"><b><m:text key="matter.time" default="Time"/></b></td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
              </td>
            </table>
              
          </div>
          <div class="matterGridScroll">
            <table width="100%">
              <td>
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <ww:sort source="@matters" comparator="@comparator">
                    <ww:iterator>
                      <tr onClick="document.location.href='../matter.getmatter.action?matterId=<ww:property value="lineId"/>';" class="listItem" onMouseOver="this.className='listItem_over'" onMouseOut="this.className='listItem'" title="<m:text key="matter.clickEdit" default="Click to edit Matter code"/>">
                        <td width="10">
                            &nbsp;
                        </td>
                        <td width="60" class="listItem_noBorder">
                            <ww:property value="id"/>
                        </td>
                        <td width="250" class="listItem_noBorder">
                            <ww:property value="name"/>
                        </td>
                        <td width="60" class="listItem_noBorder">
                            <ww:bean name="'com.qmatic.utils.Time'" id="t">
                                <ww:param name="'time'" value="time"/>
                            </ww:bean>
                            <m:format value="@t/hour" format="00"/>:<m:format value="@t/minute" format="00"/>:<m:format value="@t/second" format="00"/>
                        
                        </td>
                        <td>&nbsp;</td>
                      </tr>
                    </ww:iterator>
                  </ww:sort>
                </table>
              </td>
            </table>
          </div>
        </td>
      </tr>
    </table>
  </body>
</html>