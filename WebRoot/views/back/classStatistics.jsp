<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/back/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<title>MOOC后台统计</title>
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
		<style type="text/css">

		</style>
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>课程统计</legend>
		</fieldset>
		
		<div class="layui-form">
		  <table class="layui-table">
		    <colgroup>
		      <col width="100">
		      <col width="150">
		      <col width="150">
		      <col width="200">
		      <col>
		    </colgroup>
		    <thead>
		      <tr>
		        <th style="text-align:center;">热度</th>
		        <th>课程名</th>
		        <th>学习人数</th>
		        <th>点击数</th>
		      </tr> 
		    </thead>
		    <tbody>
		    	<c:forEach items="${classinfo}" var="c" varStatus="index">
		    		<tr>
				        <td style="text-align:center;">
				        	<c:choose>
				        		<c:when test="${index.index+1 == 1}">
						        	<div style="color:red;"><i class="layui-icon">&#xe756;</i>${index.index+1}</div>
				        		</c:when>
				        		<c:when test="${index.index+1 == 2}">
						        	<div style="color:#FF5722;"><i class="layui-icon">&#xe756;</i>${index.index+1}</div>
				        		</c:when>
				        		<c:when test="${index.index+1 == 3}">
						        	<div style="color:#FFB800;"><i class="layui-icon">&#xe756;</i>${index.index+1}</div>
				        		</c:when>
				        		<c:otherwise>
				        			<div>${index.index+1}</div>
				        		</c:otherwise>
				        	</c:choose>
				        </td>
				        <td>${c.coursename}</td>
				        <td>${c.count}</td>
				        <td>${c.clickRate}</td>
				    </tr>
		    	</c:forEach>
		    </tbody>
		  </table>
		</div>
		<script type="text/javascript" src="layui/layui.js"></script>
		<script>
		
		</script>
	</body>

</html>