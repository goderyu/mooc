
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>欢迎进入mooc作业系统</title>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/test.css" rel="stylesheet"
	type="text/css" />
<style>
.hasBeenAnswer {
	background: #5d9cec;
	color: #fff;
}

.rt_nr1_title h1 {
	margin: 0px;
	line-height: 40px;
}

.rt_content_tt h2 {
	margin: 0px;
	line-height: 40px;
}
</style>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
	text-decoration: none;
}
.test{
padding-bottom: 100px;
}
.main{
height:auto;
margin-top:100px;
 margin-left:100px;
}
ul li{
list-style: none;
}
#upgettask{
width:200px;
height:50px;
border:0;
background-color:#55b929;
color:white;
margin-top:50px;
}
.wrap .coursecontent-head .selected {
	background-color: #999999;
	color: white;
	border-radius: 5px;
}

.wrap .coursecontent-head ul li:hover {
	cursor: pointer;
	background-color: #999999;
	color: white;
	border-radius: 5px;
}
</style>
</head>
<script src="js/jquery-2.1.0.js"></script>

<body>
<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<!-- container -->
	
	<div class="main">
		<!--nr start-->
		<div class="test_main">
			<div class="nr_left">
				<div class="test">
					<!-- 试卷表单 -->
					<h2>${taskname}</h2>
					<br><br>
					<form action="/mooc/before/student/upgivetest"  id="testform" method="post">
						<c:forEach items="${list}" var="l" varStatus="count">
							
							<div class="test_content_nr">
								<input class="${l.id}" type="hidden" value="${count.count-1}">
								<input class="result" type="hidden" name="selectResult">
								<input class="correctoption" type="hidden" value="${l.correctoption}">
								<input class="iscorrect" type="hidden"> 
								<ul>

									<li>
										<div class="test_content_nr_tt">
											<c:if test="${count.count==1}">
												<input value="${l.taskid}" name="taskid" type="hidden">
											</c:if>
											<i>${count.count}</i><font>${l.subjecttext}</font>
										</div>
										<div class="test_content_nr_main">
											<ul>
											
												<li class="option"><input type="radio"
													class="${l.id}" name="${l.id}" value="A" /> <label
													for="0_answer_1_option_1"> A.
														<p class="ue" style="display: inline;">${l.optiona}</p> </label></li>
												
												<li class="option"><input type="radio"
													class="${l.id}" name="${l.id}" value="B" /> <label
													for="0_answer_1_option_2"> B.
														<p class="ue" style="display: inline;">${l.optionb}</p> </label></li>

												<li class="option"><input type="radio"
													class="${l.id}" name="${l.id}" value="C" /> <label
													for="0_answer_1_option_3"> C.
														<p class="ue" style="display: inline;">${l.optionc}</p> </label></li>

												<li class="option"><input type="radio"
													class="${l.id}" name="${l.id}" value="D" /> <label
													for="0_answer_1_option_4"> D.
														<p class="ue" style="display: inline;">${l.optiond}</p> </label></li>
											</ul>
										</div>
										<script type="text/javascript">
											$('.${l.id}').click(function(){
												var index=$('.${l.id}').index(this);
												var selectval=$('.${l.id}').eq(index).val();
												var subjectnum =$('.${l.id}').eq(0).val();
												$(".result").eq(subjectnum).val(selectval);
												var correctoption=$('.correctoption').eq(subjectnum).val();
												if(selectval==correctoption){
												$('.iscorrect').eq(subjectnum).val(1);
												}else{
												$('.iscorrect').eq(subjectnum).val(0);
												}
											})
										</script>
									</li>
								</ul>
							</div>
						</c:forEach>
						<button type="button" id="upgettask">交卷</button>
						<input id="grade" type="hidden" name="correctlv">
						<script type="text/javascript">
							$("#upgettask").click(function(){
								var subjectNum=document.getElementsByClassName("iscorrect");
								var grade=0;
								for(var i=0;i<subjectNum.length;i++){
									if(subjectNum[i].value==""){
									   alert("第"+(i+1)+"题未回答，请认真作答");
									   return;
									}else{
									grade +=Number(subjectNum[i].value);
									}
								}
								$("#grade").val(((grade/subjectNum.length)*100).toFixed(2)+"%");
								$("#testform").submit();
							})
							
						</script>
					</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
</body>
</html>
