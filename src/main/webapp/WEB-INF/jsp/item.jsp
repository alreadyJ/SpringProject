<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 16/01/2018
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Item</title>
    <jsp:include page="baseResources.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=1"/>"/>
</head>
<body>

<jsp:include page="nav.jsp"/>

<!--Card-->
<div class="card card-cascade wider reverse my-4">

    <!--Card image-->
    <div class="view overlay hm-white-slight">
        <img src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).jpg" class="img-fluid">
        <a href="#!">
            <div class="mask"></div>
        </a>
    </div>
    <!--/Card image-->

    <!--Card content-->
    <div class="card-body text-center">
        <!--Title-->
        <h4 class="card-title"><strong>My adventure</strong></h4>
        <h5 class="indigo-text"><strong>Photography</strong></h5>

        <p class="card-text">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam.
        </p>

        <!--Linkedin-->
        <a class="icons-sm li-ic"><i class="fa fa-linkedin"> </i></a>
        <!--Twitter-->
        <a class="icons-sm tw-ic"><i class="fa fa-twitter"> </i></a>
        <!--Dribbble-->
        <a class="icons-sm fb-ic"><i class="fa fa-facebook"> </i></a>

    </div>
    <!--/.Card content-->

</div>
<!--/.Card-->

<p>related</p>
<jsp:include page="cardList.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>
