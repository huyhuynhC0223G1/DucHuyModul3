<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 5/30/2023
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-bordered">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Image</th>
    </tr>
    <c:forEach items="${list}" var="customer" varStatus="loop">
        <tr>
            <td>
                <c:out value="${loop.count}"></c:out>
            </td>
            <td>
                <c:out value="${customer.name}"></c:out>
            </td>
            <td>
                <c:out value="${customer.dayofbirth}"></c:out>
            </td>
            <td>
                <c:out value="${customer.address}"></c:out>
            </td>
            <td>
                <img style="width: 50px" src="<c:out value="${customer.image}"></c:out>">
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
