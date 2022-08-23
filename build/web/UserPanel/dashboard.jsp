<%-- 
    Document   : dashboard
    Created on : Aug 22, 2022, 6:36:19 PM
    Author     : Dell
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"/>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1>Dashboard...</h1>
        <p>Name: <%= session.getAttribute("name").toString()%></p>
        <div class="container px-5" style="display: flex;justify-content: space-around;align-items: center;">
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <button type="button" class="btn btn-primary">Primary</button>
                </div>
            </div>
            <div class="card ml-2 " style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <button type="button" class="btn btn-primary">Primary</button>
                </div>
            </div>
            <div class="card ml-2 " style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <button type="button" class="btn btn-primary" style="text-align: center;" >Primary</button>
                </div>
            </div>
        </div>
        <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
