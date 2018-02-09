<%@ page import="common.pro.dao.Comment" %>
<%@ page import="common.pro.dao.TripList" %>
<%@ page import="common.pro.dao.User" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 16/01/2018
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%TripList trip = (TripList) request.getAttribute("trip");%>
<%User user = (User)session.getAttribute("User");%>
<%List<Comment> cl = (List<Comment>)request.getAttribute("comments");%>
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
                                <img src="<%=trip.getLocation()%>" alt="First slide" class="img-fluid">
                            </div>

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
                        <strong><%=trip.getDestination()%></strong>
                    </h2>
                    <span class="badge badge-danger product mb-4">bestseller</span>
                    <h3 class="h3-responsive center-on-small-only mb-5">
                            <span class="red-text font-bold">
                                <strong></strong>
                            </span>
                    </h3>

                    <!--Accordion wrapper-->
                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="card">
                            <div class="card-header pl-0" role="tab" id="headingOne">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    <h5 class="mb-0" style="color: #040404;">
                                        Remain
                                        <i class="fa fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>
                            <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="dark-grey-text pl-0">
                                    <p><%=trip.getDepartureDate()%> > <%=trip.getArrivalDate()%></p>
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
                                    <p><%=trip.getSchedule()%></p>
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
                                    <p><%=trip.getArrivalDate()%></p>
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
                                <p></p>
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


    <!-- Comments -->
    <div class="divider-new">
        <h3 class="h3-responsive font-bold black-text mx-3">Comments</h3>
    </div>

    <!-- Comments -->
    <section id="reviews" class="pb-5">

        <!--Main wrapper-->
        <div class="comments-list text-center text-md-left" id="comment-container">

            <!--First row-->
            <div class="row" id="comment-framework" style="display: none;">
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



            <%for(int i = 0; i < cl.size(); i++) {%>
            <div class="row">
                <!--Image column-->
                <div class="col-sm-2 col-12">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/img (8).jpg" alt="sample image">
                </div>
                <!--/.Image column-->

                <!--Content column-->
                <div class="col-sm-10 col-12">
                    <a>
                        <h5 class="user-name font-bold"><%=cl.get(i).getUser().getNickName()%></h5>
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
                                <i class="fa fa-clock-o"></i> <%=cl.get(i).getRegisterDate()%></li>
                        </ul>
                    </div>
                    <p class="dark-grey-text article"><%=cl.get(i).getText()%></p>
                </div>
                <!--/.Content column-->
            </div>
            <%}%>

        </div>
        <!--/.Main wrapper-->


        <div class="comments-area">
            <c:if test="${not empty sessionScope.User}">
                <input id="comment-user-serial" type="hidden" name="userSerial" value="<%=user.getSerial()%>">
                <input id="comment-item-serial" type="hidden" name="itemSerial" value="<%=trip.getSerial()%>">
                <input id="comment-user-nickName" type="hidden" name="userNickName" value="<%=user.getNickName()%>">
                <input id="comment-type" type="hidden" name="commentType" value="1">
            </c:if>
            <div class="comment-a">Comments</div>

            <c:choose>
                <c:when test="${not empty sessionScope.User}">
                <textarea type ="text" id="comment-text" rows="3" name="comment" placeholder="Your comment."
                          style="position:relative; float: left; width: calc(100% - 130px);"></textarea>
                    <input class="btn btn-default comment-btn" type="button" onclick="doComment();" value="Done"
                           style="position:relative; float:right; background-color: #040404!important; margin-top: 13px">
                </c:when>
                <c:otherwise>
                    <textarea type ="text" rows="3" name="comment" placeholder="Need login"
                              style="position:relative; float: left; width: calc(100% - 130px);"></textarea>
                    <input class="btn btn-default comment-btn" type="button" value="Done" disabled
                           style="position:relative; float:right; background-color: #040404!important; margin-top: 13px">
                </c:otherwise>
            </c:choose>
        </div>

    </section>
    <!-- /.Comments -->

    </section>
    <!-- /.Comments -->

    <div class="divider-new">
        <h3 class="h3-responsive font-bold blue-text mx-3">Related Products</h3>
    </div>



</div>


<jsp:include page="../footer.jsp"/>
<script src="<c:url value="/resources/js/comment.js?ver=1.1"/>"></script>
</body>
</html>
