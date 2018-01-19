<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>list</title>
    <jsp:include page="../baseResources.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=1"/>"/>
</head>
<body>


<jsp:include page="../nav.jsp"/>

<ul class="nav md-pills nav-justified pills-secondary">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#panel4" role="tab">Sale</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel11" role="tab">Trip</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#panel12" role="tab">Request</a>
    </li>
</ul>

<!-- Tab panels -->
<div class="tab-content">

    <!--Panel 1-->
    <div class="tab-pane fade in show active" id="panel11" role="tabpanel">
        <br>
        <jsp:include page="sale.jsp"/>
    </div>
    <!--/.Panel 1-->

    <!--Panel 2-->
    <div class="tab-pane fade" id="panel12" role="tabpanel">
        <br>
        <jsp:include page="trip.jsp"/>

    </div>
    <!--/.Panel 2-->
    <!--Panel 3-->
    <div class="tab-pane fade" id="panel13" role="tabpanel">
        <br>
        <jsp:include page="request.jsp"/>

    </div>
    <!--/.Panel 3-->
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
