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
        <title>Homepage - Glass Store</title>
    </head>
    <body>
        <jsp:include page="components/headerCustomer.jsp">
            <jsp:param name="acc" value="${sessionScope.acc.user}"/>
        </jsp:include>
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
