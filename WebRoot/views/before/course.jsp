<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>课程详情</title>
<meta name="viewport" content="width:device-width;initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/course.css">

</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="top">
			<div class="left">
				<img src="${coursebase.img}">
			</div>
			<div class="right">
				<div>
					<h1>${coursebase.cname}</h1>
				</div>
				<div class="school-msg">
					<div>学校：河南工业大学</div>
					<div>${coursebase.introduce}</div>
				</div>
				<div>
					<div class="count">已有${coursebase.count}人报名</div>
					<div>
						<form action="/mooc/StudyServlet?method=toMain" method="post" id="studyform">
							<input type="hidden" value="${coursebase.id}" name="courseid" />
						</form>
						<c:choose>
							<c:when test="${isStudyCourse}">
								<button class="gotostudy">已经报名，去学习</button>
							</c:when>
							<c:otherwise>
								<button class="joinc">立即参加</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="down">
			<div class="down-left">
				<div class="top-select">
					<span class="course-xq">课程详情</span>
					<hr style="color:#eee;">
				</div>
				<div class="coursezl">
					<div class="coursems">
						<img src="img/course/coursems.png"><span
							class="coursems-head">课程概述</span>
						<div class="coursems-text" style="color:gray;">
							${coursebase.summary}</div>
					</div>
					<div class="coursedg">
						<img src="img/course/coursedg.png"><span
							class="coursedg-head">课程大纲</span>
					</div>
				</div>
			</div>
			<div class="down-right">
				<img src="img/ncwu.jpg">
				<hr style="color:#eee;">
				<div class="teacher">
					<span class="teacher-img"><img src="${teacherUser.headImg}">
					</span> <span class="teacher-name">${teacherUser.username}</span>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(".joinc").click(function(){
			var user='${user}';
			if(user==null||user==''){
				if(confirm("您还没有登录，请先登录！")){
					window.location.href="/mooc/views/before/login.jsp";
				}
			}else{
				$("#studyform").submit();
			}
		})
		$(".gotostudy").click(function(){
			var user='${user}';
			if(user==null||user==''){
				if(confirm("您还没有登录，请先登录！")){
					window.location.href="/mooc/views/before/login.jsp";
				}
			}else{
				window.location.href="/mooc/before/index/person";
			}
		});
		//JS
		$(function(){
		var id='${coursebase.id}';
			$.ajax({
			url:"/mooc/CourseServlet?method=getFirstCatalogInfo",
			type:"post",
			data:{"id":id},
			dataType:"json",
			success:function(data){
				var div="";
				//循环一级标题
				for(var i=0;i<data.length;i++){
				   div+="<div class='first-level'>";
				   div+="<div class='first-level-text selected'>";
				   div+="<span>第"+(i+1)+"章 "+data[i].catalogname+"</span>";
				   div+="</div>";
				   //二级标题
				       $.ajax({
				          async:false,//取消异步操作
				          url:"/mooc/CourseServlet?method=getSecondCatalogInfo",
				          type:"post",
			              data:{"id":data[i].id},
			              dataType:"json",
				          success:function(second){
				             for(var j=0;j<second.length;j++){
				                 div+="<div class='second-level selected'>"
				                  div+="<span>"+(i+1)+"."+(j+1)+" "+second[j].subcatalogname+"</span>";
				                 div+="</div>";
				             }
				          }
				       
				       })
				   
				   
				   
				   
				   div+="</div>";
				}
				//将动态生成的div，添加到课程大纲中
				$(".coursedg").append(div);
				
			}
			
			})

		})
		
		
	</script>
</body>
</html>
