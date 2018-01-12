<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Page Content -->
<section class="py-5">

    <div class="container itemList">
        <!--Card-->
        <c:forEach var="a" begin="1" end="4" step="1">
        <div class="card" id="items-${a}">

            <!--Card image-->
            <div class="view overlay hm-white-slight">
                <img src="https://mdbootstrap.com/img/Photos/Others/food.jpg" class="img-fluid" alt="">
                <a>
                    <div class="mask"></div>
                </a>
            </div>
            <!--/.Card image-->

            <!--Button-->
            <a class="btn-floating btn-action"><i class="fa fa-chevron-right"></i></a>

            <!--Card content-->
            <div class="card-body">
                <!--Title-->
                <h4 class="card-title">Card title</h4>
                <h5>$15</h5>
                <hr>
                <!--Text-->
                <p class="card-text">Some quick example </p>
            </div>
            <!--/.Card content-->

            <!-- Card footer -->
            <div class="card-data">
                <ul>
                    <li><i class="fa fa-clock-o"></i> 05/10/2015</li>
                    <li><a href="#"><i class="fa fa-comments-o"></i>12</a></li>
                    <li><a href="#"><i class="fa fa-facebook"> </i>21</a></li>
                    <li><a href="#"><i class="fa fa-twitter"> </i>5</a></li>
                </ul>
            </div>
            <!-- Card footer -->

        </div>
        </c:forEach>
        <!--/.Card-->
    </div>

</section>