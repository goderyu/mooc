
$(".mainsearch").focus(function() {
	$(".mainsearch").removeAttr("placeholder");
});

$(".mainsearch").blur(function() {
	if ($(".mainsearch").value == null) {
		$(".mainsearch").attr("placeholder", "搜索感兴趣的课程");
	}
});

$(window).scroll(function() {
	if ($(window).scrollTop() > 120) {
		$(".main-scroll").attr("style", "display:block");
	} else {
		$(".main-scroll").attr("style", "display:none");
	}
});

var image = $(".main-middle-image>div");

var imgli = $(".lunbo-point>li");

var upimg = $(".lunbo-leftcricle");

var nextimg = $(".lunbo-rightcricle");

var lunbo=$(".main-lunbotu");

var index = 0;

var time;

function change(x) {
	var show = $(".image-show");
	show.attr("class", "image-hide");
	image.eq(x).attr("class", "image-show");
	imgli.removeAttr("class");
	imgli.eq(x).attr("class", "point");
	if (x == 0) {
		lunbo.attr("style", "background-color:#6041A0");
	} else if (x == 1) {
		lunbo.attr("style", "background-color:#8C28AE");
	} else if (x == 2) {
		lunbo.attr("style", "background-color:#3B28A6");
	} else if (x == 3) {
		lunbo.attr("style", "background-color:#1A0D39");
	} else {
		lunbo.attr("style", "background-color:#B72922");
	}
};

imgli.hover(function() {
	index = $(this).index();
	change(index);
});

upimg.click(function() {
	if (index > 0) {
		index = (index - 1) % (image.length);
	} else {
		index = Math.abs((index - 4) % (image.length));
	}
	change(index);
});

nextimg.click(function() {
	index = (index + 1) % (image.length);
	change(index);
});

time = setInterval(function() {
	index = index % (image.length);
	change(index);
	index++;
}, 3000);

var login = $(".main-login");

var loginbtn = $(".login");

loginbtn.click(function() {
	login.show();
});

var loginclose = $(".main-login-close");

loginclose.click(function() {
	$(".psw").val("");
	$(".username").val("");
	login.hide();
});