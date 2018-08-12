<%@ page import="com.split.first.session.dto.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 16/01/2018
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%User user = (User)session.getAttribute("User");%>
<form id="profile-form" method="post" role="form" enctype="multipart/form-data" action="/saveProfile">
<div class="container" style="padding-top: 60px;">
    <h1 class="page-header">Edit Profile</h1>
    <div class="row">
        <!-- left column -->
        <input type="hidden" id="userSerial" name="userSerial" value="<%=user.getSerial()%>"/>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="text-center">
                <%request.setAttribute("image", (user.getProfileImg().equals("") ? "user.png" : user.getProfileImg()));%>

                <img src="<c:url value="/resources/images/${image}"/>" id="profile-image" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" name="image-file" class="text-center center-block well well-sm" accept="image/*" id="profile-file" onchange="previewFile('profile-image', 'profile-file', 'image-file');">
                <input type="hidden" name="image-flag" id="image-file" value="0">
            </div>
        </div>
        <!-- edit form column -->
        <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
            <div class="col-lg-8">
                <div class="alert alert-info alert-dismissable" style="margin-top: 15px;">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    You signed up in "<%=user.getSignUpDate()%>"
                </div>
            </div>
            <h3>Personal info</h3>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-lg-3 control-label">Nick Name</label>
                    <div class="col-lg-8">
                        <input class="form-control" value="<%=user.getNickName()%>" type="text" readonly="readonly">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Country</label>
                    <div class="col-lg-8">
                        <jsp:include page="profileCountry.jsp"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Address</label>
                    <div class="col-lg-8">
                        <input class="form-control" name="address" id="profile-address" value="<%=((user.getAddress() == null) ? "" : user.getAddress())%>" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Description</label>
                    <div class="col-lg-8">
                        <textarea class="form-control" name="description" cols="30" rows="10"><%=(user.getDescription() == null ? "": user.getDescription())%></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <input class="btn btn-primary" id="profile-description" value="Save Changes" type="button" onclick="saveProfile();" style="background-color: #040404 !important;">
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</form>
<script src="<c:url value="/resources/js/saveProfile.js?ver=1.0"/>"></script>