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
		<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	</head>

	<body class="childrenBody">

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>学生管理</legend>
		</fieldset>

		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" style="width:200px;" value="" placeholder="请输入编号或姓名" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-btn-group demoTable" style="margin-left:260px;">
		  <button class="layui-btn layui-btn-danger" data-type="getCheckData">批量删除</button>
		</div>
		<a onclick="importNewStudent();" class="layui-btn layui-btn-normal" style="margin-left:10px;">导入学生</a>
		<a onclick="addNewStudent();" class="layui-btn layui-btn-normal" style="margin-left:10px;">添加学生</a>
		<div class="layui-btn-group demoTable" style="margin-left:10px;">
		  <button class="layui-btn layui-btn" data-type="isAll">导出选中</button>
		</div>
		<div class="layui-btn-group demoTable" style="margin-left:10px;">
		  <button class="layui-btn layui-btn" data-type="getAll">导出全部</button>
		</div>

		<table class="layui-hide" id="LAY_table_user1" lay-filter="demo" id="idTest"></table>

		<div id="addUserOneDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:400px;margin:100px auto;background-color:white;padding:20px;">
				<form id="excelform" action="/mooc/back/uploadUsers/uploaduser" method="post" enctype="multipart/form-data">
					<input type="file" name="mf" id="excelfile">
				</form>
				<button onclick="getAllExcel();" class="layui-btn layui-btn-normal" style="margin-left:200px;">立即导入</button>
				<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
				<br>
				<br>
				<p>1、请上传xls格式的Excel表格</p><br>
				<p>2、请按照该
					<a style="color:blue;" href="excel/user.xls">模板excel表</a>格式</p><br>
				<p>3、导入后可以预览，确认提交后方可保存</p><br>
			</div>
		</div>

		<div id="showUserOneDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:1000px;margin:50px auto;background-color:white;padding:20px;">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					<legend>学生列表</legend>
				</fieldset>
				<table class="layui-hide" id="LAY_table_user" lay-filter="useruv"></table>
				<a onclick="tijiaoExcel();" class="layui-btn layui-btn-normal" style="margin-left:300px;">确认导入</a>
				<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
			</div>
		</div>
		
		<div id="insertUserOneDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:400px;margin:100px auto;background-color:white;padding:20px;">
				<form action="/mooc/back/userManager/addOneUser" method="post">
					<span style="font-size:18px;">添加学生</span>
					<br>
					<br>
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input required="required" type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入姓名" class="layui-input">
					</div>
					<br>
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-block">
						<input id="telephone" required="required" type="text" name="telephone" lay-verify="title" autocomplete="off" placeholder="请输入手机号" class="layui-input">
						<span id="phone"></span>
					</div>
					<br>
					<div style="text-align:center;">
						<button class="layui-btn" type="submit" id="addbtnuser">确认添加</button>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		
		<div id="updateUserOneDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div style="width:400px;margin:50px auto;background-color:white;padding:20px;">
				<form id="updateinfo" class="layui-form" action="/mooc/back/userManager/updateUser" method="post">
					<span style="font-size:18px;">修改学生信息</span>
					<br>
					<br>
					<input type="hidden" name="id" id="idinfo">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input id="nameinfo" required="required" type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入姓名" class="layui-input">
					</div>
					<br>
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-block">
						<input id="telinfo" required="required" type="text" name="telephone" lay-verify="title" autocomplete="off" placeholder="请输入手机号" class="layui-input">
						<span id="iphone"></span>
					</div>
					<br>
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input id="cardinfo" required="required" type="text" name="userCard" lay-verify="title" autocomplete="off" placeholder="请输入身份证号" class="layui-input">
						<span id="card"></span>
					</div>
					<br>
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input id="emailinfo" required="required" type="text" name="userEmail" lay-verify="title" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
						<span id="email"></span>
					</div>
					<br>
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<select name="userSex" id="sexselected">
							<option value="1" id="boyoption">男</option>
							<option value="0" id="girloption">女</option>
						</select>
					</div>
					<br>
					<div style="text-align:center;">
						<a class="layui-btn" onclick="updatetrue();">确认修改</a>
						<a class="layui-btn layui-btn-primary" onclick="hideAdd();">取消</a>
					</div>
				</form>
			</div>
		</div>
		
		<div id="updateUserOneDiv" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,0.5);">
			<div class="wrap" style="width:800px;margin:50px auto;background-color:white;padding:20px;">
			</div>
		</div>
		<script type="text/javascript" src="layui/layui.all.js"></script>
		<script>
		$("#addbtnuser").click(function(){
			$("#telephone").blur();
			if($("#phone").html() != ""){
				return false;
			}
		});
		/* 手机号 */
		$("#telephone").blur(function(){
			if(/^1[3|4|5|7|8][0-9]\d{8}$/.test($("#telephone").val())){
				$.post("/mooc/back/userManager/selectTelephone",{
					telephone:$("#telephone").val()
				},function(data){
					if(!data){
						$("#phone").html("");
					}else{
						$("#phone").html("该手机号已经被使用").css("color","red");
					}
				});
			}else{
				$("#phone").html("请输入正确的手机格式").css("color","red");
			}
		});
		var tel = "";
		var ema = "";
		var car = "";
		$("#telinfo").blur(function(){
			if(/^1[3|4|5|7|8][0-9]\d{8}$/.test($("#telinfo").val())){
				if(tel == $("#telinfo").val()){
				$("#iphone").html("");
				}else{
				$.post("/mooc/back/userManager/selectTelephone",{
					telephone:$("#telinfo").val()
				},function(data){
					if(!data){
						$("#iphone").html("");
					}else{
						$("#iphone").html("该手机号已经被使用").css("color","red");
					}
				});}
			}else{
				$("#iphone").html("请输入正确的手机格式").css("color","red");
			}
		});
		/* 身份证 */
		$("#cardinfo").blur(function(){
			if(/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/.test($("#cardinfo").val())){
				if(car == $("#cardinfo").val()){
					$("#card").html("");
				}else{
				$.post("/mooc/back/userManager/selectUserCard",{
					userCard:$("#cardinfo").val()
				},function(data){
					if(!data){
						$("#card").html("");
					}else{
						$("#card").html("身份证已使用").css("color","red");
					}
				});}
			}else{
				$("#card").html("请输入正确的身份证").css("color","red");
			}
		});
		/* 邮箱 */
		$("#emailinfo").blur(function(){
			if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#emailinfo").val())){
				if(ema == $("#emailinfo").val()){
					$("#email").html("");
				}else{
				$.post("/mooc/back/userManager/selectUserEmail",{
					userEmail:$("#emailinfo").val()
				},function(data){
					if(!data){
						$("#email").html("");
					}else{
						$("#email").html("邮箱已经被使用").css("color","red");
					}
				});}
			}else{
				$("#email").html("请输入正确的邮箱格式").css("color","red");
			}		
		}); 
		
		
		function updatetrue(){
			$("input").blur();
			if($("#email").html() == "" && $("#card").html() == "" && $("#iphone").html() == ""){
				layer.confirm('确定修改吗？', function(index) {
					$("#updateinfo").ajaxSubmit(
						function(data){
							window.location.href=window.location.href;
						}
					);
					layer.close(index);
				}); 
			}else{
				return false;
			}
		}
		var searchval = null;
		window.onload=function(){
			loadUsers();
		};
		$(".search_btn").click(function(){
			searchval = $(".search_input").val();
			loadUsers();
			searchval = null;
		});
		function loadUsers(){
			layui.use('table', function() {
				var table = layui.table;
				//展示已知数据
				table.render({
					elem: '#LAY_table_user1',
					cols: [
						[ //标题栏
							{ type: 'checkbox',width:11 }, 
							{ field: 'id', title: '编号', width: 50, sort: true }, 
							{ field: 'userName', title: '姓名', width: 74 }, 
							{ field: 'telephone', title: '手机号', width: 100 },
							{ field: 'userEmail', title: '邮箱' , width: 150}, 
							{ field: 'userSex', title: '性别' , width: 30  , templet: '#titleTpl'}, 
							{ field: 'userCard', title: '身份证号' , width: 210}, 
							{ field: 'poperation', title: '操作', width: '82', fixed: 'right', toolbar: '#barDemo' }
							
						]
					],
					id:'idTest',
					url: '/mooc/back/userManager/getAllStudents?searchVal='+searchval,
					page: {
						groups: 10,
						first: false,
						last: false,
						layout: ['prev', 'page', 'next', 'count', 'limit'] //自定义分页布局
					},
					limit: 3 //每页默认显示的数量
						,
					limits: [3, 5, 10, 20, 50, 100]
				});
				//监听表格复选框选择
				table.on('checkbox(demo)', function(obj) {
					console.log(obj);
				});
				//监听工具条
				table.on('tool(demo)', function(obj) {
					var data = obj.data;
					if(obj.event === 'del') {
						layer.confirm('确定删除该行？', function(index) {
							window.location.href="/mooc/back/userManager/deleteUser?id="+data.id;
							layer.close(index);
						});
					} else if(obj.event === 'edit') {
						tel = data.telephone;
						ema = data.userEmail;
						car = data.userCard;
						$("#updateUserOneDiv").show();
						$("#idinfo").val(data.id);
						$("#nameinfo").val(data.userName);
						$("#telinfo").val(data.telephone);
						$("#cardinfo").val(data.userCard);
						$("#emailinfo").val(data.userEmail);
						if(data.userSex == false){
							$('#sexselected').siblings("div.layui-form-select").find("dd").eq(1).click();
						}else{
							$('#sexselected').siblings("div.layui-form-select").find("dd").eq(0).click();
						}
   					}
				});

				var $ = layui.$,
					active = {
						getCheckData: function() { //获取选中数据
							var checkStatus = table.checkStatus('idTest'),
								data = checkStatus.data;
							if(data.length == 0){
								layer.msg('请选择要删除的学生!');
								return false;
							}
							var idArr = new Array();
							for(var i = 0; i < data.length; i++){
								id = data[i].id;
								idArr.push(id);
							}
							//layer.alert(JSON.stringify(data));
							layer.confirm('确定删除选中行吗？', function(index) {
								window.location.href="/mooc/back/userManager/deleteUsers?userList="+idArr;
								layer.close(index);
							}); 
						},
						getAll: function() { //获取选中数目
							window.location.href="/mooc/back/exportUsers/exportAllUsers";
						}, 
						isAll: function() { //验证是否全选
							var checkStatus = table.checkStatus('idTest'),
								data = checkStatus.data;
							if(data.length == 0){
								layer.msg('请选择要导出的学生!');
								return false;
							}
							var idArray = new Array();
							for(var i = 0; i < data.length; i++){
								id = data[i].id;
								idArray.push(id);
							}
							window.location.href="/mooc/back/exportUsers/exportSelectedUsers?idArr="+idArray.toString();
							/* $.post("/mooc/exportUsers/exportSelectedUsers",
								{
									"idArr":idArray.toString()
								}
							); */
						}
					};

				$('.demoTable .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});
			});
			}

			function importNewStudent() {
				$("#addUserOneDiv").show();
			}

			function getAllExcel() {
				$("#excelform").ajaxSubmit(
					function(data) {
						$("#LAY_table_user").html("");
						$("#showUserOneDiv").show();
						if(data != null){
						layui.use('table', function() {
							var table = layui.table;
							//展示已知数据
							table.render({
								elem: '#LAY_table_user',
								cols: [
									[ //标题栏
										{ field: 'userName', title: '姓名', width: 74 }
										, { field: 'telephone', title: '手机号', width: 100 },
										{ field: 'userEmail', title: '邮箱' , width: 150}, 
										{ field: 'userSex', title: '性别' , width: 30}, 
										{ field: 'userCard', title: '身份证号' , width: 210}
									]
								],
								data: data[0].data,
								page: {
									groups: 10,
									first: false,
									last: false,
									layout: ['prev', 'page', 'next', 'count', 'limit'] //自定义分页布局
								},
								limit: 3 //每页默认显示的数量
									,
								limits: [3, 4, 5]
							});
						});}else{
							layui.use('table', function() {
							var table = layui.table;
							//展示已知数据
							table.render({
								elem: '#LAY_table_user',
								cols: [
									[ //标题栏
										{ field: 'userName', title: '姓名', width: 74 }
										, { field: 'telephone', title: '手机号', width: 100 },
										{ field: 'userEmail', title: '邮箱' , width: 150}, 
										{ field: 'userSex', title: '性别' , width: 30}, 
										{ field: 'userCard', title: '身份证号' , width: 210}
									]
								],
								page: {
									groups: 10,
									first: false,
									last: false,
									layout: ['prev', 'page', 'next', 'count', 'limit'] //自定义分页布局
								},
								limit: 3 //每页默认显示的数量
									,
								limits: [3, 4, 5]
							});
						});
						}
					}
				);
			}

			function tijiaoExcel() {
				window.location.href="/mooc/back/uploadUsers/exportuser";
			}
			function addNewStudent(){
				$("#insertUserOneDiv").show();
			}
			function hideAdd(){
				$("#insertUserOneDiv").hide();
				$("#showUserOneDiv").hide();
				$("#addUserOneDiv").hide();
				$("#updateUserOneDiv").hide();
			}
		</script>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-mini layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-mini layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		<script type="text/html" id="titleTpl">
             {{# if((d.userSex == false)){ }}
				{{d.userSex = '女'}}
				{{# }else if((d.userSex == true)){ }}
				{{d.userSex = '男'}}
			{{# }}}
		</script>
	</body>

</html>