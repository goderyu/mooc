<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/static/back/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MOOC后台管理</title>
		<base href="<%=basePath%>">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
  <link rel="stylesheet" type="text/css" href="css/backcenter.css" />
   <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
   <style type="text/css">
      .infohead{
         font-family: inherit;
         font-size: 30px;
         color:gray;
         margin-left:250px;
         margin-top:30px;
      }
      .infopersonal{
         margin-top:40px;
         margin-left:200px;
         font-size: 16px;
         color:#222;
      }
      .infopersonal > span{
         color:#4395ff;
         margin-left:10px;
         cursor:pointer;
      }
      .three > span {
         position:absolute;
         margin-left:200px;
         font-size: 16px;
         color:#222;
      }
      
   </style>
</head>
<body>
<div class="edit"></div>
<div class="showinfo"></div>
<div class="wrap"></div>
<script type="text/javascript" src="layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript">
  $(function(){
     edit();
     //center();
  });
     function edit(){
       $(".edit").html('<div class="infohead">个人信息</div><hr/>'+
                       '<div class="infopersonal">个人资料：'+
                       '<span onclick="showinfo();">查看</span>'+
                       '<span onclick="quitinfo();">编辑</span>'+
                       '<div>'
       );
    }
    function showinfo(){
        $(".edit").hide();
        adminshowinfo();
        $(".showinfo").show();
    }
    function adminshowinfo(){
        $(".showinfo").html(
        '<button onclick="hideinfo();" id="showInfo" class="layui-btn" style="position:absolute;margin-top:5px;background-color:gray;margin-left:7px;">返回</button>'+
        '<div class="infohead">个人信息</div><hr/>'+
        '<div class="three"><br/>'+
        '<span>手机：<c:choose><c:when test="${empty employee.encryptionPhone}">暂无记录</c:when><c:otherwise>${employee.encryptionPhone}</c:otherwise></c:choose></span><br/><br/>'+
        '<span>邮箱：<c:choose><c:when test="${empty employee.encryptionEmail}">暂无记录</c:when><c:otherwise>${employee.encryptionEmail}</c:otherwise></c:choose></span><br/><br/>'+
        '<span>身份证：<c:choose><c:when test="${empty employee.encryptionIDCard}">暂无记录</c:when><c:otherwise>${employee.encryptionIDCard}</c:otherwise></c:choose></span><br/><br/>'+
        '<span>角色编号：${employee.eroleID}</span><br/><br/>'+
        '<span>入职时间：${employee.entryTime}</span><br/><br/>'+
        '</div>'
        );
    }
   function hideinfo(){
       $(".showinfo").hide();
       $(".edit").show();
    }
    
    function quitinfo(){
        $(".edit").hide();
        center();
        $(".wrap").show();
    }
    function editInfo(){
        $(".wrap").hide();
        $(".edit").show();
    }
    //
    function center(){
       $(".wrap").html(
       '<button onclick="editInfo();" id="editInfo" class="layui-btn" style="position:absolute;margin-top:5px;background-color:gray;margin-left:-570px;">返回</button>'+
       '<div class="head" style="">后台个人中心</div>'+
   '<hr/>'+                   
  '<div class="center">'+
'<form id="adminInfo" class="layui-form" action="/mooc/back/admincenter/receiveAdminInfo">'+
'<div class="left">'+
	  '<div class="header"> '+
			'<span style="margin-left:7px">头像<span style="color:red">*</span>:</span>'+
			'<div class="img"><c:choose><c:when test="${empty employee.eHeadImg}"><img class="layui-upload-img" style="width:88px;height:88px;margin-left:-60px;margin-top:-29px;border-radius:100%" id="tu" src="../img/avatar03.png"/></c:when><c:otherwise><img class="layui-upload-img" style="width:88px;height:88px;margin-left:-60px;margin-top:-29px;border-radius:100%" id="tu" src="${employee.eHeadImg}"/></c:otherwise></c:choose></div>'+
			'<button type="button" class="layui-btn" id="changeheadimage" style="position:absolute;top:127px;left:380px;cursor:pointer;z-index:20;opacity:0;">'+
			'更换头像</button>'+
			'<span class="invent-btn" style="color:#4395ff;position:absolute;left:400px;top:135px;">更换头像</span>'+
			'<c:choose><c:when test="${empty employee.eHeadImg}"><input type="hidden" title="" lay-verify="img" id="img_url" name="eHeadImg" value=""/></c:when><c:otherwise><input type="hidden" title="" lay-verify="img" id="img_url" name="eHeadImg" value="${employee.eHeadImg}"/></c:otherwise></c:choose>'+
	  '</div>'+
		'<div class="threeLeft">'+
	  '<div class="layui-form-item">'+
	   '<label class="layui-form-label">姓名<span style="color:red">*</span>:</label>'+
		    '<div class="layui-input-block">'+
		      '<input id="ename" value="${employee.ename}" name="ename" lay-verify="adminname" autocomplete="off" placeholder="请输入" class="layui-input" type="text">'+
		    '</div>'+
	  '</div>'+
  
	  '<div class="layui-form-item">'+
	   '<label class="layui-form-label">生日<span style="color:red">*</span>:</label>'+
		    '<div class="layui-input-block">'+
		      '<input value="${employee.ebirth}" name="ebirth" id="date" lay-verify="adminbirthday" autocomplete="off" class="layui-input" type="text">'+
		    '</div>'+
	  '</div>'+

	    '<div class="layui-form-item">'+
    '<label class="layui-form-label">性别<span style="color:red">*</span>:</label>'+
    '<div class="layui-input-block">'+
      '<select id="esex" name="esex" lay-filter="aihao">'+
        '<option value="0">男</option>'+
        '<option value="1">女</option>'+
      '</select>'+
    '</div>'+
  '</div>'+
  '<div>'+
     '<div class="threeRight">'+
	  '<div class="layui-form-item">'+
	   '<label class="layui-form-label">邮箱<span style="color:red">*</span>:</label>'+
		    '<div class="layui-input-block">'+
		      '<input name="email" value="${employee.email}" id="email" lay-verify="email" placeholder="请输入" autocomplete="off" class="layui-input" type="text">'+
		    '</div>'+
	  '</div>'+   
    
	  '<div id="ephoneF" class="layui-form-item">'+
	    '<label class="layui-form-label">手机号<span style="color:red">*</span>:</label>'+
		    '<div  class="layui-input-block">'+
		      '<input value="${employee.ephone}" name="ephone" id="ephone" lay-verify="adminphone" placeholder="请输入" autocomplete="off" class="layui-input" type="text">'+
		    '</div>'+
	  '</div>'+
  
	  '<div class="layui-form-item">'+
	    '<label class="layui-form-label">身份证<span style="color:red">*</span>:</label>'+
		    '<div class="layui-input-block">'+
		      '<input value="${employee.eidcard}" name="eidcard" id="eidcard" lay-verify="identity" placeholder="请输入" autocomplete="off" class="layui-input" type="text">'+
		    '</div>'+
	  '</div>'+
'</div>'+
'</div>'+
	  '<div class="layui-form-item">'+
		    '<div class="layui-input-block">'+
		      '<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>'+
		      '<button type="reset" class="layui-btn layui-btn-primary">重置</button>'+
		    '</div>'+
	  '</div>'+
 '</div>'+
'</form>'+
  '</div>');
      /*调用layui事件需要放这里,脱离会导致某些事件不被识别*/
		layui.use(['form','laydate','layer','upload'], function(){
		  var form = layui.form
		  ,laydate = layui.laydate,layer = layui.layer
		  ,$ = layui.jquery,upload = layui.upload;
		  //刷新form表单
		  form.render('select');
		  laydate.render({
		     elem:'#date'
		  });
		  
		   //自定义验证规则
		  form.verify({
		    adminname: function(value){
		          if(value==""||value==null){
		             return '请输入姓名';
		          }
		          if(!new RegExp(/^[^ ]+$/).test(value)||!new RegExp(/^[\一-\龥]{0,}$/).test(value)){
				      return '姓名只能是汉字哦';
				    }
		       }
		    ,img:function(value){
		         if(value==null||value==""){
		            return '尚未选择头像';
		         }
		    }
		    ,adminbirthday:function(value){
		           if(value==null||value==""){
		               return '请选择生日日期';
		           }
		    }
		    ,adminphone:function(value){
		           if(!new RegExp(/^1[3|4|5|8][0-9]\d{8}$/).test(value)){
		               return '手机号格式不正确';
		           }
		    }
		  });
		  var phone = 0,idcard = 0,email = 0;
		  /*ajax验证手机号和身份证、邮箱*/
		  $("#ephone").on('blur',function(){
		  if($("#ephone").val()!=null&&$("#ephone").val().trim()!=''){
		     $.post(
		     "/mooc/back/admincenter/verifyPhone"
		     ,{"ephone":$("#ephone").val()}
		     ,function(data){
		       if(data!='true'){
		          layer.msg("该手机号已被注册", 
				     {area: ['210px','60px'],
				     time:2000, icon: 5, 
				     anim: 6});
				     phone = 1;
		       }else{
		             phone = 2;
		       }
		     }
		    );
		  }
		    
		  });
		  
		   $("#eidcard").on('blur',function(){
		  if($("#eidcard").val()!=null&&$("#eidcard").val().trim()!=''){
		      $.post(
		          "/mooc/back/admincenter/factorCheck"
		          ,{"eidcard":$("#eidcard").val()}
		          ,function(data){
		             if(data=="true"){
		                $.post(
							     "/mooc/back/admincenter/verifyPhone"
							     ,{"eidcard":$("#eidcard").val()}
							     ,function(data){
							       if(data!='true'){
							          layer.msg("该身份证已被注册", 
									     {area: ['210px','60px'],
									     time:2000, icon: 5, 
									     anim: 6});
									     idcard = 1;
										       }else{
										           idcard = 2;
										       }
										     }
										    ); 
		             }else{
		                layer.msg("该身份证不存在", 
						{area: ['210px','60px'],
						time:2000, icon: 5, 
						anim: 6});
						idcard = 1;
		             }
		          }
		      );
		  }
		    
		  });
		   $("#email").on('blur',function(){
		  if($("#email").val()!=null&&$("#email").val().trim()!=''){
		     $.post(
		     "/mooc/back/admincenter/verifyPhone"
		     ,{"email":$("#email").val()}
		     ,function(data){
		       if(data!='true'){
		          layer.msg("该邮箱已被注册", 
				     {area: ['210px','60px'],
				     time:2000, icon: 5, 
				     anim: 6});
				     email = 1;
		       }else{
		           email = 2;
		       }
		     }
		    );
		  }
		    
		  });
		  /* 上传头像 */
		  upload.render({
		     elem:"#changeheadimage",
		     url:"/mooc/back/admincenter/uploadimg",
		     size:1024*5,//限制只能上传5M以下的图片
		     before:function(obj){
		        obj.preview(function(index,file,result){
		          $("#tu").attr("src",result);
		        });
		     }
		      ,done:function(res){
		        //上传成功
                $("#img_url").val(res.data);
		     } 
		  }); 
		  
		  form.on('submit(demo1)',function(data){
		  	 $("#eidcard").blur();
		  	 $("#ephone").blur();
		  	 $("#email").blur();
		     if(phone==2&&email==2&&idcard==2){
		        $.post(
		            "/mooc/back/admincenter/receiveAdminInfo",
		            {
		            ename:$("#ename").val(),esex:$("#esex").val(),
		            ebirth:$("#date").val(),eidcard:$("#eidcard").val(),
		            ephone:$("#ephone").val(),email:$("#email").val(),
		            eHeadImg:$("#img_url").val()
		            },
		            function(data){
		               layer.msg('保存成功');
		               $(".wrap").hide();
                       $(".edit").show();
                       window.parent.location.href=window.parent.location.href;
		            });
		     }else{
		        layer.msg('提交失败，请根据提示信息进行修改');
		     }
		     return false;
		  });
	  }); 
    }
    
</script>
</body>
</html>
