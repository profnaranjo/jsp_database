<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost/TEST"
                   user = "root"  password = "root"/>

<c:set var = "empId" value = "${param.id}"/>

<sql:query dataSource = "${snapshot}" var = "result">
    SELECT * from Employees
    where id = ?
    <sql:param value = "${empId}" />
</sql:query>
<h1>Update Employee</h1>

<form name="updateFrm" action="update_execute.jsp" method="post">
    <c:forEach var = "row" items = "${result.rows}">
        <input type="hidden" name="id" id="id" value="<c:out value = "${row.id}"/>">
        Employee ID: <c:out value = "${row.id}"/><br>
        First Name: <input 
            type="text" 
            name="fname" 
            id="fname" 
            value="<c:out value = "${row.first}"/>"><br>
        Last Name: <input type="text" name="lname" id="lname" value="<c:out value = "${row.last}"/>"><br>
        Age: <input type="number" name="age" id="age" min="18" value="<c:out value = "${row.age}"/>"><br>
        <input type="submit" value="Save Employee">
    </c:forEach>
</form>         