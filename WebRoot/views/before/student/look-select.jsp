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
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

ul li {
	list-style: none;
	display: inline-block;
}

button {
	border: 0;
	background-color: #55b929;
}

a {
	text-decoration: none;
}

ul {
	background-color: #55b929;
	text-align: center;
}

li a,button {
	padding: 10px 50px;
	font-size: 16px;
	color: white;
}

button:hover {
	cursor: pointer;
	color: #55b929;
	background-color: #eee;
}

</style>
</head>
<body>
	<ul>
		<li><a target="down" href="/mooc/before/student/coursetext?state=${state}&catalogid=${catalogid}"><button class="eword selected">查看文档</button>
		</a>
		</li>
		<li><a target="down" href="/mooc/before/student/coursevideo?state=${state}&catalogid=${catalogid}"><button
					class="evideo selected">查看视频</button>
		</a>
		</li>
		<li><a target="_window" href="/mooc/before/student/lookcontent"><button>返回</button></a>
		</li>
	</ul>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
		$(".selected").eq(0).css("background-color","#eee");
		$(".selected").eq(0).css("color","#55b929");
		$(".selected").click(function(){
			$(".selected").css("background-color","#55b929");
			$(".selected").css("color","white");
			$(this).css("background-color","#eee");
			$(this).css("color","#55b929");
		})
	</script>
</body>
</html>