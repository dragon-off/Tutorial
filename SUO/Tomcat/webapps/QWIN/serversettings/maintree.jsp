<%@ taglib uri="mole" prefix="m" %>
<%@ page import="org.w3c.dom.Element,
                 org.w3c.dom.Document,
                 javax.xml.parsers.DocumentBuilder,
                 javax.xml.parsers.DocumentBuilderFactory,
                 org.w3c.dom.NodeList,
                 org.w3c.dom.Node,
                 com.qmatic.ConnectionContext,
                 com.qmatic.network.User,
                 com.qmatic.web.i18n.Language"%>

<%
        User user = (User)session.getAttribute("QM_USER");
        DocumentBuilderFactory builderFactory =
                DocumentBuilderFactory.newInstance();
        DocumentBuilder builder =
                builderFactory.newDocumentBuilder();

        Document document = builder.parse(getClass().getResourceAsStream("/serversettings/Tree.xml"));

        document.getDocumentElement().normalize();
        Element rootElement = document.getDocumentElement();
        NodeList nl = rootElement.getChildNodes();
        for (int i = 0; i < nl.getLength(); i++) {
            Node n = nl.item(i);
            if (n.getNodeName().equals("group")) {
                String displayName = n.getAttributes().getNamedItem("display-name").getNodeValue();

                %>

                    <table width="150" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
                        <tr>
                            <td class="boxTop"><h3 class="box"><%=Language.getInstance().getText(displayName)%></h3></td>
                        </tr>
						

                        <tr>
							
                            <td class="boxMain">
																					<% if(i==3) { %>
						     <div id="link_3_2" class="listItem" onclick='loadtouch(this);' onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);">
                                                		<img  border=0 name="img_3_2" src="<m:path src="/images/folder-closed.gif"/>">
				                                          <% out.println("\u041D\u0430\u0441\u0442\u0440\u043E\u0439\u043A\u0430\u0020\u043A\u043D\u043E\u043F\u043E\u043A");
														  %>
				                                        </div>
							 <div id="link_3_3" class="listItem" onclick='loadreset(this);' onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);">
                                                		<img  border=0 name="img_3_3" src="<m:path src="/images/folder-closed.gif"/>">
				                                          <% out.println("\u0421\u0431\u0440\u043E\u0441");
														  %>
				                                        </div>
														<div id="link_3_4" class="listItem" onclick='loadsmsuo(this);' onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);">
                                                		<img  border=0 name="img_3_4" src="<m:path src="/images/folder-closed.gif"/>">
				                                          <% out.println("\u0421\u041c \u0421\u0423\u041e");
														  %>
				                                        </div>
														<div id="link_3_4" class="listItem" onclick='loadlogindel(this);' onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);">
                                                		<img  border=0 name="img_3_4" src="<m:path src="/images/folder-closed.gif"/>">
				                                          <% out.println("\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043b\u043e\u0433\u0438\u043d\u043e\u0432");
														  %>
				                                        </div>
						<% } %>
                                <%

                                NodeList items = n.getChildNodes();
                                for (int j = 0; j < items.getLength(); j++) {
                                    Node item = items.item(j);

                                    if (item.getNodeName().equals("item")) {
                                        String itemDisplayName = item.getAttributes().getNamedItem("display-name").getNodeValue();
                                        String tree = item.getAttributes().getNamedItem("name").getNodeValue();
                                        String rule = item.getAttributes().getNamedItem("policy-rule").getNodeValue();
                                        if(user.hasPolicy(rule)) {
                                            %>
                                                <div id="link_<%=i%>_<%=j%>" class="listItem" onclick="loadTree('tree.jsp?tree=<%=tree%>',this);return false;" onMouseOver="javascript:listOver(this,1);" onMouseOut="javascript:listOver(this,0);">
                                                		<img name="img_<%=i%>_<%=j%>" border=0 src="<m:path src="/images/folder-closed.gif"/>">
				                                            	<%=Language.getInstance().getText(itemDisplayName)%>
				                                        </div>

                                            <% 
                                                      
                                        }
                                    }
                                }
                                %>
                            </td>
                        </tr>
                    </table>
                <%
            }
        }


%>      

