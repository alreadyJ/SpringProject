<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 14/01/2018
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="modalCountry2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
        <!--Content-->
        <div class="modal-content" style="height: 400px;">
            <iframe src="/googleMap2" style="height: 350px;" frameborder="0"></iframe>
            <input type="text" disabled value="Sydney" id="locationValue2" style="height: 50px;">
        </div>
        <!--/.Content-->
    </div>
</div>

<div>
    <input type="text" name="selected-location2" id="selectedLocation2" readonly="readonly" value="location" name="location2" style="width: 100px; display: inline-block;">
    <input type="hidden" name="arrivalImage" id="arrivalImage" value="">
    <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#modalCountry2" style="display: inline-block;padding :10px 10px;">Select</a>
</div>
