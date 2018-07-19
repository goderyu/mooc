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
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.main-left-select a,img {
	color: #333;
	box-sizing: content-box;
}
</style>
</head>

<body>
	<div class="main-scroll" style="display:none;">
		<div class="main-scroll-logo" style="margin-left:45px;">
			<img src="img/scrolllogo.png">
		</div>
		<div class="main-scroll-select" style="margin-left:30px;">
			<a href="#" style="margin-left:0;">课程</a> <a href="#">名校</a> <a
				href="#">学·问</a> <a href="#">学校云</a> <a href="#">考研</a>
		</div>
		<div class="main-scroll-search">
			<input class="mainsearch" type="text" placeholder="搜索感兴趣的课程" />
			<button class="scrollsearch-img">
				<img src="img/search.png">
			</button>
			<c:choose>
				<c:when test="${empty USER}">
					<a class="login" style="cursor:pointer;" href="/mooc/login/tologin">登录&nbsp</a>
					<span>|</span>
					<a href="/mooc/register/home.do">注册</a>
				</c:when>
				<c:otherwise>
					<a class="login" style="cursor:pointer;">欢迎您：${USER.userName}</a>
					|<a href="/mooc/login/loginout" style="cursor:pointer;">注销</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="main-navigation">
		<div class="main-top">
			<div class="main-logo">
				<img src="img/logo.png">
			</div>
			<div class="main-search">
				<input class="mainsearch" type="text" placeholder="搜索感兴趣的课程" />
				<button class="main-search-img">
					<img src="img/search.png">
				</button>
				<c:choose>
					<c:when test="${empty USER}">
						<a class="login" style="cursor:pointer;"
							href="/mooc/login/tologin">登录&nbsp</a>
						<span>|</span>
						<a href="/mooc/register/home.do">注册</a>
					</c:when>
					<c:otherwise>
						<a class="login" style="cursor:pointer;">欢迎您：${USER.userName}</a>
					|<a href="/mooc/login/loginout" style="cursor:pointer;">注销</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="main-top-select">
			<a href="#" style="margin-left:0;">课程</a> <a href="#">名校</a> <a
				href="#">学·问</a> <a href="#">学校云</a> <a href="#">考研</a> <a href="#"
				class="wangyiyun">网易云课堂</a> <a href="#" class="moreclass">更多频道</a>
		</div>
	</div>
	<div class="main-lunbotu" style="background-color:#6041A0;">
		<div class="main-left-select">
			<a><img src="/mooc/static/img/computer.png"><span>计算机</span>
			</a> <a><img src="img/kaoyan.png"><span>考研</span> </a> <a><img
				src="img/kongcheng.png"><span>航空管理</span> </a> <a><img
				src="img/dili.png"><span>地理学</span> </a> <a><img
				src="img/music.png"><span>音乐</span> </a> <a><img
				src="img/shehui.png"><span>社会交际学</span> </a> <a><img
				src="img/waiyu.png"><span>外国语</span> </a> <a><img
				src="img/wenxue.png"><span>国际教育</span> </a> <a><img
				src="img/xinli.png"><span>心理学</span> </a>
		</div>
		<div class="main-middle-lunbo" id="image">
			<div class="main-middle-image">
				<div class="image-show">
					<a><img src="img/lunbo1.png"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo2.jpg"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo3.png"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo4.jpg"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo5.jpg"> </a>
				</div>
			</div>
			<div class="main-lunbo-li">
				<ul class="lunbo-point">
					<li class="point"></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="lunbo-twocricle">
				<div class="lunbo-leftcricle">
					<span>＜</span>
				</div>
				<div class="lunbo-rightcricle">
					<span style="left:5px;">＞</span>
				</div>
			</div>
		</div>
		<div class="main-right-person">
			<div class="right-text">
				<span>免费学习名校名师的</span><br /> <span>精品课程</span>
			</div>
			<c:choose>
				<c:when test="${empty USER}">
					<div class="right-img">
						<img src="img/person.png"><br /> <a
							href="/mooc/login/tologin"><button class="login">登录</button>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="right-img">
						<img src="img/loginsuccess.png" style="height:80px;"><br />
						<a href="/mooc/login/tologin"><span class="loginUserName">${USER.userName}</span>
						</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="main-college">
		<span><a href="#">全部150所合作高校</a> </span> <span><a href="#"><img
				src="img/beida.png"> </a> </span> <span><a href="#"><img
				src="img/zheda.png"> </a> </span> <span><a href="#"><img
				src="img/nanjinda.png"> </a> </span> <span><a href="#"><img
				src="img/wuda.png"> </a> </span> <span><a href="#"><img
				src="img/hagongda.png"> </a> </span>
	</div>
	<div class="courselist" id="courselist">
		<h1 style="padding-top:30px;color:#55b929;">课程列表</h1>
		<c:forEach items="${list}" var="list">
			<div class="course-main">
				<div class="computer-course">
					<div class="course">
						<div class="course-img">
							<img  src="${list.courseImg}">
						</div>
					</div>
					<div class="course-text">
						<div class="course-name">${list.courseName}</div>
						<div style="margin-top:30px;margin-left:10px;">
							<span>华北水利水电大学</span> <img
								style="margin-left: 60px;" src="img/course/count.png"> <span
								style="margin-left:10px;">${list.count}</span>
						</div>
						<div style="margin-left:10px;">${list.courseIntroduce}</div>
						<form action="/mooc/course/selectcourse" class="selectform" method="post">
							<input type="hidden" name="id" value="${list.id}">
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jq.js"></script>
	<script type="text/javascript" charset="UTF-8" src="js/main.js"></script>
	<script type="text/javascript">
		
		$(".course-main").click(function() {
			var index=$(this).index();
			$(".selectform").eq(index-1).submit();
		})
	</script>
</body>
</html>
