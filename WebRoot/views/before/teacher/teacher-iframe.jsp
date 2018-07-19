<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>教师界面iframe</title>
</head>
 <body style="margin: 0px; width:100%;">
 	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
    <iframe src="/mooc/before/teacher/teacherframeset" style="border-width:0px;width:100%;" height="1000px";  >
	</iframe>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
</body>
</html>