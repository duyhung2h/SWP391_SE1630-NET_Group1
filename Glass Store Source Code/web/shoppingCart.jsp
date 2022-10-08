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
        <title>Your Cart - Glass Store</title>
    </head>
    <body>
        <jsp:include page="components/headerCustomer.jsp">
            <jsp:param name="acc" value="${sessionScope.acc.user}"/>
        </jsp:include>
        <div class="title">
            Shopping Cart
        </div>
        <div style="float:right;margin-right: 80px;margin-top:25px;margin-bottom:35px">
            <button style="width: 180px;" type="button" class="btn btn-primary"><i class="fa fa-trash" style="margin-right:20px"></i>Delete Cart</button>
        </div>
        <div>
            <table style="width:100%;height: auto">
                <tr>
                    <td style="padding-left: 10%;">Image</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Amout</td>
                </tr>
                <tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr>
                <tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr><tr>
                    <td style="padding-left: 10%;"><img class="" style="height: 100px;width:100px" src="images/chup-hinh-mat-kinh.jpg" alt="Card image cap"></td>
                    <td>Kính Thời Trang</td>
                    <td>500.000 VND</td>
                    <td><button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-minus"></i></button> 1 <button style="font-size:12px;border:1px solid black;background-color: #34e1eb"> <i class="fa fa-plus"></i></button> <i class="fa fa-trash"></i></td>
                </tr>
            </table>
        </div>
    </body>
</html>
