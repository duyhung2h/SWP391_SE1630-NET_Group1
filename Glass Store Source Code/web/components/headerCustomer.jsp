<%-- 
    Document   : headerCustomer
    Created on : Oct 2, 2022, 2:18:58 AM
    Author     : Admin
--%>

<%-- all attributes except import ones --%>
<%@ page session="false"%>
<%-- import attributes start here --%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="css/button.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/png" href="image/faviconLogo.png" />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <a href="homepage"><img class="navbar-brand" src="../images/Logo.png" width="200px"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto row align-items-start col-4">
                    <!--Link to Home Page-->
                    <li class="nav-item active">
                        <a class="nav-link d-inline-block" href="homepage"><i class="fa fa-home d-inline-block" id="home"></i> Homepage</a>
                    </li>

                    <!--Link to ProductList-->
                    <li class="nav-item">
                        <a class="nav-link " href="products" id="linkHover">Products</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0 col-8 justify-content-end" action="products" method="GET">
                    <input class="form-control mr-sm-2 col-5" type="search" placeholder="Search" aria-label="Search..." oninput="searchByName(this)" value="${txtS}" name="txt" id="searchText">
                    <button class="btn my-2 my-sm-0" type="submit" id="search"><i class="fa fa-search"></i></button>

                    <a class="btn btn-sm ml-4" href="cart" id="cart">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light" id="CartNum">${c.countNumCart(sessionScope.acc.id)}</span>
                    </a>
                    <!--Add thêm code Login vao day-->
                    <ul class="navbar-nav mr-auto col-3 justify-content-end" style="margin-right: 0!important;">
                        <c:if test="${param.acc == null || param.acc == ''}">
                            <a class="nav-link" href="login" id="linkHover">Login</a>
                        </c:if>
                        <c:if test = "${param.acc != null && param.acc != ''}">
                            <a class="nav-link" href="profile" id="bell"><i class="fas fa-user"></i></i> ${param.acc}</a>
                            <div class="navbar-nav-container">
                                <!--Link to user profile-->
                                <div class="navbar-nav-popup">
                                    <a class="nav-link" href="profile" id="bell">Profile</a>
                                    <a class="nav-link" href="logout" id="bell">Logout</a>
                                </div>
                            </div>
                        </c:if>
                    </ul>
                </form>
            </div>
        </nav>
    </body>
</html>
