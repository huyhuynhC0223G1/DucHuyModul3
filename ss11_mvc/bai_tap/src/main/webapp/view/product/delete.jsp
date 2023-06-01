<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/1/2023
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/product?action=delete">
    <table class="table table-bordered">
        <tr>
            <th>Id</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Mô tả sản phẩm</th>
            <th>Nhà sản xuất</th>
        </tr>
        <tr>
            <td>
                <input type="text" name="id" id="id" value="${product.id}">
            </td>
            <td>
                <input type="text" name="name" id="name" value="${product.nameProduct}">
            </td>
            <td>
                <input type="text" name="price" id="price" value="${product.price}">
            </td>
            <td>
                <input type="text" name="describe" id="describe" value="${product.describe}">
            </td>
            <td>
                <input type="text" name="producer" id="producer" value="${product.producer}">
            </td>
            <td>
                <input type="submit" value="Confirm">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
