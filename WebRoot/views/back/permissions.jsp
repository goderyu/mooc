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
		<link rel="stylesheet" href="css/permission.css" media="all" />
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	</head>

	<body class="childrenBody">
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-inline" style="margin-left:1000px;">
				<a class="layui-btn" style="background-color:#5FB878" onclick="addPermission();">添加权限</a>
			</div>
			<!-- <div class="layui-inline">
				<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
			</div> -->
		</blockquote>
		<div class="layui-form links_list">
			<table class="layui-table">
				<colgroup>
					<col width="50">
					<col width="20%">
					<col>
					<col>
					<col>
					<col>
					<col width="13%">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>权限类名</th>
						<th>创建时间</th>
						<th>权限描述</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="links_content">
					<c:forEach items="${list}" var="l">
						<tr>
							<td></td>
							<td>${l.name}</td>
							<td>
								<f:formatDate value="${l.pTime}" pattern="yyyy年MM月dd日 hh:mm:ss" />
							</td>
							<td>${l.pInfo}</td>
							<td>
								<a class="layui-btn layui-btn-mini" onclick="updatea('${l.id}');"><i class="iconfont icon-edit"></i>编辑</a>
								<a class="layui-btn layui-btn-danger layui-btn-mini" onclick="delper('${l.id}');"><i class="layui-icon">&#xe640;</i>删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="page"></div>
		<div id="addDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:500px;margin:100px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/backpermission/addpermission" method="post">
					<span style="font-size:18px;">添加权限</span>
					<br>
					<br>
					<label class="layui-form-label">权限类名</label>
					<div class="layui-input-block">
						<input required="required" type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
					</div>
					<br>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">权限描述</label>
						<div class="layui-input-block">
							<textarea required="required" name="pInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认添加</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		<div id="updateDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;">
			<div style="width:100%;background-color:white;padding:20px;">
				<form action="/mooc/back/backpermission/updatepermission" method="post">
					<span style="font-size:18px;">修改权限信息</span>
					<span onclick="closeupdate();" style="cursor:pointer;margin-left:900px;font-size:40px;color:#FF5722;">×</span>
					<br>
					<br>
					<label class="layui-form-label">权限类名</label>
					<div class="layui-input-block">
						<input required="required" id="pername" type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
					</div>
					<input id="idinputhi" name="id" type="hidden">
					<br>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">权限描述</label>
						<div class="layui-input-block">
							<textarea required="required" id="perinfo" name="pInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认修改</button>
						<a class="layui-btn layui-btn-primary" onclick="hideUpdate();">取消</a>
					</div>
					<br>
					<span style="padding-left:50px;font-size:18px;">子权限如下:</span>
					<a class="layui-btn" style="margin-left:800px;" onclick="addchild();">添加子权限</a>
					<div id="radiodiv" style="padding:30px 50px;"></div>

				</form>
			</div>
			<div id="addchilddiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
				<div style="width:500px;margin:100px auto;background-color:white;padding:20px;">
					<span style="font-size:18px;">添加子权限</span>
					<br>
					<br>
					<label class="layui-form-label">权限名</label>
					<div class="layui-input-block">
						<input required="required" id="cnaminput" type="text" name="cname" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
					</div>
					<br>
					<div class="layui-form-item layui-form-text">
						<!-- <label class="layui-form-label">跳转路径</label>
						<div class="layui-input-block">
							<input required="required" id="curlinput" type="text" name="curl" lay-verify="title" autocomplete="off" placeholder="请输入跳转路径" class="layui-input">
						</div> -->
						<label class="layui-form-label">权限功能</label>
						<div class="layui-input-block">
						<form class="layui-form">
							<select name="curl" id="curlinput">
								<c:forEach items="${permissionChild}" var="p">
									<option value="${p.curl}">${p.cname}</option>
								</c:forEach>
							</select>
						</form>
						</div>
					</div>
					<br>
					<div style="text-align:center;">
						<button class="layui-btn" onclick="addchildtrue();">确认添加</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="layui/layui.all.js"></script>
		<script type="text/javascript" src="js/permission.js"></script>

	</body>

</html>