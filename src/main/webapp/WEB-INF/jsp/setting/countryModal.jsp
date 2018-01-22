<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 14/01/2018
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="modalCountry" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
        <!--Content-->
        <div class="modal-content" style="height: 450px;">
            <iframe src="googleMap" style="height: 350px;" frameborder="0"></iframe>

        </div>
        <!--/.Content-->
    </div>
</div>


<div class="text-center">
    <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#modalCountry" style="padding :10px 25px;">modify</a>
</div>