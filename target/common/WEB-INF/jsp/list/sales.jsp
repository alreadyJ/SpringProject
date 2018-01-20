<%@ page import="common.pro.dao.SalesList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Page Content -->
<section class="py-5">
    <div class="container itemList">
        <!--Card-->
        <c:forEach var="a" begin="0" end="${sales.size()}" step="1">
            <!--Card Light-->
            <div class="card" id="items-${a}">
                <!--Card image-->
                <div class="view overlay hm-white-slight">
                    <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%28131%29.jpg" class="img-fluid" alt="">
                    <a>
                        <div class="mask"></div>
                    </a>
                </div>
                <!--/.Card image-->
                <!--Card content-->
                <div class="card-body">
                    <!--Social shares button-->
                    <a class="activator"><i class="fa fa-share-alt"></i></a>
                    <!--Title-->
                    <h4 class="card-title">Card title</h4>
                    <hr>
                    <a href="#" class="black-text d-flex flex-row-reverse">
                        <h5 class="waves-effect p-2">Read more <i class="fa fa-chevron-right"></i></h5>
                    </a>
                </div>
                <!--/.Card content-->
            </div>
            <!--/.Card Light-->
        </c:forEach>
        <!--/.Card-->
    </div>

</section>