<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload-ui.css"
	type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload.css" type="text/css"></link>
<style type="text/css">
.col-lg-7 {
	margin-top: 100px;
}

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

th {
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
	<div class="col-lg-7">
		<span>请上传：</span> <span style='color:blue;'>文件最大限制为50MB</span><br />
		<span class="btn btn-success fileinput-button"> <i
			class="glyphicon glyphicon-plus"></i> <span>添加文件...</span> <input
			type="file" class="upinput" name="file" multiple> </span>
	</div>
	<table class="table table-bordered">
		<caption>资料库</caption>
		<thead>
			<tr>
				<th width="60px" style="text-align: center;">序号</th>
				<th width="300px" style="text-align: center;">文件名</th>
				<th width="120px" style="text-align: center;">上传时间</th>
				<th width="300px" style="text-align: center;">操作</th>
			</tr>
		</thead>
		<tbody class="addtable">
			<c:forEach items="${list}" var="l" varStatus="count">
				<tr>
					<td>${count.count}</td>
					<td class="fileName">${l.fileName}</td>
					<td><f:parseDate value="${l.fileDate}" var="date"
							pattern="yyyy-MM-dd HH:mm:ss" /> <f:formatDate value="${date}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<form action="/mooc/before/file/deletefile"
							style="display:inline-block;" method="post">
							<input type="hidden" name="id" class="zlid" value="${l.id}">
							<button class="btn btn-danger" onclick="return deleteBtn();">删除文件</button>
						</form>
						<button class="btn btn-success updatezl" data-toggle="modal"
									data-target="#updateModal">修改作业</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改文件名</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal"
						action="/mooc/before/file/updatefile" method="post">
						<input type="hidden" name="id" id="zlid">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">文件名称:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="fileName"
									id="updatefileName" placeholder="请输入文件名" required="required">
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
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/jquery.iframe-transport.js"></script>
	<script src="js/jquery.fileupload.js"></script>
	<script src="js/jquery.xdr-transport.js"></script>
	<script type="text/javascript">
		$(".upinput")
				.fileupload(
						{
							url : "/mooc/before/file/uploadfile",//文件上传地址，当然也可以直接写在input的data-url属性内  
							dataType : "json", //如果不指定json类型，则传来的json字符串就需要解析jQuery.parseJSON(data.result);  
							add : function(e, data) {
								var uploadErrors = [];
								console.log(data.originalFiles[0]['size']);
								if (data.originalFiles[0]['size'] > 52428800) {
									uploadErrors.push('文件最大为50MB');
								}
								if (uploadErrors.length > 0) {
									alert(uploadErrors.join("\n"));
								} else {
									data.context = $('<p/>')
											.text('Subiendo...').appendTo(
													document.body);
									data.submit();
								}

							},
							done : function(e, data) {
								//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api  
								//注意data要和jquery的ajax的data参数区分，这个对象包含了整个请求信息  
								//返回的数据在data.result中，这里dataType中设置的返回的数据类型为json  
								if (data.result.sta) {
									var num = $(".addtable").children().length;
									$(".addtable")
											.append(
													"<tr>"
															+ "<td>"
															+ (num + 1)
															+ "</td>"
															+ "<td>"
															+ data.result.oldfilename
															+ "</td>"
															+ "<td>"
															+ new Date()
																	.Format('yyyy-MM-dd HH:mm:ss')
															+ "</td>"
															+ "<td><form action='/mooc/before/file/deletefile'"
							+"style='display:inline-block;' method='post'>"
															+ "<input type='hidden' name='id' value='"+data.result.id+"'>"
															+ "<button class='btn btn-danger' onclick='return deleteBtn();'>删除文件</button>"
															+ "</form>  <button class='btn btn-success updatezl' data-toggle='modal'"
									+"data-target='#updateModal'>修改作业</button></td>"
															+ "</tr>");
								}
							},
							processfail : function(e, data) {
								var currentFile = data.files[data.index];
								if (data.files.error && currentFile.error) {
									console.log(currentFile.error);
								}
							},
						});
		Date.prototype.Format = function(fmt) { //author: meizz   
			var o = {
				"M+" : this.getMonth() + 1, //月份   
				"d+" : this.getDate(), //日   
				"H+" : this.getHours(), //小时   
				"m+" : this.getMinutes(), //分   
				"s+" : this.getSeconds(), //秒   
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度   
				"S" : this.getMilliseconds()
			//毫秒   
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
		function deleteBtn() {
			if (confirm("确认删除吗？")) {
				return true;
			}
			return false;
		}
		$(".updatezl").click(function() {
			var index = $(".updatezl").index(this);
			var zlid = $(".zlid").eq(index).val();
			var fileName = $(".fileName").eq(index).text();
			$("#zlid").val(zlid);
			$("#updatefileName").val(fileName);
		})
	</script>

</body>
</html>



























