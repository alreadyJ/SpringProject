<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
    <div class="container" >
        <a class="navbar-brand" href="/">SPLIT</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars" aria-hidden="true"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item nav-custom-item">
                    <i class="fa fa-plane" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="#">Post</a>
                </li>
                <li class="nav-item nav-custom-item">
                    <i class="fa fa-th-list" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="list">List</a>
                </li>
                <li class="nav-item  nav-custom-item">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="#">Contact</a>
                </li>
                <li class="nav-item nav-custom-item">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                    <a class="nav-link nav-custom-link" href="setting">MyPage</a>
                </li>
                <li class="nav-item nav-custom-item">
                    <jsp:include page="loginModal.jsp"/>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div style="height: 72px; width: 100%;"></div>