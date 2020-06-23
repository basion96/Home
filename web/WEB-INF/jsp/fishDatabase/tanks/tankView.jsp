<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 18/06/2020
  Time: 2:13 PM
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

            $(function () {
                $('[data-toggle="popover"]').popover({html:true})
            });
        </script>
        <title>Tanks</title>
    </head>
    <body>
        <jsp:include page="/navbar"/>
        <div class="jumbotron">
            <h1>Tanks</h1>
            <p>
                <a href="${pageContext.request.contextPath}/aquariums/addTank" class="btn btn-primary">Add tank</a>
            </p>
        </div>

        <c:if test="${param.keySet().contains(\"success\")}">
            <div class="alert alert-success" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Success!</strong> The tank has been added!
            </div>
        </c:if>
        <c:if test="${param.keySet().contains(\"tankDeleted\")}">
            <div class="alert alert-success" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Poof!</strong> The tank has been deleted!
            </div>
        </c:if>

        <div class="container">
            <c:forEach var="tank" items="${tanks}">
                <div class="row">
                    <div class="col-sm">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <c:if test="${tank.image_url != \"\"}">
                                        <div class="col">
                                            <img src="${tank.image_url}" class="img-thumbnail">
                                        </div>
                                    </c:if>
                                    <div class="col">
                                        <!-- tank info -->
                                        <h4 class="card-title"><c:out value="${tank.tank_name}"/></h4>
                                        <p class="card-text">
                                            Number of fish: <c:out value="${tank.number_fish}"/><br>
                                            Tank size: <c:out value="${tank.tank_size}"/><br>
                                            Water type: <c:out value="${tank.water_type}"/><br>
                                            Water Temperature: <c:out value="${tank.water_temperature}"/><br>
                                            Description: <c:out value="${tank.description}"/><br>
                                        </p>
                                    </div>
                                    <!-- tank cleaning info -->
                                    <div class="col">
                                        <h4 class="card-title">Associated fish</h4>
                                        <div style="float: right">
                                            <a href="${pageContext.request.contextPath}/aquariums/editTank?tank_id=${tank.tank_id}" class="btn btn-primary">Edit</a>
                                        </div>
                                        <p class="card-text">
                                            <c:forEach var="fish" items="${fish}">
                                                <c:if test="${fish.tank_id == tank.tank_id}">
                                                    <button type="button" class="btn btn-link" data-toggle="popover" data-trigger="focus" title="${fish.fish_name}" data-content="Amount: ${fish.amount}<br>Sex: ${fish.sex}">
                                                            ${fish.fish_name}
                                                    </button>
                                                </c:if>
                                            </c:forEach>
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