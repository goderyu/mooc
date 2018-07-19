<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/back/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MOOC后台权限管理</title>
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
		<link rel="stylesheet" href="css/news.css" media="all" />
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	</head>

	<body class="childrenBody">
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		  <legend>系统公告</legend>
		</fieldset>  
		<a onclick="addNewNotice();" class="layui-btn layui-btn-normal" style="margin-left:1000px;margin-bottom:10px;">发布公告</a>
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
						<a onclick="deleteNotice('${b.id}');" class="layui-btn layui-btn-danger layui-btn-mini" style="float:right;"><i class="layui-icon">&#xe640;</i>删除</a>
					    <a onclick="updateNotice('${b.id}');" class="layui-btn layui-btn-mini" style="float:right;"><i class="iconfont icon-edit"></i>编辑</a>
				    </div>
				  </div>
			</c:forEach>
		</div>
		
		
		<div id="addNewNotice" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:500px;margin:100px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/backnotice/insertBackNotice" method="post">
					<span style="font-size:18px;">发布公告</span>
					<br>
					<br>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">公告内容</label>
						<div class="layui-input-block">
							<textarea required="required" name="noticeInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认发布</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		
		<div id="updateNotice" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:500px;margin:100px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/backnotice/updateBackNotice" method="post">
					<span style="font-size:18px;">修改公告</span>
					<br>
					<br>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">公告内容</label>
						<div class="layui-input-block">
							<textarea required="required" name="noticeInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
						<input name="id" type="hidden" id="noticeadminid"/>
					</div>
					<br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认修改</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		
		<form action="/mooc/back/backnotice/deleteBackNotice" method="post" style="display:none;" id="deletenoticeform">
			<input name="id" type="hidden" id="deletenoticeid">
		</form>
		
		<script type="text/javascript" src="layui/layui.js"></script>
		<script>
			layui.use('form', function () {  
		        var form = layui.form;  
		    });
			layui.use(['element', 'layer'], function() {
				var element = layui.element;
				var layer = layui.layer;

				//监听折叠
				element.on('collapse(test)', function(data) {
					layer.msg('展开状态：' + data.show);
				});
			});
			function addNewNotice(){
				$("#addNewNotice").show();
			}
			function hideAdd(){
				$("#addNewNotice").hide();
				$("#updateNotice").hide();
			}
			function updateNotice(id){
				$("#noticeadminid").val(id);
				$("#updateNotice").show();
			}
			function deleteNotice(id){
				$("#deletenoticeid").val(id);
				$("#deletenoticeform").submit();
			}
		</script>
	</body>

</html>