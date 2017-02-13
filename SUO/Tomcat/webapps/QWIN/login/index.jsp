<%@ page import="java.util.Locale,
                 com.qmatic.network.SessionFactory,
                 com.qmatic.network.LoginPolicy,
                 java.util.List,
                 java.util.Iterator,
                 com.qmatic.web.i18n.Language"%>
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="mole" prefix="m" %>
<%@ page contentType='text/html;charset=utf-8'%>


<html>
    <head>
        <title>Login</title>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css">
        <script language="JavaScript" >

            function entsub(event, myform) {
                if (event && event.keyCode == 13){
                        myform.submit();
                }
                else
                    return true;
            }
		
        </script>

    </head>
    <body> <!--
        <%
            try{
                LoginPolicy p = SessionFactory.getInstance().getLoginPolicy();
                Language l = Language.getInstance();
                List languages = l.getAvailableLocales();


        %>
        <form id="loginform" name=loginForm action="login.action" method="post">
        <center>
        <div style="margin-top: 100px;">
		<div style="display:none;">
		<table>
		<tr><td>Locale:</td><td> <select name="localeStr">
                        <%
                            for(Iterator i = languages.iterator(); i.hasNext();){
                                Locale locale = (Locale)i.next();
                                %>
                                <option value="<%=locale.getLanguage() + "_" + locale.getCountry()%>"><%=locale.getDisplayLanguage()%></option>
                                <%
                            }

                        %>



                        </select> </td></tr>
		</table>
		</div>
			<table  cellpadding="0" cellspacing="0" align="center" border=0>
          <tr>
            <td  width='283' height='78' background="../images/login_top.gif">

			</td>
          </tr>
		  <tr bgcolor='#ccffad'><td><table  cellpadding="0" cellspacing="0"  align="center" bgcolor='#ccffad'>

                        <tr><td>Username: </td><td>
                        <%
                            if(p.isUsernameListingAllowed()){
                        %>
               <select name="username" onkeypress="return entsub(event,this.form);"  onchange="loginForm.pagee.value='/index.jsp?id='+this.options[this.selectedIndex].id;">
                        <ww:action name="'stafflist'" id="list">
                            <ww:iterator value="staffMembers">
                                <ww:if test="logonName != ''">
                                    <option id="<ww:property value="loginCode"/>" value="<ww:property value="logonName"/>"><ww:property value="logonName"/></option>
                                </ww:if>
                            </ww:iterator>
                        </ww:action>
                        </select>
                        <%}else{%>
                            <input type="text" name="username" onKeyPress="return entsub(event,this.form);">
                        <%}%>

                    </td></tr>
                        <tr>
                            <td>Password: </td><td><input
                                <%
                                    if(!p.isPasswordRequired())
                                        out.println("disabled");
                                %>                                
                                type="password" name="password" onKeyPress="return entsub(event,this.form)"
                                <%=!p.isPasswordRequired()?"style=\"background-color: #EEEEEE;\"":""%>
                                >

                            </td>
                        </tr>

                        <tr>
                            <td></td><td align="right"><m:button label="'login'" onClick="document.loginForm.submit();"/></td>
                        </tr>
			</table></td></tr>
          <tr>
            <td  background="../images/login_bottom.gif" height=34 >&nbsp;
			Server SUO

</td>
          </tr>

        </table>

        </div>
        </center>
        <input type="hidden" name="sessionID" value="000000">
        <input id="pagee" type="hidden" name="page" value="/">

        </form>
		    <script language=javascript>
		    	loginForm.username.focus();
		    </script>
            <% }
               catch(Exception e){
            %>

                    <table width="500" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
                        <tr>
                            <td class="boxTop"><h3 class="box">Error</h3></td>
                        </tr>
                        <tr>
                            <td><br>Unable to create session with Q-win server<br>
                                    <%=e.getMessage()%>
                            </td>
                        </tr>
                     </table>


             <%   }
             %>
-->
    </body>

</html>