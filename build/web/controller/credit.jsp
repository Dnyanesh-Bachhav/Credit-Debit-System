<%-- 
    Document   : signupController.jsp
    Created on : Aug 21, 2022, 12:50:43 AM
    Author     : Dell
--%>

<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="mainController.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    int balance = 0;
    String sql2 = "select balance from userdata where username='"+session.getAttribute("email").toString()+"'";
    int  credit_money =  Integer.parseInt(request.getParameter("credit_money"));
    System.out.println("Name: " + credit_money);
    

    String sql = "insert into credit_data(username,date_time,money,status,previous_balance,total_balance) values(?,?,?,?,?,?)";
    LocalDateTime myDateObj = LocalDateTime.now();
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

    String formattedDate = myDateObj.format(myFormatObj);
    System.out.println("After formatting: " + formattedDate);

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(connection.url, connection.user, connection.password);
        // Get current balance
        PreparedStatement st = con.prepareStatement(sql2);
        ResultSet rs = st.executeQuery(sql2);
        rs.next();
        balance = rs.getInt(1);
        System.out.println("Balance:" + balance);
        // Add entry in credit_data table
        PreparedStatement st1 = con.prepareStatement(sql);
        st1.setString(1,session.getAttribute("email").toString());
        st1.setString(2, formattedDate);
        st1.setInt(3, credit_money);
        st1.setString(4, "credited");
        st1.setInt(5, balance);
        balance = balance + credit_money;
        st1.setInt(6, balance);
        
        int rows = st1.executeUpdate();
        sql = "update userdata set balance=? where username=?";
        PreparedStatement st2 = con.prepareStatement(sql);
        st2.setInt(1,(balance + credit_money));
        st2.setString(2, session.getAttribute("email").toString());
        st2.executeUpdate();
        System.out.println("Money credited successfully...");
        response.sendRedirect("../UserPanel/dashboard.jsp");
        
    } catch (Exception e) {
    }
%>