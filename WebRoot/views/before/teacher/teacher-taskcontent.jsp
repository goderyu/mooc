<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
.table {
	margin-top: 20px;
	margin-left: 30px;
}

.add-btn {
	margin-top: 100px;
	margin-left: 30px;
}

button {
	margin-left: 10px;
}

caption {
	margin-top: 20px;
	margin-bottom: 30px;
}

.table-hover tr th {
	text-align: center;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<form action="/mooc/before/course/coursecontent"
		method="post" style="display:inline-block;">
		<button class="btn btn-success add-btn">返回课程目录</button>
	</form>
	<button type="button" class="btn btn-success add-btn"
		data-toggle="modal" data-target="#myModal">添加作业</button>
	<table class="table table-hover">
		<caption>第一章作业</caption>
		<thead>
			<tr>
				<th width="30px">题号</th>
				<th width="100px">题目</th>
				<th width="100px">选项A</th>
				<th width="100px">选项B</th>
				<th width="100px">选项C</th>
				<th width="100px">选项D</th>
				<th width="60px">正确选项</th>
				<th width="180px">解析</th>
				<th width="150px">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="l" varStatus="count">
				<tr>
					<td style="vertical-align: middle;">${count.count}</td>
					<td class="subjecttext" style="vertical-align: middle;">${l.subjecttext}</td>
					<td class="optiona" style="vertical-align: middle;">${l.optiona}</td>
					<td class="optionb" style="vertical-align: middle;">${l.optionb}</td>
					<td class="optionc" style="vertical-align: middle;">${l.optionc}</td>
					<td class="optiond" style="vertical-align: middle;">${l.optiond}</td>
					<td class="correctoption" style="vertical-align: middle;">${l.correctoption}</td>
					<td class="analysis" style="vertical-align: middle;">${l.analysis}</td>
					<td style="vertical-align: middle;">
						<button class="btn btn-success updatesubject"  data-toggle="modal" data-target="#updateModal">修改作业</button>
						<form action="/mooc/before/teacher/deletesubject" method="post" style="display:inline-block;">
							<input type="hidden" class="subjectid" value="${l.id}" name="id">
							<button class="btn btn-danger" onclick="return deleteBtn();">删除作业</button>
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加题目信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="/mooc/before/teacher/insertsubject"
						method="post">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">题目:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="subjecttext"
									 placeholder="请输入题目内容" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项A:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optiona"
									 placeholder="请输入选项A" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项B:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optionb"
									 placeholder="请输入选项B" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项C:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optionc"
									 placeholder="请输入选项C" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项D:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optiond"
									 placeholder="请输入选项D" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">正确选项:</label>
							<div class="col-sm-7">
								<select class="form-control" name="correctoption">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">解析:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="analysis"
									id="taskname" placeholder="请输入解析" required="required">
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-success" id="addtsubject">添加题目</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改作业信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="/mooc/before/teacher/updatesubject"
						method="post">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">题目:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="subjecttext"
									id="updatesubjecttext" placeholder="请输入题目内容" required="required">
							</div>
						</div>
						<input id="subjectid" type="hidden" name="id">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项A:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optiona"
									id="updateoptiona" placeholder="请输入选项A" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项B:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optionb"
									id="updateoptionb" placeholder="请输入选项B" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项C:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optionc"
									id="updateoptionc" placeholder="请输入选项C" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">选项D:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="optiond"
									id="updateoptiond" placeholder="请输入选项D" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">正确选项:</label>
							<div class="col-sm-7">
								<select class="form-control" id="updatecorrectoption" name="correctoption">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">解析:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="analysis"
									id="updateanalysis" placeholder="请输入解析" required="required">
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-success" id="addtask">确认修改</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<div style="margin-top:50px;"></div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
		function deleteBtn(){
			if(confirm("确认删除吗？")){
				return true;
			}
			return false;
		}
		$(".updatesubject").click(function(){
			var index=$(".updatesubject").index(this);
			var subjectid=$(".subjectid").eq(index).val();
			var subjecttext=$(".subjecttext").eq(index).text();
			var optiona=$(".optiona").eq(index).text();
			var optionb=$(".optionb").eq(index).text();
			var optionc=$(".optionc").eq(index).text();
			var optiond=$(".optiond").eq(index).text();
			var correctoption=$(".correctoption").eq(index).text();
			var analysis=$(".analysis").eq(index).text();
			$("#subjectid").val(subjectid);
			$("#updatesubjecttext").val(subjecttext);
			$("#updateoptiona").val(optiona);
			$("#updateoptionb").val(optionb);
			$("#updateoptionc").val(optionc);
			$("#updateoptiond").val(optiond);
			$("#updatecorrectoption").val(correctoption);
			$("#updateanalysis").val(analysis);
		})
	</script>
</body>
</html>



























