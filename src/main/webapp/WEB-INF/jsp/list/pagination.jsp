<%@ page import="com.split.first.dto.Sale" %>
<%@ page import="javafx.scene.control.Pagination" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!int pageCount = 0; %>
<%pageCount = 1;%>
<!--Pagination -->
<nav class="my-4">
    <ul class="pagination pagination-circle pg-blue mb-0">

        <!--First-->
        <li class="page-item disabled"><a class="page-link">First</a></li>

        <!--Arrow left-->
        <li class="page-item disabled">
            <a class="page-link" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
            </a>
        </li>

        <!--Numbers-->
        <li class="page-item active"><a class="page-link">1</a></li>
        <%for (int i = 2; i <= pageCount; i++) {%>
        <li class="page-item active"><a class="page-link"><%=i%></a></li>
        <%}%>

        <!--Arrow right-->
        <li class="page-item">
            <a class="page-link" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
            </a>
        </li>

        <!--First-->
        <li class="page-item"><a class="page-link">Last</a></li>

    </ul>
</nav>
<!--/Pagination -->
