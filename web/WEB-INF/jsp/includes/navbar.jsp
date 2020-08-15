<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 18/06/2020
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.jpg"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="aquariumDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Aquarium
                        </a>
                        <div class="dropdown-menu" aria-labelledby="aquariumDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/aquariums/fish">Fish</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/aquariums/tanks">Tanks</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/aquariums/addFish">Add fish</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/aquariums/addTank">Add tank</a>
                        </div>
                    </li>
                    <!--
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="hardwareDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hardware
                        </a>
                        <div class="dropdown-menu" aria-labelledby="hardwareDropdown">
                            <a class="dropdown-item" href="#">CPUs</a>
                            <a class="dropdown-item" href="#">Motherboards</a>
                            <a class="dropdown-item" href="#">RAM</a>
                            <a class="dropdown-item" href="#">Power supplies</a>
                            <a class="dropdown-item" href="#">Hard drives</a>
                        </div>
                    </li>
                    -->
                </ul>
            </div>

            <div style="float: end">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <a class="navbar-brand" style="margin: 0" href="${pageContext.request.contextPath}/loginPage">Log in</a>
                    <p class="navbar-brand" style="margin: 0">|</p>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/createAccount">Request account</a>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="navbar-brand" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${pageContext.request.userPrincipal.name}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <c:if test="${pageContext.request.isUserInRole('admin')}">
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/adminMenu">Admin menu</a>
                                    <div class="dropdown-divider"></div>
                                </c:if>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/myAccount">Account</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">log out</a>
                            </div>
                        </li>
                    </ul>
                </c:if>
            </div>

        </nav>
    </body>
</html>