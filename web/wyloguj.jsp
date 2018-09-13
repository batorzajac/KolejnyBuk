<%-- 
    Document   : wyloguj
    Created on : 2018-09-13, 13:59:46
    Author     : MatekTSW
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
  <%
                session.setAttribute("user_name",null);
                session.setAttribute("konto",null);
                session.setAttribute("user_role",null);
               
session.invalidate();
    response.sendRedirect("index.jsp");                                

%>
  </body>
</html>