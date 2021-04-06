<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title></title>
		<script src="${pageContext.request.contextPath}/js/mui.js"></script>
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
		<link rel='stylesheet' href='http://fonts.googleapis.com/icon?family=Material+Icons' type='text/css'>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/sidenav.min.css" type="text/css">
		<style type="text/css">
			.toggle {
				display: block;
				height: 72px;
				line-height: 72px;
				text-align: center;
				width: 72px;
			}
			
			.container-fluid {
				font-size: 20px;
			}
			
			#left_00 {
				font-size: 20px;
			}
			
			li {
				padding-bottom: 20px;
			}
			
			body {
				margin: 0;
				padding: 0;
			}
			.mui-bar-nav{
				background-color: orange;
			}
		</style>
		<script type="text/javascript">
			function dianji(id) {
				var biaoti = document.getElementById(id);
				document.getElementById("biaoti").innerHTML = biaoti.innerHTML;
				JTclick(id);
			}
		</script>
	</head>

	<body>
		<nav class="sidenav" data-sidenav data-sidenav-toggle="#sidenav-toggle">
			<div class="sidenav-brand" align="center">
				菜单栏
			</div>
			<ul class="sidenav-menu">
				<li>
					<a href="${pageContext.request.contextPath}/HR/hrRight.jsp" target="mainFrame" onclick="dianji(this.id)" id="0">
						<span class="sidenav-link-title">首页</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/KC_infoServlet" target="mainFrame" onclick="dianji(this.id)" id="1">
						<span class="sidenav-link-title">考场设置</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/isPYInfoServlet" id="2" onclick="dianji(this.id)" target="mainFrame">
						<span class="sidenav-link-title">重置阅卷状态</span>
					</a>
				</li>
				<li>
					<a href="javascript:;" data-sidenav-dropdown-toggle class="active">
						<span class="sidenav-link-title">查询</span>
						<span class="sidenav-dropdown-icon show" data-sidenav-dropdown-icon>
	            			<i class="material-icons">arrow_drop_down</i>
	          			</span>
						<span class="sidenav-dropdown-icon" data-sidenav-dropdown-icon>
	            			<i class="material-icons">arrow_drop_up</i>
	          			</span>
					</a>
					<ul class="sidenav-dropdown" data-sidenav-dropdown>
						<li>
							<a href="${pageContext.request.contextPath}/HR/scoreQuery.jsp" id="3" onclick="dianji(this.id)" target="mainFrame">成绩查询</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/HR/nameQuery.jsp" target="mainFrame" id="4" onclick="dianji(this.id)">姓名查询</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/HR/hrLogin.jsp">
						<span class="sidenav-link-title">退出</span>
					</a>
				</li>
			</ul>
		</nav>

		<div class="mui-inner-wrap">
			<!-- 主页面标题 -->
			<header class="mui-bar mui-bar-nav">
				<h1 class="mui-title" id="biaoti">欢迎登录!</h1>

				<a href="javascript:;" class="toggle" id="sidenav-toggle">
					<i class="material-icons" style="color: black;">menu</i>
				</a>
			</header>
			<div class="mui-content mui-scroll-wrapper" id="panel">
				<div class="mui-scroll">
					<iframe src="${pageContext.request.contextPath}/HR/hrRight.jsp" frameborder="0" scrolling="auto" id="myiframe" name="mainFrame"></iframe>
				</div>
			</div>
		</div>

		<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/dist/sidenav.min.js"></script>
		<script>
			$('[data-sidenav]').sidenav();
		</script>
		<script type="text/javascript">
			var ifm = document.getElementById("myiframe");
			ifm.height = document.documentElement.clientHeight;
			ifm.width = document.documentElement.clientWidth;

			function changeFrameHeight() {
				var ifm = document.getElementById("myiframe");
				ifm.height = document.documentElement.clientHeight;
				ifm.width = document.documentElement.clientWidth;
			}
			window.onresize = function() {
				changeFrameHeight();
			}
		</script>
	</body>

</html>