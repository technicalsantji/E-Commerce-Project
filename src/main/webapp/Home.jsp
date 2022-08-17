<%@page import="com.Entities.User"%>
<% 

User user=(User)session.getAttribute("currentuser");
if(user==null){
     session.setAttribute("msg", "This page not directed access ! please Login");
     response.sendRedirect("Login.jsp");
     return;
    }
    else
    {
    if(user.getUserType().equals("admin")){
     
    session.setAttribute("msg", "you can not access  User panel page  .");
    response.sendRedirect("Login.jsp");
    }
    
    
    }
   
%>


<%-- 
    Document   : Home.jsp
    Created on : Aug 12, 2022, 9:47:05 AM
    Author     : SANT JI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
         <%@include file="Component/all_css_js_bootstrap.jsp" %>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <%@include  file="Navbar.jsp" %>
       
    </body>
</html>
