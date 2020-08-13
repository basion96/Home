<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 21/06/2020
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%if(!request.isUserInRole("admin") || !request.isUserInRole("basic")){response.sendRedirect(request.getContextPath() + "/403");}%>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hardware.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>Hardware</title>
    </head>
    <body>
        <jsp:include page="/navbar"/>
        <div class="jumbotron">
            <h1>Hardware</h1>
        </div>

        <div class="container">
            <div class="card-deck">

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">All Hardware</h2>
                        <p class="card-text">View all hardware</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware/viewHardware?type=All" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Processors</h2>
                        <p class="card-text">View all stored processors</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware/viewHardware?type=Processors" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Motherboards</h2>
                        <p class="card-text">View all stored processors</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware/viewHardware?type=Motherboards" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Hard drives</h2>
                        <p class="card-text">View all stored hard drives</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware/viewHardware?type=HDD" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">RAM</h2>
                        <p class="card-text">View all stored RAM</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware/viewHardware?type=RAM" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Power supplies</h2>
                        <p class="card-text">View all stored processors</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware/viewHardware?type=PSU" class="btn btn-primary">View</a>
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
