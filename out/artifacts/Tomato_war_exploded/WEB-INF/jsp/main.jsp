<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"
		   uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html" charset="utf-8">
	<title>番茄时间</title>
	<div class="input-group input-group-lg" placeholder=".input-small">
		<span class="input-group-addon">番茄数：</span>
		<input type="number" class="form-control" id="number" value="1">
		<span class="input-group-btn">
			<button class="btn btn-default" onclick="playorpause()" id="startbutton" type="button">开始</button>
		</span>
	</div>
	<h3 id="time">

	</h3>

	<div>
		<h3 id="countdown"></h3>
	</div>

	<div>
		<h3 id="info"></h3>
	</div>


	<audio id="start" src="../../assets/music/start.mp3" controls="controls" hidden="true" />
	<audio id="finish" src="../../assets/music/finish.mp3" controls="controls" hidden="true" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery Js -->
	<script src="../assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="../assets/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="../assets/js/jquery.metisMenu.js"></script>
	<script>
		var isPaused = true;
		var info = document.getElementById("info");
		var startbutton = document.getElementById("startbutton");
		var countdown = document.getElementById("countdown");
		var focustime = 25*60000;
		var resttime = 4*60000;
		var waittime = 1*60000;
		var periodtime = focustime+resttime+waittime;
		var index = 1;
		var start = document.getElementById("start");
		var finish = document.getElementById("finish");
		var start_time;
		var end_time;
		function countDown(times){
			
			var origin = times;
			var timer=null;
			//startbutton.innerText="不要停下来啊!";
			timer = setInterval(function(){
				var minute=0,
				  second=0;//时间默认值
				if(times > 0){
				  minute = Math.floor(times / 60);
				  second = Math.floor(times) - (minute * 60);
				}
				if (minute <= 9) minute = '0' + minute;
				if (second <= 9) second = '0' + second;
				//
				var info = "当前阶段剩余时间："+minute+"分钟"+second+"秒";
				//console.log(info);
				countdown.innerText=info;
				times--;
				if(times<=0){
							
					clearInterval(timer);
				}
			},1000);
		
		}
	
		function playorpause(){
			if(isPaused){
				play();
			}else{
				pause();
			}
		}
		function play(){
		    start_time = getTime();
			index = 1;
			isPaused = false;
			var times = parseInt(document.getElementById("number").value);
			startbutton.innerText="不要停下来啊！";
			for(var i=1;i<=times;i++){	
				var restmoment = focustime+periodtime*(i-1);
				setTimeout(function(){
					finish.play();
					info.innerText="第"+index+"个番茄钟专注阶段结束，好好地休息一下吧";
					countDown(resttime/1000-1);
				},restmoment);
				console.log(i+"休息延时："+restmoment/60000);
				var finishmoment = periodtime*i;
				setTimeout(function(){
					//console.log(times+typeof times);
					//console.log(index+typeof index);
					//console.log("康康"+times+","+index+","+times-index);
					//startbutton.innerText="剩余"+times-index+"个";
					if(index==times){
						isPaused = true;
						startbutton.innerText="开始";
						countdown.innerText="所有番茄钟已经完成!";
						info.innerText="恭喜您完成了所有番茄钟！";
						end_time = getTime();
                        <c:if test="${not empty sessionScope.user }">
                        $(document).ready(function() {
                            $.post("/user/finish_tomato",
                                {
                                    startTime: start_time,
                                    endTime: end_time,
                                    periodTime: times * 30,
                                    number: times
                                },
                                function (data,status) {
                                    console.log("插入番茄结果: " +status+" "+ data);
                                    var record = window.parent.document.getElementById("recordView").contentWindow;
									var statistic = window.parent.document.getElementById("statisticView").contentWindow;
                                    // console.log("父文档: " +window.parent.document);
                                    // console.log("父: " +window.parent);
                                    record.location.reload(true);
									statistic.location.reload(true);
                                });
                        });
						</c:if>
					}else{
				
						countdown.innerText="恭喜您刚刚完成了一个番茄钟!";
						index+=1;
						info.innerText="准备进行第"+index+"个番茄钟";
						console.log("准备第"+index+"个番茄钟");	
						countDown(waittime/1000-1);
					}
									
				},finishmoment);
				console.log(i+"结束延时："+finishmoment/60000+"分钟");
				var beginmoment = periodtime*(i-1);
				setTimeout(function(){
					start.play();
					info.innerText="正在进行第"+index+"个番茄钟，请保持专注！！";
					countDown(focustime/1000-1);
				},beginmoment);
				console.log(i+"开始延时："+beginmoment/60000+"分钟");
				
			}		
			
		}
		function pause(){
			//console.log("你想暂停和我不给你暂停有什么关系");
		}

		function getTime(){
            var date=new Date();
            var year=date.getFullYear(); //获取当前年份
            var mon=date.getMonth()+1; //获取当前月份
            var da=date.getDate(); //获取当前日
            var h=date.getHours(); //获取小时
            if(h<10){
                h = '0'+h;
            }
            var m=date.getMinutes(); //获取分钟
            if(m<10){
                m = '0'+m;
            }
            var s=date.getSeconds(); //获取秒
            if(s<10){
                s = '0'+s;
            }
            return year+"-"+mon+"-"+da+" "+h+":"+m+":"+s;
        }
		
		window.onload=function(){  
			setInterval(function(){   
				var date=new Date();   
				var year=date.getFullYear(); //获取当前年份   
				var mon=date.getMonth()+1; //获取当前月份   
				var da=date.getDate(); //获取当前日   
				var day=date.getDay(); //获取当前星期几   
				var h=date.getHours(); //获取小时  
				if(h<10){
					h = '0'+h;
				}
				var m=date.getMinutes(); //获取分钟   
				if(m<10){
					m = '0'+m;
				}
				var s=date.getSeconds(); //获取秒  
				if(s<10){
					s = '0'+s;
				}
				switch(day){
					case 1:day="一";break;
                    case 2:day="二";break;
                    case 3:day="三";break;
                    case 4:day="四";break;
                    case 5:day="五";break;
                    case 6:day="六";break;
                    case 0:day="天";break;
				}
				var d=document.getElementById('time');    
				d.innerHTML='当前时间:'+year+'年'+mon+'月'+da+'日'+'星期'+day+' '+h+':'+m+':'+s; 
			},1000);
		};
	</script>

</html>
