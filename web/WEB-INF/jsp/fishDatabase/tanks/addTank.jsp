<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 21/06/2018
  Time: 8:08 PM
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
        <title>Add Tank</title>
    </head>
    <body>
        <jsp:include page="/navbar"/>
        <div class="jumbotron">
            <h1>Add Tank</h1>
        </div>
        <div class="container">
            <div class="form">
                <form action="${pageContext.request.contextPath}/aquariums/addTank" method="post">
                    <!--Tank name-->
                    <div class="form-group">
                        <label class="mr-sm-2" for="tank_name">Name:</label>
                        <input type="text" id="tank_name" name="tank_name" class="form-control" required="true" maxlength="100">
                    </div>

                    <!--Tank size-->
                    <div class="form-group">
                        <label class="mr-sm-2" for="tank_size">Size (litres):</label>
                        <input type="number" id="tank_size" name="tank_size" class="form-control" required="true">
                    </div>

                    <!--Tank water type-->
                    <div class="form-group">
                        <label class="mr-sm-2" for="water_type">Tank:</label>
                        <select name="water_type" id="water_type" class="custom-select">
                            <c:forEach items="${water_types}" var="water_types">
                                <option value="${water_types.id}">${water_types.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!--Tank water temperature-->
                    <div class="form-group">
                        <label class="mr-sm-2" for="water_temperature">Tank:</label>
                        <select name="water_temperature" id="water_temperature" class="custom-select">
                            <c:forEach items="${water_temperature_types}" var="water_temperature_types">
                                <option value="${water_temperature_types.id}">${water_temperature_types.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!--Tank description-->
                    <div class="form-group">
                        <label class="mr-sm-2" for="description">Description:</label>
                        <input type="text" id="description" name="description" class="form-control" maxlength="500">
                    </div>

                    <!--Tank image url-->
                    <div class="form-group">
                        <label class="mr-sm-2" for="image_url">Image url:</label>
                        <input type="text" id="image_url" name="image_url" class="form-control" maxlength="500">
                    </div>

                    <!---->
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add tank</button>
                        <button type="reset" class="btn btn-primary">Clear</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
