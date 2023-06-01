<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/1/2023
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <caption><h2>List of Users</h2></caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${userList}" var="user">
    <tr>
        <td><c:out value="${user.id}"></c:out></td>
        <td><c:out value="${user.name}"></c:out></td>
        <td><c:out value="${user.email}"></c:out></td>
        <td><c:out value="${user.country}"></c:out></td>
        <td>
            <a href="/user-servlet?action=edit&id=${user.id}"><input type="submit" value="Edit"></a>
        </td>
        <td>
            <form method="post" action="user-servlet?action=delete&id=${user.id}" >
                <input type="submit" value="Delete"></a>
            </form>
        </td>
    </tr>
    </c:forEach>
</body>
</html>
