<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jq.js"></script>
<link rel="stylesheet" href="css/coursecontent.css" type="text/css"></link>
<link rel="stylesheet" href="back/layui/css/layui.css" media="all" />
<style type="text/css">
.taskbtn{
	border:0;
	background-color:white;
	font-size:20px;
}
.taskbtn:hover{
	cursor:pointer;
	background-color:#999999;
	color:white;
	text-decoration:none;
}
a{
text-decoration:none;
}

</style>
</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="coursecontent-head">
			<ul>
				<li>${course.cname}</li>
				<li class="selected">首页</li>
				<li><form action="/mooc/views/before/student/student-task.jsp" method="post" style="display:inline-block;">
						<button class="taskbtn">作业</button>
					</form></li>
				<li><a href="/mooc/views/before/student/student-ziliaogl.jsp" style="color:black;">资料</a></li>
				<li onclick="showdiscuss();">讨论</li>
			</ul>
		</div>
		<div class="catalog">
			<div class="tittle">目录</div>
			<form action="/mooc/views/before/student/look-frameset.jsp" method="post" style="display:inline-block;">
				<input type="hidden" id="courseid" name="courseid" value="${course.id}">
				<button class="editorcontent">查看课程内容</button>
			</form>
			<span class="line"></span><br>
			<div class="catalog-content">
				<c:forEach items="${firstlist}" var="firstl" varStatus="fcount">
					<div class="first-level">
						<div class="first-level-text">
							<img src="img/course/level1.png"><b>${fcount.count}</b><span
								class="levelname">${firstl.catalogname}</span>
						</div>
						<c:forEach items="${secondlists.get(fcount.count-1)}"
							var="secondl" varStatus="scount">
							<div class="second-level">
								<b>${fcount.count}.${scount.count}</b><img
									src="img/course/level2.png"><span class="levelname">${secondl.subcatalogname}</span>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
				<div class="content-foot"></div>
			</div>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
		<script type="text/javascript" src="js/jqu 1.0.js"></script>
	<script src="back/layui/layui.all.js" charset="utf-8"></script>
	<script type="text/javascript">
	
	     /*显示讨论区，隐藏首页*/
	     function showdiscuss(){
	         $(".catalog").hide();
	        discuss();
	        $("#discuss").show(); 
	        
	        $.post(
	          "/mooc/before/discussblock/themes",
	          function(data){
	              if(data==''){
	                 notfounddiscuss();
	              }else{
	                 existdiscuss(data);
	              }
	          }
	        );
	    }
	    
	     /*显示首页 ,隐藏讨论区*/
	     function showcatalog(){
	         $(".catalog").show();
	         $("#discuss").hide();
	    } 
	    /*讨论区界面  创建一个存放讨论区界面的div，并将其放入wrap下*/
	    function discuss(){
	      var  discuss = document.createElement("div");
	      discuss.id = "discuss";
	      $(".wrap").append(discuss);
	      $("#discuss").html('<div class="wrapdiscussblock"><fieldset style="margin-top:20px;height:auto;"><legend style="padding-left:400px;">'+
	      '<input id="issue" style="width:500px;height:30px;" placeholder="新建话题" class="layui-input"/>'+
	      '<span onclick="layuiissue();" class="layui-btn" style="height:30px;position:absolute;margin-left:505px;margin-top:-30px;line-height:30px;">发布</span>'+
	      '</legend>'+
	      '<div id="discussfield"></div>'+
	      '<div id="discusspage" style="position:relative;margin-left:180px;"><div>'+
	      '</fieldset>'+
	      '</div>');
	    }
	    /*发布话题事件*/
	    function layuiissue(){
	        layui.use(['layer'], function(){
	            var layer = layui.layer,$ = layui.jquery;
	            if($("#issue").val()!=null && $("#issue").val().trim()!=''){
	                 $.post(
	                     "/mooc/before/discussblock/issue",
	                     {"theme":$("#issue").val()},
	                     function(data){
	                         if(data!='null'){
	                             layer.msg('发布成功');
	                             showdiscuss();
	                         }else{
	                             layer.msg('发布失败');
	                         }
	                     }
	                 );
	             }else{
	                 layer.msg('请输入发布内容');
	             }
	        });
	    }
	    /*没有话题则提示发布话题*/
	    function notfounddiscuss(){
	       $("#discussfield").append('<div class="discussprinci"style="margin-bottom:140px;"><img style="margin-left:500px;" src="img/tip_03.png">'+
	      '<span style="position:absolute;margin-left:-240px;margin-top:270px;font-size:18px;color:#999;line-height:2;">还没有话题哦，快去发表一个吧！</span>'+
	      '</div>');
	    }
	    
	    /*存在话题时，显示出来*/
	    function existdiscuss(data){
	        $("#discusspage").show();
		   layui.use(['laypage', 'layer'], function(){
			var laypage = layui.laypage,layer = layui.layer;
			 var imagetheme;
			     //调用话题分页
				   laypage.render({
					    elem: 'discusspage'
					    ,count: data.length 
						,limit:3
						,jump:function(obj){
						    /*一页能显示完内容，则不再显示分页*/
						      if(data.length<=obj.limit){
						         $("#discusspage").hide();
						      }
						       //模拟渲染
						      document.getElementById('discussfield').innerHTML=function(){
						          var arr = [],
						          thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
						          var user = "${USER.id}";
						          layui.each(thisData, function(index,item){
						              var topicID = item.id;//话题id
						              var Posting = item.uid;
						              var PostingHTML;
						              if(user==Posting){
						                  PostingHTML = '<div class="operation" id="layerDemo" style="color:#7a9e31;position:absolute;margin-left:850px;margin-top:-40px;"><span onclick="deletetheme('+item.id+');" style="cursor:pointer">删除</span>&nbsp|&nbsp<span onclick="edittheme('+item.id+');" class="edittheme" data-method="notice" style="cursor:pointer">编辑</span></div>';
						              }else{
						                  PostingHTML='';
						              }
						              if(item.state==1){
						                  imagetheme = '<img style="position:absolute;margin-top:40px;margin-left:-12px;" src="img/t.png"/>';
						              }else{
						                  imagetheme = '<img style="position:absolute;margin-top:40px;margin-left:-12px;" src="img/s.png"/>';
						              }
						              arr.push('<div class="existdiscuss" style="background-color:#fcfcfc;position:relative;margin-bottom:5px;margin-left:180px;width:963px;height:157px;border:1px solid #e6e6e6;">'+
								              '<div><img style="margin-left:30px;margin-top:20px;width:42px;height:42px;border-radius:100%;" src="img/coursetest.jpg">'+
								              imagetheme+
								              '</div>'+
								              PostingHTML+
								               '<div style="width:200px;margin-left:90px;margin-top:-42px;"><span style="font-size:14px;color:#7a9e31">'+item.username+'</span><span style="margin-left:10px;color:#666">华北水电水利大学</span></div>'+
								                '<p class="issuetime" style="margin-left:89px;color:#999;font-size:12px;">'+item.entryTime+'</p>'+
								                '<div class="theme" style="position:absolute;margin-left:89px;width:682px;"><span onclick="themewords('+index+','+obj.curr+','+obj.limit+','+topicID+');" style="font-size:18px;color:#59657d;cursor:pointer;">'+item.theme+'</span></div>'+
								                '<i onclick="replyeventshow('+index+');" class="layui-icon reply" style="position:absolute;margin-top:40px;margin-left:880px;cursor:pointer;">&#xe611'+
								                '<span style="color:#202020;margin-left:5px;font-size:13px;">'+item.replys.length+'</span>'+
								                '</i>'+
								                '<div class="replyevent" style="width:500px;margin-left:89px;margin-top:50px;display:none;"><input class="layui-input replyContent" style="width:500px;height:30px;"/>'+
								                '<span class="layui-btn" onclick="ensurereply('+item.id+','+index+');" style="background-color:#7b9e31;position:absolute;margin-left:505px;margin-top:-30px;line-height:30px;height:30px;">回复</span>'+
								                '</div>'+
								          '</div>');
						          });
						           return arr.join('');
						      }();
						}
					});
					/*删除话题*/
					window.deletetheme=function(themeid){
					        layer.confirm("确认要删除吗，删除后不能恢复", { title: "删除确认",offset:"200px" }, function (index) {  
			                    layer.close(index);  
			                    $.post(
			                        "/mooc/before/discussblock/deletetheme",
			                        {"id":themeid},
			                        function(data){
			                            if(data!='null'){
			                                layer.msg('删除成功');
			                                showdiscuss();
			                            }else{
			                                layer.msg('删除失败');
			                            }
			                        }
			                    );
                             });   
                
					}
					/*编辑话题*/
					window.edittheme=function(themeid){
					      //示范一个公告层
					      layer.open({
					        type: 1
					        ,title: false //不显示标题栏
					        ,closeBtn: false
					        ,area: '300px;'
					        ,shade: 0.8
					        ,offset:'200px'
					        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
					        ,btn: ['确定', '取消']
					        ,btnAlign: 'c'
					        ,moveType: 1 //拖拽模式，0或者1
					        ,content: '<div style="padding: 50px;background-color: #393D49; font-weight: 300;"><textarea class="edittextarea" style="height:125px;width:201px;line-height:22px;" class="layui-input" placeholder="请输入要修改的内容"></textarea></div>'
					         ,yes:function(index, layero){
					             if($(".edittextarea").val()!=null&&$(".edittextarea").val().trim()!=''){
					                 $.post(
					                     "/mooc/before/discussblock/updatetheme",
					                     {"id":themeid,"theme":$(".edittextarea").val()},
					                     function(event){
					                         if(event!='null'){
					                             layer.msg('修改成功',{offset:'300px'});
					                             showdiscuss();
					                         }else{
					                             layer.msg('修改失败',{offset:'300px'});
					                         }
					                     }
					                 );
					                 layer.closeAll();
					             }else{
					                 layer.msg('请输入要修改的内容',{offset:'300px'});
					             }
					         }
					      });
					}
                   var ind;
                   var talkID;//话题id
					/*查看话题(当点击话题内容时触发)*/
			        window.themewords=function(index,curr,limit,topicID){
			         talkID=topicID;
			          ind = index+limit*(curr-1);//?????????????????????????????????????????????????????????
			           $(".wrapdiscussblock > fieldset").remove();
			           $(".wrapdiscussblock").html('<div class="viewcomments">'+
			           '<div class="existdiscuss" style="background-color:#fcfcfc;margin-top:30px;position:relative;margin-left:180px;width:963px;height:157px;border:1px solid #e6e6e6;">'+
						'<div><img style="margin-left:30px;margin-top:20px;width:42px;height:42px;border-radius:100%;" src="img/coursetest.jpg">'+
						    imagetheme+
						'</div>'+
						'<div style="width:200px;margin-left:90px;margin-top:-42px;"><span style="font-size:14px;color:#7a9e31">'+data[ind].username+'</span><span style="margin-left:10px;color:#666">华北水电水利大学</span></div>'+
						'<p class="issuetime" style="margin-left:89px;color:#999;font-size:12px;">'+data[ind].entryTime+'</p>'+
						'<div class="theme" style="position:absolute;margin-left:89px;width:682px;"><span style="font-size:18px;color:#59657d;cursor:pointer;">'+data[ind].theme+'</span></div>'+
						'<i class="layui-icon reply" style="position:absolute;margin-top:40px;margin-left:880px;cursor:pointer;">&#xe611'+
						'<span style="color:#202020;margin-left:5px;font-size:13px;">'+data[ind].replys.length+'</span>'+
						'</i>'+
						'<div class="replyevent" style="width:500px;margin-left:89px;margin-top:50px;display:none;"><input class="layui-input replyContent" style="width:500px;height:30px;"/>'+
						'<span class="layui-btn" style="background-color:#7b9e31;position:absolute;margin-left:505px;margin-top:-30px;line-height:30px;height:30px;">回复</span>'+
						'</div>'+
						'</div>'+
						 '<div id="discusslist"></div>'+
	                     '<div id="discusspage" style="position:relative;margin-left:180px;"></div>'+
	                     '<div class="replyblock" style="margin-top:50px;position:relative;margin-left:180px;margin-bottom:100px;">'+
	                     '<textarea class="layui-textarea" placeholder="请输入内容..." style="width:963px;"></textarea>'+
	                        '<span class="layui-btn ensurereply" style="background-color:#7b9e31;position:absolute;margin-left:505px;margin-top:-30px;line-height:30px;height:30px;">回复</span>'+
	                     '</div>'+
			           '</div>');
			           if(data[ind].replys==''){
			               notFoundReply();
			           }else{
			               var reply = data[ind].replys;
			               FoundReply(reply);
			           }
			           
			           $(".ensurereply").on('click',function(){
			               if($(".layui-textarea").val()!=null && $(".layui-textarea").val().trim()!=''){
			                   
			                   $.post(
							           "/mooc/before/discussblock/reply",
							           {
							           "tid":data[ind].id,
							           "uid":"${USER.id}",
							           "replyContent":$(".layui-textarea").val()
							           },
							           function(data){
							               if(data!='null'){
							                   layer.msg('回复成功');
							                   $.post(
							                      "/mooc/before/discussblock/queryreply",
							                       {"ind":talkID},
							                       function(event){
							                           FoundReply(event);
							                       }
							                   );
							               }else{
							                   layer.msg('回复失败');
							               }
							           }
							       ); 
			                   
			               }else{
			                   layer.msg('请输入内容');
			               }
			           });
			         }
			         /*暂无评论时*/
			         function notFoundReply(){
			            $("#discusslist").append('<div class="discussprinci"style="margin-bottom:140px;">'+
					      '<span style="position:relative;margin-left:500px;font-size:18px;color:#999;line-height:2;">还没有评论哦！</span>'+
					      '</div>');
			         }
			         /*有评论时,给评论分页*/
			         function FoundReply(reply){
			            //调用评论分页
			            $("#discusspage").show();
				        laypage.render({
					    elem: 'discusspage'
					    ,count: reply.length 
						,limit:3
						,jump:function(obj){
						    /*一页能显示完内容，则不再显示分页*/
						      if(reply.length<=obj.limit){
						         $("#discusspage").hide();
						      }
						       //模拟渲染
						      document.getElementById('discusslist').innerHTML=function(){
						          var arr = [],
						          thisData = reply.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
						          var user = "${USER.id}";
						          layui.each(thisData, function(index,item){
						              var PostingHTML;
						              var Posting = item.uid;
						              if(user==Posting){
						                  PostingHTML = '<div class="operation" style="color:#7a9e31;position:absolute;margin-left:800px;margin-top:-40px;"><span onclick="deletereply('+item.id+');" style="cursor:pointer">删除</span>&nbsp|&nbsp<span onclick="updatereply('+item.id+');" style="cursor:pointer">编辑</span></div>';
						              }else{
						                  PostingHTML='';
						              }
						              var imagereply;
						              if(item.states==1){
						                  imagereply = '<img style="position:absolute;margin-top:40px;margin-left:-12px;" src="img/t.png"/>';
						              }else{
						                  imagereply = '<img style="position:absolute;margin-top:40px;margin-left:-12px;" src="img/s.png"/>';
						              }
						              arr.push('<div class="existdiscuss" style="position:relative;padding-left:80px;margin-bottom:5px;margin-left:180px;width:963px;height:112px;border:1px solid #e6e6e6;">'+
								              '<div><img style="margin-left:30px;margin-top:20px;width:42px;height:42px;border-radius:100%;" src="img/coursetest.jpg">'+
								              imagereply+
								              '</div>'+
								              PostingHTML+
								               '<div style="width:200px;margin-left:90px;margin-top:-42px;"><span style="font-size:14px;color:#7a9e31">'+item.replyName+'</span><span style="margin-left:10px;color:#666">华北水电水利大学</span></div>'+
								                '<p class="issuetime" style="margin-left:89px;color:#999;font-size:12px;">'+item.replyThemeTime+'</p>'+
								                '<div class="theme" style="position:absolute;margin-left:89px;width:682px;"><span style="font-size:18px;color:#59657d;cursor:pointer;">'+item.replyContent+'</span></div>'+
								                '</div>'+
								          '</div>');
						          });
						           return arr.join('');
						      }();
						}
					});
					/* 删除评论 */
					window.deletereply=function(replyid){
					    
					    layer.confirm("确认要删除吗，删除后不能恢复", { title: "删除确认",offset:"200px" }, function (index) {  
			                    layer.close(index);  
			                     $.post(
			                        "/mooc/before/discussblock/deletereply",
			                        {"id":replyid},
			                        function(data){
			                            if(data!='null'){
			                                layer.msg('删除成功');
			                                $.post(
							                      "/mooc/before/discussblock/queryreply",
							                       {"ind":talkID},
							                       function(event){
							                           if(event!=''){
							                               FoundReply(event);
							                           }else{
							                               FoundReply(event);
							                               notFoundReply();
							                           }
							                       }
							                   ); 
			                            }else{
			                                layer.msg('删除失败');
			                            }
			                        }
			                    ); 
                             });   
					}
					/*修改评论*/
					window.updatereply=function(upreplyid){
					      //示范一个公告层
					      layer.open({
					        type: 1
					        ,title: false //不显示标题栏
					        ,closeBtn: false
					        ,area: '300px;'
					        ,shade: 0.8
					        ,offset:'200px'
					        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
					        ,btn: ['确定', '取消']
					        ,btnAlign: 'c'
					        ,moveType: 1 //拖拽模式，0或者1
					        ,content: '<div style="padding: 50px;background-color: #393D49; font-weight: 300;"><textarea class="edittextarea" style="height:125px;width:201px;line-height:22px;" class="layui-input" placeholder="请输入要修改的内容"></textarea></div>'
					         ,yes:function(index, layero){
					             if($(".edittextarea").val()!=null&&$(".edittextarea").val().trim()!=''){
					                 $.post(
					                     "/mooc/before/discussblock/updatereply",
					                     {"id":upreplyid,"replyContent":$(".edittextarea").val()},
					                     function(event){
					                         if(event!='null'){
					                             layer.msg('修改成功',{offset:'300px'});
					                             $.post(
							                      "/mooc/before/discussblock/queryreply",
							                       {"ind":talkID},
							                       function(event){
							                           FoundReply(event);
							                       }
							                   ); 
					                         }else{
					                             layer.msg('修改失败',{offset:'300px'});
					                         }
					                     }
					                 );
					                 layer.closeAll();
					             }else{
					                 layer.msg('请输入要修改的内容',{offset:'300px'});
					             }
					         }
					      });
					    
					}
					
					//
			         }
			});
			
			
			
	    }
	    
       /*点击信息图标时*/
	   function replyeventshow(data){
	      if($(".replyevent").eq(data).css("display")=="none"){
	          $(".replyevent").eq(data).show();
	      }else{
	          $(".replyevent").eq(data).hide();
	      }
	   }
	   /*点击回复时*/
	   function ensurereply(tid,index){
	        layui.use(['layer'], function(){
	            var layer = layui.layer,$ = layui.jquery;
	            if($(".replyContent").eq(index).val()!=null&&$(".replyContent").eq(index).val().trim()!=''){
	                 $.post(
			           "/mooc/before/discussblock/reply",
			           {
			           "tid":tid,
			           "uid":"${USER.id}",
			           "replyContent":$(".replyContent").eq(index).val()
			           },
			           function(data){
			               if(data!='null'){
			                   $(".replyevent").eq(index).hide();
			                   layer.msg('回复成功');
			               }else{
			                   $(".replyevent").eq(index).hide();
			                   layer.msg('回复失败');
			               }
			           }
			       ); 
	            }else{
	                layer.msg('请输入内容');
	            }
	       }); 
	   }
	    
		$(".editor").click(function() {
			var index = $(".editor").index(this);
			var con = $(".levelname").eq(index).html();
			var s = $(".editor").eq(index).attr("state");
			$("#estate").val(s);
			var v=$(".editor").eq(index).val();
			$("#editorid").val(v);
			$(".editor-window").show();
			$(".editorinput").val(con);
		})
		$(".closebtn").click(function() {
			$(".editor-window").hide();
		})
		$(".editor-window-close").click(function() {
			$(".editor-window").hide();
		})
		$(".addparent").click(function(){
			$.post("/mooc/before/course/insertFirstCatalog",{
			"courseid":$("#courseid").val()
			},function(data){
				window.location.href="/mooc/before/course/coursecontent";
			});
		});
		function deleteBtn(){
			return confirm("确认删除该章节吗？");
		}
	</script>
</body>
</html>



























