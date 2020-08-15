<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 7/07/2020
  Time: 11:51 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%if(!request.isUserInRole("admin") || !request.isUserInRole("basic")){response.sendRedirect(request.getContextPath() + "/403");}%>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <title>My Account</title>
        <jsp:include page="/navbar"/>
    </head>
    <body>
        <div class="jumbotron">
            <div style="float: right">
                <button>Edit</button>
            </div>
            <div style="float: left">
                <h1>My Account</h1>
            </div>
        </div>
        <div class="container">
            <div class="card">
                <h2>Basic Info:</h2><br>
                <h3>Account name: ${pageContext.request.userPrincipal.name}</h3>
                <h3>Account created: ${user.accountCreation}</h3>
                <h3>Roles:</h3>
                <table class="table table-sm table-bordered">
                    <tbody>
                    <tr>
                        <c:forEach var="role" items="${user.roles}">
                            <td>
                                    ${role}
                            </td>
                        </c:forEach>
                    </tr>
                    </tbody>
                </table>
            </div>
            <br>
            <div class="card">
                <h1 style="float: left">Request Roles</h1>
                <form action="${pageContext.request.contextPath}/" method="post">
                    <div style="float: left">
                        <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">

                        <c:choose>
                            <c:when test="${pageContext.request.isUserInRole('admin')}">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="adminRoleCheckbox" name="adminRoleCheckbox" value="admin" disabled checked>
                                    <label class="form-check-label" for="adminRoleCheckbox">Admin</label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="adminRoleCheckbox" name="adminRoleCheckbox" value="admin">
                                    <label class="form-check-label" for="adminRoleCheckbox">Admin</label>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${pageContext.request.isUserInRole('basic')}">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="basicRoleCheckbox" name="basicRoleCheckbox" value="basic" disabled checked>
                                    <label class="form-check-label" for="basicRoleCheckbox">Basic</label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="basicRoleCheckbox" name="basicRoleCheckbox" value="basic" >
                                    <label class="form-check-label" for="basicRoleCheckbox">Basic</label>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="form-group" style="float: right">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
