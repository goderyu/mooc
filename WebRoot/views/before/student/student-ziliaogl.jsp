<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload-ui.css"
	type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload.css" type="text/css"></link>
<style type="text/css">
.col-lg-7 {
	margin-top: 100px;
}

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

.table-hover tr th {
	text-align: center;
}

td {
	text-align: center;
}

th {
	text-align: center;
}
.wrap .coursecontent-head .selected {
	background-color: #999999;
	color: white;
	border-radius: 5px;
}

.wrap .coursecontent-head ul li:hover {
	cursor: pointer;
	background-color: #999999;
	color: white;
	border-radius: 5px;
}
</style>
</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<form action="/mooc/before/student/lookcontent" 
		method="post" style="display:inline-block;">
		<button class="btn btn-success add-btn">返回课程目录</button>
	</form>
	<table class="table table-bordered" style="margin-top:80px;">
		<caption>资料库</caption>
		<thead>
			<tr>
				<th width="60px" style="text-align: center;">序号</th>
				<th width="300px" style="text-align: center;">文件名</th>
				<th width="120px" style="text-align: center;">上传时间</th>
				<th width="300px" style="text-align: center;">操作</th>
			</tr>
		</thead>
		<tbody class="addtable">
			<c:forEach items="${list}" var="l" varStatus="count">
				<tr>
					<td>${count.count}</td>
					<td class="fileName">${l.fileName}</td>
					<td><f:parseDate value="${l.fileDate}" var="date"
							pattern="yyyy-MM-dd HH:mm:ss" /> <f:formatDate value="${date}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td><a href="${l.fileSrc}" download="${l.fileName}">下载</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div style="margin-top:50px;"></div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	>


</body>
</html>



























