<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/2/2023
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<style>
    *,
    *::before,
    *::after {
        box-sizing: border-box;
    }

    * {
        padding: 0;
        margin: 0;
    }

    .message {
        background: black;
        text-align: center;
        color: white;
        padding: 0.5em 0;
        font-size: 14px;
    }

    p {
        margin: 0;
    }

    .logo {
        width: 150px;
    }

    .bag-icon {
        display: inline;
        margin-left: 1rem;
    }

    i {
        font-size: 1.5rem;
    }

    .card {
        border: none;
    }

    footer a {
        text-decoration: none;
        text-transform: uppercase;
        cursor: pointer;
        display: inline-block;
        color: black;
    }

    footer a:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .footer--text {
        color: gray;
        font-size: 0.85rem;
    }

    .links {
        font-size: 1.5rem;
        text-decoration: none;
        margin-left: 1.5rem;
        padding: 0;
        color: gray;
        font-weight: lighter;
    }

    .links:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .hamburger {
        background: white;
        border: none;
    }

    .sign-up button,
    .log-in button,
    .sign-up button:hover,
    .log-in button:hover {
        color: white;
    }

    @media (max-width: 768px) {
        .overlay--main {
            z-index: 999;
            position: absolute;
            top: 120px;
            bottom: 0;
            left: 0;
            right: 0;
            background: white;
            /*padding: .5em 1em;*/
        }

        .overlay--main a {
            font-size: 1.5rem;
            font-weight: lighter;
            text-decoration: none;
            color: black;
        }
    }

    .color1 {
        display: block;
        background-color: #778899;
        height: 100px;
    }

</style>
<div class="header">
    <div class="message">
        <p class="">
            NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS
        </p>
    </div>
    <!-- <div class="container-fluid">
      <img
        class="w-100"
        src="https://static.vecteezy.com/system/resources/previews/002/393/980/original/corporate-banner-with-modern-design-free-vector.jpg"
      />
    </div> -->
    <div class="container-fluid p-md-5 mt-1">
        <div class="row row-cols-3 justify-content-between align-items-center pt-2">
            <div class="col col-auto d-block d-md-none">
                <button class="hamburger" onclick="switcher()">
                    <i class="fa fa-bars switcher-icon"></i>
                </button>
            </div>

            <div class="row col col-md-auto align-items-center">
                <div class="col col-auto">
                    <img
                            class="logo"
                            src="https://cdn.shopify.com/s/files/1/0554/1291/6301/files/JOJI_LOGO.png?v=1661459445&width=400"
                    />
                </div>
                <div class="col d-md-block d-none">
                    <a class="links" href="">SMITHEREENS</a>
                    <a class="links" href="">MERCH</a>
                    <a class="links" href="">MUSIC</a>
                </div>
            </div>

            <div class="col col-auto">
                <i class="far fa-user"></i>
                <i class="fa fa-shopping-bag bag-icon"></i>
            </div>
        </div>
    </div>
</div>
</body>
</html>
