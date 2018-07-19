<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="UTF-8" src="js/main.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<link rel="stylesheet" type="text/css" href="css/courseinformation.css" />
  </head>
  <body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
  	<div class="wrap">
  	  	<div class="head">
  			<div><span class="wire"></span></div>
  	  		<div class="name">
  	  			<span>课程名称</span><br/>
  	  			<span class="teacher">老师姓名</span>
  	  		</div>
  			<div id="evaluate" class="evaluate">课程评价</div>
  	  	</div>
  	  	<div class="left">
  	  		<div class="picture"><img src="../static/img/person.png" /></div>
  	  		<div class="list">
  	  			<ul>
  	  				<li class="first">公告</li>
  	  				<li>评分标准</li>
  	  				<li>课件</li>
  	  				<li>测试与作业</li>
  	  				<li>讨论区</li>
  	  			</ul>
  	  		</div>
  	  		<div class="share">
  	  			<div class="share-1">课程分享</div>
  	  			<div class="map">
	  	  			<img src="../static/img/share1.png"/>
	  	  			<img src="../static/img/share2.png"/>
	  	  			<img src="../static/img/share3.png"/>
  	  			</div>
  	  		</div>
  	  		<div class="help"><a href="">帮助中心</a></div>
  	  	</div>
    </div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript">
		/* 课程评价 */
		$("#evaluate").mousedown(function(){
		    alert("鼠标在该段落上按下！");
		});
	</script>
  </body>
</html>



























