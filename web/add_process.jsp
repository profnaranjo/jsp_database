<%-- 
    Document   : add_process
    Created on : Oct 4, 2017, 8:39:36 PM
    Author     : enaranjorivera
--%>

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
        <h1>Add Employee</h1>

    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost/TEST"
                       user = "root"  password = "root"/>


    <c:set var = "fname" value = "${param.fname}"/>
    <c:set var = "lname" value = "${param.lname}"/>
    <c:set var = "age" value = "${param.age}"/>

    <pre>
        First: <c:out value = "${fname}" />
        Last:  <c:out value = "${lname}" />
        Age:   <c:out value = "${age}" />
    </pre>

    <sql:update dataSource = "${snapshot}" var = "result">
        INSERT INTO Employees(last, first, age) 
        VALUES (?, ?, ?);
        <sql:param value = "${lname}" />
        <sql:param value = "${fname}" />
        <sql:param value = "${age}" />
    </sql:update>

    <c:redirect url="select_employees.jsp"/>



</body>
</html>
