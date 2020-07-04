<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 24/06/2020
  Time: 9:14 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hardware.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>Hardware</title>
    </head>
    <body>
        <div class="jumbotron">
            <h1>${param.get("type")}</h1>
        </div>

        <div class="container">
            <div class="card">
                <div class="card body">
                    <h2 class="card-title">${}</h2>
                </div>
            </div>
        </div>
    </body>
</html>
