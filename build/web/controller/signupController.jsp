<%-- 
    Document   : signupController.jsp
    Created on : Aug 21, 2022, 12:50:43 AM
    Author     : Dell
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mainController.connection"%>
<%
    
    String user_name = request.getParameter("name");
    System.out.println("Name: " + user_name);
    String user_password = request.getParameter("password");
    System.out.println("Password: " + user_password);
    String email = request.getParameter("email");
    int balance = Integer.parseInt(request.getParameter("balance"));

    String sql = "insert into userdata(name,username,password,balance) values(?,?,?,?)";

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(connection.url, connection.user, connection.password);
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,user_name);
        st.setString(2, email);
        st.setString(3, user_password);
        st.setInt(4,balance);
        int rows = st.executeUpdate();
        System.out.println("User added...!!!");
        response.sendRedirect("../index.html");
        
    } catch (Exception e) {
    }
%>