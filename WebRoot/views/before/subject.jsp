<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="back/layui/css/layui.css" media="all" />
	 <script src="back/layui/layui.all.js" charset="utf-8"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	   #paged{
	      background-color: #f7f7f7;
	      width:1000px;
	      position:relative;
	      left:48px;
	   }
	   .not-course-card-text{
	      color:#999;
	      font-size: 18px;
	      margin-top:30px;
	      margin-left:460px;
	   }
	 .not-course-card>img{
	      margin-left:500px;
	      margin-top:100px;
	   }
	   
	   .not-course-card{
	      position:relative;
	      width:1000px;
	      left:
	   }
	</style>
  </head>
  
  <body>
<jsp:include page="/static/jsp/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="back/css/searchresult.css">
<div class="debugging-top"></div>
   <div class="totalren"></div>
	<!-- 测试 -->
	 <ul id="biuuu_city_list"></ul> 
	<div id="paged"></div>		
   <div class="debugging-bottom"></div>
 <jsp:include page="/static/jsp/foot.jsp"></jsp:include>
 <script type="text/javascript" src="js/jquery-2.1.0.js"></script>

 
 <script type="text/javascript">
 $(".scrollsearch-img").click(function(){
	  ajaxSearchSub();
	});
     $(function(){
       ajaxSearchSub();
     });     	
     function ajaxSearchSub(){
        if($(".mainsearch-copy").val()!=null&&$(".mainsearch-copy").val().trim()!=''){
        $.post(
            "/mooc/before/course/ajaxsearch",
            {"selectValue":$(".mainsearch-copy").val()},
            function(data){
              if(data.length<=0){
                 notFound();
                 dataInfo(data);
              }else{
                 getShopCustomesInfo(data);
                  dataInfo(data);
              }
                
            }
        );
        }
     }
     
     function dataInfo(data){
        $(".totalren").html('共'+data.length+'条'+
        '<span style="color:#84b706">'+$(".mainsearch-copy").val()+'</span>'+'相关的结果');
     }
        function notFound(){
           $("#paged").hide();
           $("#biuuu_city_list").html('<div class="not-course-card">'+
               '<img src="img/notfound.png"/>'+
               '<div class="not-course-card-text">'+
               '抱歉，暂无'+
               '<span style="color:#84b706">'+$(".mainsearch-copy").val()+'</span>'+
               '相关内容'+
               '</div>'+'</div>'
               
           );
        }
     
     	function getShopCustomesInfo(data){
     	$("#paged").show();
	   	layui.use(['laypage', 'layer'], function(){
		var laypage = layui.laypage,layer = layui.layer;
	  //调用分页
	   laypage.render({
	    elem: 'paged'
	    ,count: data.length 
		,limit:1
	    ,jump: function(obj){
	    /*一页能显示完内容，则不再显示分页*/
	      if(data.length<=obj.limit){
	         $("#paged").hide();
	      }
      //模拟渲染
      document.getElementById('biuuu_city_list').innerHTML = function(){
        var arr = []
        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
        layui.each(thisData, function(index, item){
          arr.push('<div class="courselist" id="courselist"> '+
			'<div class="course-main">'+
				'<div class="computer-course">'+
					'<div class="course">'+
						'<div class="course-img">'+
							'<img src="'+item.courseImg+'">'+
						'</div>'+
					'</div>'+
					'<div class="course-text">'+
				'<div class="course-name" style="font-weight: normal;">'+item.courseName+'</div>'+
					    '<div class="subInfo">'+
					        '<span>华北水利水电大学</span>'+
					    '</div>'+
					   ' <div class="subIntroduction" style="width:500px;">'+
					        	item.pithy+
					    '</div>'+
					   ' <div class="totalnumber">'+
					       '<img src="img/course/count.png" style="height:18px;">'+
					      ' <span style="margin-left:10px;">'+item.count+'人参与</span>'+
					    '</div>'+
					    '<form action="/mooc/before/course/selectcourse" class="selectform" method="post">'+
					    '<input type="hidden" name="id" value='+item.id+'>'+
					    '</form>'+
					'</div>'+
				'</div>'+
			'</div>'+
	'</div>');
        });
        return arr.join('');
      }();
	   	$(".course-main").on("click",function(){
			var index=$(this).index();
			$(".selectform").eq(index-1).submit();
		});
    }
  });
		  
	});
	   	}
	   	
 </script>
 </body>
</html>
