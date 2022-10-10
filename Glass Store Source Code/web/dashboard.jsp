<%-- 
    Document   : dashboard
    Created on : Oct 3, 2022, 6:55:34 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
            <c:forEach var="o" items="${countProductByCategory}">
                    ['${o.name}', ${o.id}],
            </c:forEach>
                ]);

                var options = {
                    title: 'Percentage of product by category'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>    </head>
    <body>


        <div class="container-fluid">
            <div class="row">
                <jsp:include page="components/headerManager.jsp" />
                <div class="col-md-10">
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-4" id="borderCard">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-12">
                                        <a href="accountManager" style="text-decoration: none;"><img src="images/AccountDashboard.jpg" alt="" id="headerImage" width="250px"/></a>
                                    </div>
                                    <div class="col-md-12" id="dashboardCard">
                                        <div class="card-body">
                                            <a href="accountManager" style="text-decoration: none;"><h5 class="card-title" id="total">Total Accounts</h5></a>
                                            <a href="accountManager" style="text-decoration: none;"><h5 class="card-title" id="amount">${totalAccount}</h5></a>
                                            <a href="accountManager" style="text-decoration: none;"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4" id="borderCard">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-12">
                                        <a href="manager" style="text-decoration: none;"><img src="images/ProductDashboard.jpg" alt="" id="headerImage" width="250px"/></a>
                                    </div>
                                    <div class="col-md-12" id="dashboardCard">
                                        <div class="card-body">
                                            <a href="manager" style="text-decoration: none;"><h5 class="card-title" id="total">Total Products</h5></a>
                                            <a href="manager" style="text-decoration: none;"><h5 class="card-title" id="amount">${totalProduct}</h5></a>
                                            <a href="manager" style="text-decoration: none;"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4" id="borderCard">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-12">
                                        <a href=""><img src="images/InvoiceDashboard.jpg" alt="" id="headerImage" width="250px"/></a>
                                    </div>
                                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                                        <div class="col-md-12" id="dashboardCard">
                                            <div class="card-body">
                                                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><h5 class="card-title" id="total">Total Invoices</h5></a>
                                                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><h5 class="card-title" id="amount">${totalCart}</h5></a>
                                                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.isAdmin != 1}">
                                        <div class="col-md-12">
                                            <div class="card-body">
                                                <a style="text-decoration: none;" href ="viewInvoiceDetailAdmin?sellerId=${sessionScope.acc.id}&orderId=1"><h5 class="card-title">Total Invoices</h5></a>
                                                <a style="text-decoration: none;" href ="viewInvoiceDetailAdmin?sellerId=${sessionScope.acc.id}&orderId=1"><h5 class="card-title">${totalCart}</h5></a>
                                                <a style="text-decoration: none;" href ="viewInvoiceDetailAdmin?sellerId=${sessionScope.acc.id}&orderId=1"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-7">
                            <div id="piechart" style="width: 900px; height: 500px;"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-5">
                            <h3>Most Selling Product</h3>
                            <c:forEach var="o" items="${top3MostSellD}">
                                <h6>${o.name}</h6>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-5">
                            <h3>Least Selling Product</h3>
                            <c:forEach var="o" items="${top3LeastSellD}">
                                <h6>${o.name}</h6>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                        <div class="col-1"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>

