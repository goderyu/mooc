<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>慕课网登录界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<link href="css/verify.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="main-login">
		<div class="main-login-window">
			<div class="login-text">
				<span style="padding-top:20px">使用已有账号登录</span>
			</div>
			<div style="border-bottom:1px solid gray;"></div>
			<div class="main-login-mes">
				<span><img src="img/username.png"><input type="text"
					class="telephone" name="telephone" placeholder="请输入手机号码"
					style="display:inline-block;" /> </span> <span><img
					src="img/psw.png"><input type="password" name="password"
					required="required" class="password" placeholder="请输入密码" /> </span>
				<div id="mpanel1" style="margin-left:151px;margin-top:20px;"></div>
				<span id="loginmsg" style="color:red;">&nbsp</span> <input
					type="button" class="loginbtn"
					style="border:0;text-align:center; padding-left:0;background-color:#55b929;margin-left:152px;"
					value="登录" required="required" />
			</div>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/verify.js"></script>
	<script type="text/javascript"><!--
		var yzmTest = false;
		$('#mpanel1').slideVerify({
			type : 1, //类型
			vOffset : 5, //误差量，根据需求自行调整
			barSize : {
				width : '340px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
				if($("#loginmsg:contains('验证码')")){ 
					$("#loginmsg").html("&nbsp");
				}
				yzmTest = true;
			},
			error : function() {
				yzmTest = false;
			}

		});
		var pswTest = false;
		var telTest = false;
		$(".telephone").blur(function() {
			var reg = /^1[3|4|5|7|8][0-9]\d{8}$/;
			var tel = $(".telephone").val();
			if (reg.test(tel)) {
				$("#loginmsg").html("&nbsp");
				telTest = true;
			} else {
				$("#loginmsg").html("&nbsp请输入正确手机号码");
				telTest = false;
			}
		});

		$(".password").blur(function() {
			var psw = $(".password").val();
			if (psw == "" || psw == null) {
				$("#loginmsg").html("&nbsp密码不能为空");
				pswTest = false;
			} else {
				$("#loginmsg").html("&nbsp");
				pswTest = true;
			}
		});
		$(".loginbtn").click(function() {
			$(".telephone").blur();
			if (telTest) {
				$(".password").blur();
			}
			if(pswTest&&telTest){
			if(yzmTest){
				$("#loginmsg").html("&nbsp");
			}else{
				$("#loginmsg").html("&nbsp验证码不正确");
			}
			}
			if (pswTest && telTest && yzmTest) {
				$.post("/mooc/UserServlet?method=login", {
					"telephone" : $(".telephone").val(),
					"password" : $(".password").val()
				}, function(data) {
					if (data=='true') {
						window.location.href="/mooc/CourseServlet?method=getCourseBaseInfo";
					} else {
						$("#loginmsg").html("&nbsp密码错误");
					}
				},"text");
			}
		});
	</script>
</body>
</html>
