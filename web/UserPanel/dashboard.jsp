<%-- 
    Document   : dashboard
    Created on : Aug 22, 2022, 6:36:19 PM
    Author     : Dell
--%>
<%@page import="java.sql.*" %>
<%@page import="mainController.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"/>
    </head>
    <body>
        <%
            String sql = "select balance from userdata where username='" + session.getAttribute("email") + "'";

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(connection.url, connection.user, connection.password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            int balance = rs.getInt(1);
        %>
        <!--<h1>Hello World!</h1>-->

        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid ml-5">
                <a class="navbar-brand " href="#">
                    <img src="../assets/images/Bank_Logo.png" alt="" width="30" height="30" class="d-inline-block align-text-top">
                    <%= session.getAttribute("name").toString()%>
                </a> 
                <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal" class="btn btn-danger" style="margin-right: 50px;" >

                    Logout
                </a>
            </div>
        </nav>
        <div style="display: flex;align-items: center; width: max-content;padding: 10px;border-radius: 10px;margin-left: 20px;" class="shadow mt-4">
            <h2> Current Balance: </h2> <span class="fst-italic" style="font-weight: bold;font-size: 25px; margin-left: 20px;" > ₹<%= balance%> </span>
        </div>
        <!--Modal Logout-->
        <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../controller/logout.jsp">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Credit</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">  
                            Are you sure you want to exit this session?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger">Logout</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Credit -->
        <div class="modal fade" id="creditModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../controller/credit.jsp">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Credit</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label">Enter Money to credit:</label>
                                <input type="number" class="form-control" name="credit_money" id="recipient-name">
                            </div>
                            <div class="mb-3" hidden>
                                <label for="recipient-name" class="col-form-label">Time:</label>
                                <input type="number" class="form-control" name="time" id="date_time">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal Debit -->
        <div class="modal fade" id="debitModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../controller/debit.jsp">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Debit</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label">Enter Money to debit:</label>
                                <input type="number" class="form-control" name="debit_money" id="recipient-name">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container px-5 mt-5 mb-5 " style="display: flex;justify-content: space-around;align-items: center;">
            <div class="card text-center ml-2 pt-4" style="width: 18rem;display: flex;align-items: center;justify-content: center;">
                <div style="width: 45%;height: 45%;" >
                    <img src="../assets/images/incoming_payment.jpg" class="img-fluid" alt="History" style=" object-fit: contain;">
                </div>
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <hr/>
                    <button type="button" class="btn btn-primary" style="text-align: center;" onclick="setDate();" data-bs-toggle="modal" data-bs-target="#creditModal" >Credit</button>
                </div>
            </div>
            <div class="card text-center ml-2 pt-4" style="width: 18rem;display: flex;align-items: center;justify-content: center;">
                <img src="../assets/images/outgoing_payment.jpg" class=" img-fluid " alt="History" style="width: 45%;height: 45%;">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <hr/>
                    <button type="button" class="btn btn-primary" style="text-align: center;" data-bs-toggle="modal" data-bs-target="#debitModal" >Debit</button>
                </div>
            </div>
            <div class="card text-center ml-2 pt-4" style="width: 18rem;display: flex;align-items: center;justify-content: center;">
                <img src="../assets/images/clock.png" class=" img-fluid " alt="History" style="width: 45%;height: 45%;">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <hr/>
                    <a href="../UserPanel/history.jsp" class="btn btn-primary" style="text-align: center;">History</a>
                </div>
            </div>
        </div>
        <footer class=" bg-light p-2 text-black" style="  position: fixed;left: 0;bottom: 0;width: 100%;text-align: center;" >Copyright 2022&copy; All rights reserved.</footer>
        <script>
            function setDate() {
                var d = new Date();
                console.log("Date:" + d);
                document.getElementById("date_time").innerHTML = d + "";
            }

        </script>
        <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
