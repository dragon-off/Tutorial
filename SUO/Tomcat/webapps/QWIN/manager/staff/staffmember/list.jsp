<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.List,
                 java.util.Iterator,                 
                 com.qmatic.QwinFactory.QWinFactory,
                 com.qmatic.scripting.Script"%>

<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
  </head>

  <body>
        <table width="780"  border="0" cellspacing="0" cellpadding="0">
            <tr align="left" valign="top">
                <td width="500">
                    <table width="500" border="0" cellspacing="0" cellpadding="0" class="box">
                        <tr>
                            <td class="boxTop"><h3 class="box">Staff Members</h3></td>
                        </tr>
                        <tr>
                            <td class="boxMain">
                                <div class="col2BoxScroll">
                                    här kommer listan... dsa das das das jldas ldas dlasd l<br>
                                    här kommer listan... dsa das das das jldas ldas dlasd l<br>
                                    här kommer listan... dsa das das das jldas ldas dlasd l<br>
                                    här kommer listan... dsa das das das jldas ldas dlasd l<br>
                                    här kommer listan... dsa das das das jldas ldas dlasd l<br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1BoxBot"><table width="*"  border="0" cellpadding="0" cellspacing="0" class="buttonBar">
                        <tr>
                            <td>
                                <m:button label="Add" onClick=""/>
                            </td>
                            <td>
                                <m:button label="Remove" onClick=""/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>


<%--
<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="mole" prefix="m" %>
<html>
    <head>
        <title>Connection: <%=session.getAttribute("conn")%></title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body>

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left" valign="top" class="boxMain">
            <div class="col2BoxScroll">

                <table border="0" cellspacing="0" cellpadding="0" class="mainBody">
                    <tr>
                        <td colspan="2">
            <table border="0">

                    <th>Name</th><th>Login</th><th>Web Login</th><th>Remove</th>

                <webwork:action name="'stafflist'" id="list">
                <webwork:iterator value="staffMembers">
                    <tr>
                        <td valign="top">
                            <a href="staff.member.getmember.action?staffInfoNo=<webwork:property value="id"/>"><webwork:property value="name"/></a>
                        </td>
                        <td>
                            <webwork:property value="logonName"/>
                        </td>
                        <td>
                            <webwork:property value="webUser"/>
                        </td>

                        <td valign="top">
                            <a href="staff.member.remove.action?staffInfoNo=<webwork:property value="id"/>">Remove</a>
                        </td>
                    </tr>
                    </webwork:iterator>
                </webwork:action>
            </table>
                        </td>
                    </tr>

                </table>
            </div>
        </td>
    </tr>
</table>



    </body>
</html>


    --%>