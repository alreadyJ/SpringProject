<%@ page import="common.pro.dao.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%User user = (User)session.getAttribute("User");%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
    <div class="container" >
        <a class="navbar-brand" href="/">SPLIT</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars" aria-hidden="true"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item nav-custom-item">
                    <i class="fa fa-plane" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="/post/sale">Post</a>
                </li>
                <li class="nav-item nav-custom-item">
                    <i class="fa fa-th-list" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="/list/sale">List</a>
                </li>
                <li class="nav-item  nav-custom-item">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="#">Contact</a>
                </li>
                <li class="nav-item nav-custom-item">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                    <c:choose>
                        <c:when test="${not empty sessionScope.User}">
                            <a class="nav-link nav-custom-link" href="/setting">MyPage</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link nav-custom-link" data-toggle="modal" data-target="#modalLRForm">MyPage</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item nav-custom-item">
                    <c:choose>
                        <c:when test="${not empty sessionScope.User}">
                        <div class="btn-group">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <p id="profile_nickname" style="display: inline-block;margin: 0;vertical-align: middle;" class="" >
                                <%=user.getNickName()%></p>
                            <img class="img img-circle" style="height: 45px;" src="<c:url value="/resources/images/user.png"/> "/>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#" onclick="doLogOut();">LogOut</a>
                            </div>
                        </div>
                        </c:when>
                        <c:otherwise>
                            <jsp:include page="loginModal.jsp"/>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div style="height: 72px; width: 100%;"></div>