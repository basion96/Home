<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 21/06/2018
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>Home</title>
        <jsp:include page="/navbar"/>
    </head>
    <body>
        <div class="jumbotron" style="text-align: center">
            <h1 class="display-4">Welcome home,</h1>
            <p class="lead">What would you like to get up to today?</p>
        </div>

        <div class="container">

            <div class="card-deck">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Aquariums</h2>
                        <p class="card-text">View all current aquariums</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/aquariums" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Computer hardware</h2>
                        <p class="card-text">View all computer hardware available</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/hardware" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Finance</h2>
                        <p class="card-text">A little bit of money management</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/finance/frontpage" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="w-100" style="margin-bottom: 1rem"></div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Events</h2>
                        <p class="card-text">up and coming events</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/#" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">To do</h2>
                        <p class="card-text">List of things to be done</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/#" class="btn btn-primary">View</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Birthdays</h2>
                        <p class="card-text">Keep track of birthdays here</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/#" class="btn btn-primary">View</a>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
