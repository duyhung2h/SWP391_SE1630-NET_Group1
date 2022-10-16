<%-- 
    Document   : panelSignup
    Created on : Sep 30, 2022, 5:01:21 PM
    Author     : Admin
--%>
<%-- import attributes start here --%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <title>Signup - Glass Store</title>
</head>
<body>
    <div class="login-form">
        <form>
            <h1 class="h3 my-5 font-weight-normal text-center">Profile Page</h1>
            <p class="text-danger">${mess}</p>
            <p class="text-center">Username: ${acc.user}</p>
            <p class="text-center">Email: ${acc.email}</p>
            <br>
            <p><b>Role: </b>
                <c:choose>
                    <c:when test="${acc.isSell == 1}">
                        Seller
                    </c:when>
                    <c:when test="${acc.isAdmin == 1}">
                        Admin
                    </c:when>
                    <c:otherwise>
                        Customer
                    </c:otherwise>
                </c:choose>
            </p>
            <p><b>Status: </b>${acc.status}</p>
            <br>
        </form>
        <form action="orders" id="sign-up-form" method="post">
            <button class="btn btn-success btn-block portal-button w-100" type="submit">
                <i class="fa fa-shopping-cart"></i> View Orders
            </button>
        </form>
        <form class="row" action="change-pass" id="sign-up-form" method="post">
            <input name="pass" id="pass" type="password" class="form-control my-4" placeholder="Password" required autofocus="" value="${pass}" onkeypress="return event.charCode !== 32">
            <div class="col-md-7 h6 px-0">
                Enter your password, then click on the button to change your account's password
            </div>
            <div class="col-md-5 px-0">
                <button class="btn btn-success btn-block portal-button w-100" type="submit">
                    Change Password
                </button>
            </div>
        </form>
    </div>
</body>