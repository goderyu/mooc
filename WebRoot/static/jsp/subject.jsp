<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
        
		.wrap{
			width: 930px;
            background-color: #f7f7f7;
			margin-top: 15px;
			font-size: 16px;
		}
		.total{
			margin-top: 78px !important;
			font-size: 14px;
		}
		.content{
			padding-bottom: 23px;
            padding-left: 5px;
           	height:172px;
		}
		ul li{
			list-style:none;
		}
		.current{
			background-color: #55b929;
            color: #fff;
			cursor: pointer;
			width:128px;
			text-align: center;
		}
		.img{
			margin-right: 6px;
			top: 4px;
			position: relative;
			width:16px;
			height:19px;
		}
		.btn{
			margin-right: 6px;
			top: 1px;
			position: relative;
		}
		.icon {
			margin-left: 4px;
			vertical-align: middle;
		}
		.content li{
			line-height: 30px;
		}
		a {
			text-decoration:none;
		}
		.bar{
			padding: 35px 5px;
			border: 1px solid #e6e6e6;
			padding-bottom:35px;
			padding-top:25px;
		}
		.u_bar_left{
			float:left;
		}
		.u_bar_right{
			float:right;
		}
		.u_bar_left li, .u_bar_right li{
			padding: 0px 15px;
			font-size: 14px;
			line-height: 14px;
			cursor: pointer;
		}
		.f_fl{
			float:left;
		}
		.f_rl{
			float:right;
		}
	</style>
  </head>
  
  <body>
<jsp:include page="/static/jsp/header.jsp"></jsp:include>
<div class="total"><a href="">首页</a> >全部课程 </div>
<div class="wrap">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="content"> 
		<tr> 
			<td class="current">
				<span class="img"><img alt="" src="img/quanbu.png"></span>
				<a href=""><span class="btn">全部</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/jisuan.png"></span>
				<a href=""><span class="btn">计算机</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/jingji.png"></span>
				<a href=""><span class="btn">经济管理</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/xinlixue.png"></span>
				<a href=""><span class="btn">心理学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/jisuan.png"></span>
				<a href=""><span class="btn">外语</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/yuwen.png"></span>
				<a href=""><span class="btn">文学历史</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/yishu.png"></span>
				<a href=""><span class="btn">艺术设计</span></a>
			</td>  
		</tr> 
		<tr> 
			<td class="current">
				<span class="img"><img alt="" src="img/gong.png"></span>
				<a href=""><span class="btn">工学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/li.png"></span>
				<a href=""><span class="btn">理学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/sheng.png"></span>
				<a href=""><span class="btn">生命科学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/zhe.png"></span>
				<a href=""><span class="btn">哲学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/fa.png"></span>
				<a href=""><span class="btn">法学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/jiaoyu.png"></span>
				<a href=""><span class="btn">教育教学</span></a>
			</td> 
			<td class="current">
			    <span class="img"><img alt="" src="img/qita.png"></span>
				<a href=""><span class="btn">其他</span>
					<span class="icon"><img alt="" src="img/icon.png"></span>
				</a>
			</td>  
		</tr> 
</table> 
</div>

<div class="bar">
	<ul class="u_bar_left">
		<li class="f_fl">全部</li>
		<li class="f_fl">正在进行</li>
		<li class="f_fl">即将开始</li>
		<li class="f_fl">已结束</li>
	</ul>
	<ul class="u_bar_right">
		<li class="f_rl">综合排序</li>
		<li class="f_rl">热门</li>
		<li class="f_rl">最新</li>	
	</ul>
</div>
 <jsp:include page="/static/jsp/foot.jsp"></jsp:include>
 </body>
</html>
