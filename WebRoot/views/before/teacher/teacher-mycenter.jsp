<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="UTF-8" src="js/main.js"></script>
<!-- <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"> -->
<script type="text/javascript" src=""></script>
<link rel="stylesheet" type="text/css" href="css/teacher-mycenter.css" />
</head>
  <body>
        <form action="/mooc/before/upteacher/toupdate" onsubmit="return tijiao()" method="post" id="headPortraitForm" enctype="multipart/form-data">
		  	 <div class="wrap">
				  <div class="head">
						<span class="mycenter">个人中心</span>
						<hr />
				  </div>
			  	  <div class="content">
			  		    <div> 
				  			<span>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</span>  
				  			<div>
								<input id="userHeadPortrait" value="${USER.headImg}" name="file" type="file" class="file"/>	
								<input type="hidden" name="headimg" value="${USER.headImg}"/>	  
				  			</div>
							<div class="img"><img id="headPortraitimg" src="${USER.headImg}"/></div>
				  		</div>
				  		<div>
				  			<input name="userId" value="${id}" type="hidden"/>
				  			<input name="id" value="${id}" type="hidden"/>
				  			<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span><span class="nickname">${USER.userName}</span>
				  		</div>
				  		<div>
				  			<span>手&nbsp;机&nbsp;号：</span><span class="nickname">${USER.telephone}</span>
				  		</div>
				  		<div>
				  			<span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><span class="nickname">******</span>
				  		</div>
				    	<div>
				    		<span>常用邮箱：</span><input class="input" id="userEmail" value="${user.teacheremail}" name="teacheremail" placeholder="请输入邮箱" required="required"/>
				    		<span class="hint-0" id="userEmailinput"></span>
				    	</div>
				    	<span id="submit" class="error"></span>
				    	<div>
				    		<input id="sub" class="button" type="submit" value="提交"/> 
				    	</div> 
			      </div>
		  	 </div>
	 	</form>
	 	<!-- 修改密码 -->
	 	<input class="change-1" type="submit" value="修改"/>
	 	<form action="/mooc/before/upteacher/updataPassword"  id="updateform" onsubmit="return pswcheck()" method="post">
			<div class="update-1">
				<div>
					初始密码：<input type="password" id="password"name="password" class="input-2"/>
					<span class="span" id="passwordinput"></span>
				</div>
				<input name="id" value="${id}" type="hidden">
				<div class="password">
					新&nbsp;密&nbsp;码：<input type="password" name="newpassword" id="pwd" class="input-2" required="required"/>
					<span id="pwdinput"></span>
				</div>
				<div>
					确认密码：<input type="password" id="passw" class="input-2" required="required"/>
					<span id="passwinput"></span>
				</div>
				<div class="subm">
					<input class="sub" type="submit"  style="cursor:pointer;" value="提交"/>
					<a class="qxbtn sub" style="cursor:pointer;">取消</a>
				</div>
			</div>
		</form>
	  	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript">
     		
     		$(".qxbtn").click(function(){
     			$(".update-1").hide();
     		})
     		/* 头像上传 */
			$("#userHeadPortrait").change(function() {
				//获取文件  
				var file = $("#headPortraitForm").find("input")[0].files[0];
				if ((file.type).indexOf("image/") == -1) {
					$("#userHeadPortrait + i").html("图片格式错误").css("color", "red");
					$("#userHeadPortrait").val("");
					$("#headPortraitimg").removeAttr("src");
				} else {
					$("#userHeadPortrait + i").html("");
					//创建读取文件的对象  
					var reader = new FileReader();
					//创建文件读取相关的变量  
					var imgFile;
					//为文件读取成功设置事件  
					reader.onload = function(e) {
						imgFile = e.target.result;
						$("#headPortraitimg").attr('src', imgFile);
					};
					//正式读取文件  
					reader.readAsDataURL(file);
				}
			});
			
			/* 密码的显示*/
			$(".change-1").click(function(){
				$(".update-1").show();
			});
     		/* 初始密码 */
     		/* $("#password").blur(function(){
     			$.post("/mooc/before/upteacher/selectPassword",{
     				passWord:$("#password").val(),
     				id:'${user.userId}'
     			},function(data){
     				if(!data){
     					$("#passwordinput").html("密码输入错误").css("color","red");
     				}else{
     					$("#passwordinput").html("").css("color","green");
     				}
     			});
     		}); */
     		function pswcheck(){
     			$.post("/mooc/before/upteacher/selectPassword",{
     				passWord:$("#password").val(),
     				id:'${user.userId}'
     			},function(data){
     				if(!data){
     					$("#passwordinput").html("密码输入错误").css("color","red");
     					$("#pwd").val("");
     					$("#passw").val("");
     					$("#password").val("");
     					return false;
     				}else{
     					$("#passwordinput").html("").css("color","green");
     					$("#updateform").ajaxSubmit(function(data) {	
						if(data){
							top.location.href="/mooc/before/login/loginout";
						}
						});
						return false;
     				}
     			});
     			return false;
     		}
     		/* 新密码 */
     	 	$("#pwd").blur(function(){
     			var pwd = /^([0-9A-Za-z])[0-9A-Za-z]{5,16}$/;
     			if(!pwd.test($("#pwd").val())){
     				$("#pwdinput").html("密码格式错误(5-16位字符)").css("color","red");
     			}else{
     				$("#pwdinput").html("").css("color","green");
     			}
     		}); 
     		/* 两次密码是否一致 */
     		$("#passw").blur(function(){
     			var pwd = $("#pwd").val();
     			var passw = $("#passw").val();
     			if(pwd != passw){
     				$("#passwinput").html("两次密码不一致").css("color","red");
     			}else{
     				$("#passwinput").html("").css("color","green");
     			}
     		}); 
			
			var emailTest=false;
			/* 邮箱 */
			$("#userEmail").blur(function(){
				if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#userEmail").val())){
					$.post("/mooc/before/upteacher/selectUserEmail",{
						userEmail:$("#userEmail").val()
					},function(data){
						if(!data){
							$("#userEmailinput").html("").css("color","green");
							emailTest=true;
						}else{
							$("#userEmailinput").html("邮箱已占用").css("color","red");
							emailTest=false;
						}
				    });
				}else{
					$("#userEmailinput").html("邮箱格式错误").css("color","red");
					emailTest=false;
				}
			});
			
			function tijiao(){
			$("#userEmail").blur();
				if(emailTest){
					return true;
				}
				return false;
			}
		</script>
  </body>
</html>




























