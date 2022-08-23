<%-- 
    Document   : login.jsp
    Created on : Aug 19, 2022, 3:50:02 PM
    Author     : Dell
--%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"></head>
    <body>
        <%
            String url = "jdbc:mysql://localhost:3306/credit_debit_system";
            String name = "root";
            String password = "";
            String sql = "select * from userdata";
             
            try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(url, name, password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
//             while(rs.next())
//             {
             %>
            <%-- <p style="border: 1px solid black" >Name:<%=rs.getString(1) %></p>
             <%= rs.getString(2) %>
             <%= rs.getString(3) %>
             <%= rs.getString(4) %> --%>
             
        <%
//            }
            }catch(Exception e){
            System.out.println("Error occured..."+e.getMessage());
            }
            %>
        
        <section class="vh-100" style="background-color: #eee;">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12 col-xl-11">
                        <div class="card text-black" style="border-radius: 25px;">
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>

                                        <form class="mx-1 mx-md-4" action="../controller/loginController.jsp">
                                           

                                            <div class="d-flex flex-row align-items-center mb-2">
                                                <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <label class="form-label" for="form3Example3c">Your Email</label>
                                                    <input type="email" id="form3Example3c" name="email" class="form-control" />
                                                    
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-2">
                                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <label class="form-label" for="form3Example4c">Password</label>
                                                    <input type="password" id="form3Example4c" name="password" class="form-control" />
                                                    
                                                </div>
                                            </div>


                                            <div class="form-check d-flex justify-content-center mb-5">
                                                <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
                                                <label class="form-check-label" for="form2Example3">
                                                    I agree all statements in <a href="#!">Terms of service</a>
                                                </label>
                                            </div>

                                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                <button type="submit" class="btn btn-primary btn-lg">Register</button>
                                            </div>

                                        </form>

                                    </div>
                                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                             class="img-fluid" alt="Sample image">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            <script>
            
        
                </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
