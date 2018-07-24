<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.split.first.dto.Sale" %>
<%@ page import="java.util.List" %>
<%List<Sale> sales = (List<Sale>)request.getAttribute("sales");%>

<!--Carousel Wrapper-->
<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">



    <!--Slides-->
    <div class="carousel-inner py-5" role="listbox">

        <a class="btn-floating" href="#multi-item-example" style="position: absolute;top: 150px;left: 2%; background: transparent; box-shadow: none;" data-slide="prev"><i class="fa fa-chevron-left" style="color:#040404;"></i></a>
        <a class="btn-floating" href="#multi-item-example" style="position: absolute;top: 150px;right: 2%; background: transparent; box-shadow: none;" data-slide="next"><i class="fa fa-chevron-right" style="color:#040404;"></i></a>
        <!--First slide-->
        <div class="carousel-item active container">
            <% for (int i = 0; i < Math.min(4, sales.size()); i++) {%>
            <!--Card Light-->
            <div class="card" id="items-<%=i%>">
                <!--Card image-->
                <div class="view overlay hm-white-slight">

                    <div class="preloader-wrapper big active progress-custom" style="position: absolute; top:88px; left:88px;">
                        <div class="preloader-wrapper big active">
                            <div class="preloader-wrapper big active">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%request.setAttribute("image", sales.get(i).getSaleImage().get(0).getUri());%>
                    <img class="card-image" style="display: none;" src="<c:url value="/resources/images/${image}"/>" class="img-fluid" alt="">
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color: #040404;">
                        <div class="mask"></div>
                    </a>
                </div>
                <!--/.Card image-->
                <!--Card content-->
                <div class="card-body">
                    <!--Title-->
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color: #040404;">
                        <h5 class="card-title" style="overflow-x: hidden;
                     overflow-y: hidden; width: 200px;
                      height: 15px; font-family: 'Jeju Gothic'; font-size: small;"><%=sales.get(i).getTitle()%></h5><a>
                    <p style="color: rgb(143, 143, 149); font-size: small;"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;5
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;0</p>
                    <a type="button" class="btn-floating btn-small" style="text-align: center; background-color: #404040!important; margin: 0; color: #fff3cd;"
                       data-toggle="tooltip" data-placement="top" title="USD <%=sales.get(i).getPrice()%>">
                        <i class="fa fa-dollar" aria-hidden="true"></i></a>
                </div>
                <!--/.Card content-->
            </div>
            <!--/.Card Light-->
            <%}%>
        </div>
        <!--/.First slide-->

        <!--Second slide-->
        <%if (sales.size() > 4) {%>
        <div class="carousel-item container">
            <% for (int i = 4; i < Math.min(8, sales.size()); i++) {%>
            <!--Card Light-->
            <div class="card" id="items-<%=i%>">
                <!--Card image-->
                <div class="view overlay hm-white-slight">

                    <div class="preloader-wrapper big active progress-custom" style="position: absolute; top:88px; left:88px;">
                        <div class="preloader-wrapper big active">
                            <div class="preloader-wrapper big active">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%request.setAttribute("image", sales.get(i).getSaleImage().get(0));%>
                    <img class="card-image" style="display: none;" src="<c:url value="/resources/images/${image}"/>" class="img-fluid" alt="">
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color: #040404;">
                        <div class="mask"></div>
                    </a>
                </div>
                <!--/.Card image-->
                <!--Card content-->
                <div class="card-body">
                    <!--Title-->
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color: #040404;">
                        <h5 class="card-title" style="overflow-x: hidden;
                     overflow-y: hidden; width: 200px;
                      height: 15px; font-family: 'Jeju Gothic'; font-size: small;"><%=sales.get(i).getTitle()%></h5></a>
                    <p style="color: rgb(143, 143, 149); font-size: small;"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;5
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;0</p>
                    <a type="button" class="btn-floating btn-small" style="text-align: center; background-color: #404040!important; margin: 0; color: #fff3cd;"
                       data-toggle="tooltip" data-placement="top" title="USD <%=sales.get(i).getPrice()%>">
                        <i class="fa fa-dollar" aria-hidden="true"></i></a>
                </div>
                <!--/.Card content-->
            </div>
            <!--/.Card Light-->
            <%}%>
        </div>
        <%}%>
        <!--/.Second slide-->

        <%if (sales.size() > 8) {%>
        <!--Third slide-->
        <div class="carousel-item container">
            <% for (int i = 8; i < Math.min(12, sales.size()); i++) {%>
            <!--Card Light-->
            <div class="card" id="items-<%=i%>">
                <!--Card image-->
                <div class="view overlay hm-white-slight">

                    <div class="preloader-wrapper big active progress-custom" style="position: absolute; top:88px; left:88px;">
                        <div class="preloader-wrapper big active">
                            <div class="preloader-wrapper big active">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%request.setAttribute("image", sales.get(i).getSaleImage().get(0).getUri());%>
                    <img class="card-image" style="display: none;" src="<c:url value="/resources/images/${image}"/>" class="img-fluid" alt="">
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color: #040404;">
                        <div class="mask"></div>
                    </a>
                </div>
                <!--/.Card image-->
                <!--Card content-->
                <div class="card-body">
                    <!--Title-->
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color: #040404;"><h5 class="card-title" style="overflow-x: hidden;
                     overflow-y: hidden; width: 200px;
                      height: 15px; font-family: 'Jeju Gothic'; font-size: small;"><%=sales.get(i).getTitle()%></h5></a>
                    <p style="color: rgb(143, 143, 149); font-size: small;"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;5
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;0</p>
                    <a type="button" class="btn-floating btn-small" style="text-align: center; background-color: #404040!important; margin: 0; color: #fff3cd;"
                       data-toggle="tooltip" data-placement="top" title="USD <%=sales.get(i).getPrice()%>">
                        <i class="fa fa-dollar" aria-hidden="true"></i></a>
                </div>
                <!--/.Card content-->
            </div>
            <!--/.Card Light-->
            <%}%>

        </div>
        <!--/.Third slide-->
        <%}%>
    </div>
    <!--/.Slides-->
    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
        <%if (sales.size() > 4) {%>
        <li data-target="#multi-item-example" data-slide-to="1"></li>
        <%}%>
        <%if (sales.size() > 8) {%>
        <li data-target="#multi-item-example" data-slide-to="2"></li>
        <%}%>
    </ol>
    <!--/.Indicators-->



</div>