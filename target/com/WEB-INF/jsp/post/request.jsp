<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.split.first.dto.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<div class="jumbotron">
    <h1 class="h1-responsive">Post Request</h1>

    <div class="container" style="padding-top: 60px;">
        <div class="row">
            <!-- left column -->

            <!-- edit form column -->
            <div class="col-sm-6 col-xs-12">

                <form class="form-horizontal" method="post" role="form" id="request-form" enctype="multipart/form-data" action="/postRequest">
                    <input id="comment-user-serial" type="hidden" name="userSerial" value="2">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Category</label>
                        <div class="col-lg-8">
                            <jsp:include page="category.jsp"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Title</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="title" id="request-title" value="" type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Request details</label>
                        <div class="col-lg-8">
                            <textarea class="form-control" name="request-detail" id="request-detail" required wrap="hard" cols="30" rows="10" maxlength="1000" placeholder="내용을 자세하게 적어주세요.(상품 사이즈, 색상, 포장, 구입 방법 등, 1000자 이하)"></textarea>
                        </div>
                    </div>


                    <div class="form-group" >
                        <label class="col-lg-3 control-label" style="max-width:100%;">Upload images</label>
                        <div class="file-field">
                            <div class="z-depth-1-half mb-4">
                                <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" id="request-img1" class="img-fluid">
                            </div>
                            <div class="d-flex justify-content-center">
                                <div class="btn btn-mdb-color btn-rounded">
                                    <span>Choose file</span>
                                    <input type="file" name="image-file1" accept="image/*" id="request-file1" onchange="previewFile('request-img1', 'request-file1', 'image-file1');">
                                    <input type="hidden" name="image-flag1" id="image-file1" value="0">
                                </div>
                            </div>
                        </div>

                        <div class="file-field">
                            <div class="z-depth-1-half mb-4">
                                <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" id="request-img2" class="img-fluid">
                            </div>
                            <div class="d-flex justify-content-center">
                                <div class="btn btn-mdb-color btn-rounded">
                                    <span>Choose file</span>
                                    <input type="file" name="image-file2" accept="image/*"  id="request-file2" onchange="previewFile('request-img2', 'request-file2', 'image-file2');">
                                    <input type="hidden" name="image-flag2" id="image-file2" value="0">
                                </div>
                            </div>
                        </div>

                        <div class="file-field">
                            <div class="z-depth-1-half mb-4">
                                <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" id="request-img3" class="img-fluid">
                            </div>
                            <div class="d-flex justify-content-center">
                                <div class="btn btn-mdb-color btn-rounded">
                                    <span>Choose file</span>
                                    <input type="file" name="image-file3" accept="image/*"  id="request-file3" onchange="previewFile('request-img3', 'request-file3', 'image-file3');">
                                    <input type="hidden" name="image-flag3" id="image-file3" value="0">
                                </div>
                            </div>
                        </div>

                    </div>
                    
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Location of buyer</label>
                        <jsp:include page="../setting/countryModal.jsp"/>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Expiration</label>
                        <div class="md-form">
                            <input placeholder="Selected date"  name="selected-date" type="text" id="date-picker-example" style="width: 200px;" class="form-control datepicker">
                        </div>
                        <script>
                            $('.datepicker').pickadate({
                                format: 'yyyy-mm-dd',
                                formatSubmit: 'yyyy-mm-dd',
                                min: true,
                                max: false
                            });
                        </script>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Quantity</label>
                        <p></p>
                        <div class="input-group">
                          <span class="input-group-btn">
                              <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                  <i class="fa fa-minus" aria-hidden="true"></i>
                              </button>
                          </span>
                            <input type="number" name="quant[1]" id="request-quantity" class="form-control input-number" value="1" min="1" max="500" style="width:100px; flex: 0;">
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
                                  <i class="fa fa-plus" aria-hidden="true"></i>
                              </button>
                          </span>
                        </div>
                        <p></p>
                    </div>
                    <script src="<c:url value="/resources/js/minusPlus.js"/> "></script>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Service fee</label>
                        <div class="col-lg-8" style="padding: 0;">
                            <input class="form-control" name="service-fee" id="service-fee" value="" type="number" min="1" max="1000000" placeholder="write service fee" style="width: 200px; display: inline-block">
                            <i class="fa fa-dollar" aria-hidden="true"  style="display: inline-block;"></i>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-lg-3 control-label">Price</label>
                        <div class="col-lg-8" style="padding: 0;">
                            <input class="form-control" value="" name="request-price" id="request-price" type="number" min="1" max="1000000" placeholder="write dollar" style="width: 200px; display: inline-block">
                            <i class="fa fa-dollar" aria-hidden="true"  style="display: inline-block;"></i>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <a class="btn btn-primary btn-lg" role="button" onclick="postRequest();">Complete post</a>
</div>
<script src="<c:url value="/resources/js/postRequest.js?ver=1.2" />"></script>