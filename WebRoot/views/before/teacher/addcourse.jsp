<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="UTF-8" src="js/main.js"></script>
<script type="text/javascript" src="js/jq.js"></script>

<link rel="stylesheet" href="css/addcourse.css" type="text/css"></link>
</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="addfh">新建</div>
		<div class="add-coursexx">
			<form action="/mooc/before/course/insertcourse" id="courseForm" method="post" enctype="multipart/form-data">
				<span class="coursefm" id="coursefm-text" style="margin-top:20px;">课程封面：</span>
				<span class="coursefm-wrap" style="margin-left:0px;">
				<input class="coursefm" id="coursefm" name="file" type="file" /> 
					<i></i>
					<img style="width:150px;height:150px;z-index:99;" id="courseimg" src="img/course/mrcoursefm.jpg"/>
					 </span> <br />
				<span>课程名称：</span><input name="courseName" ><br />
				<span>课程简介：</span><input name="courseSummary"><br /> 
				<input type="hidden" name="teacherid" value="${teacher.id}">
				<input type="submit"
					class="nextbtn"  value="下一步" >
			</form>
			<form action="/mooc/before/index/person" target="_window">
				<input type="submit" class="returnbtn" style="margin-left:-70px;" value="返回">
			</form>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
		$("#coursefm").change(function() {
			//获取文件  
			var file = $("#courseForm").find("input")[0].files[0];
			if ((file.type).indexOf("image/") == -1) {

				$("#coursefm + i").html("图片格式错误").css("color", "red");
				$("#coursefm").val("");
				$("#courseimg").removeAttr("src");
			} else {

				$("#coursefm + i").html("");
				//创建读取文件的对象  
				var reader = new FileReader();
				//创建文件读取相关的变量  
				var imgFile;
				//为文件读取成功设置事件  
				reader.onload = function(e) {
					imgFile = e.target.result;
					$("#courseimg").attr('src', imgFile);
				};
				//正式读取文件  
				reader.readAsDataURL(file);
			}

		});
	</script>
</body>
</html>



























