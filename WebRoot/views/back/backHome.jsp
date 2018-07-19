<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/static/back/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MOOC后台管理</title>
		<base href="<%=basePath%>">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="css/lock.css" />
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
		<link rel="stylesheet" href="css/main.css" media="all" />
	</head>

	<body class="main_body">
		<div class="layui-layout layui-layout-admin">
			<!-- 顶部 -->
			<div class="layui-header header">
				<div class="layui-main">
					<a href="#" class="logo"><img src="img/backlogo.png" style="padding-top:12px;" /></a>

					<!-- 顶部右侧菜单 -->
					<ul class="layui-nav top_menu">
						<li class="layui-nav-item showNotice" id="showNotice">
							<a href="javascript:void(0)" data-method="notice1" class="lock" id="noticebtn"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
						</li>
						<li class="layui-nav-item lockcms">
							<a href="javascript:void(0)" data-method="notice" class="lock"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
						</li>
						<li class="layui-nav-item">
							<a href="/mooc/back/backlogin/quitLogin"><i class="iconfont icon-loginout"></i> 退出</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">
								<%-- <c:choose>
									<c:when test="${empty employee.eHeadImg}">
										<img src="images/face.jpg" class="layui-circle" width="35" height="35">
									</c:when>
									<c:otherwise>
										<img src="${employee.eHeadImg}" class="layui-circle" width="35" height="35">
									</c:otherwise>
								</c:choose>
								<cite>
									<c:choose>
										<c:when test="${empty employee.ename}">
											管理员
										</c:when>
										<c:otherwise>
											${employee.ename}
										</c:otherwise>
									</c:choose>
								</cite> --%>
							</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="javascript:;" data-url="/mooc/back/admincenter/personal"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a>
								</dd>
								<dd>
									<a href="javascript:;" data-url="/mooc/back/change/pwd"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a>
								</dd>
								<dd>
									<a href="/mooc/back/backlogin/quitLogin"><i class="iconfont icon-loginout"></i><cite>退出</cite></a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- 左侧导航 -->
			<div class="layui-side layui-bg-black">
				<div class="user-photo">
					<a class="img" title="我的头像">
						<%-- <c:choose>
							<c:when test="${empty employee.eHeadImg}">
								<img src="images/face.jpg" class="layui-circle" width="35" height="35">
							</c:when>
							<c:otherwise>
								<img src="${employee.eHeadImg}" class="layui-circle" width="35" height="35">
							</c:otherwise>
						</c:choose> --%>
					</a>
					<p>你好！<span class="userName">
						<%-- <c:choose>
							<c:when test="${empty employee.ename}">
								管理员
							</c:when>
							<c:otherwise>
								${employee.ename}
							</c:otherwise>
						</c:choose> --%>
					</span>, 欢迎登录</p>
				</div>

				<div class="navBar layui-side-scroll">
					<ul class="layui-nav layui-nav-tree">
						<li class="layui-nav-item">
							<a href="javascript:;" data-url="page/main.html"><i class="iconfont icon-computer" data-icon="icon-computer"></i><cite>后台首页</cite></a>
						</li>
						<c:forEach items="${list}" var="l">
							<li class="layui-nav-item">
								<a href="javascript:;"><i class="iconfont icon-text" data-icon="icon-text"></i><cite>${l.name}</cite></a>
								<dl class="layui-nav-child">
									<c:forEach items="${l.permissionChildList}" var="p">
										<dd>
											<a href="javascript:;" data-url="${p.curl}"><i class="iconfont icon-text" data-icon="icon-text"></i><cite>${p.cname}</cite></a>
										</dd>
									</c:forEach>
								</dl>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 右侧内容 -->
			<div class="layui-body layui-form">
				<div class="layui-tab marg0" lay-filter="bodyTab">
					<ul class="layui-tab-title top_tab">
						<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
					</ul>
					<div class="layui-tab-content clildFrame">
						<div class="layui-tab-item layui-show">
							<iframe src="/mooc/back/backhome/tolog"></iframe>
						</div>
					</div>
				</div>
			</div>
			<span type="hidden" id="lockdatainfo"></span>
			<!-- 底部 -->
			<div class="layui-footer footer">
				<!-- 底部固定区域 -->
				© 河南工业大学
			</div>
		</div>

		<script type="text/javascript" src="layui/layui.js"></script>
		<script type="text/javascript" src="js/nav.js"></script>
		<script type="text/javascript" src="js/leftNav.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script>
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;

			});
			layui.use('layer', function() { //独立版的layer无需执行这一句
				var $ = layui.jquery,
					layer = layui.layer; //独立版的layer无需执行这一句

				function emptyCode() {
					layer.msg('请输入解锁密码！', { time: 2000 });
				}

				function errorCode() {
					layer.msg('密码错误，请重新输入！', { time: 2000 });
				}
				function lockPage() {
					layer.open({
						title: false,
						type: 1,
						content: '<div class="admin-header-lock" id="lock-box">' +
							'<div class="admin-header-lock-img">' +
							'<img src="layui/images/face/0.gif">' +
							'</div>' +
							'<div id="lockUserName" class="admin-header-lock-name">deideidei,讲的dei</div>' +
							'<div class="input-btn">' +
							'<input class="admin-header-lock-input layui-input" type="password" placeholder="请输入密码解锁"/>' +
							'<button id="unlock" class="layui-btn">解锁</button>' +
							'</div>' +
							'</div>',

						closeBtn: 0,
						shade: 0.8
					});
				}
				if('${lockcode}' != null && '${lockcode}' != '') {
					lockPage();
				}

				//触发事件
				var active = {
					notice: function() {
						//示范一个公告层
						layer.open({
							type: 1,
							title: false //不显示标题栏
								,
							closeBtn: false //如设置为true，则右上角会出现一个巨丑陋的x号
								,
							area: '300px;',
							shade: 0.8 //遮罩层的透明度
								,
							id: 'LAY_layuipro' //设定一个id，防止重复弹出
								,
							btnAlign: 'c',
							btn: ['确定锁屏', '取消'],
							moveType: 1 //拖拽模式，0或者1
								,
							content: '<div class="myfrom" style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form id="userForm" action="/mooc/backhome/lock"  method="post">密码：<input class="lockcode" lay-verify="number" style="padding-left:5px;height:21px;" name="lockcode" type="password" placeholder="请输入锁屏码"/><br/></form></div>',
							yes: function(index, layero) {
								var value = $(".lockcode").val();
								if(value != null && value != "") {
									//layero.find("#userForm").submit();
									$.post("/mooc/back/backhome/lock",
										{
											lockcode:$(".lockcode").val()
										},
										function(data){
											layer.closeAll();
											$("#lockdatainfo").html(data);
											lockPage();
										}
									);
								} else {
									var userForm = document.getElementById("userForm");
									var newNodeBottom = document.createElement("span");
									newNodeBottom.className = "pop";
									newNodeBottom.style.color = "orange";
									newNodeBottom.style.position = "absolute";
									newNodeBottom.style.bottom = "0px";
									newNodeBottom.style.left = "85px";
									newNodeBottom.innerHTML = "多少输点东西吧兄dei~";
									setTimeout(function() { $(".pop").remove(); }, 2000);
									userForm.parentNode.insertBefore(newNodeBottom, userForm.nextSibling);
								}
							}
						});
					},
					notice1: function() {
						//示范一个公告层
						layer.open({
							type: 1,
							title: '系统公告' //不显示标题栏
								,
							closeBtn: false,
							area: '300px;',
							shade: 0.8,
							id: 'LAY_layuipro' //设定一个id，防止重复弹出
								,
							btn: ['我知道了'],
							btnAlign: 'c',
							moveType: 1 //拖拽模式，0或者1
								,
							content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' + "${allBackNotices.get(0).noticeInfo}" + '</div>',
							yes: function() {
								$.post("/mooc/back/backhome/know");
								layer.closeAll();
							}
						});
					}
					
				};
				window.onload = function() {
					if("${state}" != 1)
						$("#noticebtn").click();
				};
				$('.lock').on('click', function() {
					var othis = $(this),
						method = othis.data('method');
					active[method] ? active[method].call(this, othis) : '';
				});
				$(document).on('click',"#unlock",function(){
					var unlock = $(".admin-header-lock-input").val();
						if(unlock != null && unlock != '') {
							$.post(
								"/mooc/back/backhome/unlock", { "unlock": unlock },
								function(data) {
									if(data == true || $("#lockdatainfo").html() == unlock) {
										layer.closeAll();
									} else {
										errorCode();
									}
								}
							);
						} else {
							emptyCode();
						}
				});

			});

			/* layui.use('element', function(){
			  var $ = layui.jquery
			  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
			  
			  //触发事件
			  var active = {
			    tabAdd: function(){
			    	if ($(".layui-tab-title li[lay-id='"+$(this).attr("id")+"']").length > 0) { 
						//切换到指定Tab项
			     		 element.tabChange('demo', $(this).attr("id")); //切换到
					} else {
			    	alert(111);
					    //已经存在
				      //新增一个Tab项
				      element.tabAdd('demo', {
				        title: $(this).html() //用于演示
				        ,content: '内容'+ (Math.random()*1000|0)
				        ,id: $(this).attr("id") //实际使用一般是规定好的id，这里以时间戳模拟下
				      });
				      element.tabChange('demo', $(this).attr("id")); //切换到
					}
			    }
			    ,tabChange: function(){
			      //切换到指定Tab项
			      element.tabChange('demo', '22'); //切换到：用户管理
			    }
			  };
			  
			  $('.site-demo-active').on('click', function(){
			    var othis = $(this), type = othis.data('type');
			    active[type] ? active[type].call(this, othis) : '';
			  });
			  
			  //Hash地址的定位
			  var layid = location.hash.replace(/^#test=/, '');
			  element.tabChange('test', layid);
			  
			  element.on('tab(test)', function(elem){
			    location.hash = 'test='+ $(this).attr('lay-id');
			  });
			  
			}); */
		</script>
	</body>

</html>