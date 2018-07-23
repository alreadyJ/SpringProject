<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SPLIT::List</title>
    <jsp:include page="../baseResources.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=2.2"/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/googleMap.css?ver=2"/>"/>
</head>
<body>
<%String type = (String) request.getAttribute("type");%>
<jsp:include page="../nav.jsp"/>

<ul class="nav md-pills nav-justified pills-secondary">
    <li class="nav-item">
        <%if (type.equals("sale")) {%>
        <a class="nav-link active"  href="/list/sale"  >Sale</a>
        <%} else {%>
        <a class="nav-link" href="/list/sale"  >Sale</a>
        <%}%>
    </li>
    <li class="nav-item">
        <%if (type.equals("trip")) {%>
        <a class="nav-link active" href="/list/trip"  >Trip</a>
        <%} else {%>
        <a class="nav-link" href="/list/trip" >Trip</a>
        <%}%>
    </li>
    <li class="nav-item">
        <%if (type.equals("request")) {%>
        <a class="nav-link active" href="/list/request" >Request</a>
        <%} else {%>
        <a class="nav-link" href="/list/request" >Request</a>
        <%}%>
    </li>
</ul>

<!-- Tab panels -->
<div class="tab-content">

    <!--Panel 1-->
    <div class="tab-pane fade in show active" id="listing">
        <br>
        <%switch (type) {
            case "sale":%><jsp:include page="sales.jsp"/><% break;
        case "trip":%><jsp:include page="trips.jsp"/><%  break;
        case "request":%><jsp:include page="requests.jsp"/><%  break;
        default: break;
    }%>
    </div>

</div>

<jsp:include page="../footer.jsp"/>

<script src="<c:url value="/resources/js/custom-card.js" />"></script>
</body>
</html>
