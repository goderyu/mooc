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
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
.table {
	margin-top: 20px;
	margin-left: 30px;
}

.add-btn {
	margin-top: 100px;
	margin-left: 30px;
}

button {
	margin-left: 10px;
}

caption {
	margin-top: 20px;
	margin-bottom: 30px;
}

th {
	text-align: center;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<form action="/mooc/before/course/coursecontent"
		method="post" style="display:inline-block;">
		<button class="btn btn-success add-btn">返回课程目录</button>
	</form>
	<table class="table table-hover" style="margin-top:100px;">
		<caption>学生信息列表</caption>
		<thead>
			<tr>
				<th style="width:150px;text-align: center;">编号</th>
				<th style="width:150px;text-align: center;">学生姓名</th>
				<th style="width:150px;text-align: center;">电话</th>
				<th style="width:500px;text-align: center;">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="l" varStatus="count">
				<tr>
					<td>${count.count}</td>
					<td class="taskname">${l.username}</td>
					<td class="sendtime">${l.telephone}</td>
					<td>
						<form action="/mooc/before/manage/listask" method="post">
							<input type="hidden" value="${l.id}" name="userid">
							<button class="btn btn-success">查看作业完成情况</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div style="margin-top:50px;"></div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
</body>
</html>



























