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
 <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
</head>
<body>
	<div class="main-scroll">
		<div class="main-scroll-logo" style="margin-left:45px;">
			<a href="/mooc/courseServlet?method=getCourseBaseInfo"><img src="img/scrolllogo.png"></a>
		</div>
		<div class="main-scroll-select" style="margin-left:30px;">
		</div>
		<div class="main-scroll-search">
			<input class="mainsearch" type="text" placeholder="搜索感兴趣的课程" />
			<input class="mainsearch-copy" type="hidden" value="${selectValue}" />
			<button class="scrollsearch-img">
				<img src="img/search.png">
			</button>
			<c:choose>
				<c:when test="${empty user}">
					<a class="login" style="cursor:pointer;" href="/mooc/views/before/login.jsp">登录&nbsp</a>
					<span >|</span>
					<a href="/mooc/views/before/register.jsp">注册</a>
				</c:when>
				<c:otherwise>
					<a class="login" href="/mooc/before/index/person" style="cursor:pointer;">欢迎您：${user.username}</a>
					|<a href="/mooc/UserServlet?method=quit" style="cursor:pointer;">注销</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript">
	$(".scrollsearch-img").click(function(){
	  if($(".mainsearch").val()!=null&&$(".mainsearch").val().trim()!=''){
	         $(".mainsearch-copy").val($(".mainsearch").val());
	         if($("#paged").length>0){
	         }else{
	         searchCourseForm($(".mainsearch-copy").val());
	         }
		   }
	   
	});
	
	
			// JavaScript 构建一个 form 
function searchCourseForm(data) { 
  // 创建一个 form 
  var searchcourse = document.createElement("form"); 
  searchcourse.id = "searchcourse"; 
  searchcourse.name = "searchcourse"; 
  // 添加到 body 中 
  document.body.appendChild(searchcourse); 
  // 创建一个输入 
  var input = document.createElement("input"); 
  // 设置相应参数 
  input.type = "text"; 
  input.name = "selectValue"; 
  input.value = data; 
  // 将该输入框插入到 form 中 
  searchcourse.appendChild(input); 
  // form 的提交方式 
  searchcourse.method = "POST";
  // form 提交路径 
  searchcourse.action = "/mooc/before/course/searchresult"; 
  // 对该 form 执行提交 
  searchcourse.submit(); 
  // 删除该 form 
  document.body.removeChild(searchcourse); 
} 
	  
	</script>
</body>
</html>