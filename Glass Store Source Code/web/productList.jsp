
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product List - Glass Store</title>
    </head>
    <body>
        <jsp:include page="components/headerCustomer.jsp" />
        
        <br>
        <br>
        <div class="row">
            <div class="col-sm-3">
                <div class="card bg-light mb-3">
                    <div class="card-header bg-info text-white text-uppercase"><i class="fa fa-list" aria-hidden="true"></i> Categories</div>
                    <ul class="list-group category_block">

                        <!--Category nao dang dc chon thi se noi bat-->
                        <li class="list-group-item text-white ">
                            <a href="products?CategoryID=1"><i class="fas fa-laptop" aria-hidden="true"></i> Kính Cận</a>
                        </li>

                        <li class="list-group-item text-white active">
                            <a href="products?CategoryID=2"><i class="fas fa-desktop" aria-hidden="true"></i> Kính Râm Thời Trang</a>
                        </li>

                        <li class="list-group-item text-white ">
                            <a href="products?CategoryID=3"><i class="far fa-folder-open" aria-hidden="true"></i> Kính Áp Tròng</a>
                        </li>

                        <li class="list-group-item text-white ">
                            <a href="products?CategoryID=4"><i class="far fa-keyboard" aria-hidden="true"></i> Kính Lão-Viễn</a>
                        </li>

                        <li class="list-group-item text-white ">
                            <a href="products?CategoryID=5"><i class="fas fa-mobile-alt" aria-hidden="true"></i> Gọng Kính</a>
                        </li>

                        <li class="list-group-item text-white ">
                            <a href="products?CategoryID=6"><i class="fas fa-tablet-alt" aria-hidden="true"></i> Mắt Kính</a>
                        </li>

                        <li class="list-group-item text-white ">
                            <a href="products?CategoryID=7"><i class="fas fa-headphones" aria-hidden="true"></i> Kính Bơi</a>
                        </li>

                    </ul>
                </div>
                <div class="card bg-light mb-3">
                    <div class="card-header bg-info text-white text-uppercase">HOT product</div>
                    <div class="card-body">
                        <img class="img-fluid" src="images/chup-hinh-mat-kinh.jpg">
                        <h5 class="card-title">Kính Đôi Hàng Hiệu</h5>
                        <p class="bloc_left_price">13.590.000 VND</p>
                    </div>
                </div>
                <div class="card bg-light mb-3">
                    <div class="card-header bg-info text-white text-uppercase">Most Favorite product</div>
                    <div class="card-body">
                        <img class="img-fluid" src="images/chup-hinh-mat-kinh.jpg">
                        <h5 class="card-title">Gọng Kính Bạch Kim</h5>
                        <p class="bloc_left_price">7.090.000 VND</p>
                    </div>
                </div>    
            </div>




            <div class="col-md-9 col-sm-9">
                <div class="row" id="content">
                    <!--List Product-->

                    <div class="col-12 col-md-6 col-lg-4">
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
                                    <div class="col">
                                        <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=3"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
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
                                    <div class="col">
                                        <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=5"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
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
                                    <div class="col">
                                        <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=8" style="text-decoration: none;"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
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
                                    <div class="col">
                                        <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=22"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
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
                                    <div class="col">
                                        <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=23"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card" id="product">
                            <a href="detail?ProductID=24" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                            <div class="card-body">
                                <h4 class="card-title show_txt"><a href="detail?ProductID=24" title="View Product">Kính Thời Trang</a></h4>
                                <div class="row">
                                    <div class="col">
                                        <a onclick="addCart(24)"><p class="btn btn-warning btn-block" id="price">209.899.000 VND</p></a>


                                    </div>
                                    <div class="col">
                                        <a onclick="addCart(24)" class="btn btn-info btn-block" id="cart">Add to cart</a>
                                    </div>
                                    <div class="col">
                                        <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=24"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="clearfix">
                    <div class="hint-text">Showing <b>6</b> out of <b>22</b> entries</div>
                    <ul class="pagination pagination-circle">
                        <li class="page-item paging active"><a onclick="load(this, 1, 2)" class="page-link">1</a></li>

                        <li class="page-item paging"><a onclick="load(this, 2, 2)" class="page-link">2</a></li>


                        <li class="page-item paging"><a onclick="load(this, 3, 2)" class="page-link">3</a></li>


                        <li class="page-item paging"><a onclick="load(this, 4, 2)" class="page-link">4</a></li>


                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
