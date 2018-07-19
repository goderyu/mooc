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
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<style type="text/css">
.foot {
margin-top:10px;
	height:150px;
	background-color: #333;
}
.foot>*{
	color:#999;
}
.foot a{
text-decoration:none;
	color:#999;
}
.logo {
	width: 100%;
	height: 37px;
	background: url(img/scrolllogo.png) no-repeat 0 0;
	background-size: auto auto;
	-webkit-background-size: contain;
	-moz-background-size: contain;
	-o-background-size: contain;
	background-size: contain
}
.f-fcc{
	color:white;
}
.logo{
	margin-top: 15px;
	margin-bottom: 15px;
}
.idcard{
	height:70px;
	background-color: #333;
	text-align: center;
	color:#999;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="foot">
		<div style="height:20px;"></div>
		<div class="g-flow f-cb" >
			<div class="col-xs-8 col-sm-1"></div>
			<div class="col-xs-8 col-sm-6">
				<div class="logo"></div>
				<p >由高教社联手网易推出，让每一个有提升愿望的用户能够学到中国知名高校的课程，并获得认证。</p>
			</div>

			<div class="col-xs-8 col-sm-2">
				<h4 class="f-fcc">关于我们</h4>
				<div>
					<a>关于我们</a> <a>学校云</a><br /> 
					<a>联系我们</a> <a>常见问题</a><br />
					<a>意见反馈</a> <a>法律条款</a><br />
				</div>
			</div>
		</div>
		<div class="col-xs-8 col-sm-3">
			<h4 class="f-fcc">友情链接</h4>
			<div class="f-cb">
				<a >网易卡搭</a><br/> 
				<a >网易云课堂</a><br/> 
				<a >网易100分</a><br/> 
			</div>
		</div>
	</div>
		<div class="idcard">
				<p>粤B2-20090191-26| 京ICP备12020869号-2 | 京公网安备44010602000207</p>
				©2014-2018 icourse163.org
		</div>
</body>
</html>