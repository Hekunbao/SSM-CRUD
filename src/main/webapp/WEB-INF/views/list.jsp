<%--
  Created by IntelliJ IDEA.
  User: shawn
  Date: 2022/5/26
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setAttribute("APP_PATH", request.getContextPath());

%>
<html>
<head>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <title>CRUD QUREY</title>
</head>
<body>


    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h1>SSM-CRUD</h1>
            </div>
            <div class="col-md-4 col-md-offset-8" >
                <button class="btn btn-primary">
                    addNew
                </button>
                <button class="btn btn-danger">
                    delete
                </button>
            </div>
        </div>
        <div class="row">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <td>#</td>
                        <td>empName</td>
                        <td>email</td>
                        <td>gender</td>
                        <td>depName</td>
                        <td>action</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.email}</td>
                            <td>
                                <c:if test="${emp.gender=='F'}">
                                    female
                                </c:if>
                                <c:if test="${emp.gender=='M'}">
                                    male
                                </c:if>
                            </td>
                            <td>${emp.dept.depName}</td>
                            <td>
                                <button class="btn btn-info">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>edit
                                </button>
                                <button class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>delete
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="row">
            <div class="col-md-6">
                current page : ${pageInfo.pageNum}, total pages : ${pageInfo.pages}, total records : ${pageInfo.total}
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageInfo.pageNum != 1}">
                            <li><a href="${APP_PATH}/emps?page=1">first page</a></li>
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <li <c:if test="${page_Num == pageInfo.pageNum}">class="active"</c:if>>
                                <a href="${APP_PATH}/emps?page=${page_Num}">${page_Num}</a>
                            </li>
                        </c:forEach>


                        <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                            <li><a href="${APP_PATH}/emps?page=${pageInfo.pages}">last page</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
            </div>
        </div>

    </div>
</body>
</html>

