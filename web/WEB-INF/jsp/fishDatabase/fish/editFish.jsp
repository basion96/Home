<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 18/06/2020
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<jsp:include page="/navbar"/>
<div class="jumbotron">
    <h1>Editing fish: ${fish.fish_name}</h1>
</div>

<div class="container">
    <form action="${pageContext.request.contextPath}/aquariums/editFish" method="post" class="form">
        <!--fish name-->
        <input type="hidden" value="${fish.fish_id}" name="fish_id">
        <div class="form-group">
            <label class="mr-sm-2" for="fish_name">Name:</label>
            <input type="text" value="${fish.fish_name}" id="fish_name" name="fish_name" class="form-control" required="true" maxlength="100">
        </div>

        <!--fish sex-->
        <div class="form-group">
            <label class="mr-sm-2" for="sex">Sex:</label>
            <input type="text" value="${fish.sex}" id="sex" name="sex" class="form-control" required="true">
        </div>

        <!--fish amount-->
        <div class="form-group">
            <label class="mr-sm-2" for="amount">Amount:</label>
            <input type="text" value="${fish.amount}" id="amount" name="amount" class="form-control" required="true">
        </div>

        <!--Tank-->
        <div class="form-group">
            <label class="mr-sm-2" for="tank_id">Tank:</label>
            <select name="tank_id" id="tank_id" class="custom-select">
                <c:forEach items="${tanks}" var="tank">
                    <c:choose>
                        <c:when test="${tank.name} == ${fish.tank_name}">
                            <option value="${tank.id}" selected>${tank.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${tank.id}">${tank.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <option value="">None</option>
            </select>
        </div>

        <!--fish image url-->
        <div class="form-group">
            <label class="mr-sm-2" for="image_url">Image url:</label>
            <input type="text" value="${fish.image_url}" id="image_url" name="image_url" class="form-control" maxlength="500">
        </div>

        <!--fish description-->
        <div class="form-group">
            <label class="mr-sm-2" for="description">Description:</label>
            <input type="text" value="${fish.fish_description}" id="description" name="description" class="form-control" maxlength="500">
        </div>

        <!---->
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-primary">Clear</button>
        </div>
    </form>
    <form action="${pageContext.request.contextPath}/aquariums/editFish" method="post" class="form">
        <input type="hidden" value="${fish.fish_id}" name="delete">
        <button type="submit" class="btn btn-primary">Delete fish</button>
    </form>
</div>

</body>
</html>
