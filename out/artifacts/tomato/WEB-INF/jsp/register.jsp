<%--
  Created by IntelliJ IDEA.
  User: ouyan
  Date: 2018/10/20
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="../../assets/css/bootstrap.css">
    <link rel="stylesheet" href="../../assets/css/font-awesome.css">
    <link rel="stylesheet" href="../../assets/css/form-elements.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <script src="../../assets/js/md5.js" type="text/javascript"></script>
    <script src="../../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body >
    <%--<table>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--账号名：--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<input id="account_name" name="accountName" type="text">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--密码：--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<input id="password" name="password" type="password">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--请再次输入密码：--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<input id="password_again" name="password" type="password">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--用户名：--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<input id="user_name" name="userName" type="text">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<button id="register_button" >注册</button>--%>
            <%--</td>--%>
        <%--</tr>--%>

    <%--</table>--%>
    <%--<div id="register_info">--%>

    <%--</div>--%>

    <!-- Top menu -->
    <nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
        <div class="container">

        </div>
    </nav>

    <!-- Top content -->
    <div class="top-content">
        <div class="inner-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 text">
                        <h1><strong>番茄钟</strong>简</h1>
                        <div class="description">
                            <p>
                                这是一个简单<strong>好用</strong>的番茄钟
                            </p>
                        </div>

                    </div>
                    <div class="col-sm-5 form-box">
                        <div class="form-bottom">
                            <div class="form-group">
                                <label class="sr-only">账号名</label>
                                <input type="text" placeholder="账户名:用于登录的名字" class="form-control" id="account_name">
                            </div>
                            <div class="form-group">
                                <label class="sr-only">密码</label>
                                <input type="password" placeholder="密码:特殊字符除外6-20位密码" class="form-control" id="password">
                            </div>
                            <div class="form-group">
                                <label class="sr-only">密码</label>
                                <input type="password" placeholder="再次输入密码" class="form-control" id="password_again">
                            </div>
                            <div class="form-group">
                                <label class="sr-only">用户名</label>
                                <input type="text" placeholder="昵称:我们该如何称呼您" class="form-control" id="user_name">
                            </div>
                            <button id="register_button" class="btn">注册</button>
                            <div id="register_info">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <%--<form action="/user/checkRegister" onSubmit="encryPassword()">--%>
       <%----%>
    <%--</form>--%>

    <%--${sessionScope.register_info}--%>
    <script>
        // function encryPassword() {
        //     password.value = hex_md5(password.value);
        // }
        function checkNull(text){
            var input  = /^[\s]*$/;
            return input.test(text);
        }
        function confirmAccountName(){
            var name=document.getElementById("account_name");
            if(checkNull(name)){
                tip("用户名不能为空");
                return false;
            }else if((name.value).length!=0){
                reg=/^[0-9a-zA-Z]+$/g;
                if(!reg.test(name.value)){
                    tip("账户名只能是英文和数字的组合");
                    return false;
                }
            }
            return true;
        }
        function confirmUserName(){
            var name=document.getElementById("user_name");
            if(checkNull(name)){
                tip("昵称不能为空");
                return false;
            }else if((name.value).length!=0){
                reg=/^[\u4e00-\u9fa5_a-zA-Z0-9-]{1,16}$/g;
                if(!reg.test(name.value)){
                    tip("对不起，输入的用户名限16个字符，支持中英文、数字、减号或下划线");
                    return false;
                }
            }

            return true;
        }

        function confirmPassword(){
            var password=document.getElementById("password");
            if(checkNull(password.value)){
                tip("密码不能为空");
                return false;
            }else if((password.value).length!=0){
                reg=/^(\w){6,20}$/;
                if(!reg.test(password.value)){
                    tip("对不起，您输入的密码格式不正确!");
                    return false;
                }
            }
            return true;
        }
        function confirmPasswordAgain(){
            var againpassword=document.getElementById("password_again");
            var password=document.getElementById("password");
            if(checkNull(password.value)){
                tip("密码不能为空");
                return false;
            }else if(checkNull(againpassword.value)){
                tip("请再次输入密码");
                return false;
            }else{
                if(password.value.length!=againpassword.value.length){
                    tip("密码输入不匹配,请重新输入");
                    return false;
                }
                if(password.value.indexOf(againpassword.value)==-1){
                    tip("密码输入不匹配,请重新输入");
                    return false;
                }
            }

            return true;
        }

        function tip(text){
            $("#register_info").html(text);
        }
        function check(){
            if(confirmAccountName()){
                if( confirmUserName()){
                    if( confirmPassword()){
                        if( confirmPasswordAgain()){
                            return true;
                        }
                    }
                }
            }
            return false;
        };
        function countDown(times){
            var countdown = document.getElementById("countdown");
            var timer = setInterval(function(){
                var second = Math.floor(times);
                countdown.innerText=second;
                times--;
                if(times<=0){
                    clearInterval(timer);
                }
            },1000);

        }

        $(document).ready(function(){
            $("#register_button").click(function(){
                if(check()){
                    $("#register_button").attr("disabled","true");
                    setTimeout(function(){
                        $("#register_button").removeAttr("disabled");
                    },3000);
                    $.post("/user/checkRegister",
                        {
                            userName:$("#user_name").val(),
                            accountName:$("#account_name").val(),
                            password:hex_md5($("#password").val())
                        },
                        function(data,status){
                            if(data=="success"){
                                $("#register_info").html("成功注册！<span id='countdown'>3</span>秒后跳转");
                                countDown(2);
                                setTimeout(function(){
                                    $.post("/user/checkLogin",
                                        {
                                            accountName:$("#account_name").val(),
                                            password:hex_md5($("#password").val())
                                        },
                                        function(data,status){
                                            if(data=="success"){
                                                window.location.href = "/";
                                            }else{
                                                console.log("data:"+data+",status:"+status);
                                            }
                                        });
                                },3000);

                            }else if(data=="failed"){
                                $("#register_info").html("注册失败");
                            }else if(data=="conquered"){
                                $("#register_info").html("该用户名已被注册");
                            }else{
                                console.log("data:"+data+",status:"+status);
                            }
                        });
                }

            });
        });
    </script>
</body>
</html>
