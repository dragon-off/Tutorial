<%@page language="java" contentType="text/html;charset=windows-1251" pageEncoding="windows-1251"%>
<%@ page import ="java.net.*" %>
<%@ page import ="java.sql.*" %>
<%@page import="java.io.*"%>
<%@page import="java.servlet.*"%>
<%@page import="java.servlet.http.*"%>
<%@page import="java.util.*"%> 
<%
   Class.forName("com.mysql.jdbc.Driver").newInstance(); 
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/db_workers?user=root&password=user");
  Statement stmt = null; 
  ResultSet rs = null; 
  stmt = conn.createStatement(); 
  rs = stmt.executeUpdate("insert into users (Login,id_priv) values ('"+request.getParameter("userlogin")+"','"+request.getParameter("selpriv")+"')");
%>