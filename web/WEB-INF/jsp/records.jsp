<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ouyan
  Date: 2018/10/20
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>


<html>
    <title>番茄记录</title>
    <div class="dataTables_length" id="dataTables-example_length">
        <label>
            <select  aria-controls="dataTables-example" class="form-control input-sm" name="pageSize" onchange="window.location='records?page=1&pageSize='+this.value">
                <option value="10" <c:out value="${pageSize==10?'selected=selected':''}"/>>10</option>
                <option value="25" <c:out value="${pageSize==25?'selected=selected':''}"/>>25</option>
                <option value="50" <c:out value="${pageSize==50?'selected=selected':''}"/>>50</option>
                <option value="100" <c:out value="${pageSize==100?'selected=selected':''}"/>>100</option>
            </select>
        </label>
    </div>

    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead>
            <tr>
                <%--<th>序号</th>--%>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>耗时</th>
                <th>完成番茄个数</th>
            </tr>
        </thead>
        <tbody>

            <c:set var="length" value="${fn:length(records)}"/>
            <c:forEach var="i" begin="1" end="${length}">
                <tr class="odd gradeX">
                    <%--<td><c:out value="${i}"/></td>--%>
                    <td><c:out value="${records[i-1].startTime}"/></td>
                    <td><c:out value="${records[i-1].endTime}"/></td>
                    <td><c:out value="${records[i-1].periodTime}分钟"/></td>
                    <td class="center"><c:out value="${records[i-1].number}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                    <c:if test="${number!=0}">
                        <c:out value="显示第${(currentPage-1)*pageSize+1}"/>
                    </c:if>
                    <c:if test="${number==0}">
                        <c:out value="显示第0"/>
                    </c:if>
                    <c:out value="条至第${(currentPage)*pageSize>number?number:(currentPage)*pageSize}条，共${number}条"/>
                </div>
            </div>
            <div class="col-sm-6">
                <div>
                    <ul class="pagination navbar-right">
                        <li class="paginate_button previous active" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                            <c:set var="preParam" scope="session" value="records?page=${currentPage>=2?currentPage-1:1}&pageSize=${pageSize}"/>
                            <a href="<c:out value="${preParam}"/>">
                                上一页
                            </a>
                        </li>
                        <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
                            <a href="<c:out value="records?page=${currentPage}&pageSize=${pageSize}"/>">
                                <c:out value="${currentPage}"/>
                            </a>
                        </li>
                        <li class="paginate_button next active" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                            <%--<form name="nextAction" action="<c:out value="students?page=${currentPage+1>numnber?number:currentPage+1}&pageSize=${pageSize}"/>" method="post">--%>
                            <%--<a href="javascript:document.nextAction.submit();">--%>
                            <%--下一页--%>
                            <%--</a>--%>
                            <%--</form>--%>
                            <c:set var="nextParam" scope="session" value="records?page=${currentPage+1>number?number:currentPage+1}&pageSize=${pageSize}"/>
                            <a href="<c:out value="${nextParam}"/>">
                                下一页
                            </a>

                        </li>
                    </ul>
                </div>
            </div>
    </div>




    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


    <!-- jQuery Js -->
    <script src="../assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="../assets/js/jquery.metisMenu.js"></script>
    <!-- DATA TABLE SCRIPTS -->
    <script src="../assets/js/dataTables/jquery.dataTables.js"></script>


    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable({
                "paging":false,
                "info":false,
                "searching":false,
                "lengthChange":false,
                "ordering":false,
                "language":{
                    "emptyTable":'<c:out value="${userName}"/>，你还没有进行过一次完整的番茄钟哦'
                }
            });

        });
    </script>

</html>
