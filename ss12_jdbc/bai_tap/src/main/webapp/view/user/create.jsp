<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/1/2023
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/user-servlet?action=add">
    <table border="1">
        <caption>
            <h2>Add New User</h2>
        </caption>
        <tr>
            <th>User Name:</th>
            <td>
                <input type="text" name="name" id="name">
            </td>
        </tr>
        <tr>
            <th>User Email:</th>
            <td>
                <input type="text" name="email" id="email">
            </td>
        </tr>
        <tr>
            <th>Country:</th>
            <td>
                <input type="text" name="country" id="country">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
