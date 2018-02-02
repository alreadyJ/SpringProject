<%@ page import="common.pro.dao.RequestList" %>
<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 16/01/2018
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%RequestList req = (RequestList) request.getAttribute("request");%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Item</title>
    <jsp:include page="../baseResources.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=1"/>"/>
</head>

<style>
    .mt-5 {
        margin-top: 1rem!important;
    }
    .btn-primary {
        background-color: #040404!important;
    }
    .carousel-inner {
        height: 100%;
        display: flex;
        align-items: center;
    }
    .carousel-item-next, .carousel-item-prev {
        display: none;
    }
</style>

<body>

<jsp:include page="../nav.jsp"/>


<div class="container mt-5 pt-3">

    <!--Section: Product detail -->
    <section id="productDetails" class="pb-5">

        <!--News card-->
        <div class="card border-primary mt-5 hoverable">
            <div class="row mt-5">
                <div class="col-lg-6">

                    <!--Carousel Wrapper-->
                    <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">

                        <!--Slides-->
                        <div class="carousel-inner center-on-small-only" role="listbox">
                            <div class="carousel-item active">
                                <%request.setAttribute("image", req.getImage(0));%>
                                <img src="<c:url value="/resources/images/${image}"/>" alt="First slide" class="img-fluid">
                            </div>
                            <%
                                for (int i = 1; i < req.imageSize(); i++) {%>
                            <div class="carousel-item">
                                <%request.setAttribute("image", req.getImage(i));%>
                                <img src="<c:url value="/resources/images/${image}"/>" alt="Second slide" class="img-fluid">
                            </div>
                            <%}%>

                        </div>
                        <!--/.Slides-->

                        <!--Thumbnails-->
                        <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                        <!--/.Thumbnails-->

                    </div>
                    <!--/.Carousel Wrapper-->
                </div>
                <div class="col-lg-5 mr-3 center-on-small-only">
                    <h2 class="h2-responsive center-on-small-only product-name font-bold dark-grey-text mb-1">
                        <strong><%=req.getTitle()%></strong>
                    </h2>
                    <span class="badge badge-danger product mb-4">bestseller</span>
                    <h3 class="h3-responsive center-on-small-only mb-5">
                            <span class="red-text font-bold">
                                <strong>$<%=req.getPrice()%></strong>
                            </span>
                        <span class="gray-text font-bold">
                                <strong>$<%=req.getServiceFee()%></strong>
                            </span>
                    </h3>


                    <!--Accordion wrapper-->
                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="card">
                            <div class="card-header pl-0" role="tab" id="headingOne">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    <h5 class="mb-0" style="color: #040404;">
                                        Quantity
                                        <i class="fa fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="dark-grey-text pl-0">
                                    <p><%=req.getQuantity()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header pl-0" role="tab" id="headingTwo">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    <h5 class="mb-0" style="color: #040404;">
                                        Details
                                        <i class="fa fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <div id="collapseTwo" class="collapse show" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="dark-grey-text pl-0" >
                                    <p><%=req.getDetail()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header pl-0" role="tab" id="headingThree">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <h5 class="mb-0" style="color: #040404;">
                                        Expiry Date
                                        <i class="fa fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="dark-grey-text pl-0">
                                    <p><%=req.getExpiration()%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.Accordion wrapper-->

                    <!-- Add to Cart -->
                    <section class="color">
                        <div class="mt-5" style="color: #040404;">
                            <p class="grey-text" >location</p>
                            <div class="row center-on-small-only">
                                <p><%=req.getLocation()%></p>
                            </div>

                            <div class="row mt-3 mb-r">
                                <div class="col-md-12 center-on-small-only text-md-right">
                                    <button class="btn btn-primary btn-rounded waves-effect waves-light">
                                        <i class="fa fa-cart-plus mr-2" aria-hidden="true"></i> Buy Now</button>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- /.Add to Cart -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.Section: Product detail -->

    <div class="divider-new">
        <h3 class="h3-responsive font-bold blue-text mx-3">Product Reviews</h3>
    </div>

    <!-- Product Reviews -->
    <section id="reviews" class="pb-5">

        <!--Main wrapper-->
        <div class="comments-list text-center text-md-left">

            <!--First row-->
            <div class="row">
                <!--Image column-->
                <div class="col-sm-2 col-12">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/img (8).jpg" alt="sample image">
                </div>
                <!--/.Image column-->

                <!--Content column-->
                <div class="col-sm-10 col-12">
                    <a>
                        <h5 class="user-name font-bold">John Doe</h5>
                    </a>
                    <!-- Rating -->
                    <ul class="rating">
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                    </ul>
                    <div class="card-data">
                        <ul class="list-unstyled mb-1">
                            <li class="comment-date font-small grey-text">
                                <i class="fa fa-clock-o"></i> 05/10/2015</li>
                        </ul>
                    </div>
                    <p class="dark-grey-text article">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                        nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
                </div>
                <!--/.Content column-->
            </div>
            <!--/.First row-->

            <!--Second row-->
            <div class="row">
                <!--Image column-->
                <div class="col-sm-2 col-12">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/img (30).jpg" alt="sample image">
                </div>
                <!--/.Image column-->

                <!--Content column-->
                <div class="col-sm-10 col-12">
                    <a>
                        <h5 class="user-name font-bold">Lily Brown</h5>
                    </a>
                    <!-- Rating -->
                    <ul class="rating">
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                    </ul>
                    <div class="card-data">
                        <ul class="list-unstyled mb-1">
                            <li class="comment-date font-small grey-text">
                                <i class="fa fa-clock-o"></i> 05/10/2015</li>
                        </ul>
                    </div>
                    <p class="dark-grey-text article">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                        nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
                </div>
                <!--/.Content column-->
            </div>
            <!--/.Second row-->

            <!--Third row-->
            <div class="row">
                <!--Image column-->
                <div class="col-sm-2 col-12">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/img (28).jpg" alt="sample image">
                </div>
                <!--/.Image column-->
                <!--Content column-->
                <div class="col-sm-10 col-12">
                    <a>
                        <h5 class="user-name font-bold">Martha Smith</h5>
                    </a>
                    <!-- Rating -->
                    <ul class="rating">
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                        <li>
                            <i class="fa fa-star blue-text"></i>
                        </li>
                    </ul>
                    <div class="card-data">
                        <ul class="list-unstyled mb-1">
                            <li class="comment-date font-small grey-text">
                                <i class="fa fa-clock-o"></i> 05/10/2015</li>
                        </ul>
                    </div>
                    <p class="dark-grey-text article">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                        nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
                </div>
                <!--/.Content column-->
            </div>
            <!--/.Third row-->
        </div>
        <!--/.Main wrapper-->

    </section>
    <!-- /.Product Reviews -->

    <div class="divider-new">
        <h3 class="h3-responsive font-bold blue-text mx-3">Related Products</h3>
    </div>

    <!--Section: Products v.5-->
    <section id="products" class="pb-5">

        <p class="section-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet numquam iure provident voluptate
            esse quasi, veritatis totam voluptas nostrum quisquam eum porro a pariatur accusamus veniam.</p>

        <!--Carousel Wrapper-->
        <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

            <!--Controls-->
            <div class="controls-top">
                <a class="btn-floating primary-color waves-effect waves-light" href="#multi-item-example" data-slide="prev">
                    <i class="fa fa-chevron-left"></i>
                </a>
                <a class="btn-floating primary-color waves-effect waves-light" href="#multi-item-example" data-slide="next">
                    <i class="fa fa-chevron-right"></i>
                </a>
            </div>
            <!--Controls-->

            <!--Indicators-->
            <ol class="carousel-indicators">
                <li class="primary-color active" data-target="#multi-item-example" data-slide-to="0"></li>
                <li class="primary-color" data-target="#multi-item-example" data-slide-to="1"></li>
                <li class="primary-color" data-target="#multi-item-example" data-slide-to="2"></li>
            </ol>
            <!--Indicators-->

            <!--Slides-->
            <div class="carousel-inner" role="listbox">

                <!--First slide-->
                <div class="carousel-item active">

                    <div class="col-md-4">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/14.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Sony TV-675i</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-danger mb-2">bestseller</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star grey-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">

                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                    <div class="col-md-4 clearfix d-none d-md-block">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/13.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Samsung 786i</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-info mb-2">new</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star grey-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">
                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                    <div class="col-md-4 clearfix d-none d-md-block">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/9.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Canon 675-D</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-danger mb-2">bestseller</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">
                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                </div>
                <!--First slide-->

                <!--Second slide-->
                <div class="carousel-item">

                    <div class="col-md-4">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/8.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Samsung V54</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-grey mb-2">best rated</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">
                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                    <div class="col-md-4 clearfix d-none d-md-block">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/5.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Dell V-964i</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-info mb-2">new</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">

                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                    <div class="col-md-4 clearfix d-none d-md-block">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/1.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">iPad PRO</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-danger mb-2">bestseller</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star grey-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">
                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                </div>
                <!--Second slide-->

                <!--Third slide-->
                <div class="carousel-item">

                    <div class="col-md-4">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/12.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Asus CT-567</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-grey mb-2">best rated</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">
                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                    <div class="col-md-4 clearfix d-none d-md-block">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/7.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Dell 786i</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-info mb-2">new</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star grey-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">
                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->


                    </div>

                    <div class="col-md-4 clearfix d-none d-md-block">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/10.jpg" class="img-fluid" alt="">
                                <a>
                                    <div class="mask waves-effect waves-light"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-left no-padding">
                                <!--Category & Title-->

                                <h5 class="card-title mb-1">
                                    <strong>
                                        <a href="" class="dark-grey-text">Headphones</a>
                                    </strong>
                                </h5>
                                <span class="badge badge-info mb-2">new</span>
                                <!-- Rating -->
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star blue-text"></i>
                                    </li>
                                </ul>

                                <!--Card footer-->
                                <div class="card-footer pb-0">
                                    <div class="row mb-0">
                                            <span class="left">
                                                <strong>1439$</strong>
                                            </span>
                                        <span class="right">

                                                <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Wishlist">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </span>
                                    </div>
                                </div>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>

                </div>
                <!--Third slide-->

            </div>
            <!--Slides-->

        </div>
        <!--Carousel Wrapper-->

    </section>
    <!--Section: Products v.5-->

</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>
