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
</head>
	<!-- 在此框架集中也调用Servlet测试一下 -->
	<frameset name="fra" cols="75%,25%" id="fra" border="10" bordercolor="black" style="height:100%;">
			<frameset rows="7%,93%" border="0">
			<!-- /mooc/views/before/student/look-select.jsp -->
			<!-- /mooc/views/before/student/look-word.jsp -->
				<frame src="/mooc/views/before/student/look-select.jsp?course=${course}" name="ltop" scrolling="no" />
				<frame src="/mooc/StudyServlet?method=toLookWord" name="down" />
			</frameset>
			<frame src="/mooc/views/before/student/look-catalog.jsp" name="right" scrolling="no" />
	</frameset>
<body>
</body>
</html>