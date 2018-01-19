<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alreadyj
  Date: 19/01/2018
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="jumbotron">
    <h1 class="h1-responsive">Post Sale</h1>

    <div class="container" style="padding-top: 60px;">
        <div class="row">
            <!-- left column -->

            <!-- edit form column -->
            <div class="col-sm-6 col-xs-12">

                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Country</label>
                        <div class="col-lg-8">
                            <jsp:include page="category.jsp"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Title</label>
                        <div class="col-lg-8">
                            <input class="form-control" value="" type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Sales details</label>
                        <div class="col-lg-8">
                            <textarea class="form-control" cols="30" rows="10"></textarea>
                        </div>
                    </div>


                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="text-center">
                            <img src="<c:url value="/resources/images/user.png"/>" class="avatar img-circle img-thumbnail" alt="avatar">
                            <h6>Upload a different photo...</h6>
                            <input type="file" class="text-center center-block well well-sm">
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>



    <a class="btn btn-primary btn-lg" role="button">Complete post</a>
</div>
