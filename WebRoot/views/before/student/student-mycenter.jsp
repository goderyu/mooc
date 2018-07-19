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
<style type="text/css">
	a{
		list-style: none;
	}
</style>
</head>
  <body>
        <form action="/mooc/before/upstudent/toupdate" method="post" id="headPortraitForm" enctype="multipart/form-data">
		  	 <div class="wrap">
				  <div class="head">
						<span class="mycenter">个人中心</span>
						<hr />
				  </div>
			  	  <div class="content">
			  		    <div> 
				  			<span >头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</span>
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
				    		<span>常用邮箱：</span><input class="input" id="userEmail" value="${user.userEmail}" name="userEmail" placeholder="请输入邮箱"/>
				    		<span class="hint-0" id="userEmailinput"></span>
				    	</div>
				    	<c:choose>
				    	<c:when test="${empty user.userCard}">
				    	<div>
				    		<span>身&nbsp;&nbsp;份&nbsp;证：</span><input class="input" id="userCard" value="${user.userCard}" name="userCard" placeholder="请输入身份证" />
				    		<span class="hint" id="userCardinput"></span>
				    	</div>
				    	</c:when>
				    	<c:otherwise>
				    		<div>
				    			<span>身&nbsp;&nbsp;份&nbsp;证：</span>${user.userCard}
				    			<span class="hint" id="userCardinput"></span>
				    		</div>
				    	</c:otherwise>
				    	</c:choose>
				    	<span id="submit" class="error"></span>
				    	<div>
				    		<input id="sub" class="button" type="submit" value="提交"/> 
				    	</div> 
			      </div>
		  	 </div>
	 	</form>
	 	<!-- 修改密码 -->
	 	<input class="change-2" type="submit" value="修改"/>
	 	<form action="/mooc/before/upstudent/updataPassword" onsubmit="return pswcheck()" id="updateform" method="post">
			<div class="update-1">
				<div>
					初始密码：<input type="password" id="password" class="input-2" required="required"/>
					<span class="span" id="passwordinput"></span>
				</div>
				<input name="id" value="${id}" type="hidden">
				<div class="password">
					新&nbsp;密&nbsp;码：<input type="password" name="password" id="pwd" class="input-2" required="required"/>
					<span id="pwdinput"></span>
				</div>
				<div>
					确认密码：<input type="password" id="passw" class="input-2" required="required"/>
					<span id="passwinput"></span>
				</div>
				<div class="subm">
					<input class="sub" type="submit" style="cursor:pointer;" value="提交"/>
					<a class="qxbtn sub" style="cursor:pointer;" >取消</a>
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
					//正式读取文件  +
					reader.readAsDataURL(file);
				}
			});
			
			/* 密码的显示 */
			$(".change-2").click(function(){
				$(".update-1").show();
			});
			
			
     		function pswcheck(){
     			$.post("/mooc//before/upstudent/selectPassword",{
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
			
			
			/* 邮箱 */
			$("#userEmail").blur(function(){
				if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#userEmail").val())){
					$.post("/mooc/before/upstudent/selectUserEmail",{
						userEmail:$("#userEmail").val()
					},function(data){
						if(!data){
							$("#userEmailinput").html("").css("color","green");
						}else{
							$("#userEmailinput").html("邮箱已占用").css("color","red");
						}
				    });
				}else{
					$("#userEmailinput").html("邮箱格式错误").css("color","red");
				}
			});
		
			/*身份证 */
			$("#userCard").blur(function(){
				if(/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/.test($("#userCard").val())){
					$.post("/mooc/before/upstudent/selectUserCard",{
						userCard:$("#userCard").val()
					},function(data){
						if(!data){
							$("#userCardinput").html("").css("color","green");
						}else{
							$("#userCardinput").html("身份证已占用").css("color","red");
						}
					});
				}else{
			 		$("#userCardinput").html("身份证格式错误").css("color","red");
				}
			});
		</script>
  </body>
</html>



























