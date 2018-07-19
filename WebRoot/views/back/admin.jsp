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
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<title>MOOC后台登录</title>
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
		<style type="text/css">
			 .lablediv label{
			 	width:150px;
			 	vertical-align:left;
			 	display:inline-block;
			 	font-size:16px;
			 	margin:10px 0;
			 }
			 .lablediv span{
			 	font-size:17px;
			 }
		</style>
	</head>

	<body>
		<br>
		<a class="layui-btn" onclick="addAdmin();" style="margin-left:900px;">添加管理员</a>
		<br>
		<br>
		<div class="layui-form links_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="30%">
				<col>
				<col>
				<col>
				<col width="13%">
		    </colgroup>
		    <thead>
				<tr>
					<th>管理员用户名</th>
					<th>管理员角色</th>
					<th>在职情况</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="links_content">
		    	<tr>
		    		<td>admin</td>
		    		<td>超级管理员</td>
		    		<td>在职</td>
		    		<td>超管不可侵犯</td>
		    	</tr>
		    	<c:forEach items="${allAdminUser}" var="a">
		    		<tr>
		    			<td>${a.aname}</td>
		    			<td>${a.roleName}</td>
		    			<td>
		    				<c:choose>
		    					<c:when test="${a.estatus == 1}">在职</c:when>
		    					<c:otherwise>停职</c:otherwise>
		    				</c:choose>
		    			</td>
		    			<td>
		    				<c:choose>
		    					<c:when test="${id==a.id}">
		    						不要改自己哦
		    					</c:when>
		    					<c:otherwise>
				    				<a onclick="selectInfo('${a.aname}');" class="layui-btn layui-btn-normal layui-btn-mini"><i class="layui-icon">&#xe615;</i>查看</a>
				    				<a onclick="updateInfo('${a.aname}${a.roleName}');" class="layui-btn layui-btn-mini"><i class="layui-icon">&#xe642;</i>编辑</a>
									<a onclick="deleteAdmin('${a.id}');" class="layui-btn layui-btn-danger layui-btn-mini"><i class="layui-icon">&#xe640;</i>删除</a>
		    					</c:otherwise>
		    				</c:choose>
		    			</td>
		    		</tr>
		    		
		    		<div id="${a.aname}" class="selectInfoDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:99;">
						<div style="width:100%;background-color:white;padding:20px;">
							  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
							    <legend>管理员基本信息</legend>
							  </fieldset>
							   <span onclick="closeSelectInfo();" style="cursor:pointer;margin-left:900px;font-size:40px;color:#FF5722;">×</span>
							   <div style="padding-left:100px;" class="lablediv">
								   	<label>用户名</label>
										<span>${a.aname}</span><br>
									<label>姓名</label>
										<span>${a.ename}</span><br>
									<label>性别</label>
										<span>${a.esex}</span><br>
									<label>生日</label>
										<span>${a.date}</span><br>
									<label>身份证号</label>
										<span>${a.eidcard}</span><br>
									<label>电话</label>
										<span>${a.ephone}</span><br>
									<label>邮箱</label>
										<span>${a.email}</span><br>
									<label>就职时间</label>
										<span><f:formatDate value="${a.etime}" pattern="yyyy-MM-dd"/></span>
							   </div>
						</div>
					</div>
					
					
					<div id="${a.aname}${a.roleName}" class="selectInfoDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);z-index:99;">
						<div style="width:500px;margin:50px auto;background-color:white;padding:20px;">
							<form action="/mooc/back/backadmin/updateAdmin" method="post" class="layui-form">
								<span style="font-size:18px;">编辑管理员信息</span>
								<br>
								<br>
								<input type="hidden" name="adminID" value="${a.id}" >
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-block">
									<input required="required" value="${a.aname}" style="border:0;" type="text" lay-verify="title" autocomplete="off" class="layui-input">
								</div>
								<br>
								<div class="layui-form-item">
								    <label class='layui-form-label'>角色</label>
								    <div class="layui-input-block">
										<select name="eroleID" id="roleselect${a.aname}${a.roleName}">
											<option></option>
										</select>
								    </div>
								  </div>
								<div class="layui-form-item">
								    <label class='layui-form-label'>就职</label>
								    <div class="layui-input-block">
										<select name="estatus"">
											<option value="1" <c:if test="${a.estatus==1}">selected</c:if>>在职</option>
											<option value="0" <c:if test="${a.estatus==0}">selected</c:if>>停职</option>
										</select>
								    </div>
								  </div>
								<br>
								<div style="text-align:center;">
									<button class="layui-btn" type="submit">确认修改</button>
									<a class="layui-btn layui-btn-primary" onclick="hideAddAdmin();">取消</a>
								</div>
							</form>
						</div>
					</div>
					
		    	</c:forEach>
		    </tbody>
		</table>
	</div>
	
	
	
	<div id="addAdminDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:700px;margin:50px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/backadmin/addAdmin" method="post" class="layui-form">
					<span style="font-size:18px;">添加管理员</span>
					<br>
					<br>
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input required="required" type="text" name="aname" lay-verify="title" autocomplete="off" placeholder="请输入管理员用户名" class="layui-input">
					</div>
					<br>
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input required="required" type="text" name="apassword" lay-verify="title" autocomplete="off" placeholder="请输入登录密码" class="layui-input">
					</div>
					<br>
					<div class="layui-form-item">
					    <label class='layui-form-label'>角色</label>
					    <div class="layui-input-block" id="rolediv">
							<select name="roleId" id="roleselect">
								<option></option>
							</select>
					    </div>
					  </div>

					<br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit">确认添加</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAddAdmin();">取消</a>
					</div>
				</form>
			</div>
		</div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript">
		function selectInfo(aname){
			$("#"+aname).show();
		}
		function updateInfo(aname){
			$.post("/mooc/back/backadmin/getAllRole",
				{},
				function(data){
					$("#roleselect"+aname).html("");
					for ( var i in data) {
						if(aname.indexOf(data[i].roleName) != -1){
							var str = $("<option selected='selected' value="+data[i].roleId+">"+data[i].roleName+"</option>");  
						}else{
							var str = $("<option value="+data[i].roleId+">"+data[i].roleName+"</option>");  
						}
						$("#roleselect"+aname).append(str); 
						layui.use('form', function(){
							var form = layui.form();
							form.render('select');
						});
					}
					$("#"+aname).show();
				}
			);
		}
		function closeSelectInfo(){
			$(".selectInfoDiv").hide();
		}
		function hideAddAdmin(){
			$("#addAdminDiv").hide();
			$(".selectInfoDiv").hide();
		}
		function addAdmin(){
			$.post("/mooc/back/backadmin/getAllRole",
				{},
				function(data){
					$("#roleselect").html("");
					for ( var i in data) {
						var str = $("<option value="+data[i].roleId+">"+data[i].roleName+"</option>");  
						$("#roleselect").append(str); 
						layui.use('form', function(){
							var form = layui.form();
							form.render('select');
						});
					}
					$("#addAdminDiv").show();
				}
			);
		}
		layui.use('form', function(){
			var form = layui.form();
			form.render('select');
		});
		function deleteAdmin(id){
			if(confirm("确定要删除吗？")){
				window.location.href="/mooc/back/backadmin/deleteAdmin?id="+id;
			}
		}
	</script>
	
	</body>

</html>