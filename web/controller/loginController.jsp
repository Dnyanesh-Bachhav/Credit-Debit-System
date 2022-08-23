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
    String user_password = request.getParameter("password");
    String email = request.getParameter("email");
    String url = "jdbc:mysql://localhost:3306/credit_debit_system";
    boolean isLogin = false;
    String sql = "select * from userdata where username='"+email+"'";

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(url, database_user, password);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        
//        rs.next();
        if(rs.next() == false)
        {
        response.sendRedirect("../login/login.jsp");
        }
        System.out.println(rs.getString("username"));
     
        if(email.equals(rs.getString("username")) && user_password.equals(rs.getString("password")))
        {
            isLogin = true;
//            session.setAttribute("isLogin", isLogin);
            session.setAttribute("name", rs.getString("name"));
            session.setAttribute("email", rs.getString("username"));
            System.out.println("User logged in...");
            response.sendRedirect("../UserPanel/dashboard.jsp");
        }
        else{
        isLogin = false;
        session.setAttribute("isLogin", isLogin);
        System.out.println(isLogin);
        System.out.println("Some of credentials are wrong...");
        response.sendRedirect("../login/login.jsp");
        }
        
    } catch (Exception e) {
    }
%>
