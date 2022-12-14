<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import = "mainController.connection"%>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <%!
            int count = 0;
        %>
        <%
            
            String sql = "select * from credit_data where username='"+session.getAttribute("email").toString()+"'";

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(connection.url, connection.user, connection.password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            

        %>
        <div class="mt-5" style="display: flex;justify-content: center;align-items: center;">
            <div class="shadow p-3 mb-5 bg-body rounded">Transaction History</div>
        </div>
        <div style="display: flex;justify-content: center;align-items: center;" >
        
        <table class="table table-hover table-striped mt-5 border" style="width: 80%;" >
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Money</th>
                    <th scope="col">Date</th>
                    <th scope="col">Total Amount</th>
                </tr>
            </thead>
            <tbody>
                <%        
                    
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= rs.getString(4)%> <%= rs.getString(5) %>...</td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getInt(7)%></td>

                </tr>
                <%
                    }

                %>
            
            </tbody>
        </table>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
