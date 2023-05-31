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
<form method="post" action="/product?action=add">
    <table>
        <tr>
            <td>Id sản phẩm</td>
            <td><input type="text" name="id" id="id"></td>
        </tr>
        <tr>
            <td>Tên sản phẩm</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>Giá sản phẩm</td>
            <td><input type="text" name="price" id="price"></td>
        </tr>
        <tr>
            <td>Mô tả sản phẩm</td>
            <td><input type="text" name="describe" id="describe"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" name="producer" id="producer"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Add"></td>
        </tr>
    </table>
</form>
</body>
</html>
