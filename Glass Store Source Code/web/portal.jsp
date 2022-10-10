<%-- 
    Document   : portal
    Created on : Sep 30, 2022, 4:59:50 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link href="css/portal.css" rel="stylesheet" type="text/css"/>
</head>
<jsp:include page="components/headerCustomer.jsp">
    <jsp:param name="acc" value="${sessionScope.acc.user}"/>
</jsp:include>
<jsp:include page="components/portal.jsp"/>