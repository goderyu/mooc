<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/static/back/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aaa.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="css/main.css" media="all" />
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
  </head>
  
  <body class="childrenBody">
  
  	<div class="panel_box row">
		<div class="panel col">
			<a href="javascript:;">
				<div class="panel_icon" style="background-color:#FF5722;">
					<i class="iconfont icon-dongtaifensishu" data-icon="icon-dongtaifensishu"></i>
				</div>
				<div class="panel_word userAll">
					<span>${usersCount.get(1).count}</span>
					<cite>${usersCount.get(1).name}</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;">
				<div class="panel_icon" style="background-color:#5FB878;">
					<i class="iconfont icon-dongtaifensishu" data-icon="icon-dongtaifensishu"></i>
				</div>
				<div class="panel_word userAll">
					<span>${usersCount.get(2).count}</span>
					<cite>${usersCount.get(2).name}</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;">
				<div class="panel_icon" style="background-color:#009688;">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word userAll">
					<span>${usersCount.get(0).count}</span>
					<cite>${usersCount.get(0).name}</cite>
				</div>
			</a>
		</div>
		<div class="panel col" style="margin-left:0px;">
			<a href="javascript:;">
				<div class="panel_icon" style="background-color:#2F4056;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word userAll">
					<span>${usersCount.get(3).count}</span>
					<cite>${usersCount.get(3).name}</cite>
				</div>
			</a>
		</div>
	</div>
  
  
  
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>登录信息</legend>
	</fieldset>
	<a onclick="morelog();" style="margin-left:1024px;cursor:pointer;">查看更多</a>
	<br><br>
	
     <table class="content">
        <c:forEach items="${userlog}" var="u">
	     	<tr>
	     		<td class="content-list">
	     			${u.aname}&nbsp;&nbsp;&nbsp;<f:formatDate value="${u.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	     			&nbsp;&nbsp;&nbsp;<span>登录系统</span>&nbsp;&nbsp;&nbsp;${u.loginIp}
	     			
	     		</td>
	     	</tr>
     	</c:forEach>
     </table>
     
     <div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>系统公告</legend>
		</fieldset>  
		<div class="layui-collapse" lay-accordion="">
			<c:forEach items="${backNotices}" var="b">
				 <div class="layui-colla-item">
				 
				    <h2 class="layui-colla-title">${b.aname}
					    <span style="float:right;">
					    	<f:formatDate value="${b.noticeTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
					    </span>
				    </h2>
				    <div class="layui-colla-content layui-show">
				    	${b.noticeInfo}
				    </div>
				  </div>
			</c:forEach>
		</div>
     </div>
     
     
     <div id="allLogDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="overflow:auto;height:340px;width:500px;margin:50px auto;background-color:white;padding:20px;">
				<div class="xdiv" style="margin-left:450px;font-size:25px;cursor:pointer;color:red;">×</div>
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;">
						<legend>全部登录信息</legend>
				</fieldset>
				<table class="alllog">
				     	
			     </table>
			</div>
		</div>
     <script type="text/javascript">
     	function morelog(){
     		$("#allLogDiv").show();
     		$(".alllog").html("");
     		$.post("/mooc/back/backhome/getAllLog",
     			function(data){
     				for ( var a in data) {
						$(".alllog").append('<tr>'+
				     		'<td>'+data[a].aname+'&nbsp;&nbsp;&nbsp;'+data[a].loginTime+'&nbsp;&nbsp;&nbsp;<span>登录系统</span>&nbsp;&nbsp;&nbsp;'+data[a].loginIp+'</td>'
				     	+'</tr>');
					}
     			}
     		);
     	}
     	$(".xdiv").click(function(){
     		$("#allLogDiv").hide();
     	});
     </script>
  </body>
</html>
