<%
    session.removeAttribute("email");
    session.removeAttribute("name");
    response.sendRedirect("../index.html");
%>