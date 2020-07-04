<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 2/07/2020
  Time: 2:30 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="jumbotron">
        <h1>Welcome, ${pageContext.request.userPrincipal.name}</h1>
        <p>
            hi ${requestScope.get("name")}<br>
            hi ${name}
        </p>
    </div>
</body>
</html>
