<%-- 
    Document   : headerManager
    Created on : Oct 4, 2022, 9:20:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Favicon-->
        <link rel="icon" type="image/png" href="image/faviconLogo.png" />

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/Dashboard.css" rel="stylesheet" type="text/css"/>
        <title>GLASSES</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>




        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script></head>
    <body>
        <div class="col-md-2" style="background-color: #ebebf2">
            <nav class="navbar navbar-expand-lg navbar-light flex-column">
                <a class="navbar-brand" href="dashBoard"><img src="../images/Logo.png" width="200px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="productList"><i class="fas fa-home"></i>Home</a>
                        <hr class="line">
                    </li>
                    <c:if test="${sessionScope.acc == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login</a>
                        </li>
                    </c:if>
                    <c:if test = "${sessionScope.acc != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="profile"><i class="fas fa-user-circle"></i>Hello ${sessionScope.acc.user}</a>
                            <hr class="line">
                        </li>

                        <c:if test="${sessionScope.acc.isSell == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="manager"><i class="fas fa-tasks"></i>Manager Product</a>
                                <a class="nav-link" href="blogManager"><i class="fas fa-tasks"></i>Manager Blog</a>
                                <a class="nav-link" href="manage-feedback"><i class="fas fa-tasks"></i>Manage Feedback</a>
                                <hr class="line">
                            </li> 
                        </c:if>

                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="accountManager"><i class="fas fa-tasks"></i>Manager Account</a>
                                <hr class="line">
                            </li> 
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="viewAllNotifications"><i class="fas fa-bell"></i>Notifications (${numberNoti})</a>
                        </li> 
                    </c:if>

                    <li class="nav-item">&nbsp;
                    </li> 
                </ul>
                <a class="nav-link position-fixed" href="logout" style="right: 10px;">LogOut</a>
            </nav>
        </div>
    </body>
</html>
