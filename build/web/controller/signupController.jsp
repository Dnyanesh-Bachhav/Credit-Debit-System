<%-- 
    Document   : signupController.jsp
    Created on : Aug 21, 2022, 12:50:43 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String name = request.getParameter("name");
        System.out.println("Name: "+name);
        String password = request.getParameter("password");
        System.out.println("Password: "+password);
%>