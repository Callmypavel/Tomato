
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String url = "/user/login";   //设置跳转的地址
%>
<html>
<head>
    <meta http-equiv=refresh content=10;url=<%=url %>>
</head>
<body>
<div align="center">
    <h2 style=color:red>注册成功</h2>
    <h2 style=color:red><span id=jump>10</span> 秒钟后页面将自动返回登录页面...</h2>
    <h2><a href="javascript:void(0);" onclick="jumpToIndex()">点击此处立即跳转</a></h2>
</div>
</body>
<script>
    function countDown(secs){
        jump.innerText=secs;
        if(--secs>0)
            setTimeout("countDown("+secs+" )",1000);
    }
    countDown(10);
    function jumpToIndex(){
        window.location.href='<%=url %>';
    }
</script>
</html>   