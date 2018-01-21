<%@ page import="common.pro.dao.SalesList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Page Content -->
<%List<SalesList> sales = (List<SalesList>) request.getAttribute("sales");%>
<section class="py-5">
    <div class="container itemList" style="overflow: auto;">
        <!--Card-->

        <% for (int i = 0; i < sales.size(); i++) {%>
            <!--Card Light-->
            <div class="card" id="items-<%=i%>">
                <!--Card image-->
                <div class="view overlay hm-white-slight">
                    <%request.setAttribute("image", sales.get(i).getImage(0));%>
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
                     overflow-y: hidden; width: 200px; height: 19px;"><%=sales.get(i).getTitle()%></h5>
                    <hr>
                    <p><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;5
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;0</p>
                    <a href="#" class="black-text d-flex flex-row-reverse">
                        <h5 class="waves-effect p-2"><i class="fa fa-dollar" aria-hidden="true"></i>
                            <%=sales.get(i).getPrice()%></h5>
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