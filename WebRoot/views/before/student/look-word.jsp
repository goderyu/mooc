<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<!--脚本控制-->
<script type="text/javascript" src="js/wangEditor.js"></script>
<!-- 编辑器编辑后，提交时执行js，获得编辑器的内容，赋值给textarea，用于向后台提交存入数据库 -->
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
#updateBtn{
	margin-top:20px;
	height:40px;
	width:100px;
	border:0;
	color:white;
	margin-left:40%;
	background-color:#55b929;
	cursor:pointer;
}
</style>

</head>
<body>
		<div>
			<div id="editor">
				<p>${map.content}</p>
			</div>
		</div>
</body>
</body>
</html>