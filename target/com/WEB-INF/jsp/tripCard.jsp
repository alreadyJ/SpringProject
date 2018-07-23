<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.split.first.dto.Trip" %>
<%List<Trip> trips = (List<Trip>) request.getAttribute("trips");%>

<!--Carousel Wrapper-->
<div id="multi-item-example2" class="carousel slide carousel-multi-item" data-ride="carousel">

    <!--Slides-->
    <div class="carousel-inner py-5" role="listbox">
        <a class="btn-floating" href="#multi-item-example2" style="position: absolute;top: 150px;left: 2%; background: transparent; box-shadow: none;" data-slide="prev"><i class="fa fa-chevron-left" style="color:#040404;"></i></a>
        <a class="btn-floating" href="#multi-item-example2" style="position: absolute;top: 150px;right: 2%; background: transparent; box-shadow: none;" data-slide="next"><i class="fa fa-chevron-right" style="color:#040404;"></i></a>
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
                    <a href="/item/trip/<%=trips.get(i).getSerial()%>" style="color: #040404;"><h4 class="card-title"><%=trips.get(i).getUser().getNickName()%></h4> </a>
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
                    <a href="/item/trip/<%=trips.get(i).getSerial()%>" style="color: #040404;"><h4 class="card-title"><%=trips.get(i).getUser().getNickName()%></h4></a>
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
                    <a href="/item/trip/<%=trips.get(i).getSerial()%>" style="color: #040404;"><h4 class="card-title"><%=trips.get(i).getUser().getNickName()%></h4></a>
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

    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#multi-item-example2" data-slide-to="0" class="active"></li>
        <%if (trips.size() > 4) {%>
        <li data-target="#multi-item-example2" data-slide-to="1"></li>
        <%}%>
        <%if (trips.size() > 8) {%>
        <li data-target="#multi-item-example2" data-slide-to="2"></li>
        <%}%>
    </ol>
    <!--/.Indicators-->
</div>