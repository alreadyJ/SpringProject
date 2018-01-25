<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="jumbotron">
    <h1 class="h1-responsive">Post Trip</h1>

    <div class="container" style="padding-top: 60px;">
        <div class="row">
            <!-- left column -->

            <!-- edit form column -->
            <div class="col-sm-6 col-xs-12">

                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Source</label>
                        <jsp:include page="../setting/countryModal.jsp"/>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Destination</label>
                        <jsp:include page="../setting/countryModal.jsp"/>
                    </div>



                    <div class="form-group">
                        <label class="col-lg-3 control-label">Date</label>
                        <div class="md-form">
                            <input placeholder="Selected date" type="text" id="date-picker-example" style="width: 200px;" class="form-control datepicker">
                        </div>
                        <div class="md-form">
                            <input placeholder="Selected date" type="text" id="date-picker-example2" style="width: 200px;" class="form-control datepicker">
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
                        <label class="col-lg-3 control-label">Trip details</label>
                        <div class="col-lg-8">
                            <textarea class="form-control" required wrap="hard" cols="30" rows="10" maxlength="1000" placeholder="내용을 자세하게 적어주세요.(상품 사이즈, 색상, 포장, 구입 방법 등, 1000자 이하)"></textarea>
                        </div>
                    </div>





                </form>
            </div>
        </div>
    </div>

    <a class="btn btn-primary btn-lg" role="button">Complete post</a>
</div>
