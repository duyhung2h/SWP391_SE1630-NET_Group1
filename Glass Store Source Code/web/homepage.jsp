<%-- 
    Document   : homepage
    Created on : Oct 5, 2022, 8:57:22 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="components/headerCustomer.jsp" />--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
            <a href="home"><img class="navbar-brand" src="../images/Logo.png" width="200px"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto row align-items-start col-4">
                    <!--Link to Home Page-->
                    <li class="nav-item active">
                        <a class="nav-link d-inline-block" href="home"><i class="fa fa-home d-inline-block" id="home"></i> Homepage</a>
                    </li>

                    <!--Link to ProductList-->
                    <li class="nav-item">
                        <a class="nav-link " href="productList" id="linkHover">Products</a>
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
                <form class="form-inline my-2 my-lg-0 col-8 justify-content-end" action="search" method="GET">
                    <input class="form-control mr-sm-2 col-5" type="search" placeholder="Search" aria-label="Search..." oninput="searchByName(this)" value="${txtS}" name="txt" id="searchText">
                    <button class="btn my-2 my-sm-0" type="submit" id="search"><i class="fa fa-search"></i></button>

                    <a class="btn btn-sm ml-4" href="show" id="cart">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light" id="CartNum">${c.countNumCart(sessionScope.acc.id)}</span>
                    </a>
                    <!--Add thêm code Login vao day-->
                    <ul class="navbar-nav mr-auto col-3 justify-content-end" style="margin-right: 0!important;">
                        <c:if test="${acc == null}">
                            <a class="nav-link" href="login" id="linkHover">Login</a>
                        </c:if>
                        <c:if test = "${acc != null}">
                            <!--Link to user profile-->
                            <a class="nav-link" href="profile" id="bell" style="font-size: 2em;"><i class="fas fa-user"></i></i></a>
                        </c:if>
                    </ul>
                </form>
            </div>
        </nav>
        <div class="backgrounds">
            <img src="images/glasses.jpg" style="width:100%;height: 800px">
        </div>
        <div>
            <div class="col-md-9 col-sm-9" style="margin-top:400px;">
                <div class="col-md-9 col-sm-9" style="font-size:22px">NEW PRODUCTS</div>
                    <div class="" id="content" style="display:flex">
                        <!--List Product-->
                    
                        <div class="col-12 col-md-6 col-lg-3">
                            <div class="card" id="product"> 
                                <a href="detail?ProductID=3" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="detail?ProductID=3" title="View Product">Kính Thời Trang</a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <a onclick="addCart(3)"><p class="btn btn-warning btn-block" id="price">23.000.000 VND</p></a>

                                        </div>
                                        <div class="col">
                                            <a onclick="addCart(3)" class="btn btn-info btn-block" id="cart">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-12 col-md-6 col-lg-3" style="margin-left:25px">
                            <div class="card" id="product"> 
                                <a href="detail?ProductID=5" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="detail?ProductID=5" title="View Product">Kính Thời Trang</a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <a onclick="addCart(5)"><p class="btn btn-warning btn-block" id="price">17.000.000 VND</p></a>

                                        </div>
                                        <div class="col">
                                            <a onclick="addCart(5)" class="btn btn-info btn-block" id="cart">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-12 col-md-6 col-lg-3" style="margin-left:25px">
                            <div class="card" id="product"> 
                                <a href="detail?ProductID=8" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="detail?ProductID=8" title="View Product">Kính Thời Trang</a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <a onclick="addCart(8)"><p class="btn btn-warning btn-block" id="price">2.000.000 VND</p></a>

                                        </div>
                                        <div class="col">
                                            <a onclick="addCart(8)" class="btn btn-info btn-block" id="cart">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-12 col-md-6 col-lg-3" style="margin-left:25px">
                            <div class="card" id="product"> 
                                <a href="detail?ProductID=22" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="detail?ProductID=22" title="View Product">Kính Thời Trang</a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <a onclick="addCart(22)"><p class="btn btn-warning btn-block" id="price">18.000.000 VND</p></a>

                                        </div>
                                        <div class="col">
                                            <a onclick="addCart(22)" class="btn btn-info btn-block" id="cart">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-12 col-md-6 col-lg-3" style="margin-left:25px"> 
                            <div class="card" id="product"> 
                                <a href="detail?ProductID=23" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="detail?ProductID=23" title="View Product">Kính Thời Trang</a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <a onclick="addCart(23)"><p class="btn btn-warning btn-block" id="price">25.000.000 VND</p></a>

                                        </div>
                                        <div class="col">
                                            <a onclick="addCart(23)" class="btn btn-info btn-block" id="cart">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
