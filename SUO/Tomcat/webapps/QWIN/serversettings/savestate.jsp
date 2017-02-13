<%@ page import="java.util.Enumeration,
                 java.util.HashMap"%>
 <%--
  Created by IntelliJ IDEA.
  User: Jan Gabrielsson
  Date: 2005-okt-04
  Time: 17:28:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title>Simple jsp page</title></head>
  <body>
  <%

      String type = (String)request.getParameter("type");
      if(type.equals("state")){
        String tree = (String)request.getParameter("tree");
        String state = (String)request.getParameter("state");
        HashMap treeStates = (HashMap)request.getSession().getAttribute("treeStates");
        if(treeStates == null){
            treeStates = new HashMap();
        }
        treeStates.put(tree,state);
        request.getSession().setAttribute("treeStates",treeStates);

      }
      else if(type.equals("lastactive")){
        String tree = (String)request.getParameter("tree");
        String state = (String)request.getParameter("state");
        HashMap lastActiveInTree = (HashMap)request.getSession().getAttribute("lastActiveInTree");
        if(lastActiveInTree == null){
            lastActiveInTree = new HashMap();
        }
        lastActiveInTree.put(tree,state);
        request.getSession().setAttribute("lastActiveInTree",lastActiveInTree);


      }

  %>
  SUCCESS <%=type%>




  </body>
</html>