<%@ taglib uri="mole" prefix="m" %>
<html>
    <head>
        <title>Server Settings</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link href="<m:path src="/css/default.css"/>" rel="stylesheet" type="text/css" />

        <SCRIPT LANGUAGE="JavaScript">

            var selectedLink = '';

            function loadTree(tree,link) {
                if(selectedLink) {
                  selectedLink.className = 'listItem';
                  setFolder(selectedLink.id,'closed');
                }
                link.className = 'listItem_selected';
                setFolder(link.id,'open');
                selectedLink = link;
                parent.tree.location.href      = tree;
                parent.grid.location.href      = 'blank.jsp';
                parent.scriptdbg.location.href = 'blank.jsp';
            }
			function loadtouch(link) {
			if(selectedLink) {
                  selectedLink.className = 'listItem';
                  setFolder(selectedLink.id,'closed');
                }
                link.className = 'listItem_selected';
                setFolder(link.id,'open');
                selectedLink = link;
			parent.scriptdbg.location.href = 'blank.jsp';
			parent.tree.location.href      = 'blank.jsp';
			parent.grid.location.href      = 'touchbuttons.qsp2';
			}
			function loadreset(link) {
			if(selectedLink) {
                  selectedLink.className = 'listItem';
                  setFolder(selectedLink.id,'closed');
                }
                link.className = 'listItem_selected';
                setFolder(link.id,'open');
                selectedLink = link;
			parent.scriptdbg.location.href = 'blank.jsp';
			parent.tree.location.href      = 'blank.jsp';
			parent.grid.location.href      = 'reset/reset.html';
			}
			function loadsmsuo(link) {
			if(selectedLink) {
                  selectedLink.className = 'listItem';
                  setFolder(selectedLink.id,'closed');
                }
                link.className = 'listItem_selected';
                setFolder(link.id,'open');
                selectedLink = link;
			parent.scriptdbg.location.href = 'blank.jsp';
			parent.tree.location.href      = 'blank.jsp';
			parent.grid.location.href      = 'smsuo.qsp2';
			}
			function loadlogindel(link) {
			if(selectedLink) {
                  selectedLink.className = 'listItem';
                  setFolder(selectedLink.id,'closed');
                }
                link.className = 'listItem_selected';
                setFolder(link.id,'open');
                selectedLink = link;
			parent.scriptdbg.location.href = 'blank.jsp';
			parent.tree.location.href      = 'blank.jsp';
			parent.grid.location.href      = '/touchscreens/bossallview/settings_logins/del_logins/index.html';
			}
            function setFolder(id,state) {
                var img = id.replace(/link_/, 'img_');
                img = eval("document."+img);
                img.src = state=='closed'?"<m:path src="/images/folder-closed.gif"/>":"<m:path src="/images/folder-open.gif"/>";
            }

            function listOver(item, over) {
              if(over==1 && item.id != selectedLink.id) {
                item.className = 'listItem_over';
              } else {
                if(item.id == selectedLink.id) {
                  item.className = 'listItem_selected';
                } else {
                  item.className = 'listItem';
                }
              }
            }


        </SCRIPT>
    </head>
    <body>

        <jsp:include page="maintree.jsp"/>
    </body>
</html>