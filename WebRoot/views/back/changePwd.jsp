<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 

	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MOOC后台权限管理</title>
		<link rel="stylesheet" href="back/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="back/css/font_eolqem241z66flxr.css" media="all" />
		<link rel="stylesheet" href="back/css/changePwd.css" media="all" />
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>修改密码</legend>
		</fieldset>  
		<input type="hidden" id="adminid" value="${admin.id}">
		<form action="/mooc/back/change/update" method="post" target="_top">
			<div class="wrap">
				<div>
					用&nbsp;&nbsp;户&nbsp;&nbsp;名：<span class="person">${admin.aname}</span>
				</div>
				<div>
					初始密码：<input id="apassword" type="password" required="required"/>
					<span id="apasswordinput"></span>
				</div>
				<input type="hidden" name="id" type="password" value="${id}">
				<div>
					新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input id="pwd" type="password" required="required"/>
					<span id="pwdinput"></span>
				</div>
				<div>
					确认密码：<input id="apwd" type="password" name="apassword" required="required"/>
					<span id="apwdinput"></span>
				</div>
				<div>
					<button onclick="changeTrue();" class="layui-btn">提交</button>
				</div>
			</div>
		</form>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript">
			function changeTrue(){
				if(!confirm("确认修改？")){
					return false;
				}
			}
			/* 判断密码是否输入正确 */
			$("#apassword").blur(function(){
				$.post("/mooc/back/change/selectApassword",{
					apassword:$("#apassword").val(),
					id:$("#adminid").val()
				},function(data){
					if(!data){
						$("#apasswordinput").html("密码输入错误").css("color","red");
					}else{
						$("#apasswordinput").html("密码输入正确").css("color","green");
					}
				});
			});
			
			/* 新密码 */
			$("#pwd").blur(function(){
				var reg = /^([0-9A-Za-z])[0-9A-Za-z]{5,16}$/;
				if(!reg.test($("#pwd").val())){
					$("#pwdinput").html("密码格式错误").css("color","red");
				}else{
					$("#pwdinput").html("格式正确").css("color","green");
				}
			});
			
			/* 两次密码一致 */
			$("#apwd").blur(function(){
				var pwd = $("#pwd").val();
				var apwd = $("#apwd").val();
				if(pwd != apwd ){
					$("#apwdinput").html("两次密码不一致").css("color","red");
				}else{
					$("#apwdinput").html("密码一致").css("color","green");
				}
			});
		</script>
	</body>

</html>




















