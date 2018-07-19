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
	<span
		style="display:inline-block;margin:100px 0 20px 50px;font-size:20px;">学生姓名：${user.userName}</span>
	<table class="table table-hover">
		<caption>作业列表</caption>
		<thead>
			<tr>
				<th style="width:150px;text-align: center;">作业名称</th>
				<th style="width:150px;text-align: center;">作业截止时间</th>
				<th style="width:500px;text-align: center;">作业完成情况</th>
				<th style="width:500px;text-align: center;">正确率</th>
				<th style="width:500px;text-align: center;">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="l">
				<tr>
					<td>${l.taskname}</td>
					<td>${l.endtime}</td>
					<c:choose>
						<c:when test="${l.taskComplete==null}">
							<td>未完成</td>
							<td>未完成</td>
							<td>未完成</td>
						</c:when>
						<c:otherwise>
							<td>已经完成</td>
							<td>${l.taskComplete.correctlv}</td>
							<td>
								<form action="/mooc/before/manage/testresult" target="_blank"
									method="post" style="display:inline-block;">
									<input type="hidden" name="taskid" value="${l.id}"> <input
										type="hidden" name="userid" value="${user.id}"> <input
										type="hidden" name="taskname" value="${l.taskname}">
									<button class="btn btn-success add-btn">查看结果</button>
								</form></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin-top:50px;"></div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
</body>
</html>



























