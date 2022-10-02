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
        <title>Glass King Storefront</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <!--<a class="navbar-brand" href="home"><img src="image/Other/Logo.jpg" width="200px"></a>-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <!--Link to Home Page-->
                    <li class="nav-item active">
                        <a class="nav-link" href="home"><i class="fa fa-home" id="home"></i><span class="sr-only">(current)</span></a>
                    </li>

                    <!--Link to ProductList-->
                    <li class="nav-item">
                        <a class="nav-link" href="productList" id="linkHover">Shop</a>
                    </li>

                    <!--N?u acc khác null -> login r?i -> hi?n th? c? 3 menu d??i-->
                    <c:if test = "${acc != null}">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="display: unset !important;">
                            <ul class="nav nav-pills mr-auto justify-content-end">           
                                <li class="nav-item dropdown " id="sup">
                                    <a onclick="notiRead(${acc.id})" class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: #ebebf2;">
                                        <i class="fa fa-bell" id="bell">     
                                            <span id="unread">${unread}</span>
                                        </i>

                                    </a>

                                    <ul class="dropdown-menu" id="dropdown">
                                        <li class="head text-light bg-dark">
                                            <div class="row">
                                                <div class="col-lg-12 col-sm-12 col-12">
                                                    <span>Notifications (most recently)</span>
                                                    <a onclick="notiRead(${acc.id})" class="float-right text-light" href="#">
                                                        Mark all as read
                                                    </a>
                                                </div>
                                        </li>

                                        <c:forEach items="${notis}" var="item">
                                            <c:set var="condition" >${item.status}</c:set>
                                            <form action="viewInvoiceDetailAdmin" id="${item.orderId}1" style="display:none;">
                                                <input type="text" value="${item.orderId}" name="id"/>
    <!--                                                    <input type="hidden" value="${item.status}" name="status"/>-->
                                                <input type="text" value="${condition}" name="status"/>
                                            </form>
                                            <form action="viewOrderDetail" id="${item.orderId}2" style="display:none;">
                                                <input type="hidden" value="${item.orderId}" name="id"/>
                                            </form>
                                            <a 
                                                <c:if test="${acc.isAdmin == 1}">
                                                    onclick="formAutoSubmit('${item.orderId}1')"
                                                </c:if>
                                                <c:if test="${acc.isAdmin != 1}">
                                                    onclick="formAutoSubmit('${item.orderId}2')"
                                                </c:if>
                                                style="text-decoration: none;cursor: pointer">
                                                <li class="notification-box" style="cursor: pointer;" >
                                                    <div class="row" id="noticeContent">
                                                        <div class="col-lg-3 col-sm-3 col-3 text-center">
                                                            <img src="image/47734_tai_nghe_corsair_hs35_stereo_blue_0005_1.jpg" class="w-50 rounded-circle">
                                                        </div>    
                                                        <div class="col-lg-8 col-sm-8 col-8" >
                                                            <div>
                                                                ${item.content}
                                                            </div>
                                                            <small class="text-warning">${item.time}</small>
                                                        </div>    
                                                    </div>
                                                </li>
                                            </a>
                                        </c:forEach>

                                        <li class="footer bg-dark text-center">
                                            <a href="viewAllNotifications" class="text-light">View All (${numberOfNotifications})</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--Ki?m tra xem có ph?i ng??i bán ko: isSell = 1-->
                        <c:if test="${acc.isSell == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="dashBoard" id="linkHover">Dash Board</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="manager" id="linkHover">Manager Product</a>
                            </li> 
                        </c:if>
                        <!--Ki?m tra xem có ph?i admin ko: isAdmin == 1-->
                        <c:if test="${acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="accountManager" id="linkHover">Manager Account</a>
                            </li> 
                        </c:if>
                        <li class="nav-item">
                            <!--S?a: khi ?n logout: d?n -> servlet-->
                            <a class="nav-link" href="logout" id="linkHover">LogOut</a>
                        </li>
                    </c:if>
                </ul>
                <form class="form-inline my-2 my-lg-0" action="search" method="post">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search..." oninput="searchByName(this)" value="${txtS}" name="txt" id="searchText">
                    <button class="btn my-2 my-sm-0" type="submit" id="search"><i class="fa fa-search"></i></button>

                    <a class="btn btn-sm ml-4" href="show" id="cart">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light" id="CartNum">${c.countNumCart(sessionScope.acc.id)}</span>
                    </a>
                </form>

                <ul class="navbar-nav mr-auto" style="margin-right: 0!important;">
                    <!--Add thêm code Login ? ?ây-->
                    <!--Trong test là ?i?u ki?n c?a mình-->
                    <!--sessionScope: g?i ??n Session : n?u acc = null thì hi?n th? menu là Login còn n?u khác null thì hi?n th? là Logout-->
                    <c:if test="${acc == null}">
                        <a class="nav-link" href="login" id="linkHover">Login</a>
                    </c:if>
                </ul>

                <c:if test = "${acc != null}">
                    <!--Link to user profile-->
                    <a class="nav-link" href="profile" id="bell" style="font-size: 2em;"><i class="fas fa-user"></i></i></a>
                </c:if>
            </div>
        </nav>
    </body>
</html>
