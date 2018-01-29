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

        <% for (int i = 0; i < requests.size(); i++) { %>
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
                     overflow-y: hidden; width: 200px;
                      height: 15px; font-family: 'Jeju Gothic'; font-size: small;"><%=requests.get(i).getTitle()%></h5>
                <p style="color: rgb(143, 143, 149); font-size: small;"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;5
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;0</p>
                <a type="button" class="btn-floating btn-small" style="text-align: center; background-color: #404040!important; margin: 0; color: #fff3cd;"
                   data-toggle="tooltip" data-placement="top" title="service fee <%=requests.get(i).getServiceFee()%>">
                    <i class="fa fa-dollar" aria-hidden="true"></i></a>
            </div>
            <!--/.Card content-->
        </div>
        <!--/.Card Light-->
        <%}%>
        <!--/.Card-->
    </div>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        })
    </script>
</section>
<jsp:include page="pagination.jsp"/>