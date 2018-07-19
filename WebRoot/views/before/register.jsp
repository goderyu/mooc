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

<title>慕课网注册界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/register.css" rel="stylesheet" type="text/css">
<link href="css/verify.css" rel="stylesheet" type="text/css">
<style type="text/css">
#formr ul input {
	margin-bottom: 20px;
	padding-left: 10px;
}
</style>
</head>

<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="registerCont">
			<h1 style="color:#55b929;">注册</h1>
			<form id="formr" >
				<ul>
					<li><span class="dis">账号:</span> <input type="text"
						name="username" id="username" class="input username"
						maxlength="24" placeholder="请输入用户名,3-12个字符"><span
						class="usernameAlt" style="color:red"></span></li>

					<li><span class="dis">密码:</span> <input type="password"
						name="password" id="password" class="input password"
						maxlength="16" class="a" placeholder="6-16位密码，区分大小写"> <span
						class="passwordAlt" style="color:red"></span>
					</li>

					<li><span class="dis">确认密码:</span> <input type="password"
						name="repeatPassword" id="rePassword" class="input repassword"
						class="a" maxlength="16" tabindex="1" placeholder="请再次输入密码">
						<span class="repasswordAlt" style="color:red"></span>
					</li>
					<li class="telNumber"><span class="dis">手机号码:</span> <input
						type="text" class="input telephone" id="phone" name="telephone"
						maxlength="11" class="a" placeholder="请输入11位手机号"> <span
						class="telephoneAlt" style="color:red"></span>
					</li>
					<li style="margin-left:160px;"><div id="mpanel4"
							style="margin-top:50px;"></div>
					</li>
					<li class="agree"><input name="protocol" id="protocol"
						type="checkbox" value="" style="margin-left:62px;"
						checked="checked"> 我同意《<a href="#" target="_black">慕课网注册协议</a>》<span
						id="protocolAlt"></span></li>
					<li class="btnr"><input
						style="padding-left:0;margin-left:160px;" type="button" onclick="sub()" value="注册">
					</li>
				</ul>
			</form>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="js/jquery-form.js"></script>
	<script type="text/javascript" src="js/verify.js"></script>
	<script type="text/javascript">
		var nameTest = false;
		var pswTest = false;
		var rePswTest = false;
		var telTest = false;
		var yzmTest = false;

		/* 验证用户名格式是否正确，是否已存在  */
		$(".username").blur(function() {
			var a = /^(?!(\d+)$)[\u4e00-\u9fffa-zA-Z\d\-_]{3,12}$/;
			if (!a.test($(".username").val())) {
				nameTest = false;
				$(".usernameAlt").html("格式错误，3-12个字符(不能含有特殊字符)");
			} else {
			       nameTest=true;
			        return true;
				/*$.post("/mooc/before/register/checkusername", {
					"userName" : $(".userName").val()
				}, function(data) {
					if (!data) {
						nameTest = false;
						$(".userNameAlt").html("对不起，用户名已存在");
					} else {
						nameTest = true;
						$(".userNameAlt").html("");
					}
				});*/
			}
		});

		/*  验证密码格式 */
		$(".password").blur(function() {
		//正则表达式：用来给form表单添加一些输入的规则
			var reg = /^([0-9A-Za-z])[0-9A-Za-z]{5,16}$/;
			$(".repassword").blur();
			//判断输入的内容与正则表达式规定的是否一致
			if (!reg.test($(".password").val())) {
				pswTest = false;
				$(".passwordAlt").html("6-16位密码，区分大小写");
			} else {
				pswTest = true;
				$(".passwordAlt").html("");
			}
		});

		/* 重复密码验证 */

		$(".repassword").blur(function() {

			var psw = $(".password").val();
			var psw1 = $(".repassword").val();
			if (psw != psw1) {
				rePswTest = false;
				$(".repasswordAlt").html("两次密码不相同");
			} else if (psw1 == "") {
				rePswTest = false;
				$(".repasswordAlt").html("密码不能为空");
			} else {
				rePswTest = true;
				$(".repasswordAlt").html("");
			}
		});

		//验证手机号格式是否正确，是否已存在
		$(".telephone").blur(function() {
			var a = /^1[3|4|5|7|8][0-9]\d{8}$/;
			if (a.test($(".telephone").val())) {
			   telTest=true;
			   return true;
				/*$.post("/mooc/before/register/checktel", {
					"telephone" : $(".telephone").val()
				}, function(data) {
					if (!data) {
						telTest = false;
						$(".telephoneAlt").html("对不起，该手机号码已经被使用");
					} else {
						telTest = true;
						$(".telephoneAlt").html("");
					}
				});*/
			} else {
				telTest = false;
				$(".telephoneAlt").html("请输入正确的手机格式");
			}
		});
		var code;

		/* 如果表单的各项正确则可提交，错误不提交 */

		var pictureNum = 50;
		var pictureName = new Array(pictureNum);
		for ( var i = 0; i < pictureNum; i++) {
			pictureName[i] = (i + 1) + ".jpg";
		}

		$('#mpanel4').slideVerify({
			type : 2, //类型
			vOffset : 5, //误差量，根据需求自行调整
			vSpace : 5, //间隔
			imgName : pictureName,
			imgSize : {
				width : '340px',
				height : '170px',
			},
			blockSize : {
				width : '40px',
				height : '40px',
			},
			barSize : {
				width : '340px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
				yzmTest = true;
			},
			error : function() {
				yzmTest = false;
			}

		});

			function sub() {
				$(".username").blur();
				$(".password").blur();
				$(".repassword").blur();
				$(".telephone").blur();
				if (nameTest && pswTest && rePswTest && telTest && yzmTest){
					$.ajax({
					    url:"/mooc/UserServlet?method=register",
					    type:"post",
					    data:$("#formr").serialize(),//serialize():提交表单
					    dataType:"text",
					    success:function(data){
					    //通过服务器返回的数据判断
					    //若返回的有执行成功的数据，则跳转到登录页面
					 if(data=='true'){
					 	window.location.href="/mooc/views/before/login.jsp" 
					 }
					  //  若返回的没有执行成功的数据，在当前页面	
					    }
					})
				 }
			}
	</script>
</body>
</html>
