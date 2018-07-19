
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>欢迎进入mooc作业系统</title>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/test.css" rel="stylesheet" type="text/css" />
<style>
.hasBeenAnswer {
	background: #5d9cec;
	color: #fff;
}

.rt_nr1_title h1 {
	margin: 0px;
	line-height: 40px;
}

.rt_content_tt h2 {
	margin: 0px;
	line-height: 40px;
}
</style>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
	text-decoration: none;
}

.test {
	padding-bottom: 100px;
}

.main {
	height: auto;
	margin-top: 100px;
	margin-left: 100px;
}

ul li {
	list-style: none;
}

#upgettask {
	width: 200px;
	height: 50px;
	border: 0;
	background-color: #55b929;
	color: white;
	margin-top: 50px;
}
</style>
</head>
<script src="js/jquery-2.1.0.js"></script>

<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<!-- container -->
	<div class="main">
		<!--nr start-->
		<div class="test_main">
			<div class="nr_left">
				<div class="test">
					<!-- 试卷表单 -->
					<h2>${taskname}</h2>
					<br> <br>
					<c:forEach items="${list}" var="l" varStatus="count">

						<div class="test_content_nr">
							<input class="iscorrect" type="hidden">
							<ul>

								<li>
									<div class="test_content_nr_tt">
										<i>${count.count}</i><font>${l.subjecttext}</font>
									</div>
									<div class="test_content_nr_main">
										<ul>

											<li class="option"><label for="0_answer_1_option_1">
													A.
													<p class="ue" style="display: inline;">${l.optiona}</p> </label>
											</li>

											<li class="option"><label for="0_answer_1_option_2">
													B.
													<p class="ue" style="display: inline;">${l.optionb}</p> </label>
											</li>

											<li class="option"><label for="0_answer_1_option_3">
													C.
													<p class="ue" style="display: inline;">${l.optionc}</p> </label>
											</li>

											<li class="option"><label for="0_answer_1_option_4">
													D.
													<p class="ue" style="display: inline;">${l.optiond}</p> </label>
											</li>
											<li style="margin-top:20px;">
												你的选项：${result[count.count-1]}</li>

											<li style="margin-top:20px;color:#55b929;">
												正确选项：${l.correctoption}</li>
											<li style="margin-top:20px;margin-bottom: 10px;">
												<div style="height:3px;width:100%;background-color:#999999;margin-bottom: 10px;"></div>
												解析：${l.analysis}
											</li>
										</ul>
									</div></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
</body>
</html>
