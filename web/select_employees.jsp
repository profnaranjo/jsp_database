<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SELECT Operation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>

    <body>
        
        <h1>Employees</h1>
        
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost/TEST"
                           user = "root"  password = "root"/>
        
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Employees;
        </sql:query>
        
            <table class="table table-bordered">
            <tr>
                <th>Emp ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.first}"/></td>
                    <td><c:out value = "${row.last}"/></td>
                    <td><c:out value = "${row.age}"/></td>
                    <td align="center">
                        <a href="update_employee.jsp?id=<c:out value = "${row.id}"/>" class="btn btn-success">Update &raquo;</a>
                    </td>
                    <td align="center">
                        <a href="delete_employee.jsp?id=<c:out value = "${row.id}"/>" class="btn btn-danger">Delete &raquo;</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
            
            <h3>change</h3>
            
        <br>
        <a href="add_employee.jsp" class="btn btn-danger">Add Employee</a>
    </body>
</html>
