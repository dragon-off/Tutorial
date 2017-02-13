<%@ page import="webwork.action.ActionContext"%>
 <%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- tabbedpane.jsp	
  --
  -- Required Parameters:
  --   * contentName      - The name of the data map to be used.  
  --
  -- Optional Parameters:
  --   * tabAlign 	-	 The Alignment of the tabs. Default is the CENTER of the control.
  --   * id  				- 	 Id of the control.
  --
  --%>

<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="mole" prefix="m" %>

<webwork:bean name="'webwork.util.Counter'" id="tabIndex">
	<webwork:param name="'first'" value="0"/>
	<webwork:param name="'last'" value="content/size"/>
</webwork:bean>


<table width="780"  border="0" cellspacing="0" cellpadding="0">
	<tr align="left" valign="top">
		<td>
			<table width="200" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
				<tr>
					
					<td class="boxTabTop">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="boxTabEnd" width=1>&nbsp;</td>
								<webwork:iterator value="content">
								
									<webwork:if id="isCur" test="selectedIndex == @tabIndex/current"/>

									<%--<webwork:if test="@tabIndex/current == 0"/>							
									INDEX: <webwork:property value="@tabIndex/current"/>--%>

									<webwork:if test="@isCur == true">
										<td width="1"> <!-- onClick="javascript:switchTab('<webwork:url includeParams="'all'"><webwork:param name="indexLink" value="@tabIndex/next"/></webwork:url>');"> -->
											<table width="100%"  border="0" cellspacing="0" cellpadding="0">
												<tr>
													<webwork:if test="@tabIndex/current == 1">
													<td width="1" align="left" valign="top"><img src="<m:path src="/images/tab_border.gif"/>" width="1" height="21" /></td>
													</webwork:if>
													<td nowrap class="boxTabActive" onMouseOver="this.className='boxTabActive_over'" onMouseOut="this.className='boxTabActive'">
														<h3 class="tab">
															<webwork:property value="key"/>
														</h3>
													</td>
													<td width="1" align="left" valign="top"><img src="<m:path src="/images/tab_border.gif"/>" width="1" height="21" /></td>
												</tr>
											</table>
										</td>
									</webwork:if>

									<webwork:else>
										<td width="1" onClick="javascript:switchTab('<webwork:property value="@tabIndex/next"/>');">
											<table width="100%"  border="0" cellspacing="0" cellpadding="0">
												<tr>
													<webwork:if test="@tabIndex/current == 1">
													<td width="1" align="left" valign="top"><img src="<m:path src="/images/tab_border.gif"/>" width="1" height="21" /></td>
													</webwork:if>
													<td nowrap class="boxTabNormal" onMouseOver="this.className='boxTabNormal_over'" onMouseOut="this.className='boxTabNormal'">
														<h3 class="tab">
															<webwork:property value="key"/>
														</h3>
													</td>
													<td width="1" align="left" valign="top"><img src="<m:path src="/images/tab_border.gif"/>" width="1" height="21" /></td>
												</tr>
											</table>
										</td>
									</webwork:else>
									
								</webwork:iterator>
							
								<td class="boxTabEnd">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>  
						<!--START--> <%-- <webwork:property value="selectedUrl"/> --%>
						<webwork:include value="selectedUrl"/>
						<!--END-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>