<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 18/06/2020
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/aquarium.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script>
            window.setTimeout(function() {
                $(".alert").fadeTo(500, 0).slideUp(500, function(){
                    $(this).remove();
                });
            }, 4000);
        </script>
        <title>Fish</title>
    </head>
    <body>
        <jsp:include page="/navbar"/>
        <div class="jumbotron">
            <h1>Fish</h1>
            <p>
                <a href="${pageContext.request.contextPath}/aquariums/addFish" class="btn btn-primary">Add fish</a>
            </p>
        </div>

        <c:if test="${param.keySet().contains(\"status\")}">
            <c:if test="${param.get(\"status\")== \"updated\"}">
                <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong> The fish has been updated!
                </div>
            </c:if>

            <c:if test="${param.get(\"status\") == \"added\"}">
                <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong> The fish has been added!
                </div>
            </c:if>

            <c:if test="${param.get(\"status\") == \"fishDeleted\"}">
                <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong> The fish has been removed!
                </div>
            </c:if>
        </c:if>

        <div class="container">
            <c:forEach var="fish" items="${fish}">
                <div class="row">
                    <div class="col-sm">
                        <div style="background-color: #53E89E" class="card">
                            <div class="card-body">
                                <div class="row">
                                    <c:if test="${fish.image_url != \"\"}">
                                        <div class="col">
                                            <img src="${fish.image_url}" alt="${fish.image_url}" class="img-thumbnail">
                                        </div>
                                    </c:if>
                                    <div class="col">
                                        <!--Displays the current fish details-->
                                        <h4 class="card-title"><c:out value="${fish.fish_name}"/></h4>
                                        <div style="float: right">
                                            <a href="${pageContext.request.contextPath}/aquariums/editFish?fish_id=${fish.fish_id}" class="btn btn-primary">Edit</a>
                                        </div>
                                        <p class="card-text">
                                            Amount: <c:out value="${fish.amount}"/><br>
                                            Sex: <c:out value="${fish.sex}"/><br>
                                            Tank: <c:out value="${fish.tank_name}"/><br>
                                            Description: ${fish.fish_description}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </c:forEach>
        </div>
    </body>
</html>
