<%-- 
    Document   : select_simple
    Created on : Oct 4, 2017, 10:25:36 PM
    Author     : Eduardo Naranjo <enaranjorivera@bmcc.cuny.edu>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees</title>
    </head>
    <body>
        <h1>Employees</h1>
        <%
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/TEST", "root", "root");

            Statement statement = connection.createStatement();

            ResultSet resultset = statement.executeQuery("select * from employees");
        %>

        <table class="table table-bordered">
            <tr>
                <th>Emp ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <% while(resultset.next()) { %>
            
            <tr>
                    <td><%= resultset.getString(1) %></td>
                    <td><%= resultset.getString(2) %></td>
                    <td><%= resultset.getString(3) %></td>
                    <td><%= resultset.getInt(4) %></td>
                    <td align="center">
                        <a href="update_employee.jsp?id=<%= resultset.getString(1) %>" class="btn btn-success">Update &raquo;</a>
                    </td>
                    <td align="center">
                        <a href="delete_employee.jsp?id=<%= resultset.getString(1) %>" class="btn btn-danger">Delete &raquo;</a>
                    </td>
                </tr>
            
            <% } %>

    </body>
</html>
