<%-- 
    Document   : signupController.jsp
    Created on : Aug 21, 2022, 12:50:43 AM
    Author     : Dell
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String database_user = "root";
    String password = "";
    String user_name = request.getParameter("name");
    System.out.println("Name: " + user_name);
    String user_password = request.getParameter("password");
    System.out.println("Password: " + user_password);
    String email = request.getParameter("email");
    String url = "jdbc:mysql://localhost:3306/credit_debit_system";

    String sql = "insert into userdata(name,username,password) values(?,?,?)";

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(url, database_user, password);
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,user_name);
        st.setString(2, email);
        st.setString(3, user_password);
        int rows = st.executeUpdate();
        System.out.println("User added...!!!");
        response.sendRedirect("../index.html");
        
    } catch (Exception e) {
    }
%>