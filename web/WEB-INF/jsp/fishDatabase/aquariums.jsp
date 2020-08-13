<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 21/06/2018
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%if(!request.isUserInRole("admin") || !request.isUserInRole("basic")){response.sendRedirect(request.getContextPath() + "/403");}%>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/aquarium.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>Aquariums</title>
        <jsp:include page="/navbar"/>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Aquariums</h1>
            <p>
                <a href="${pageContext.request.contextPath}/aquariums/addFish" class="btn btn-primary">Add fish</a>
                <a href="${pageContext.request.contextPath}/aquariums/addTank" class="btn btn-primary">Add tank</a>
            </p>
        </div>
        <div class="container">
            <div class="card-deck">

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Fish</h2>
                        <p class="card-text">View all fish across all tanks</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/aquariums/fish" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Tanks</h2>
                        <p class="card-text">View all tanks currently running</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/aquariums/tanks" class="btn btn-primary">View</a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
