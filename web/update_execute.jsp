<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1>Insert</h1>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost/TEST"
                           user = "root"  password = "root"/>

        <c:set var = "id" value = "${param.id}"/>
        <c:set var = "fname" value = "${param.fname}"/>
        <c:set var = "lname" value = "${param.lname}"/>
        <c:set var = "age" value = "${param.age}"/>

        <pre>
        ID:    <c:out value = "${id}" />
        First: <c:out value = "${fname}" />
        Last:  <c:out value = "${lname}" />
        Age:   <c:out value = "${age}" />
        </pre>

        <sql:update dataSource = "${snapshot}" var = "count">
            UPDATE Employees SET last = ?, first = ?, age = ?
            WHERE id = ?;
            <sql:param value = "${lname}" />
            <sql:param value = "${fname}" />
            <sql:param value = "${age}" />
            <sql:param value = "${id}" />
        </sql:update>

        <c:redirect url="select_employees.jsp"/>

    </body>
</html>
