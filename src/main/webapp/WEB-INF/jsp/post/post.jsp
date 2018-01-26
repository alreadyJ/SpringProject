<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SPLIT::Post</title>

    <jsp:include page="../baseResources.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=1"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.0.1/jquery-migrate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<c:url value="/resources/js/pickadate-3.5.6/lib/legacy.js"/> "></script>
    <script src="<c:url value="/resources/js/pickadate-3.5.6/lib/picker.js"/> "></script>
    <script src="<c:url value="/resources/js/pickadate-3.5.6/lib/picker.date.js"/> "></script>
    <script src="<c:url value="/resources/js/pickadate-3.5.6/lib/picker.time.js"/> "></script>
</head>
<body>
<%String type = (String) request.getAttribute("type");%>

<jsp:include page="../nav.jsp"/>

<ul class="nav md-pills nav-justified pills-secondary">
    <li class="nav-item">
        <%if (type.equals("sale")) {%>
            <a class="nav-link active"  href="/post/sale"  >Sale</a>
        <%} else {%>
            <a class="nav-link" href="/post/sale"  >Sale</a>
        <%}%>
    </li>
    <li class="nav-item">
        <%if (type.equals("trip")) {%>
        <a class="nav-link active" href="/post/trip"  >Trip</a>
        <%} else {%>
        <a class="nav-link" href="/post/trip" >Trip</a>
        <%}%>
    </li>
    <li class="nav-item">
        <%if (type.equals("request")) {%>
        <a class="nav-link active" href="/post/request" >Request</a>
        <%} else {%>
        <a class="nav-link" href="/post/request" >Request</a>
        <%}%>
    </li>
</ul>

<!-- Tab panels -->
<div class="tab-content">

    <!--Panel 1-->
    <div class="tab-pane fade in show active" id="posting">
        <br>
        <%switch (type) {
            case "sale":%><jsp:include page="sale.jsp"/><% break;
            case "trip":%><jsp:include page="trip.jsp"/><%  break;
            case "request":%><jsp:include page="request.jsp"/><%  break;
            default: break;
        }%>
    </div>

</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
