<%@ page import="com.split.first.dto.Sale" %>
<%@ page import="javax.smartcardio.Card" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Page Content -->
<%List<Sale> sales = (List<Sale>) request.getAttribute("sales");%>
<section class="py-5">
    <div class="container itemList" style="overflow: auto;">
        <!--Card-->

        <% for (int i = 0; i < sales.size(); i++) {%>
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
                    <%request.setAttribute("image", sales.get(i).getImage(0));%>
                    <img class="card-image" style="display: none;" src="<c:url value="/resources/images/${image}"/>" class="img-fluid" alt="">
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color:#040404;">
                        <div class="mask"></div>
                    </a>
                </div>
                <!--/.Card image-->
                <!--Card content-->
                <div class="card-body">
                    <!--Title-->
                    <a href="/item/sale/<%=sales.get(i).getSerial()%>" style="color:#040404;">
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
        <!--/.Card-->
    </div>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        })
    </script>
</section>

<jsp:include page="pagination.jsp"/>