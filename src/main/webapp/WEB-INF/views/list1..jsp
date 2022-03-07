<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: 他人使用
  Date: 2022/2/12
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <title>员工列表</title>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-lg-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-xs-4 col-xs-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>序号</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="employee" varStatus="status">
                    <tr>
                        <td>1</td>
                        <td>${status.index+1}</td>
                        <td>${employee.getEmpName()}</td>
                        <td>${employee.getGender()=="M"?"男":"女"}</td>
                        <td>${employee.getEmail()}</td>
                        <td>${employee.getDepartment().getDeptName()}</td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-xs-6">
            当前${pageInfo.pageNum}页，总共${pageInfo.pages}页，总计录${pageInfo.total}
        </div>
        <%--分页条信息--%>
        <div class="col-xs-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="emps?pn=${pageInfo.pageNum-1}" aria-label="Previous" >
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <li <c:if test="${page_Num == pageInfo.pageNum}">class="active" </c:if>>
                        <a href="emps?pn=${page_Num}">${page_Num}<span class="sr-only">(current)</span></a>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </c:if>

                    <li><a href="emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
