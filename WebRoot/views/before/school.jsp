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
    
    <title>全部学校</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		* {
			box-sizing: border-box;
		}
		.total{
			margin-top: 60px;
			padding-left:60px;
			font-family: "微软雅黑";
			font-size: 40px;
		}
     	.row .col {
     	          
				  float: left;
				  width: 25%;
				  margin-top: 45px;
				  text-align: center;
	            }
	</style>
  </head>
  <body>
     <jsp:include page="/static/jsp/header.jsp"></jsp:include>
     <div class="total">全部学校</div>
     <div class="row">
    	<div class="col"><img alt="北京大学" src="img/beida.png" ></div> 
    	<div class="col"><img alt="浙江大学" src="img/zheda.png" ></div> 
    	<div class="col"><img alt="南京大学" src="img/nanjinda.png" ></div> 
    	<div class="col"><img alt="武汉大学" src="img/wuda.png" ></div><br/>
    	
    	<div class="col"><img alt="北京大学" src="img/beida.png" ></div> 
    	<div class="col"><img alt="浙江大学" src="img/zheda.png" ></div> 
    	<div class="col"><img alt="南京大学" src="img/nanjinda.png" ></div> 
    	<div class="col"><img alt="武汉大学" src="img/wuda.png" ></div><br/>
    	
    	<div class="col"><img alt="北京大学" src="img/beida.png" ></div> 
    	<div class="col"><img alt="浙江大学" src="img/zheda.png" ></div> 
    	<div class="col"><img alt="南京大学" src="img/nanjinda.png" ></div> 
    	<div class="col"><img alt="武汉大学" src="img/wuda.png" ></div><br/>
    	
    	<div class="col"><img alt="北京大学" src="img/beida.png" ></div> 
    	<div class="col"><img alt="浙江大学" src="img/zheda.png" ></div> 
    	<div class="col"><img alt="南京大学" src="img/nanjinda.png" ></div> 
    	<div class="col"><img alt="武汉大学" src="img/wuda.png" ></div><br/>
     </div>
     <jsp:include page="/static/jsp/foot.jsp"></jsp:include>
  </body>
</html>
