<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MyPage</title>
    <jsp:include page="../baseResources.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom-card.css?ver=1"/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/setting.css"/> "/>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="row">
    <!-- First column -->
    <div class="col-4" id="setting-nav" style="margin-top: 32px;">

        <!-- Navigation -->
        <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Home</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
            <a class="list-group-item list-group-item-action" id="list-account-list" data-toggle="list" href="#list-account" role="tab" aria-controls="messages">Account</a>
            <a class="list-group-item list-group-item-action" id="list-phone-list" data-toggle="list" href="#list-phone" role="tab" aria-controls="settings">Phone</a>
            <a class="list-group-item list-group-item-action" id="list-payment-list" data-toggle="list" href="#list-payment" role="tab" aria-controls="settings">Payment</a>
        </div>
        <!-- Navigation -->

    </div>
    <!-- First column -->

    <!-- Second column -->
    <div class="col-8" id="setting-details">

        <!-- Content -->
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                <jsp:include page="home.jsp"/>
            </div>
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                <jsp:include page="profile.jsp"/>
            </div>
            <div class="tab-pane fade" id="list-account" role="tabpanel" aria-labelledby="list-profile-list">
                <jsp:include page="account.jsp"/>
            </div>
            <div class="tab-pane fade" id="list-phone" role="tabpanel" aria-labelledby="list-messages-list">
                <jsp:include page="phone.jsp"/>
            </div>
            <div class="tab-pane fade" id="list-payment" role="tabpanel" aria-labelledby="list-settings-list">
                <jsp:include page="payment.jsp"/>
            </div>
        </div>
        <!-- Content -->

    </div>
    <!-- Second column -->

</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>
