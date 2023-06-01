<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 5/31/2023
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<p>
<a href="/product?action=add">Thêm mới sản phẩm</a>
</p>
<table class="table table-bordered">
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả sản phẩm</th>
        <th>Nhà sản xuất</th>
    </tr>
    <c:forEach items="${productList}" var="product" >
        <tr>
            <td>
                <c:out value="${product.id}"></c:out>
            </td>
            <td>
                <c:out value="${product.nameProduct}"></c:out>
            </td>
            <td>
                <c:out value="${product.price}"></c:out>
            </td>
            <td>
                <c:out value="${product.describe}"></c:out>
            </td>
            <td>
                <c:out value="${product.producer}"></c:out>
            </td>
            <td>
                <a href="/product?action=edit&id=${product.id}">
                <input type="submit" value="Edit"></a>
            </td>
            <td>
                <a href= "/product?action=delete&id=${product.id}">
                <input type="submit" value="Delete"></a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
