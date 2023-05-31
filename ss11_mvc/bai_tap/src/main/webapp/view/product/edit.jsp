<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 5/31/2023
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/product?action=edit">
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
                <label>${product.id}</label>
                <input type="text" name="id" id="id">
            </td>
            <td>
                <label>${product.nameProduct}</label>
                <input type="text" name="name" id="name">
            </td>
            <td>
                <label>${product.price}</label>
                <input type="text" name="price" id="price">
            </td>
            <td>
                <label>${product.describe}</label>
                <input type="text" name="describe" id="describe">
            </td>
            <td>
                <label>${product.producer}</label>
                <input type="text" name="producer" id="producer">
            </td>
            <td>
                <input type="submit" value="Confirm">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
