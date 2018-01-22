<%@ page import="common.pro.dao.SaleList" %>
<%@ page import="java.util.List" %>
<%@ page import="common.pro.dao.RequestList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Page Content -->
<%List<RequestList> requests = (List<RequestList>) request.getAttribute("requests");%>
<section class="py-5">
    <div class="container itemList" style="overflow: auto;">
        <!--Card-->

        <% for (int i = 0; i < requests.size(); i++) {%>
        <!--Card Light-->
        <div class="card" id="items-<%=i%>">
            <!--Card image-->
            <div class="view overlay hm-white-slight">
                <%request.setAttribute("image", requests.get(i).getImage(0));%>
                <img class="card-image" src="<c:url value="/resources/images/${image}"/>" class="img-fluid" alt="">
                <a>
                    <div class="mask"></div>
                </a>
            </div>
            <!--/.Card image-->
            <!--Card content-->
            <div class="card-body">
                <!--Title-->
                <h5 class="card-title" style="overflow-x: hidden;
                     overflow-y: hidden; width: 200px; height: 19px;"><%=requests.get(i).getTitle()%></h5>
                <hr>
                <p><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;5
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;0</p>
                <a href="#" class="black-text d-flex flex-row-reverse">
                    <h5 class="waves-effect p-2">service&nbsp;fee&nbsp;<i class="fa fa-dollar" aria-hidden="true"></i>
                        <%=requests.get(i).getServiceFee()%></h5>
                </a>
            </div>
            <!--/.Card content-->
        </div>
        <!--/.Card Light-->
        <%}%>
        <!--/.Card-->
    </div>

</section>
<jsp:include page="pagination.jsp"/>