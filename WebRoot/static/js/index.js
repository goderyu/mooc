var $,tab,skyconsWeather;
layui.config({
	base : "js/"
}).use(['bodyTab','form','element','layer','jquery'],function(){
	var form = layui.form(),
		layer = layui.layer,
		element = layui.element();
		$ = layui.jquery;
		tab = layui.bodyTab({
			openTabNum : "50",  //鏈€澶у彲鎵撳紑绐楀彛鏁伴噺
			url : "json/navs.json" //鑾峰彇鑿滃崟json鍦板潃
		});

	//鏇存崲鐨偆
	function skins(){
		var skin = window.sessionStorage.getItem("skin");
		if(skin){  //濡傛灉鏇存崲杩囩毊鑲�
			if(window.sessionStorage.getItem("skinValue") != "鑷畾涔�"){
				$("body").addClass(window.sessionStorage.getItem("skin"));
			}else{
				$(".layui-layout-admin .layui-header").css("background-color",skin.split(',')[0]);
				$(".layui-bg-black").css("background-color",skin.split(',')[1]);
				$(".hideMenu").css("background-color",skin.split(',')[2]);
			}
		}
	}
	skins();
	$(".changeSkin").click(function(){
		layer.open({
			title : "鏇存崲鐨偆",
			area : ["310px","280px"],
			type : "1",
			content : '<div class="skins_box">'+
						'<form class="layui-form">'+
							'<div class="layui-form-item">'+
								'<input type="radio" name="skin" value="榛樿" title="榛樿" lay-filter="default" checked="">'+
								'<input type="radio" name="skin" value="姗欒壊" title="姗欒壊" lay-filter="orange">'+
								'<input type="radio" name="skin" value="钃濊壊" title="钃濊壊" lay-filter="blue">'+
								'<input type="radio" name="skin" value="鑷畾涔�" title="鑷畾涔�" lay-filter="custom">'+
								'<div class="skinCustom">'+
									'<input type="text" class="layui-input topColor" name="topSkin" placeholder="椤堕儴棰滆壊" />'+
									'<input type="text" class="layui-input leftColor" name="leftSkin" placeholder="宸︿晶棰滆壊" />'+
									'<input type="text" class="layui-input menuColor" name="btnSkin" placeholder="椤堕儴鑿滃崟鎸夐挳" />'+
								'</div>'+
							'</div>'+
							'<div class="layui-form-item skinBtn">'+
								'<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-normal" lay-submit="" lay-filter="changeSkin">纭畾鏇存崲</a>'+
								'<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-primary" lay-submit="" lay-filter="noChangeSkin">鎴戝啀鎯虫兂</a>'+
							'</div>'+
						'</form>'+
					'</div>',
			success : function(index, layero){
				var skin = window.sessionStorage.getItem("skin");
				if(window.sessionStorage.getItem("skinValue")){
					$(".skins_box input[value="+window.sessionStorage.getItem("skinValue")+"]").attr("checked","checked");
				};
				if($(".skins_box input[value=鑷畾涔塢").attr("checked")){
					$(".skinCustom").css("visibility","inherit");
					$(".topColor").val(skin.split(',')[0]);
					$(".leftColor").val(skin.split(',')[1]);
					$(".menuColor").val(skin.split(',')[2]);
				};
				form.render();
				$(".skins_box").removeClass("layui-hide");
				$(".skins_box .layui-form-radio").on("click",function(){
					var skinColor;
					if($(this).find("span").text() == "姗欒壊"){
						skinColor = "orange";
					}else if($(this).find("span").text() == "钃濊壊"){
						skinColor = "blue";
					}else if($(this).find("span").text() == "榛樿"){
						skinColor = "";
					}
					if($(this).find("span").text() != "鑷畾涔�"){
						$(".topColor,.leftColor,.menuColor").val('');
						$("body").removeAttr("class").addClass("main_body "+skinColor+"");
						$(".skinCustom").removeAttr("style");
						$(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
					}else{
						$(".skinCustom").css("visibility","inherit");
					}
				})
				var skinStr,skinColor;
				$(".topColor").blur(function(){
					$(".layui-layout-admin .layui-header").css("background-color",$(this).val());
				})
				$(".leftColor").blur(function(){
					$(".layui-bg-black").css("background-color",$(this).val());
				})
				$(".menuColor").blur(function(){
					$(".hideMenu").css("background-color",$(this).val());
				})

				form.on("submit(changeSkin)",function(data){
					if(data.field.skin != "鑷畾涔�"){
						if(data.field.skin == "姗欒壊"){
							skinColor = "orange";
						}else if(data.field.skin == "钃濊壊"){
							skinColor = "blue";
						}else if(data.field.skin == "榛樿"){
							skinColor = "";
						}
						window.sessionStorage.setItem("skin",skinColor);
					}else{
						skinStr = $(".topColor").val()+','+$(".leftColor").val()+','+$(".menuColor").val();
						window.sessionStorage.setItem("skin",skinStr);
						$("body").removeAttr("class").addClass("main_body");
					}
					window.sessionStorage.setItem("skinValue",data.field.skin);
					layer.closeAll("page");
				});
				form.on("submit(noChangeSkin)",function(){
					$("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
					$(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
					skins();
					layer.closeAll("page");
				});
			},
			cancel : function(){
				$("body").removeAttr("class").addClass("main_body "+window.sessionStorage.getItem("skin")+"");
				$(".layui-bg-black,.hideMenu,.layui-layout-admin .layui-header").removeAttr("style");
				skins();
			}
		})
	})

	//閫€鍑�
	$(".signOut").click(function(){
		window.sessionStorage.removeItem("menu");
		menu = [];
		window.sessionStorage.removeItem("curmenu");
	})

	//闅愯棌宸︿晶瀵艰埅
	$(".hideMenu").click(function(){
		$(".layui-layout-admin").toggleClass("showMenu");
		//娓叉煋椤堕儴绐楀彛
		tab.tabMove();
	})

	//娓叉煋宸︿晶鑿滃崟
	tab.render();

	//閿佸睆
	function lockPage(){
		layer.open({
			title : false,
			type : 1,
			content : '	<div class="admin-header-lock" id="lock-box">'+
							'<div class="admin-header-lock-img"><img src="images/face.jpg"/></div>'+
							'<div class="admin-header-lock-name" id="lockUserName">璇峰彨鎴戦┈鍝�</div>'+
							'<div class="input_btn">'+
								'<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="璇疯緭鍏ュ瘑鐮佽В閿�.." name="lockPwd" id="lockPwd" />'+
								'<button class="layui-btn" id="unlock">瑙ｉ攣</button>'+
							'</div>'+
							'<p>璇疯緭鍏モ€�123456鈥濓紝鍚﹀垯涓嶄細瑙ｉ攣鎴愬姛鍝︼紒锛侊紒</p>'+
						'</div>',
			closeBtn : 0,
			shade : 0.9
		})
		$(".admin-header-lock-input").focus();
	}
	$(".lockcms").on("click",function(){
		window.sessionStorage.setItem("lockcms",true);
		lockPage();
	})
	// 鍒ゆ柇鏄惁鏄剧ず閿佸睆
	if(window.sessionStorage.getItem("lockcms") == "true"){
		lockPage();
	}
	// 瑙ｉ攣
	$("body").on("click","#unlock",function(){
		if($(this).siblings(".admin-header-lock-input").val() == ''){
			layer.msg("璇疯緭鍏ヨВ閿佸瘑鐮侊紒");
			$(this).siblings(".admin-header-lock-input").focus();
		}else{
			if($(this).siblings(".admin-header-lock-input").val() == "123456"){
				window.sessionStorage.setItem("lockcms",false);
				$(this).siblings(".admin-header-lock-input").val('');
				layer.closeAll("page");
			}else{
				layer.msg("瀵嗙爜閿欒锛岃閲嶆柊杈撳叆锛�");
				$(this).siblings(".admin-header-lock-input").val('').focus();
			}
		}
	});
	$(document).on('keydown', function() {
		if(event.keyCode == 13) {
			$("#unlock").click();
		}
	});

	//鎵嬫満璁惧鐨勭畝鍗曢€傞厤
	var treeMobile = $('.site-tree-mobile'),
		shadeMobile = $('.site-mobile-shade')

	treeMobile.on('click', function(){
		$('body').addClass('site-mobile');
	});

	shadeMobile.on('click', function(){
		$('body').removeClass('site-mobile');
	});

	// 娣诲姞鏂扮獥鍙�
	$("body").on("click",".layui-nav .layui-nav-item a",function(){
		//濡傛灉涓嶅瓨鍦ㄥ瓙绾�
		if($(this).siblings().length == 0){
			addTab($(this));
			$('body').removeClass('site-mobile');  //绉诲姩绔偣鍑昏彍鍗曞叧闂彍鍗曞眰
		}
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	})

	//鍏憡灞�
	function showNotice(){
		layer.open({
	        type: 1,
	        title: "绯荤粺鍏憡",
	        closeBtn: false,
	        area: '310px',
	        shade: 0.8,
	        id: 'LAY_layuipro',
	        btn: ['鐏€熷洿瑙�'],
	        moveType: 1,
	        content: '<div style="padding:15px 20px; text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;"><p>鏈€杩戝伓鐒跺彂鐜拌搐蹇冨ぇ绁炵殑layui妗嗘灦锛岀灛闂磋浠栫殑瀹岀編鏍峰紡鎵€鍚稿紩锛岃櫧鐒跺姛鑳戒笉绠楀己澶э紝浣嗘瘯绔熸槸涓€涓垰鍒氬嚭鐜扮殑妗嗘灦锛屽悗闈細鎱㈡參瀹屽杽鐨勩€傚緢鏃╀箣鍓嶅氨鎯冲仛涓€濂楀悗鍙版ā鐗堬紝浣嗘槸鎰熻bootstrop浠ｇ爜鐨勫啑浣欏お澶э紝涓嶆槸闈炲父鍠滄锛岃嚜宸卞啓鍙堝お绱紝鎵€浠ヤ竴鐩撮棽缃簡涓嬫潵銆傜洿鍒伴亣鍒颁簡layui鎴戞墠鍙堢噧璧蜂簡鍒朵綔涓€濂楀悗鍙版ā鐗堢殑鏂楀織銆傜敱浜庢湰浜哄彧鏄函鍓嶇锛屾墍浠ラ〉闈㈠彧鏄崟绾殑瀹炵幇浜嗘晥鏋滐紝娌℃湁鍋氭湇鍔″櫒绔殑涓€浜涘鐞嗭紝鍙兘鍚庢湡鎶€鏈窡涓婁簡浼氭洿鏂扮殑锛屽鏋滄湁浠€涔堥棶棰樻杩庡ぇ瀹舵寚瀵笺€傝阿璋㈠ぇ瀹躲€�</p><p>鍦ㄦ鐗瑰埆鎰熻阿Beginner鍜孭aco锛屼粬浠啓鐨勬鏋剁粰浜嗘垜寰堝ソ鐨勫惎鍙戝拰鍊熼壌銆傚笇鏈涙湁鏃堕棿鍙互澶氬璇锋暀銆�</p></div>',
	        success: function(layero){
				var btn = layero.find('.layui-layer-btn');
				btn.css('text-align', 'center');
				btn.on("click",function(){
					window.sessionStorage.setItem("showNotice","true");
				})
				if($(window).width() > 432){  //濡傛灉椤甸潰瀹藉害涓嶈冻浠ユ樉绀洪《閮ㄢ€滅郴缁熷叕鍛娾€濇寜閽紝鍒欎笉鎻愮ず
					btn.on("click",function(){
						layer.tips('绯荤粺鍏憡韬插湪浜嗚繖閲�', '#showNotice', {
							tips: 3
						});
					})
				}
	        }
	    });
	}
	//鍒ゆ柇鏄惁澶勪簬閿佸睆鐘舵€�(濡傛灉鍏抽棴浠ュ悗鍒欐湭鍏抽棴娴忚鍣ㄤ箣鍓嶄笉鍐嶆樉绀�)
	if(window.sessionStorage.getItem("lockcms") != "true" && window.sessionStorage.getItem("showNotice") != "true"){
		showNotice();
	}
	$(".showNotice").on("click",function(){
		showNotice();
	})

	//鍒锋柊鍚庤繕鍘熸墦寮€鐨勭獥鍙�
	if(window.sessionStorage.getItem("menu") != null){
		menu = JSON.parse(window.sessionStorage.getItem("menu"));
		curmenu = window.sessionStorage.getItem("curmenu");
		var openTitle = '';
		for(var i=0;i<menu.length;i++){
			openTitle = '';
			if(menu[i].icon){
				if(menu[i].icon.split("-")[0] == 'icon'){
					openTitle += '<i class="iconfont '+menu[i].icon+'"></i>';
				}else{
					openTitle += '<i class="layui-icon">'+menu[i].icon+'</i>';
				}
			}
			openTitle += '<cite>'+menu[i].title+'</cite>';
			openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="'+menu[i].layId+'">&#x1006;</i>';
			element.tabAdd("bodyTab",{
				title : openTitle,
		        content :"<iframe src='"+menu[i].href+"' data-id='"+menu[i].layId+"'></frame>",
		        id : menu[i].layId
			})
			//瀹氫綅鍒板埛鏂板墠鐨勭獥鍙�
			if(curmenu != "undefined"){
				if(curmenu == '' || curmenu == "null"){  //瀹氫綅鍒板悗鍙伴椤�
					element.tabChange("bodyTab",'');
				}else if(JSON.parse(curmenu).title == menu[i].title){  //瀹氫綅鍒板埛鏂板墠鐨勯〉闈�
					element.tabChange("bodyTab",menu[i].layId);
				}
			}else{
				element.tabChange("bodyTab",menu[menu.length-1].layId);
			}
		}
		//娓叉煋椤堕儴绐楀彛
		tab.tabMove();
	}

	//鍒锋柊褰撳墠
	$(".refresh").on("click",function(){  //姝ゅ娣诲姞绂佹杩炵画鐐瑰嚮鍒锋柊涓€鏄负浜嗛檷浣庢湇鍔″櫒鍘嬪姏锛屽彟澶栦竴涓氨鏄负浜嗛槻姝㈣秴蹇偣鍑婚€犳垚chrome鏈韩鐨勪竴浜沯s鏂囦欢鐨勬姤閿�(涓嶈繃璨屼技杩欎釜闂杩樻槸瀛樺湪锛屼笉杩囨鐜囧皬浜嗗緢澶�)
		if($(this).hasClass("refreshThis")){
			$(this).removeClass("refreshThis");
			$(".clildFrame .layui-tab-item.layui-show").find("iframe")[0].contentWindow.location.reload(true);
			setTimeout(function(){
				$(".refresh").addClass("refreshThis");
			},2000)
		}else{
			layer.msg("鎮ㄧ偣鍑荤殑閫熷害瓒呰繃浜嗘湇鍔″櫒鐨勫搷搴旈€熷害锛岃繕鏄瓑涓ょ鍐嶅埛鏂板惂锛�");
		}
	})

	//鍏抽棴鍏朵粬
	$(".closePageOther").on("click",function(){
		if($("#top_tabs li").length>2 && $("#top_tabs li.layui-this cite").text()!="鍚庡彴棣栭〉"){
			var menu = JSON.parse(window.sessionStorage.getItem("menu"));
			$("#top_tabs li").each(function(){
				if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
					element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
					//姝ゅ灏嗗綋鍓嶇獥鍙ｉ噸鏂拌幏鍙栨斁鍏ession锛岄伩鍏嶄竴涓釜鍒犻櫎鏉ュ洖寰幆閫犳垚鐨勪笉蹇呰宸ヤ綔閲�
					for(var i=0;i<menu.length;i++){
						if($("#top_tabs li.layui-this cite").text() == menu[i].title){
							menu.splice(0,menu.length,menu[i]);
							window.sessionStorage.setItem("menu",JSON.stringify(menu));
						}
					}
				}
			})
		}else if($("#top_tabs li.layui-this cite").text()=="鍚庡彴棣栭〉" && $("#top_tabs li").length>1){
			$("#top_tabs li").each(function(){
				if($(this).attr("lay-id") != '' && !$(this).hasClass("layui-this")){
					element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
					window.sessionStorage.removeItem("menu");
					menu = [];
					window.sessionStorage.removeItem("curmenu");
				}
			})
		}else{
			layer.msg("娌℃湁鍙互鍏抽棴鐨勭獥鍙ｄ簡@_@");
		}
		//娓叉煋椤堕儴绐楀彛
		tab.tabMove();
	})
	//鍏抽棴鍏ㄩ儴
	$(".closePageAll").on("click",function(){
		if($("#top_tabs li").length > 1){
			$("#top_tabs li").each(function(){
				if($(this).attr("lay-id") != ''){
					element.tabDelete("bodyTab",$(this).attr("lay-id")).init();
					window.sessionStorage.removeItem("menu");
					menu = [];
					window.sessionStorage.removeItem("curmenu");
				}
			})
		}else{
			layer.msg("娌℃湁鍙互鍏抽棴鐨勭獥鍙ｄ簡@_@");
		}
		//娓叉煋椤堕儴绐楀彛
		tab.tabMove();
	})
})

//鎵撳紑鏂扮獥鍙�
function addTab(_this){
	tab.tabAdd(_this);
}

//鎹愯禒寮圭獥
function donation(){
	layer.tab({
		area : ['260px', '367px'],
		tab : [{
			title : "寰俊",
			content : "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='images/wechat.jpg'></div>"
		},{
			title : "鏀粯瀹�",
			content : "<div style='padding:30px;overflow:hidden;background:#d2d0d0;'><img src='images/alipay.jpg'></div>"
		}]
	})
}
