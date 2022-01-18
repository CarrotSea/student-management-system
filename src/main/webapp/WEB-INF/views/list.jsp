<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Student List</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/boostrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/boostrap/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Student-Management-System</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 offset-md-8">
                <button class="btn btn-primary">Add</button>
                <button class="btn btn-danger">Delete</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>studentName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>change</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="student">
                        <tr>
                            <th>${student.stuId}</th>
                            <th>${student.stuName}</th>
                            <th>${student.gender == 'M' ? "Male" : "Female"}</th>
                            <th>${student.email}</th>
                            <th>${student.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    Edit
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    Delete
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                Currently at page ${pageInfo.pageNum}, ${pageInfo.pages} pages in total, ${pageInfo.total} records in total
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="${APP_PATH}/students?pn=1">First</a>
                        </li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li class="page-item">
                                <a class="page-link" href="${APP_PATH}/students?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="active page-item">
                                    <a class="page-link" href="#">${page_Num}</a>
                                </li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li class="page-item">
                                    <a class="page-link" href="${APP_PATH}/students?pn=${page_Num}">${page_Num}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li class="page-item">
                                <a class="page-link" href="${APP_PATH}/students?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li class="page-item">
                            <a class="page-link" href="${APP_PATH}/students?pn=${pageInfo.pages}">Last</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
