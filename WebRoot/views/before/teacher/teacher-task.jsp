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

th {
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
		<caption>作业信息列表</caption>
		<thead>
			<tr>
				<th style="width:150px;text-align: center;">作业名称</th>
				<th style="width:150px;text-align: center;">作业截止时间</th>
				<th style="width:500px;text-align: center;">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="l">
				<tr>
					<td class="taskname">${l.taskname}</td>
					<td class="sendtime">${l.endtime}</td>
					<td><c:choose>
							<c:when test="${l.state==0}">
								<form action="/mooc/before/teacher/toupdatetask"
									style="display:inline-block;" method="post">
									<input type="hidden" name="id" class="taskid" value="${l.id}">
									<button class="btn btn-success">完善作业</button>
								</form>
								<button class="btn btn-success updatetask" data-toggle="modal"
									data-target="#updateModal">修改作业</button>
								<form action="/mooc/before/teacher/updatetaskstate"
									style="display:inline-block;" method="post">
									<input type="hidden" name="id" value="${l.id}">
									<button class="btn btn-danger" onclick="return fabuBtn();">发布作业</button>
								</form>
								<form action="/mooc/before/teacher/deletetask"
									style="display:inline-block;" method="post">
									<input type="hidden" name="id" value="${l.id}">
									<button class="btn btn-danger" onclick="return deleteBtn();">删除作业</button>
								</form>
							</c:when>

							<c:otherwise>
								<form action="/mooc/before/teacher/tolookTask"
									style="display:inline-block;" method="post">
									<input type="hidden" name="id" class="taskid" value="${l.id}">
									<button class="btn btn-success">查看作业</button>
								</form>
								<form action="/mooc/before/teacher/deletetask"
									style="display:inline-block;" method="post">
									<input type="hidden" name="id" value="${l.id}">
									<button class="btn btn-danger" onclick="return deleteBtn();">删除作业</button>
								</form>

							</c:otherwise>
						</c:choose></td>
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
					<h4 class="modal-title" id="myModalLabel">添加作业信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="/mooc/before/teacher/addtask"
						method="post">
						<input type="hidden" name="courseid" value="${courseid}">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">作业名称:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="taskname"
									id="taskname" placeholder="请输入作业名称" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-4 control-label">截止时间:</label>
							<div class="col-sm-7">
								<input type="date" id="date" name="endtime" class="form-control">
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-success" id="addtask">添加作业</button>
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
					<form class="form-horizontal"
						action="/mooc/before/teacher/updatetask" method="post">
						<input type="hidden" name="courseid" value="${courseid}">
						<input type="hidden" name="id" id="taskid">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">作业名称:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="taskname"
									id="updatetaskname" placeholder="请输入作业名称" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-4 control-label">截止时间:</label>
							<div class="col-sm-7">
								<input type="date" id="updatedate" name="endtime"
									class="form-control">
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
		var date = new Date();
		var mouth = date.getMonth() + 1;
		if (mouth < 10) {
			mouth = "0" + mouth;
		}
		var day = date.getDate() + 1;
		if (day < 10) {
			day = "0" + day;
		}
		$("#date").val(date.getFullYear() + "-" + mouth + "-" + day);
		$("#date").prop("min", date.getFullYear() + "-" + mouth + "-" + day);
		$("#date").change(function() {
			if ($("#date").val() == "") {
				$("#date").val(date.getFullYear() + "-" + mouth + "-" + day);
			}
		})

		$(".updatetask").click(function() {
			var index = $(".updatetask").index(this);
			var taskid = $(".taskid").eq(index).val();
			var taskname = $(".taskname").eq(index).text();
			var endtime = $(".sendtime").eq(index).text();
			$("#taskid").val(taskid);
			$("#updatetaskname").val(taskname);
			$("#updatedate").val(endtime);
		})

		function deleteBtn() {
			if (confirm("确认删除吗？")) {
				return true;
			}
			return false;
		}
		
		function fabuBtn() {
			if (confirm("确认发布吗？（发布后将不能修改，请谨慎操作）")) {
				return true;
			}
			return false;
		}
	</script>
</body>
</html>



























