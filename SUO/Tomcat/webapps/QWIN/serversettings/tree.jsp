<%@ page import="com.qmatic.web.serversettings.TreeManager,
                     com.qmatic.web.serversettings.Tree"%><html>
 <%@ taglib uri="mole" prefix="m" %>
 <%@ taglib uri="webwork" prefix="ww" %>
    <%
        session.setAttribute("CURRENT_TREE", request.getAttribute("tree"));
    %>
    <head>
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />
        <title></title>

        <%@ include file="tree.js"%>

    </head>
    <body>
    <script language="JavaScript">
        top.actionFrame.location.href="blank.jsp";


    </script>

        <table width="180" border="0" cellspacing="0" cellpadding="0" class="borderedbox">
        <tr>
            <td class="boxTop"><h3 class="box"><div id="treeRoot"></div></h3></td>
        </tr>
        <tr>
            <td class="boxMain">
                <div class="settingsTreeScroll">

                    <div id="tree" class="tree" style="line-height: 30px;"></div>
                </div>
            </td>
        </tr>
    </table>
        <script language="JavaScript">
            //alert("Cookie " + getCookie('<ww:property value="$tree"/>'));
        </script>


        <script language="JavaScript">

        		var lastSelectedNode;

            function onNodeClicked(id) {

                n = findNode(id);

								if(lastSelectedNode) {
									lastSelectedNode.isSelected = false;
								}

                if(n.gridRef == "") {
                    top.grid.document.location.href="blank.jsp";   
                }
                if(n.gridRef != "" && n.refType != "raw") {

                    openGrid(n.gridRef);
                }
                if(n.refType == "raw"){
                    openRaw(n.gridRef);
                }

                if(n.actionRef != ""){
                    openAction(n.actionRef);
                } else {
                    closeAction();
                }

                n.isSelected = true;

                lastSelectedNode = n;

                ihtml = '';
                //stateStr = '';
                drawNode(rootNode);
                setLastActivePage(id);
                //saveState();
            }

            function openRaw(gridRef) {
                top.grid.document.location.href = gridRef;
                location.href = "javascript:void (document.close())";
            }

            function openGrid(gridRef) {

                top.grid.document.location.href = "ss.getgrid.action?reload=false&gridRef=" + gridRef;

                // prevent incomplete statusbar in ie.
                location.href = "javascript:void (document.close())";


            }

            function closeAction() {
                top.actionFrame.document.location.href = 'blank.jsp';
                location.href = "javascript:void (document.close())";
            }
            function openAction(ref){
                top.actionFrame.document.location.href = 'ss.getactiongrid.action?gridRef=' + ref;
                location.href = "javascript:void (document.close())";
            }


            //drawNode(rootNode);
            stateStr = "";



        </script>
        <m:jtree treeName="$tree" reloadActivePage="'false'"/>
    </body>
</html>
