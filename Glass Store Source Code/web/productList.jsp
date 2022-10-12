
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product List - Glass Store</title>
    </head>
    <body>
        <jsp:include page="components/headerCustomer.jsp">
            <jsp:param name="acc" value="${sessionScope.acc.user}"/>
        </jsp:include>
        <br>
        <br>
        <div class="row">
            <div class="col-sm-3">
                <div class="card bg-light mb-3">
                    <div class="card-header bg-info text-white text-uppercase"><i class="fa fa-list" aria-hidden="true"></i> Categories</div>
                    <ul class="list-group category_block">
                        <c:forEach items="${allCategory}" var="item">
                            <li class="list-group-item text-white ">
                            <a href="products?CategoryID=${item.id}">${item.name}</a>
                        </li>
                        </c:forEach>
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
                    <c:forEach items="${listP}" var="o">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card" id="product"> <!--class="card"-->
                                <!--Product's image-->
                                <a href="detail?ProductID=${o.id}" title="View Product"><img class="card-img-top" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></a>
                                <div class="card-body">
                                    <!--Product's name. Onlick: Product's Detail-->
                                    <h4 class="card-title show_txt"><a href="detail?ProductID=${o.id}" title="View Product">${o.name}</a></h4>
                                    <div class="row">
                                        <div class="col">
                                            <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=${o.id}"><p class="btn btn-warning btn-block">Add to Cart</p></a>
                                            <a onmouseover="this.style.textDecoration = 'none';" href="compare?id=${o.id}"><p class="btn btn-warning btn-block">Add to Compare</p></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
