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
    <title>登录</title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="../../assets/css/bootstrap.css">
    <link rel="stylesheet" href="../../assets/css/font-awesome.css">
    <link rel="stylesheet" href="../../assets/css/form-elements.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <script src="../../assets/js/md5.js" type="text/javascript"></script>
    <script src="../../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body>


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
                                <input type="text" placeholder="账号名:你在异世界的名字" class="form-control" id="account_name">
                            </div>
                            <div class="form-group">
                                <label class="sr-only">密码</label>
                                <input type="password" placeholder="密码:你灵魂深处的那个呼喊" class="form-control" id="password">
                            </div>
                            <button id="login_button" class="btn">呼唤我之名</button>
                            <div id="login_info">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
            // function encryPassword() {
            //     password.value = hex_md5(password.value);
            // }
            function checkNull(text){
                var input  = /^[\s]*$/;
                return input.test(text);
            }
            function checkAccountName(){
                var name=document.getElementById("account_name");
                if(checkNull(name)){
                    tip("用户名不能为空");
                    return false;
                }else{
                    return true;
                }
            }
            function checkPassword(){
                var password=document.getElementById("password");
                if(checkNull(password)){
                    tip("密码不能为空");
                    return false;
                }else{
                    return true;
                }
            }
            function check(){
                if(checkAccountName()){
                    if (checkPassword()){
                        return true;
                    }
                }
                return false;
            }
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
                $("#login_button").click(function(){
                    if(check()){
                        $("#login_button").attr("disabled","true");
                        setTimeout(function(){
                            $("#login_button").removeAttr("disabled");
                        },3000);
                        $.post("/user/checkLogin",
                            {
                                accountName:$("#account_name").val(),
                                password:hex_md5($("#password").val())
                            },
                            function(data,status){
                                if(data=="success"){
                                    $("#login_info").html("次元穿梭成功，即将于<span id='countdown'>1</span>秒后跳转");
                                    countDown(1);
                                    setTimeout(function(){
                                        window.location.href = "/";
                                    },1000);

                                }else if(data=="failed"){
                                    $("#login_info").html("呼喊与名字不匹配，灵魂同调失败");
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
