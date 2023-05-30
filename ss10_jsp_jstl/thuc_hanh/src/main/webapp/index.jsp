<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<form method="post" action="currency-converter.jsp">
    <h2>Currency Converter</h2>
    <label>Rate:</label><br>
    <input type="text" name="rate" placeholder="RATE" value="20000"><br>
    <label>USD</label><br>
    <input type="text" name="usd" placeholder="USD" value="0"><br>
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>