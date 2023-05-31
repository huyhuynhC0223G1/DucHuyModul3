<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/calculate-servlet">
<h2>Simple Calculator</h2>
<table style="border: 1px black solid">
<tr>
    <td>First operand:</td>
    <td><input name="firstOperand" type="text" placeholder="firstOperand"></td>
</tr>
    <tr>
        <td>Operator:</td>
        <td><select name="calculation">
            <option>+</option>
            <option>-</option>
            <option>*</option>
            <option>/</option>
        </select></td>
    </tr>
    <tr>
        <td>Second operand:</td>
        <td><input name="secondOperand" type="text" placeholder="secondOperand"></td>
    </tr>
    <tr>
        <td><input type="submit" value="Calculate"></td>
    </tr>
</table>
</form>
</body>
</html>