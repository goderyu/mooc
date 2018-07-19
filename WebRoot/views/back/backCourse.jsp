<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <title>课程管理数据的展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css" />
	<link rel="stylesheet" href="back/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<style type="text/css">
		#courselist{
			margin-bottom:0;
		}
	</style>
  </head>
  
  <body style="width:auto;">
      <div class="courselist" id="courselist" style="width:auto;">
      
		<c:forEach items="${list}" var="list">
			<div class="course-main" style="position:relative;">
				<div class="computer-course">
					<div class="course">
						<div class="course-img">
							<img src="${list.courseImg}">
						</div>
					</div>
					<div class="course-text">
						<div class="course-name">${list.courseName}</div>
						<div style="margin-top:30px;margin-left:10px;">
							<span>华北水利水电大学</span> <img
								style="margin-left: 30px;" src="img/course/count.png"> <span
								style="margin-left:10px;">${list.count}</span>
						</div>
						<div style="margin-left:10px;">${list.courseIntroduce}</div>
					</div>
				</div>
				<button onclick="selectClass('${list.id}');" style="padding:3px 15px;border:0;border-radius:2px;color:white;background-color:#009688;">查看</button>
				<button onclick="deleteClass('${list.id}');" style="padding:3px 15px;border:0;border-radius:2px;color:white;background-color:#FF5722;">删除</button>
			</div>
		</c:forEach>
	</div>
	
	<div id="showClass" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
		<div style="width:800px;background-color:white;padding:20px;margin:50px auto;">
			<fieldset class="layui-elem-field layui-field-title">
				<legend>课程简介</legend>
			</fieldset>
			<a style="margin-left:600px;cursor:pointer;" onclick="baseClass();">查看详情</a>
			<br>
			<span>课程名：</span><span id="classname"></span><br><br>
			<span>课程描述：</span><span id="courseIntroduce"></span><br><br>
			<span>课程概要：</span><span id="courseSummary"></span><br><br>
			<span>老师姓名：</span><span id="teachername"></span><br><br>
			<button class="layui-btn" style="margin-left:350px;" onclick="hideClass();">关闭</button>
		</div>
	</div>
	
	<div id="showBaseClass" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
		<div style="width:600px;background-color:white;padding:20px;margin:50px auto;">
			<fieldset class="layui-elem-field layui-field-title">
				<legend>课程详情</legend>
			</fieldset>
			<div class="classcontent"></div>
			<button class="layui-btn" style="margin-left:250px;" onclick="hideClass();">关闭</button>
		</div>
	</div>
	
	<div class="showVedio" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
		<div style="width:600px;background-color:white;padding:20px;margin:50px auto;">
			<div class="childvedio"></div>
			<button class="layui-btn" style="margin-left:350px;" onclick="hideVideo();">关闭</button>
		</div>
	</div>
	
	<div class="showtext" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
		<div style="width:600px;background-color:white;padding:20px;margin:50px auto;">
			<div class="childtext" style="height:auto;"></div>
			<button class="layui-btn" style="margin-left:350px;" onclick="hideVideo();">关闭</button>
		</div>
	</div>
	<script type="text/javascript">
		function deleteClass(id){
			window.location.href="/mooc/back/backCourse/delete?id="+id;
		}
		function selectClass(id){
			$.post("/mooc/back/backCourse/selectcourse",
				{
					id:id
				},
				function(data){
					$(".classcontent").html("");
					$("#classname").html(data.coursebase.courseName);
					$("#courseIntroduce").html(data.coursebase.courseIntroduce);
					$("#courseSummary").html(data.coursebase.courseSummary);
					$("#teachername").html(data.coursebase.userName);
					for ( var a in data.courselist) {
						if(data.courselist[a].cataloVideo != null){
							var vedioStr1 = "'"+data.courselist[a].cataloVideo+"'";
						}else{
								vediostr1 = null;
							}
						var childcontent = "";
						for ( var b in data.courselist[a].courseSecondCatalog) {
							if(data.courselist[a].courseSecondCatalog[b].scataloVideo != null){
								var vediostr = "'"+data.courselist[a].courseSecondCatalog[b].scataloVideo+"'";
							}else{
								vediostr = null;
							}
							var child = '<div>'+
								'<span>&nbsp;&nbsp;&nbsp;&nbsp;子章节名称：</span><span>'+data.courselist[a].courseSecondCatalog[b].scatalogName+'</span>'+
								'&nbsp;&nbsp;&nbsp;&nbsp;<a style="cursor:pointer;" onclick="cons('+data.courselist[a].courseSecondCatalog[b].id+');">内容</a>'+
								'&nbsp;&nbsp;&nbsp;&nbsp;<a style="cursor:pointer;" onclick="ved('+vediostr+');">视频</a>'
								+'</div>';
							childcontent = childcontent + child;
						}
						$(".classcontent").append('<div>'+
						'<span>章节名称：</span><span>'+data.courselist[a].catalogName+'</span>'+
						'&nbsp;&nbsp;&nbsp;&nbsp;<a style="cursor:pointer;" onclick="con('+data.courselist[a].id+');">内容</a>'+
								'&nbsp;&nbsp;&nbsp;&nbsp;<a style="cursor:pointer;" onclick="ved('+vedioStr1+');">视频</a>'+
						childcontent
						+'<br></div>');
					}
				}
			);
			$("#showClass").show();
		}
		function hideClass(){
			$("#showClass").hide();
			$("#showBaseClass").hide();
		}
		function baseClass(){
			$("#showClass").hide();
			$("#showBaseClass").show();
		}
		function con(id){
			$.post("/mooc/back/backCourse/getFirstText",
				{id:id},
				function(data){
					$(".showtext").show();
					if(data == null){
						$(".childtext").html("暂无");
					}else{
						$(".childtext").html(data);
					}
				}
			);
		}
		function cons(id){
			$.post("/mooc/back/backCourse/getSecondText",
				{id:id},
				function(data){
					$(".showtext").show();
					if(data == null){
						$(".childtext").html("暂无");
					}else{
						$(".childtext").html(data);
					}
				}
			);
		}
		function ved(url1){
			if(url1 != null && url1 != ""){
				$(".childvedio").html("");
				$(".showVedio").show();
				$(".childvedio").append('<embed src='+url1+' width="500px;" height="300px;"></embed>');
			}else{
				alert("暂无");
			}
		}
		function hideVideo(){
			$(".showVedio").hide();
			$(".showtext").hide();
		}
	</script>
  </body>
</html>
