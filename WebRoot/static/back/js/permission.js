function addPermission(){
			$("#addDiv").show();
		}
		function hideAdd(){
			$("#addDiv").hide();
			$("#addchilddiv").hide();
		}
		function delper(id){
			if(confirm("确定要删除吗？")){
				$.post("/mooc/back/backpermission/deletepermission",
						{
					id:id
						},
						function(data){
							window.location.href="/mooc/back/backpermission/permissions";
						}
				);
			}
		}
		function hideUpdate(){
			$("#updateDiv").hide();
		}
		function closeupdate(){
			$("#updateDiv").hide();
		}
		function updatea(id){
			$("#radiodiv").html("");
			$.post("/mooc/back/backpermission/permission",
				{
					id:id
				},
				function(data){
					$("#pername").val(data.permission.name);
					$("#perinfo").val(data.permission.pInfo);
					for ( var i in data.permissionChild) {
						var str = $("<span style='padding:5px 20px;color:#009688;'>"+data.permissionChild[i].cname+"</span><span class='xspan' data-perid="+id+" onclick='delchild("+data.permissionChild[i].cid+");'>×</span>");  
						$("#radiodiv").append(str); //将动态创建的str元素追加到ul下面
					}
					$("#updateDiv").attr("perid",id);
					$("#idinputhi").val(id);
					$("#updateDiv").show();
				}
			);
		}
		function delchild(cid){
			if(confirm("确定要删除吗？")){
				$.post("/mooc/back/backpermission/deletePermissionChild",
					{
						id:cid
					},
					function(data){
						updatea($("#updateDiv").attr("perid"));
					}
				);
			}
		}
		function addchild(){
			$("#addchilddiv").show();
		}
		function addchildtrue(){
			$.post("/mooc/back/backpermission/insertPermissionChild",
				{
					pid:$("#updateDiv").attr("perid"),
					cname:$("#cnaminput").val(),
					curl:$("#curlinput").val()
				},
				function(data){
					updatea($("#updateDiv").attr("perid"));
					$("#addchilddiv").hide();
				}
			);
		}