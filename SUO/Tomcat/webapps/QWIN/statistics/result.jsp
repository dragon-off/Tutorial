<%@ page import="javax.xml.parsers.DocumentBuilderFactory,
                 javax.xml.parsers.DocumentBuilder,
                 org.w3c.dom.Document,
                 org.w3c.dom.Element,
                 java.io.File,
                 org.w3c.dom.NodeList,
                 org.w3c.dom.Node,
                 com.qmatic.web.i18n.Language"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="mole" prefix="m" %>

<html>
    <head>
        <title><m:text key="wreports.reports" default="Reports"/></title>

    <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
    <script language="JavaScript">
        function showImage(image){
            var ib = document.getElementById("ImageBox");
            var html = "<img src=\"out/" + image + ".gif\" height=430><br>";
            html+="<a href=\"out/" + image + ".html\" target=\"_top\"><%=Language.getInstance().getText("wreports.fullScale")%></a>";
            ib.innerHTML=html;
        }
    </script>
    </head>
    <body>
    <table>
    <td width="150">
    <table border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><m:text key="wreports.reportPreview" default="Report preview"/></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="reportPreviewScroll">
                <center>

    <table>
    <%
        //String filename = "REPORT_001.xml";
        String filename = request.getParameter("report");
        if(filename != null) {
            filename = filename.replaceAll("html", "xml"); // change extention
            filename = filename.substring(1);              // Remove first /
            String realPath = pageContext.getServletContext()
                      .getRealPath(request.getServletPath());

            String filepath = realPath.substring(0, realPath.lastIndexOf('\\')) + "\\out\\" + filename;

            DocumentBuilderFactory builderFactory =
                    DocumentBuilderFactory.newInstance();
            DocumentBuilder builder =
                    builderFactory.newDocumentBuilder();

            Document document = builder.parse(new File(filepath));

            document.getDocumentElement().normalize();
            Element rootElement = document.getDocumentElement();
            NodeList nl = rootElement.getChildNodes();
            int pageNo = 1;
            %>

            <%
            for (int i = 0; i < nl.getLength(); i++) {
                Node n = nl.item(i);
                if (n.getNodeName().equals("report")) {
                    String reportName = n.getAttributes().getNamedItem("name").getNodeValue();
                    String reportNameWithoutExtension = reportName.replace(".gif", "");  // remove extension
                        out.println("<tr><td><a href=\"javascript:showImage('"+ reportNameWithoutExtension +"')\"><img border=\"0\" alt=\"" + reportName + "\" width=\"100\" height=\"100\" src=\"out/" + reportName + "\"></a></td></tr>");

                }
            }
        }
    %>
       </table>         </center>
                </div>
                </td>
                </tr>
                </table>

                </td><td valign="top">
                    <div id="ImageBox"></div>
                </td></table>
    </body>
</html>