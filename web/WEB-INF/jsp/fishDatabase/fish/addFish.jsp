<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 21/06/2018
  Time: 8:08 PM
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
        <title>Add Fish</title>
        <jsp:include page="/navbar"/>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Add Fish</h1>
        </div>
        <div class="container">
            <form action="${pageContext.request.contextPath}/aquariums/addFish" method="post">
                <div class="form-group">
                    <label class="mr-sm-2" for="fish_name">Name:</label>
                    <input type="text" id="fish_name" name="fish_name" class="form-control" required="true" maxlength="50">
                </div>
                <div class="form-group">
                    <label class="mr-sm-2" for="sex">Sex:</label>
                    <input type="text" id="sex" name="sex" class="form-control" required="false" maxlength="10">
                </div>
                <div class="form-group">
                    <label class="mr-sm-2" for="amount">amount:</label>
                    <input type="number" id="amount" name="amount" class="form-control" required="true">
                </div>
                <div class="form-group">
                    <label class="mr-sm-2" for="tank_id">Tank:</label>
                    <select name="tank_id" id="tank_id" class="custom-select">
                        <c:forEach items="${tanks}" var="tanks">
                            <option value="${tanks.id}">${tanks.name}</option>
                        </c:forEach>
                        <option value="" selected>None</option>
                    </select>
                </div>

                <!--fish image url-->
                <div class="form-group">
                    <label class="mr-sm-2" for="image_url">Image url:</label>
                    <input type="text" id="image_url" name="image_url" class="form-control" maxlength="500">
                </div>

                <!--fish description-->
                <div class="form-group">
                    <label class="mr-sm-2" for="description">Description:</label>
                    <input type="text" id="description" name="description" class="form-control" maxlength="500">
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add Fish</button>
                    <button type="reset" class="btn btn-primary">Clear</button>
                </div>
            </form>
        </div>
    </body>
</html>
