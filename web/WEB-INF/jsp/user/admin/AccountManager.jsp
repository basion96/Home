<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 12/08/2020
  Time: 3:20 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%if(!request.isUserInRole("admin")){response.sendRedirect(request.getContextPath() + "/403");}%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <jsp:include page="/navbar"/>
        <title>Account Manager</title>
    </head>
    <body>
        <div class="jumbotron">
            <h1>pending users</h1>
        </div>
        <div class="container">
            <c:choose>
                <c:when test="${userListLength == 0}">
                    <div class="card">
                        <p>no users to show</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="user" items="${users}">
                        <div class="card">
                            <form action="${pageContext.request.contextPath}/adminMenu/accountManager" method="post">
                                <h1>${user}</h1>
                                <input type="hidden" name="username" value="${user}">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="PendingUser" id="accept" value="Accept" checked>
                                    <label class="form-check-label" for="accept">
                                        Accept
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="PendingUser" id="deny" value="Deny">
                                    <label class="form-check-label" for="deny">
                                        Deny
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="mr-sm-2" for="role">Role:</label>
                                    <select name="role" id="role" class="custom-select">
                                        <option value="basic">Basic</option>
                                        <option value="admin" selected>Admin</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
