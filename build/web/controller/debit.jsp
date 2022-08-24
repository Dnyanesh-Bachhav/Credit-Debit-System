<%-- 
    Document   : signupController.jsp
    Created on : Aug 21, 2022, 12:50:43 AM
    Author     : Dell
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="mainController.connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    int balance = 0;
    int debit_money = Integer.parseInt(request.getParameter("debit_money"));
    System.out.println("Name: " + debit_money);
    String sql = "select balance from userdata where username='"+session.getAttribute("email").toString()+"'";

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(connection.url, connection.user, connection.password);
            LocalDateTime myDateObj = LocalDateTime.now();
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

    String formattedDate = myDateObj.format(myFormatObj);
    System.out.println("After formatting: " + formattedDate);
        // Get current balance
        PreparedStatement st = con.prepareStatement(sql);
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        balance = rs.getInt(1);
        System.out.println("Balance:" + balance);
        // Update balance
        sql = "update userdata set balance=? where username=?";
        PreparedStatement st1 = con.prepareStatement(sql);
        st1.setInt(1, (balance-debit_money));
        st1.setString(2, session.getAttribute("email").toString());
        int rows = st1.executeUpdate();
        // Insert details into history...
        sql = "insert into credit_data(username,date_time,money,status,previous_balance,total_balance) values(?,?,?,?,?,?)";
        PreparedStatement st2 = con.prepareStatement(sql);
        st2.setString(1,session.getAttribute("email").toString());
        st2.setString(2, formattedDate);
        st2.setInt(3, debit_money);
        st2.setString(4, "debited");
        st2.setInt(5, balance);
        st2.setInt(6,(balance-debit_money));
        st2.executeUpdate();

        System.out.println("Money debited successfully...");
        response.sendRedirect("../UserPanel/dashboard.jsp");

    } catch (Exception e) {
    System.out.println(e.getMessage());
    }
%>