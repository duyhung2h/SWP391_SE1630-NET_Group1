<%-- 
    Document   : portal
    Created on : Sep 28, 2022, 9:00:30 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <body>
        <div class="container">
            <div class="row" >
                <div class="col-md-1"></div>
                <div class="col-md-5" style="margin: 0px; -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3); float: right; background-color: white; opacity: 100%">
                    <img style="height: 585px; width: 375px; opacity: 100%" src="images/Login.gif" alt=""/>
                </div>
                <div class="col-md-5" id="logreg-forms" style="background-image: linear-gradient(to bottom right, #c165dd, #268bff); margin: 0px; -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3); opacity: 100%">
                    <c:if test="${screen=='login'}">
                        <jsp:include page="small_components/panelLogin.jsp"/>
                    </c:if>
                    <c:if test="${screen=='signup'}">
                        <jsp:include page="small_components/panelSignup.jsp"/>
                    </c:if>
                    <br>
                    <div id="status">
                    </div>

                    <div class="row">
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
