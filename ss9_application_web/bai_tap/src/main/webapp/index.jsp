<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/DiscountServlet">
    <label for = "product_description">
    Product Description:
    </label>
    <input type="text" name="product_description" id="product_description"/><br>
    <label for = "list_price">
        List Price:
    </label>
    <input type="number" name="list_price" id="list_price"/><br>
    <label for = "discount_percent">
        Discount Percent %:
    </label>
    <input type="number" name="discount_percent" id="discount_percent"/><br>
    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>