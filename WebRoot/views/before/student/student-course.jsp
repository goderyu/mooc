<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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

<title>学生课程管理</title>

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
	.courses,.add-course{
		vertical-align: middle;
	}
</style> 
</head>
<div class="course-manage">
	<div class="course-manage-head">
		<span class="select">我学的课</span>
		<hr />
	</div>
	<div class="teach-course">
		<c:forEach items="${list}" var="coursebase">
		<div class="courses">
			<div class="studycourse">
			<img src="${coursebase.img}">
			<div class="course-msg">
				<span class="course-name">${coursebase.cname}</span><br/>
			</div>
			<form action="/mooc/StudyServlet?method=getCourseContent" target="_window" class="selectf" method="post">
				<input type="hidden" name="courseid" value="${coursebase.id}">
			</form>
			</div>
			<div class="deletecourse">
			<form action="/mooc/StudyServlet?method=toDelete"
					style="display:inline-block;" target="right" method="post">
					<input type="hidden" name="courseid" value="${coursebase.id}">
					<button class="btn btn-danger" onclick="return deleteCourse();">删除该课程</button>
			</form>
			</div>
		</div>
		</c:forEach>
		
	</div>
</div>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	$(".studycourse").click(function(){
		var index =	$(".studycourse").index(this);
		$(".selectf").eq(index).submit();
	});
	$(".deletecourse").click(function(){
		if(confirm('确认删除吗？')){
			return true;
		} else {
			return false;
		}
	});
</script>
<body>
</body>
</html>
