<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/4/2023
  Time: 11:39 PM
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

<div class="container mt-4">
    <div id="thongbao" class="alert alert-danger d-none face" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>

    <div class="card">
        <div class="container-fliud">
            <form name="frmsanphamchitiet" id="frmsanphamchitiet" method="post"
                  action="/php/twig/frontend/giohang/themvaogiohang">
                <input type="hidden" name="sp_ma" id="sp_ma" value="5">
                <input type="hidden" name="sp_ten" id="sp_ten" value="SMITHEREENS Black Pullover Hoodie">
                <input type="hidden" name="sp_gia" id="sp_gia" value="69.05">
                <input type="hidden" name="hinhdaidien" id="hinhdaidien" value="SMITHEREENS Black Pullover Hoodie">

                <div class="wrapper row">
                    <div class="preview col-md-6 preview-pic tab-content tab-pane active" id="picture">
                        <img src="/view/images/3.png" width="500px">
                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${productList.productName}</h3>
                        <p class="product-description"><span>${productList.productDescription}</span>
                           </p>
                        <small class="text-muted">Old price: <s><span>(${productList.price} + 10)</span></s></small>
                        <h4 class="price">New price: <span>${productList.price}</span></h4>
                        <p class="vote"><strong>100% quality goods</strong>
                        </p>
                        <h5 class="sizes">Sizes:
                            <span class="size" data-toggle="tooltip" title="cỡ Nhỏ">S</span>
                            <span class="size" data-toggle="tooltip" title="cỡ Trung bình">M</span>
                            <span class="size" data-toggle="tooltip" title="cỡ Lớn">L</span>
                            <span class="size" data-toggle="tooltip" title="cỡ Đại">XL</span>
                        </h5>
                        <h5 class="colors">Colors:
                            <span class="color orange not-available" data-toggle="tooltip"
                                  title="Hết hàng"></span>
                            <span class="color green"></span>
                            <span class="color blue"></span>
                        </h5>
                        <div class="action">
                            <button type="submit" class="btn btn-primary bg-black text-white">Add to cart</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="container-fluid">
            <h3>Product details</h3>
        </div>
    </div>
</div>
<!-- End block content -->


<!-- footer -->
<footer class="footer mt-auto py-3">
    <div class="d-flex" style="justify-content: center">
        <img src="/view/images/cards.png" height="82" width="684"/></tr>
    </div>
</footer>
<script
        defer
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"
></script>
<script
        src="https://kit.fontawesome.com/4bf93b0ca4.js"
        crossorigin="anonymous"
></script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>