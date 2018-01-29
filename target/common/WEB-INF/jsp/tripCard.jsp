<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="common.pro.dao.TripList" %>
<%List<TripList> trips = (List<TripList>) request.getAttribute("trips");%>

<!--Carousel Wrapper-->
<div id="multi-item-example2" class="carousel slide carousel-multi-item" data-ride="carousel">

    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#multi-item-example2" data-slide-to="0" class="active"></li>
        <%if (trips.size() > 4) {%>
        <li data-target="#multi-item-example2" data-slide-to="1"></li>
        <%}%>
        <%if (trips.size() > 7) {%>
        <li data-target="#multi-item-example2" data-slide-to="2"></li>
        <%}%>
    </ol>
    <!--/.Indicators-->

    <!--Slides-->
    <div class="carousel-inner py-5" role="listbox">
        <!--First slide-->
        <div class="carousel-item active container">
            <!--Card-->

            <% for (int i = 0; i < Math.min(4, trips.size()); i++) {%>
            <!--Card-->
            <div class="card testimonial-card" id="items-<%=i%>">

                <!--Bacground color-->
                <div class="card-up aqua-gradient">
                </div>

                <!--Avatar-->
                <div class="avatar"><img src="<c:url value="/resources/images/user.png"/> " class="rounded-circle">
                </div>

                <div class="card-body">
                    <!--Name-->
                    <h4 class="card-title"><%=trips.get(i).getUserInfo().getNickName()%></h4>
                    <hr>
                    <!--Quotation-->
                    <p style="text-align: center"><i class="fa fa-quote-left"></i>&nbsp;<%=trips.get(i).getSource()%>&nbsp;
                        <i class="fa fa-plane" aria-hidden="true"></i>&nbsp;<%=trips.get(i).getDestination()%>
                        <i class="fa fa-quote-right" aria-hidden="true"></i>&nbsp;</p>
                </div>

            </div>
            <!--/.Card-->
            <%}%>
        </div>
        <!--/.First slide-->

        <!--Second slide-->
        <%if (trips.size() > 4) {%>
        <div class="carousel-item container">
            <!--Card-->

            <% for (int i = 4; i < Math.min(8, trips.size()); i++) {%>
            <!--Card-->
            <div class="card testimonial-card" id="items-<%=i%>">

                <!--Bacground color-->
                <div class="card-up aqua-gradient">
                </div>

                <!--Avatar-->
                <div class="avatar"><img src="<c:url value="/resources/images/user.png"/> " class="rounded-circle">
                </div>

                <div class="card-body">
                    <!--Name-->
                    <h4 class="card-title"><%=trips.get(i).getUserInfo().getNickName()%></h4>
                    <hr>
                    <!--Quotation-->
                    <p style="text-align: center"><i class="fa fa-quote-left"></i>&nbsp;<%=trips.get(i).getSource()%>&nbsp;
                        <i class="fa fa-plane" aria-hidden="true"></i>&nbsp;<%=trips.get(i).getDestination()%>
                        <i class="fa fa-quote-right" aria-hidden="true"></i>&nbsp;</p>
                </div>

            </div>
            <!--/.Card-->
            <%}%>
        </div>
        <%}%>
        <!--/.Second slide-->

        <%if (trips.size() > 8) {%>
        <!--Third slide-->
        <div class="carousel-item container">
            <!--Card-->

            <% for (int i = 8; i < Math.min(12, trips.size()); i++) {%>
            <!--Card-->
            <div class="card testimonial-card" id="items-<%=i%>">

                <!--Bacground color-->
                <div class="card-up aqua-gradient">
                </div>

                <!--Avatar-->
                <div class="avatar"><img src="<c:url value="/resources/images/user.png"/> " class="rounded-circle">
                </div>

                <div class="card-body">
                    <!--Name-->
                    <h4 class="card-title"><%=trips.get(i).getUserInfo().getNickName()%></h4>
                    <hr>
                    <!--Quotation-->
                    <p style="text-align: center"><i class="fa fa-quote-left"></i>&nbsp;<%=trips.get(i).getSource()%>&nbsp;
                        <i class="fa fa-plane" aria-hidden="true"></i>&nbsp;<%=trips.get(i).getDestination()%>
                        <i class="fa fa-quote-right" aria-hidden="true"></i>&nbsp;</p>
                </div>

            </div>
            <!--/.Card-->
            <%}%>
        </div>
        <%}%>
    </div>
    <!--/.Slides-->

    <div class="controls-top">
        <a class="btn-floating" href="#multi-item-example2" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
        <a class="btn-floating" href="#multi-item-example2" data-slide="next"><i class="fa fa-chevron-right"></i></a>
    </div>
</div>