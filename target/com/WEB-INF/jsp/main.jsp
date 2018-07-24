<%@ page import="com.split.first.dto.Sale" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SPLIT</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <jsp:include page="baseResources.jsp" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=2.3"/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/half-slider.css" />" />
</head>

<style>
    .py-5 {
        padding-bottom: 0!important;
        padding-top: 0!important;
    }
    @media (min-width: 400px) {
        .carousel-multi-item .controls-top {
            margin-bottom: 0;
        }
    }
    .carousel-multi-item .carousel-indicators {
        position: static;
        height: 70px;
        margin-top: -35px;
    }

    @media (max-width: 582px) {
        .py-5 .container {
            max-width: 240px;
            margin: 0 auto;
            padding: 0;
        }
        .py-5 .carousel-item-next,.py-5 .carousel-item-prev {
            max-width: 240px;
            margin-left: calc(calc(100% - 240px)/2);
            margin-right: calc(calc(100% - 240px)/2);
        }

        .tab-content {
            padding: 0;
            padding-top: 2rem;

        }

        .carousel-multi-item .carousel-indicators {
            position: static;
            height: 70px;
            margin-top: -15px;
        }


        .carousel-multi-item .py-5 .container .card {
            margin: 0 0 20px 0;
        }
        #items-1, #items-5, #items-9 {
            display: none;
        }
        #items-2, #items-6, #items-10 {
            display: none;
        }
        #items-3, #items-7, #items-11 {
            display: none;
        }
    }

    @media (min-width: 582px) {
        .py-5 .container {
            max-width: 550px;
        }
        .py-5 .carousel-item-next,.py-5 .carousel-item-prev {
            max-width: 550px;
            margin-left: calc(calc(100% - 550px)/2);
            margin-right: calc(calc(100% - 550px)/2);
        }
        #items-1, #items-5, #items-9 {
            display: block;
        }
        #itemss-2, #items-6, #items-10 {
            display: none;
        }
        #items-3, #items-7, #items-11 {
            display: none;
        }
    }

    @media (min-width: 768px) {
        .py-5 .container {
            max-width: 550px;
        }
        .py-5 .carousel-item-next,.py-5 .carousel-item-prev {
            max-width: 550px;
            margin-left: calc(calc(100% - 550px)/2);
            margin-right: calc(calc(100% - 550px)/2);
        }
        #items-1, #items-5, #items-9 {
            display: block;
        }
        #items-2, #items-6, #items-10 {
            display: none;
        }
        #items-3, #items-7, #items-11 {
            display: none;
        }
    }

    @media (min-width: 840px) {
        .py-5 .container {
            max-width:810px;
        }
        .py-5 .carousel-item-next,.py-5 .carousel-item-prev {
            max-width: 810px;
            margin-left: calc(calc(100% - 810px)/2);
            margin-right: calc(calc(100% - 810px)/2);
        }
        #items-3, #items-7, #items-11 {
            display: none;
        }
        #items-2, #items-6, #items-10 {
            display: block;
        }
    }

    @media (min-width: 1100px) {
        .py-5 .container {
            max-width: 1070px;
        }
        .py-5 .carousel-item-next,.py-5 .carousel-item-prev {
            max-width: 1070px;
            margin-left: calc(calc(100% - 1070px)/2);
            margin-right: calc(calc(100% - 1070px)/2);
        }
        #items-3, #items-7, #items-11 {
            display: block;
        }
    }
    .carousel-multi-item .carousel-indicators li {
        background: #404040;
    }
    .carousel-multi-item .carousel-indicators .active {
        background: #404040;
    }

    .divider-new {
        padding: 0 15%;
    }


</style>


<body>

<jsp:include page="nav.jsp"/>
<header style="margin-bottom: 80px;">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
                <div class="carousel-caption d-none d-md-block">
                    <h3>First Slide</h3>
                    <p>This is a description for the first slide.</p>
                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Second Slide</h3>
                    <p>This is a description for the second slide.</p>
                </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Third Slide</h3>
                    <p>This is a description for the third slide.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>
<div class="divider-new">
    <h3 class="h3-responsive font-bold black-text mx-3">Sales</h3>
</div>
<jsp:include page="saleCard.jsp"/>
<div class="divider-new">
    <h3 class="h3-responsive font-bold black-text mx-3">Trips</h3>
</div>
<%--<jsp:include page="tripCard.jsp"/>--%>
<div class="divider-new">
    <h3 class="h3-responsive font-bold black-text mx-3">Requests</h3>
</div>
<jsp:include page="requestCard.jsp"/>


<jsp:include page="footer.jsp"/>


    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        })
    </script>

<script src="<c:url value="/resources/js/custom-card.js?ver=2.3" />"></script>
</body>
</html>
