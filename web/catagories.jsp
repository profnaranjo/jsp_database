<%-- 
    Document   : index
    Created on : Sep 25, 2017, 8:22:30 PM
    Author     : enaranjorivera
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
    <head>
        <title>SELECT Operation</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

    </head>

    <body>
        <h3>Categories</h3>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost/TEST"
                           user = "root"  password = "root"/>
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Categories;
        </sql:query>
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.CategoryID}"/></td>
                        <td><c:out value = "${row.CategoryName}"/></td>
                        <td><c:out value = "${row.Description}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
