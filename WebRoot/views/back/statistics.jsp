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
			<legend>平台统计</legend>
		</fieldset>
		
		<div class="layui-form">
		  <table class="layui-table">
		    <colgroup>
		      <col width="150">
		      <col width="150">
		      <col width="200">
		      <col>
		    </colgroup>
		    <thead>
		      <tr>
		        <th>统计对象</th>
		        <th>统计结果</th>
		      </tr> 
		    </thead>
		    <tbody>
		    	<c:forEach items="${usercount}" var="u">
		    		<tr>
				        <td>${u.name}</td>
				        <td>${u.count}</td>
				    </tr>
		    	</c:forEach>
		    </tbody>
		  </table>
		</div>
		
	</body>

</html>