<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>学生信息查询</title>
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- Morris Chart Styles-->
   
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <%@ taglib prefix="c"
               uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.jsp"><strong><i class="icon fa fa-plane"></i> BRILLIANT</strong></a>
				<div id="sideNav" href="">

		</div>
            </div>

        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">


                    <li>
                        <a class="active-menu"><i class="fa fa-table"></i>学生信息表</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >

		
            <div id="page-inner"> 
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             黑色高级表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_length" id="dataTables-example_length">
                                            <label>
                                                <select  aria-controls="dataTables-example" class="form-control input-sm" name="pageSize" onchange="window.location='students?page=${currentPage}&pageSize='+this.value">
                                                    <option value="10" <c:out value="${pageSize==10?'selected=selected':''}"/>>10</option>
                                                    <option value="25" <c:out value="${pageSize==25?'selected=selected':''}"/>>25</option>
                                                    <option value="50" <c:out value="${pageSize==50?'selected=selected':''}"/>>50</option>
                                                    <option value="100" <c:out value="${pageSize==100?'selected=selected':''}"/>>100</option>
                                                </select>条记录每页
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <label>
                                                <form action="students" method="get">
                                                    搜索:<input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="searchText" <c:out value="value=${searchText}"/> />

                                                </form>

                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>学号</th>
                                            <th>姓名</th>
                                            <th>班级</th>
                                            <th>性别</th>
                                            <th>年级</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="student" items="${students}">
                                        <tr class="odd gradeX">
                                            <td><c:out value="${student.studentNo}"></c:out></td>
                                            <td><c:out value="${student.studentName}"></c:out></td>
                                            <td><c:out value="${student.studentClass}"></c:out></td>
                                            <td class="center"><c:out value="${student.sex}"></c:out></td>
                                            <td class="center"><c:out value="${student.grade}"></c:out></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                            <c:out value="显示第 ${(currentPage-1)*pageSize+1}条至${(currentPage)*pageSize>number?number:(currentPage)*pageSize}条，共${number}条"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                            <ul class="pagination">
                                                <li class="paginate_button previous active" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                                    <c:set var="preParam" scope="session" value="students?page=${currentPage>=2?currentPage-1:1}&pageSize=${pageSize}"/>
                                                    <c:if test="${searchText!='输入搜索词'}">
                                                        <c:set var="preParam" value="${preParam}&searchText=${searchText}"/>
                                                    </c:if>
                                                    <a href="<c:out value="${preParam}"/>">
                                                        上一页
                                                    </a>
                                                </li>
                                                <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
                                                    <a href="<c:out value="students?page=${currentPage}&pageSize=${pageSize}"/>">
                                                        <c:out value="${currentPage}"/>
                                                    </a>
                                                </li>
                                                <li class="paginate_button next active" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                                    <%--<form name="nextAction" action="<c:out value="students?page=${currentPage+1>numnber?number:currentPage+1}&pageSize=${pageSize}"/>" method="post">--%>
                                                        <%--<a href="javascript:document.nextAction.submit();">--%>
                                                            <%--下一页--%>
                                                        <%--</a>--%>
                                                    <%--</form>--%>
                                                    <c:set var="nextParam" scope="session" value="students?page=${currentPage+1>numnber?number:currentPage+1}&pageSize=${pageSize}"/>
                                                    <c:if test="${searchText!='输入搜索词'}">
                                                        <c:set var="nextParam" value="${nextParam}&searchText=${searchText}"/>
                                                    </c:if>
                                                    <a href="<c:out value="${nextParam}"/>">
                                                        下一页
                                                    </a>

                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            </div>
               <footer><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p></footer>
        </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable({
                    "paging":false,
                    "info":false,
                    "searching":false,
                    "lengthChange":false
                });

            });
    </script>
         <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    
   
</body>
</html>
