<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 7/07/2020
  Time: 11:51 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%if(!request.isUserInRole("admin") || !request.isUserInRole("basic")){response.sendRedirect(request.getContextPath() + "/403");}%>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>My Account</title>
        <jsp:include page="/navbar"/>
    </head>
    <body>
        <h1>Account name: ${pageContext.request.userPrincipal.name}</h1>
        <c:if test="${pageContext.request.isUserInRole(\"admin\")}">
            <h1>Account type: Admin</h1>
        </c:if>
        <c:if test="${pageContext.request.isUserInRole(\"basic\")}">
            <h1>Account type: Basic</h1>
        </c:if>
    </body>
</html>
