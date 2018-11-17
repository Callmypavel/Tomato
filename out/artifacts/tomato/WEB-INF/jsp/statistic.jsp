<%--
  Created by IntelliJ IDEA.
  User: ouyan
  Date: 2018/10/27
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<body>
    <title>统计</title>
    <div class="row">
        <div class="col-sm-3">
            <h2>今天完成番茄：${dayRecordNumber}个</h2>
            <h3>
                耗时：<fmt:parseNumber integerOnly="true" value="${dayRecordNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${dayRecordNumber%2*60}"/>分钟<br>
                专注时间：<fmt:parseNumber integerOnly="true" value="${dayRecordNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${dayRecordNumber*5/12}"/>分钟<br>
            </h3>
        </div>
        <div class="col-sm-3">
            <h2>最近7天完成番茄：${sevenDaysRecordNumber}个</h2>
            <h3>
                耗时：<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordNumber/2}"/>分钟<br>
                专注时间：<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordNumber%(5/12)*60}"/>分钟<br>
                日均完成番茄：<fmt:formatNumber type="number" maxFractionDigits="2" value="${sevenDaysRecordAverageNumber}"/>个<br>
                日均耗时：<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordAverageNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordAverageNumber%2*60}"/>分钟<br>
                日均专注时间：<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordAverageNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${sevenDaysRecordAverageNumber%(5/12)*60}"/>分钟<br>
            </h3>
        </div>
        <div class="col-sm-3">
            <h2>最近30天完成番茄：${thirtyDaysRecordNumber}个</h2>
            <h3>
                总耗时：<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordNumber/2}"/>分钟<br>
                专注时间：<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordNumber%(5/12)*60}"/>分钟<br>
                日均完成番茄：<fmt:formatNumber type="number" maxFractionDigits="2" value="${thirtyDaysRecordAverageNumber}"/>个<br>
                日均耗时：<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordAverageNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordAverageNumber%2*60}"/>分钟<br>
                日均专注时间：<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordAverageNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${thirtyDaysRecordAverageNumber%(5/12)*60}"/>分钟<br>
            </h3>
        </div>
        <div class="col-sm-3">
            <h2>总共完成番茄：${totalNumber}个</h2>
            <h3>
                使用番茄钟：${totalDays}天<br>
                耗时：<fmt:parseNumber integerOnly="true" value="${totalNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${totalNumber/2}"/>分钟<br>
                专注时间：<fmt:parseNumber integerOnly="true" value="${totalNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${totalNumber%(5/12)*60}"/>分钟<br>
                日均完成番茄：<fmt:formatNumber type="number" maxFractionDigits="2" value="${averageNumber}"/>个<br>
                日均耗时：<fmt:parseNumber integerOnly="true" value="${averageNumber/2}"/>小时<fmt:parseNumber integerOnly="true" value="${averageNumber%2*60}"/>分钟<br>
                日均专注时间：<fmt:parseNumber integerOnly="true" value="${averageNumber*5/12}"/>小时<fmt:parseNumber integerOnly="true" value="${averageNumber%(5/12)*60}"/>分钟<br>
            </h3>
        </div>
    </div>
</body>
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


</html>
