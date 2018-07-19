<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<title>MOOC后台登录</title>
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
	</head>

	<body>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>角色管理</legend>
		</fieldset>
		<a class="layui-btn" onclick="addRole();" style="margin-left:1000px;">添加角色</a>
		<br>
		<br>
		<span style="font-size:17px;">平台角色如下:</span>
		<br>
		<br>
		<div class="layui-collapse" lay-accordion="">
				<div class="layui-colla-item">
					<h2 class="layui-colla-title">超级管理员</h2>
					<div class="layui-colla-content">
						<p><span style="margin-left:50px;">超级管理员拥有平台所有权限</span></p>
					</div>
				</div>
			<c:forEach items="${list}" var="l">
				<div class="layui-colla-item">
					<h2 class="layui-colla-title">${l.roleName}
						<a onclick="updateRole('${l.roleId}');" class="layui-btn layui-btn-normal" style="margin-left:600px;">修改信息</a>
						<a onclick="updatePermission('${l.roleId}');" class="layui-btn" style="margin-left:30px;">修改权限</a>
						<a onclick="delrole('${l.roleId}');" class="layui-btn layui-btn-danger" style="margin-left:30px;">移除角色</a>
					</h2>
					<c:forEach items="${l.permissions}" var="p">
						<div class="layui-colla-content">
							<p>
								<span style="margin-left:50px;">${p.name}</span>
								<span style="margin-left:100px;">${p.pInfo}</span>
							</p>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		
		<div id="addRoleDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:500px;margin:50px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/backrole/insertRole" method="post">
					<span style="font-size:18px;">添加角色</span>
					<br>
					<br>
					<label class="layui-form-label">角色名</label>
					<div class="layui-input-block">
						<input required="required" type="text" name="roleName" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
					</div>
					<br>
					<label class="layui-form-label">角色标识</label>
					<div class="layui-input-block">
						<input required="required" type="text" name="roleCode" lay-verify="title" autocomplete="off" placeholder="请输入标识" class="layui-input">
					</div>
					<br>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">角色描述</label>
						<div class="layui-input-block">
							<textarea required="required" name="roleDesc" placeholder="请输入内容" class="layui-textarea"></textarea>
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
		
		<div id="updateRoleDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:500px;margin:50px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/backrole/updateRole" method="post">
					<span style="font-size:18px;">修改角色信息</span>
					<br>
					<br>
					<label class="layui-form-label">角色名</label>
					<div class="layui-input-block">
						<input required="required" id="roleNameinput" type="text" name="roleName" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
					</div>
					<br>
					<label class="layui-form-label">角色标识</label>
					<div class="layui-input-block">
						<input required="required" id="roleCodeinput" type="text" name="roleCode" lay-verify="title" autocomplete="off" placeholder="请输入标识" class="layui-input">
					</div>
					<br>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">角色描述</label>
						<div class="layui-input-block">
							<textarea required="required" id="roleDesctextarea" name="roleDesc" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<br>
					<input name="roleId" type="hidden" id="roleIdinput">
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认修改</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		
		<div id="updatePerDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:500px;margin:50px auto;background-color:white;padding:20px;">
				<form class="layui-form" action="/mooc/back/backrole/updateRolePermission" method="post">
					<div class="layui-form-item">
					    <label class="layui-form-label">修改权限</label>
					    <br>
					    <br>
					    <br>
					    <br>
					    <div class="layui-input-block" id="checkboxdiv">
					    </div>
					  </div>
					<input name="rolePerId" type="hidden" id="roleperIdinput">
					<br>
					    <br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认修改</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		
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
			function addRole(){
				$("#addRoleDiv").show();
			}
			function hideAdd(){
				$("#addRoleDiv").hide();
				$("#updateRoleDiv").hide();
				$("#updatePerDiv").hide();
			}
			function updateRole(id){
				$.post("/mooc/back/backrole/getOneRole",
					{
						id:id
					},
					function(data){
						$("#roleNameinput").val(data.roleName);
						$("#roleCodeinput").val(data.roleCode);
						$("#roleDesctextarea").val(data.roleDesc);
						$("#roleIdinput").val(id);
						$("#updateRoleDiv").show();
					}
				);
			}
			function updatePermission(id){
				$("#roleperIdinput").val(id);
				$.post("/mooc/back/backrole/getRolePermission",
					{id:id},
					function(data){
						$("#checkboxdiv").html("");
						for ( var i in data.yesPermissions) {
							var str = $("<input type='checkbox' name='idlist' value="+data.yesPermissions[i].id+" title="+data.yesPermissions[i].name+" checked='checked'>");  
							$("#checkboxdiv").append(str); 
							layui.use('form', function(){
						        var form = layui.form();
						        //根据的type类型修改
						        form.render('checkbox');
						    });
						}
						for ( var i in data.noPermissions) {
							var str = $("<input type='checkbox' name='idlist' value="+data.noPermissions[i].id+" title="+data.noPermissions[i].name+">");  
							$("#checkboxdiv").append(str); 
							$("#checkboxdiv").append(str); 
							layui.use('form', function(){
						        var form = layui.form();
						        //根据的type类型修改
						        form.render('checkbox');
						    });
						}
					}
				);
				$("#updatePerDiv").show();
			}
			function delrole(roleId){
				if(confirm("确定要删除吗？")){
					window.location.href="/mooc/back/backrole/deleteRole?id="+roleId;
				}
			}
		</script>
	</body>

</html>