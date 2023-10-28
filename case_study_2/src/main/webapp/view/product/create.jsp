<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/2/2023
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/view/navbar.jsp"></c:import>
</head>
<body>
<a href="/product">
    <button type="submit" class="btn btn-primary bg-black text-white">Back</button>
</a><br><br>
<h2 id="success">
    <c:if test="${requestScope['message'] != null}">
        <span style="color: green"><i class="fa-solid fa-square-check"></i>${requestScope['message']}</span>
    </c:if>
</h2>

<div class="d-flex" style="justify-content: space-between">
    <form method="post" action="/product?action=create" class="row row-cols-lg-auto g-3 align-items-center">
        <div class="col-12 mb-3">
            <input name="name" type="text" class="form-control" id="formGroupExampleInput"
                   placeholder="Product's name">
        </div>
        <div class="col-12 col-auto form-check mb-3">
            <input name="description" type="text" class="form-control"
                   placeholder="Product Description">
        </div>
        <div class="col-12 mb-3">
            <div class="input-group ">
                <input name="price" type="number" class="form-control" placeholder="Product price">
                <span class="input-group-text">€</span>
            </div>
        </div>
        <div class="col-12 ">
            <div class="input-group mb-3">
                <input name="image" type="text" class="form-control" id="inputGroupFile02" value="/view/images/x.png">
                <label class="input-group-text" for="inputGroupFile02">Image</label>
            </div>
        </div>
        <div class="col-12 col-auto form-check mb-3">
            <select name="productType" class="form-select" aria-label="Default select example">
                <option value="0">Product Type</option>
                <c:forEach var="productType" items="${productTypeList}">
                    <option value="${productType.productTypeId}">${productType.productTypeName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-12 mb-3">
            <button type="submit" class="btn btn-primary bg-black text-white">Add new products</button>
        </div>
    </form>
</div>
<script>
    setTimeout(function () {
        document.getElementById("success").style.display = "none";
    }, 1000)
</script>
</body>
</html>
