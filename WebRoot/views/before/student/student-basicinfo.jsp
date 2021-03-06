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
		  	 <div class="wrap">
				  <div class="head">
						<span class="mycenter">个人中心</span>
						<hr />
				  </div>
				<div class="content">
				<form action="/mooc/UserServlet?method=updateHeadImg"  method="post" enctype="multipart/form-data" id="headPortraitForm" >
			  		    <div> 
				  			<span >头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</span>
				  			<div>
								<input id="userHeadPortrait" value="${user.headImg}" name="file" type="file" class="file"/>
								<input type="hidden" name="headimg" value="${user.headImg}"/>		  
				  			</div>
							<div class="img"><img id="headPortraitimg" src="${user.headImg}"/></div>
				  		</div>
				</form>
				  		<div>
				  			<input name="userid" value="${user.id}" type="hidden"/>
				  			<%-- <input name="id" value="${user.id}" type="hidden"/> --%>
				  			<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span><span class="nickname">${user.username}</span>
				  		</div>
				  		<div>
				  			<span>手&nbsp;机&nbsp;号：</span><span class="nickname">${user.telephone}</span>
				  		</div>
				<form action="/mooc/BasicServlet?method=updateBasicinfo&userid=${user.id}" onSubmit="return infocheck()" method="post" id="basicinfoForm" >
						<div>
							<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
							<c:choose>
								<c:when test="${basicinfo.sex eq 1}">
									<input type="radio" value="1" name="sex" checked="checked"/>男
									<input type="radio" value="0" name="sex"/>女
								</c:when>
								<c:otherwise>
									<input type="radio" value="1" name="sex"/>男
									<input type="radio" value="0" name="sex"  checked="checked"/>女
								</c:otherwise>
							</c:choose>
				   		</div>
				    	<div>
				    		<span>常用邮箱：</span><input class="input" id="userEmail"  value="${basicinfo.email}" name="userEmail" placeholder="请输入邮箱"/>
				    		<span id="userEmailinput"></span>
				    	</div>
				    	
			    		<div>
			    			<span>身&nbsp;&nbsp;份&nbsp;证：</span><input class="input" id="userCard"  value="${basicinfo.card}" name="userCard" placeholder="请输入身份证号"/>
			    			<span id="userCardinput"></span>
			    		</div>
				    	
				    	<span id="submit" class="error"></span>
				    	<div>
				    		<input id="sub" class="button" type="submit" value="提交"/> 
				    	</div> 
				 </form>
			     </div>
		  	</div>
	 	
	 	<!-- 修改密码 -->
	 	<input class="change-2" type="submit" value="修改密码"/>
	 	<form action="/mooc/UserServlet?method=updatePassword" onSubmit="return pswcheck()" id="updateform" method="post">
			<div class="update-1">
				<div>
					初始密码：<input type="password" id="password" name="password" class="input-2" required="required"/>
					<span class="span" id="passwordinput"></span>
				</div>
				<input name="userid" value="${user.id}" type="hidden">
				<div class="password">
					新&nbsp;密&nbsp;码：<input type="password" id="pwd" name="pwd" class="input-2" required="required"/>
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
		<script type="text/javascript" charset="utf-8" src="js/ajaxfileupload.js"></script>
		<script type="text/javascript">
			$(".qxbtn").click(function(){
     			$(".update-1").hide();
     		});
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
					var imgFile = null;
					//为文件读取成功设置事件  
					reader.onloadend = function(e) {
						imgFile = e.target.result;
						// 设置img图像框，prop范围更广。src为更换的文件名
						$("#headPortraitimg").prop("src", imgFile);
					};
					
					//*****************
					$.ajaxFileUpload({
						url:"/mooc/FileUpload",
						secureuri:false,
						fileElementId:"userHeadPortrait",	//文件选择框的id属性
						dataType:"json",
						success: function(data,status) //相当于java中try语句块的用法
						{
							$.post("/mooc/UserServlet?method=updateHeadImg",{
								headImg:"img/personage/"+data.src,
								userid:'${user.id}'
							},function(data){
								if(data)
									alert('头像更新成功！');
								else
									alert('头像更新失败！');
							});
						},
						error: function (data,status,e)
						{
							$("#result").html("上传图片失败");
						}
					});
					//正式读取文件  +
					reader.readAsDataURL(file);
				}
			});
			
			/* 修改密码框的显示 */
			$(".change-2").click(function(){
				$(".update-1").show();
			});
			/* 提交修改个人信息的检查 */
			function infocheck(){
				var emailinput = document.getElementById("userEmailinput").innerHTML;
				var cardinput = document.getElementById("userCardinput").innerHTML;
				if(emailinput!="" || cardinput!=""){
					alert('您有非正规操作，请修改您的个人信息');
					return false;
				}else{
					return true;
				}
			}
     		
     		function pswcheck(){
         		/* 两次密码是否一致 */
     			var pwd = $("#pwd").val();
     			var passw = $("#passw").val();
     			if(pwd != passw){
     				$("#passwinput").html("两次密码不一致").css("color","red");
     				return false;
     			}else{
     				$("#passwinput").html("");
     			}
     			$.post("/mooc/UserServlet?method=selectPassword",{
     				"password":$("#password").val(),
     				"id":'${user.id}'
     			},function(data){
     				if(!data){
     					$("#passwordinput").html("密码输入错误").css("color","red");
     					$("#pwd").val("");
     					$("#passw").val("");
     					$("#password").val("");
     					return false;
     				}else{
     					$("#passwordinput").html("");
     					$("#updateform").ajaxSubmit(function(data) {	
						if(data){
							alert('密码修改成功！您需重新登录。');
							top.location.href="/mooc/UserServlet?method=quit";
						}
						});
						return true;
     				}
     			});
     			return false;
     		}

			/* 邮箱 */
			$("#userEmail").blur(function(){
				if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#userEmail").val())){
					$("#userEmailinput").html(""); // 移除该标签对象
					$.post("/mooc/BasicServlet?method=selectEmail",{
						userEmail:$("#userEmail").val(),
						userid:'${user.id}'
					},function(data){
						if(data){
							$("#userEmailinput").html("邮箱已占用").css("color","red");
						}else{
							$("#userEmailinput").html("");
						}
				    });
				}else{
					$("#userEmailinput").html("邮箱格式错误").css("color","red");
				}
			});
		
			/*身份证 */
			$("#userCard").blur(function(){
				if(/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/.test($("#userCard").val())){
					$("#userCardinput").html(""); // 移除该标签对象
					$.post("/mooc/BasicServlet?method=selectCard",{
						userCard:$("#userCard").val(),
						userid:'${user.id}'
					},function(data){
						if(data){
							$("#userCardinput").html("身份证已占用").css("color","red");
						}else{
							$("#userCardinput").html("");
						}
					});
				}else{
			 		$("#userCardinput").html("身份证格式错误").css("color","red");
				}
			});
		</script>
  </body>
</html>