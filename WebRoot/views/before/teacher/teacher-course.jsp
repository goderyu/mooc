<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>教师课程管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/teacher-course.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
.courses,.add-course {
	vertical-align: middle;
}

.selected {
	cursor: pointer;
}

.course-manage .study-course {
	margin-top: 10px;
}

.course-manage .study-course .courses {
	cursor: pointer;
	margin-top: 30px;
	margin-right: 30px;
	display: inline-block;
	width: 272px;
	height: 270px;
	border: 1px solid #eee;
	background-color: #f3f3f3;
}

.course-manage .study-course .courses img {
	width: 272px;
	height: 190px;
}

.course-manage .study-course  .course-msg .course-name {
	display: inline-block;
	margin-top: 10px;
	margin-left: 10px;
}

.course-manage .study-course  .course-msg .teahcer-name {
	display: inline-block;
	margin-top: 10px;
	margin-left: 10px;
	font-size: 12px;
	color: gray;
}
</style>
</head>
<div class="course-manage">
	<div class="course-manage-head">
		<span class="selected">我教的课</span><span>|</span><span class="selected">我学的课</span>
		<hr />
	</div>
	<div class="teach-course">
		<c:forEach items="${list}" var="l">
			<div class="courses">
				<div class="lookcourse">
					<img src="${l.courseImg}">
					<div class="course-msg">
						<span class="course-name">${l.courseName}</span><br />
					</div>
					<form action="/mooc/before/course/coursecontent" target="_window"
						class="selectf" method="post">
						<input type="hidden" name="id" value="${l.id}">
					</form>
				</div>
				<form action="/mooc/before/teacher/deletecourse"
					style="display:inline-block;" target="_window" method="post">
					<input type="hidden" name="courseid" value="${l.id}">
					<button class="btn btn-danger" onclick="return deleteCourse();">删除该课程</button>
				</form>
			</div>
		</c:forEach>
		<div class="add-course">
			<div>
				<a href="/mooc/before/teacher/teacheraddcourse" target="_window">
					<div class="addfh">
						<span>+</span>
					</div> </a>
			</div>
		</div>
	</div>
	<div class="study-course" style="display:none;">
		<c:forEach items="${studycourse}" var="l">
			<div class="courses">
				<div class="stydycourse">
					<img src="${l.courseImg}">
					<div class="course-msg">
						<span class="course-name">${l.courseName}</span><br />
					</div>
					<form action="/mooc/before/student/lookcontent" target="_window"
						class="selectf" method="post">
						<input type="hidden" name="id" value="${l.id}">
					</form>
				</div>
				<form action="/mooc/before/teacher/deletestudycourse"
					style="display:inline-block;" target="_window" method="post">
					<input type="hidden" name="courseid" value="${l.id}">
					<button class="btn btn-danger" onclick="return deleteCourse();">删除该课程</button>
				</form>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
	$(".lookcourse").click(function() {
		var index = $(".lookcourse").index(this);
		$(".selectf").eq(index).submit();
	})
	
	function deleteCourse(){
		if(confirm("确认删除该课程吗？")){
			return true;
		}
		return false;
	}
	$(".selected").eq(0).css("color","#55b929");
	$(".selected").click(function(){
		$(".selected").css("color","black");
		$(this).css("color","#55b929");
		var index=$(".selected").index(this);
		if(index==0){
			$(".teach-course").show();
			$(".study-course").hide();
		}else{
			$(".teach-course").hide();
			$(".study-course").show();
		}
	})
	$(".stydycourse").click(function(){
		var index =	$(".courses").index(this);
		$(".selectf").eq(index).submit();
	})
</script>
<body>
</body>
</html>
