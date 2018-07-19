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

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script src="js/jquery.ui.widget.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.xdr-transport.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload-ui.css"
	type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload.css" type="text/css"></link>
<style type="text/css">
.bar {
	margin-top: 10px;
	height: 10px;
	max-width: 300px;
	background: green;
}

.col-lg-7 {
	margin-top: 30px;
	margin-bottom: 15px;
	margin-left: 100px;
}

.fileinput-button {
	margin: 30px;
}

.progress {
	height: 50px;
}
</style>

</head>
<body>
	<div class="col-lg-7">
		<span>请上传：</span> <span style='color:blue;'>(支持'3gp','rmvb','flv','wmv','avi','mkv','mp4','wav'格式),最大限制为500MB</span><br />
		<span class="btn btn-success fileinput-button"> <i
			class="glyphicon glyphicon-plus"></i> <span>添加/替换文件...</span> <input
			type="file" class="upinput" name="file" multiple> </span>
	</div>
	<!-- 上传进度条及状态： -->
	<input type="hidden" value="${map.id}" id="cid">
	<input type="hidden" value="${map.state}" id="cstate">
	<div class="progress">
		<div class="bar" style="width: 0%;"></div>
		<div class="upstatus" style="margin-top:10px;"></div>
	</div>
	<div class="preview">
		<embed src="${map.videos}" allowscriptaccess='always'
			allowfullscreen='true' wmode='opaque' " style="margin-left:200px;"
			width='600' height='340'>

		</embed>
	</div>
	<script type="text/javascript">
		$(".upinput")
				.fileupload(
						{
							url : "/mooc/before/editor/uploadVideo",//文件上传地址，当然也可以直接写在input的data-url属性内  
							dataType : "json", //如果不指定json类型，则传来的json字符串就需要解析jQuery.parseJSON(data.result);  
							formData : function(form) {//如果需要额外添加参数可以在这里添加  
								return [ {
									name : "catalogid",
									value : $("#cid").val()
								}, {
									name : "state",
									value : $("#cstate").val()
								} ]
							},
							add : function(e, data) {
								var uploadErrors = [];

								var acceptFileTypes =/(\.|\/)(3gp|flv|rmvb|mp4|wmv|avi|mkv|mp3|wav)$/i;
								if (data.originalFiles[0]['type'].length
										&& !acceptFileTypes.test(data.originalFiles[0]['type'])) {
									uploadErrors
											.push('请上传正确的视频格式');
								}

								console.log(data.originalFiles[0]['size']);
								if (data.originalFiles[0]['size'] > 524288000) {
									uploadErrors
											.push('视频最大为500MB');
								}
								if (uploadErrors.length > 0) {
									alert(uploadErrors.join("\n"));
								} else {
									data.context = $('<p/>')
											.text('Subiendo...').appendTo(
													document.body);
									data.submit();
								}

							},done : function(e, data) {
								//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api  
								//注意data要和jquery的ajax的data参数区分，这个对象包含了整个请求信息  
								//返回的数据在data.result中，这里dataType中设置的返回的数据类型为json  
								if (data.result.sta) {
									// 上传成功：  
									$(".upstatus").html(
											data.result.oldfilename
													+ data.result.msg);
									$(".preview")
											.html(
													"<embed src="+data.result.previewSrc+  
                " allowscriptaccess='always' allowfullscreen='true' wmode='opaque'"+  
                " width='600px' height='340px' style='margin-left:200px;'></embed>");
								} else {
									// 上传失败：  
									$(".progress .bar").css("width", "0%");
									$(".upstatus").html(
											"<span style='color:red;'>"
													+ data.result.oldfilename
													+ data.result.msg
													+ "</span>");
								}

							},
							progress : function(e, data) {//上传进度  
								var progress = parseInt(data.loaded
										/ data.total * 100, 10);
								$(".progress .bar")
										.css("width", progress + "%");
								$(".upstatus").html("正在上传...");
							},
							processfail : function(e, data) {
								var currentFile = data.files[data.index];
								if (data.files.error && currentFile.error) {
									console.log(currentFile.error);
								}
							},
						});
	</script>
</body>
</html>