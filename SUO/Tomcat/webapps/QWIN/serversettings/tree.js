<script language="JavaScript">
    var ihtml = "";
    var lines = new Array();
    lines[0] = true;
    var rootNode = new Node(null, "Root Node", true);
    rootNode.isOpen = false;
    rootNode.id = 0;
    var deaph = 0;
    var tab = "&nbsp;&nbsp;&nbsp";
    var lastActive;    // The last active page in the right most frame

    function Node(parent, label, isNode) {
        this.parent     = parent;
        this.isNode     = isNode;
        this.subNodes   = new Array(100);
        this.nodeCount  = 0;
        this.label      = label;
        this.addNode    = addNode;
        this.isOpen     = false;
        this.id         = "0";
        this.gridRef    = "";
        this.refType    = "";
        this.actionRef  = ""
        this.isLast     = isLast;
        this.baseId     = 0;
        this.hasChilds  = hasChilds;
        this.isSelected = false;
    }

    function hasChilds() {
        return this.nodeCount > 0;
    }

    function isLast() {
        var parent = this.parent;
        if(parent != null){
            if(parent.nodeCount > 0){
                return this.parent.subNodes[this.parent.nodeCount-1].baseId == this.baseId;
            }else{
                return true;
            }
        }
        return true;
    }

    function showHide(node) {
        var n = document.getElementById(node);
        n.style.visibility = "hidden";

    }

    function addNode(node) {
        node.id = this.id + "," + this.nodeCount;
        node.baseId = this.nodeCount;
        this.subNodes[this.nodeCount++] = node;
    }

    function drawNode(node) {

				var isLink = false;
				var ih = '';
				var cssClass = '';
								
        if(node.parent == null){
						var treeRoot = document.getElementById("treeRoot");
						treeRoot.innerHTML = node.label;
        }

        var tree = document.getElementById("tree");
        deaph++;
        if(node.isSelected) {
	        ih+="<tr><td class=\"treeItem_selected\">";
	      } else {
	        ih+="<tr><td class=\"treeItem\" onMouseOver=\"this.className='treeItem_over'\" onMouseOut=\"this.className='treeItem'\">";
	      }
        ih+="<table cellspacing=0 cellpadding=0 border=0><td>";

				lines[deaph] = node.isLast();
				
				for(tab = 1; tab < deaph; tab++){
					if(!lines[tab]) {
						ih += "<img border=\"0\" src=\"images/tree_5.gif\">";
					} else {
						if(tab == 1) {
							ih += "<img border=0 src=\"images/space.gif\" width=4>";
						} else {
							ih += "<img border=0 src=\"images/space.gif\">";
						}
					}
				}		
				ih+="</td><td align=\"left\">";				

				// --------------------------------------
				// ----- Expand/collapse Link START -----
        if(node.parent == null){
        		isLink = true;
            if(node.isOpen) {
              img="images/tree_top-open.gif";
            } else {
              img="images/tree_top.gif";
            }
        }else{                    
            if(!node.isLast() && !node.hasChilds()){
              img="images/tree_1.gif";
            }
            if(!node.isLast() && node.hasChilds()){
	        		isLink = true;
	            if(node.isOpen) {
                img="images/tree_2-open.gif";
              } else {
                img="images/tree_2.gif";
              }
            }

            if(node.isLast() && !node.hasChilds()){
              img="images/tree_3.gif";
            }
            if(node.isLast() && node.hasChilds()){
	        		isLink = true;
	            if(node.isOpen) {
                img="images/tree_4-open.gif";
              } else {
                img="images/tree_4.gif";
              }
            }
        }
				
				if(isLink) {
	        ih+="<a href=\"javascript:openClose('" + node.id + "');\">" + "<img border=\"0\" src=\"" + img + "\">" + "</a>";
	      } else {
	      	ih+="<img border=\"0\" src=\"" + img + "\">";
	      }
	      
				// ----- Expand/collapse Link END -----
				// ------------------------------------


				// ----------------------------
				// ----- Image Link START -----
				if(node.hasChilds()) {
	        ih+="<NOBR><a href=\"javascript:onNodeClicked('" + node.id + "');\">";
          if(node.isOpen){
              ih+="<img border=\"0\" src=\"images/folder-open.gif\">";
          }else{
              ih+="<img border=\"0\" src=\"images/folder-closed.gif\">";
          }
	        ih+="</a></NOBR>";
				}
        ih+="</td>";
				// ----- Image Link END -----
				// --------------------------


        if(node.isSelected) {
        	cssClass = 'node_selected';
        } else {
        	cssClass = 'node';
        }

				// ----- Text Link START -----
				// ---------------------------
        ih+="<td class=\"" + cssClass + "\" onClick=\"javascript:onNodeClicked('" + node.id + "');\">";
        ih+="<NOBR>&nbsp;" + node.label + "</NOBR>";
        ih+="</td><td class=\"node\" width=\"100%\" onClick=\"onNodeClicked('" + node.id + "');\">&nbsp;</td>";
				// ----- Text Link END -----
				// -------------------------

        ih+="</table></td></tr>";
				
        if(node.parent != null) {
        	ihtml += ih;
        }
				
        if(node.isOpen || node.parent == null) {
            for(var i = 0; i < node.nodeCount; i++){
                drawNode(node.subNodes[i]);
            }
        }
        deaph--;

        if(deaph == 0) {
	        tree.innerHTML = "<table cellspacing=0 cellpadding=0 border=0 width=100%>" + ihtml + "</table>";
	      }

    }

    function findNode(id) {
        if(id.indexOf(",") > -1) {
            var ids = id.split(",");
            n = rootNode.subNodes[ids[1]]; // 0 is root node
            for(i = 2; i < ids.length; i++) {
                n = n.subNodes[ids[i]];
                if(n == null){
                    return rootNode;
                }
            }
        }else{
            return rootNode;
        }
        return n;
    }

    function openClose(id) {
        ihtml = "";
        n = findNode(id);
        n.isOpen = !n.isOpen;
        drawNode(rootNode);
        saveState();

    }
    var stateStr = "";

    function getStateString(node) {
        var i;
        if(node.isOpen){
            stateStr+=node.id + "|";
        }
        for(i = 0; i< node.nodeCount; i++){
            getStateString(node.subNodes[i]);
        }

        return stateStr;
    }

    function restoreActivePage(page){
        alert(page);
    }

    function setLastActivePage(page){
        lastActive = page;
        sndReq("savestate.jsp?type=lastactive&tree=<ww:property value="$tree"/>&state="+page);
    }

    function clearState(){
        //document.cookie = "";
    }

    function getKey(){
        return "<m:crc32 value="$tree"/>";
    }



    function saveState() {
        sndReq("savestate.jsp?type=state&tree=<ww:property value="$tree"/>&state="+getStateString(rootNode));
    }

    function restoreState(state, laid){
        if(state) {
            var nids = state.split("|");

            for(id = 0; id < nids.length; id++) {
                n = findNode(nids[id]);
                if(n != null){
                    n.isOpen = true;
                }
            }
        }
        drawNode(rootNode);

        if(laid)
            onNodeClicked(laid);
    }
    function createRequestObject() {
        var ro;
        var browser = navigator.appName;
        if(browser == "Microsoft Internet Explorer"){
            ro = new ActiveXObject("Microsoft.XMLHTTP");
        }
        else{
            ro = new XMLHttpRequest();
        }
            return ro;
    }

    var http = createRequestObject();

    function sndReq(action) {
        http.open('get', action, true);

        http.onreadystatechange = handleResponse;
        http.send(null);
    }

    function handleResponse() {
        if(http.readyState == 4){
            var response = http.responseText;

            //alert("Treestate saved = "+response);
        }


    }

</script>