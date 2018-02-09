<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="jumbotron">
    <h1 class="h1-responsive">Post Request</h1>

    <div class="container" style="padding-top: 60px;">
        <div class="row">
            <!-- left column -->

            <!-- edit form column -->
            <div class="col-sm-6 col-xs-12">

                <form class="form-horizontal" role="form" action="/postSale">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Category</label>
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
                        <label class="col-lg-3 control-label">Request details</label>
                        <div class="col-lg-8">
                            <textarea class="form-control" required wrap="hard" cols="30" rows="10" maxlength="1000" placeholder="내용을 자세하게 적어주세요.(상품 사이즈, 색상, 포장, 구입 방법 등, 1000자 이하)"></textarea>
                        </div>
                    </div>


                    <div class="form-group" >
                        <label class="col-lg-3 control-label" style="max-width:100%;">Upload images</label>
                        <form>
                            <div class="file-field">
                                <div class="z-depth-1-half mb-4">
                                    <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" class="img-fluid">
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="btn btn-mdb-color btn-rounded">
                                        <span>Choose file</span>
                                        <input type="file">
                                        <input type="hidden" id="image-file1" value="0">
                                    </div>
                                </div>
                            </div>

                            <div class="file-field">
                                <div class="z-depth-1-half mb-4">
                                    <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" class="img-fluid">
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="btn btn-mdb-color btn-rounded">
                                        <span>Choose file</span>
                                        <input type="file">
                                        <input type="hidden" id="image-file2" value="0">
                                    </div>
                                </div>
                            </div>

                            <div class="file-field">
                                <div class="z-depth-1-half mb-4">
                                    <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" class="img-fluid">
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="btn btn-mdb-color btn-rounded">
                                        <span>Choose file</span>
                                        <input type="file">
                                        <input type="hidden" id="image-file3" value="0">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Location of buyer</label>
                        <jsp:include page="../setting/countryModal.jsp"/>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Expiration</label>
                        <div class="md-form">
                            <input placeholder="Selected date" type="text" id="date-picker-example" style="width: 200px;" class="form-control datepicker">
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
                        <label class="col-lg-3 control-label">Service fee</label>
                        <div class="col-lg-8" style="padding: 0;">
                            <input class="form-control" value="" type="number" min="1" max="1000000" placeholder="write service fee" style="width: 200px; display: inline-block">
                            <i class="fa fa-dollar" aria-hidden="true"  style="display: inline-block;"></i>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-lg-3 control-label">Price</label>
                        <div class="col-lg-8" style="padding: 0;">
                            <input class="form-control" value="" type="number" min="1" max="1000000" placeholder="write dollar" style="width: 200px; display: inline-block">
                            <i class="fa fa-dollar" aria-hidden="true"  style="display: inline-block;"></i>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <a class="btn btn-primary btn-lg" role="button">Complete post</a>
</div>
