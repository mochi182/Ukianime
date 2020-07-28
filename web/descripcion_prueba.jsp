<%-- 
    Document   : descripcion
    Created on : Jul 28, 2020, 11:17:45 AM
    Author     : galop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String id_anime = request.getParameter("id_anime"); %>
        <h1><%=id_anime %></h1>
    </body>
</html>
