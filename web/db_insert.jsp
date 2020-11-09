<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Database Insert</h1>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost/TEST"
                           user = "root"  password = "root"/>


        <sql:update dataSource = "${snapshot}" var = "result">
            INSERT INTO Employees VALUES (104, 2, 'Nuha', 'Ali');
        </sql:update>


        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Employees;
        </sql:query>
        <table border = "1" width = "100%">
            <tr>
                <th>Emp ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.first}"/></td>
                    <td><c:out value = "${row.last}"/></td>
                    <td><c:out value = "${row.age}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
