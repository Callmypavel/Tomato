<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>番茄时间</title>
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
<header class="main-header">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="navbar-brand">
                    <strong>番茄时间</strong>
                </div>
            </div>
        </div>
    </div>
</header>
<nav class="main-navigation" >
    <%--<div class="navbar-header">--%>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 top-navbar">

                <div class="navbar-header">
				    <ul class="nav navbar-nav navbar-right menu" >
						<c:if test="${empty sessionScope.user }">
						<button class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger" data-toggle="collapse" data-target="#main-menu" style="color:#F36A5A" >

						</button>
						</c:if>
						<c:if test="${not empty sessionScope.user }">
						<button class="navbar-toggle collapsed glyphicon glyphicon-user" data-toggle="collapse" data-target="#main-menu" style="color:#F36A5A">

						</button>
		
						</c:if>
					</ul>
                </div>


            
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="nav navbar-nav navbar-right menu" >
					
					    <c:if test="${empty sessionScope.user }">
                        <li><a href="/user/register"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                        <li><a href="/user/login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
					    </c:if>
						<c:if test="${not empty sessionScope.user }">
                        <li>
                            <a href="/user/logout"><i class="fa fa-sign-out fa-fw"></i>登出</a>
                        </li>
						</c:if>
						<li>
							<a>
								<input type="checkbox" id="isShowData" onclick="onClickCheck()">显示统计数据和记录
							</a>
						</li>
                    </ul>
                </div>
          
            





            </div>
        </div>
    </div>


</nav>

<section id="content-wrap" >

    <div class="container">

        <div class="row">
            <main class="col-md-8 main-content">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        番茄钟
                    </div>
                    <div class="panel-body">
                        <iframe class="view" id="mainView" src="/main" width="100%"  scrolling="no" frameborder="0" height='112'>

                        </iframe>

                    </div>
                </div>
               
                    <%--<div class="row">--%>
                        <%--<main class="col-md-8">--%>

				<div class="panel panel-default" id="record_model" style="visibility: hidden;">
					<div class="panel-heading">
						番茄记录
					</div>
					<div class="panel-body">
					 <c:if test="${not empty sessionScope.user }">
						<iframe class="view" id="recordView" src="/user/records" width="100%"  scrolling="no" frameborder="0" >

						</iframe>
					 </c:if>
					 <c:if test="${empty sessionScope.user }">
					  注册登录后显示记录
					 </c:if>
					</div>
				</div>

                        <%--</main>--%>
                    <%--</div>--%>

             
            </main>
            <aside class="col-md-4 sidebar">
                <c:if test="${not empty sessionScope.user }">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户中心
                        </div>
                        <div class="panel-body">
                            <h2 class="info-text">欢迎您，<c:out value="${sessionScope.user.userName}"/></h2>
                        </div>
                    </div>
                </c:if>
                <div class="panel panel-default"   id="statistic_model" style="visibility: hidden;">
                    <c:if test="${empty sessionScope.user }">
                        <div class="panel-heading">
                            统计数据
                        </div>
                        <div class="panel-body">
                            注册登录后使用番茄钟，在这里就会显示统计数据哦！
                        </div>

                    </c:if>
                    <c:if test="${not empty sessionScope.user }">
                        <div class="panel-heading" >
                            统计数据
                        </div>
                        <div class="panel-body">
                            <iframe class="view" id="statisticView" src="/user/statistic" width="100%"  scrolling="no" frameborder="0" >

                            </iframe>
                        </div>

                    </c:if>

                </div>


            </aside>
        </div>

    </div>

</section>
<%--<div id="wrapper">--%>
   <%----%>
 <%----%>
<%--</div>--%>
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
    var iframe = document.getElementById("mainView");
    function toRecords() {
        window.open("/user/records");
        //iframe.src = "/user/records";
    }
    // function toRegister() {
    //     iframe.src = "/user/register";
    // }
    // function toLogin() {
    //     iframe.src = "/user/login";
    // }
	function showModel(){
		document.getElementById('statistic_model').style.visibility="visible";
		document.getElementById('record_model').style.visibility="visible";
	}
	function hideModel(){
		document.getElementById('statistic_model').style.visibility="hidden";
		document.getElementById('record_model').style.visibility="hidden";
	}
	function onClickCheck(){		
		var isShowData=document.getElementById("isShowData");
		if (isShowData.checked) {
			showModel();
		}else{
			hideModel();
		}
	}
    function toMain() {
        iframe.src = "/main";
    }
    // $(function(){
    //     $("mainView").attr("width",(document.body.offsetWidth - 100) + "px");
    //     $("mainView").attr("height", getHeight() + "px");
    // });

    function reinitIframe() {
        var iframes = document.getElementsByClassName("view");
        //console.log("康康iframes"+iframes);
        try {
            for(var i=0;i<iframes.length; i++){
                var bHeight = iframes[i].contentWindow.document.body.scrollHeight;
                var dHeight = iframes[i].contentWindow.document.documentElement.scrollHeight;
                //console.log("康康iframe"+iframes[i]+iframes[i].name);
                iframes[i].height =  Math.max(bHeight, dHeight);
            }

        } catch (ex) {
            console.log(ex);
        }
    }
    window.setInterval("reinitIframe()", 200);//定时去检查iframe的高度,这样保证时时都是自动高了

    function getHeight() {
        var height = document.body.clientHeight - 100;
        if (height < 550)
            height = 600;

        return height;
    }
</script>



</body>
</html>
