<%@ page import="common.pro.dao.TripList" %>
<%@ page import="javax.smartcardio.Card" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Page Content -->
<%List<TripList> trips = (List<TripList>) request.getAttribute("trips");
String key = (String)request.getAttribute("key");%>
<section class="py-5">
    <div class="container itemList" style="overflow: auto;">
        <!--Card-->

        <% for (int i = 0; i < trips.size(); i++) {%>
        <!--Card-->
        <div class="card testimonial-card">

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

</section>
<jsp:include page="pagination.jsp"/>