<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "views/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<title>居民健康管理平台</title>
		<style>
			* {
				margin: 0;
				padding: 0;
				font-family: "Microsoft YaHei";
				color: #333;
				box-sizing: border-box;
			}
			
			
			.header .logo_2 p {
				color: #8bc86a;
				font-size: 18px;
				line-height: 30px;
				margin-top: 15px;
				border-left: 2px solid #8bc86a;
				padding-left: 30px;
			}
			
			body {
				background-color: #ebfde9;
			}
			.hint {
				font-size: 13px;
				padding-top: 20px;
				padding-left: 90px;
			}
			
			.p_btn {
				padding-top: 10px;
			}
			
			.nav {
				text-align: center;
			}
			.content{
				padding-top: 50px;
				overflow: hidden;
			}
			.jumpdiv{
				line-height:40px;
				text-align:center;
			}
		</style>
	</head>

	<body>
		<jsp:include page="/static/jsp/header.jsp"></jsp:include>
		<div class="content">
			<div class="col-md-12">
				<div class="jumpdiv">
					<h2 style=color:green>注册成功</h2>
					<h4 style=color:black><span id=jump>5</span> 秒钟后页面将自动跳转至登录页面...</h4>
					<h4><a href="javascript:void(0);" onclick="jumpToIndex()">点击此处立即跳转至登录</a></h4>
				</div>
			</div>
		</div>
		<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
		<script type="text/javascript">
			if(1 == 1){
				$(".shade2").show();
				function countDown(secs) {
					jump.innerText = secs;
					if(--secs > 0){
						setTimeout("countDown(" + secs + " )", 1000);
					}
					if(secs == 0){
						jumpToIndex();
					}
				}
				countDown(5);
		
				function jumpToIndex() {
					window.location.href = "login.jsp";
				}
			}
		</script>
	</body>

</html>