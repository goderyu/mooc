<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/back/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<title>MOOC后台登录</title>
<link rel="stylesheet" href="css/login.css" media="all" />
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
</head>
<body>

	
	<div class="wrap">
			<div class="content">
				<ul>
					<li style="line-height:70px;margin-top:50px;">
						<a href="#"><img src="img/backlogo.png"/></a>
					</li>
					<li class="textInput" style="line-height:70px;">
						<span style="color:white;">用户名：</span><input id="anameinput" name="aname" placeholder="请输入用户名"/>
					</li>
					<li class="textInput" style="line-height:70px;">
						<span style="color:white;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" id="apasswordinput" name="apassword" placeholder="请输入密码"/>
					</li>
					<li class="btnInput" style="line-height:70px;">
						<input id="loginbtn" type="submit" value="登    录"/>
					</li>
				</ul>	
			</div>
		</div>
	
	<script type="text/javascript">

 		$("#loginbtn").click(function(){
 			$.post("/mooc/back/backlogin/adminLogin",
				{
 					aname:$("#anameinput").val(),
 					apassword:$("#apasswordinput").val()
 				},
 				function(data){
 					if(data != null){
 						window.location.href="/mooc/toBackHome";
 					}else{
 						layui.use(['element', 'layer'], function() {
							var element = layui.element;
							var layer = layui.layer;
				 			//layer.msg("用户名或密码错误！", {icon: 5, anim: 3});
				 			layer.msg("用户名或密码错误！", {area: ['210px','60px'],time:1500, icon: 5, offset: '300px', anim: 6});
						});
	 				}
 				}
 			);
 		});
 		
	</script>

</body>
</html>