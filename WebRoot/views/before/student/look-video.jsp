<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script src="js/jquery.ui.widget.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.xdr-transport.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload-ui.css"
	type="text/css"></link>
<link rel="stylesheet" href="css/jquery.fileupload.css" type="text/css"></link>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

.preview {
	background-color: #eee;
	margin-top: -40px;
}

.preview embed {
	margin-top: 0;
}
</style>

</head>
<body>
	<div class="preview">
		<embed src="${map.videos}" id="videow"style="text-align: center;"
			allowscriptaccess='always' allowfullscreen='true' wmode='opaque'
			width='1000' height='640'>

		</embed>
	</div>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
		$(window).resize(function() {
			$("#videow").attr("width",$(window).width());
		});
	</script>
</body>
</html>