<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 8/07/2020
  Time: 10:09 am
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>Create Account</title>
        <jsp:include page="/navbar"/>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Create Account</h1>
        </div>

        <c:if test="${param.get(\"error\")== \"1\"}">
            <div class="alert alert-warning" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Error!</strong> This username has already been taken.
            </div>
        </c:if>

        <div class="container">
            <form action="${pageContext.request.contextPath}/createAccount" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <c:choose>
                        <c:when test="${param.get(\"error\") == \"1\"}">
                            <input class="form-control" id="username" name="username" placeholder="${username}" required="true" type="text">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="form-control" id="username" name="username" required="true" placeholder="Username">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <p>Please note: An admin must approve your account before it can be created</p>
                <button type="submit" class="btn btn-primary">Create</button>
            </form>
        </div>
    </body>
</html>
