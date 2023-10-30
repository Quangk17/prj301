<%-- 
    Document   : user
    Created on : May 30, 2023, 11:05:05 AM
    Author     : ASUS
--%>

<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>User's Information</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if(loginUser == null  || !"US".equals(loginUser.getRoleID())){
                response.sendRedirect("login.html");
                return;
            }
        %>
        UserID:<%= loginUser.getUserID() %><br />
        FullName:<%= loginUser.getFullName()%><br />
        RoleID:<%= loginUser.getRoleID()%><br />
        Password:<%= loginUser.getPassword()%><br />
        Status:<%= loginUser.getStatus()%><br />
    </body>
</html>
