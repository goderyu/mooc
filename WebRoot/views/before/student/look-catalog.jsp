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
.wrap{
width:500px;
height:100%;
overflow: hidden;
}
.wrap .catalog {
	margin-top: 20px;
	margin-left: 5px;
	height: auto
}
.wrap .catalog .tittle {
	display:inline-block;
	margin: 20px;
	font-size: 25px;
}

.wrap .catalog .line {
	display: inline-block;
	border-top: 1px solid #999999;
}

.wrap .catalog .catalog-content .first-level {
	font-size: 16px;
	vertical-align: middle;
	margin-bottom: 5px;
}

.wrap .catalog .catalog-content .first-level b {
	position: relative;
	left: -20px;

}
.wrap .catalog .catalog-content .second-level:hover {
	background-color: #eee;
	cursor: pointer;
}
.first-level img{
	vertical-align: middle;
}
.wrap .catalog .catalog-content .second-level {
	margin: 5px 5px 10px 30px;
	padding:5px;
}

.wrap .catalog .catalog-content .first-level .first-level-text:hover {
	cursor: pointer;
	background-color: #eee;
}
.ljt{
	position: fixed;
	top:0;
	border-radius:0 30px 30px 0;
	left:-10px;
	cursor:pointer;
	background-color: gray;
	color:white;
	font-size:30px;
	padding:5px 20px;
}
.first-level-text
</style>
</head>
<body>

<div class="ljt">></div>
<div class="wrap">
	<div class="catalog">
		<div class="tittle">目录</div>
		<span class="line"></span><br>
		<div class="catalog-content">
			<c:forEach items="${firstlist}" var="firstl" varStatus="fcount">
				<div class="first-level " >
					<div class="first-level-text selected">
						<img src="img/course/level1.png" ><b>${fcount.count}</b><span
							class="levelname">${firstl.catalogname}</span>
						<input class="selectedcatalog" type="hidden" value="${firstl.id}">
						<input class="levelstate"  type="hidden" value="1">
					</div>
					<c:forEach items="${secondlists.get(fcount.count-1)}"
						var="secondl" varStatus="scount">
						<div class="second-level selected" >
							<b>${fcount.count}.${scount.count}</b><img
								src="img/course/level2.png"><span class="levelname">${secondl.subcatalogname}</span>
							<input class="selectedcatalog" type="hidden"  value="${secondl.id}">
						<input class="levelstate" type="hidden" value="2">
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
		$(".ljt").click(function(){
			var jt=$(".ljt").text();
			if(jt=='>'){
				$('#fra', window.parent.document).attr("cols", "*,50");
				$(".ljt").text("<");
			}else{
				$('#fra', window.parent.document).attr("cols", "75%,25%");
				$(".ljt").text(">");
			}
		});
		$(".selected").eq(0).css("background-color","#eee");
		$(".selected").click(function(){
			$(".selected").css("background-color","white");
			$(this).css("background-color","#eee");
			var index=$(".selected").index(this);
			var catalogid = $(".selectedcatalog").eq(index).val();
			var state =$(".levelstate").eq(index).val();
			top.ltop.location="/mooc/before/student/coursetop?state="+state+"&catalogid="+catalogid;
			top.down.location="/mooc/before/student/coursetext?state="+state+"&catalogid="+catalogid;
		});
		
	</script>
</body>
</html>