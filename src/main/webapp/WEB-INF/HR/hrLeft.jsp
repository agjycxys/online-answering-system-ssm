<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
			.container-fluid {
				font-size: 20px;
			}
			#left_00{
				font-size: 20px;
			}
			li{
				padding-bottom: 20px;
			}
		</style>
	</head>

	<body>
		<div id="left_00">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active">
				<a>菜单栏</a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath}/KC_infoServlet" target="mainFrame">考场设置</a>
			</li>
			<li role="presentation" class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
					查询<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li role="presentation">
						<a href="${pageContext.request.contextPath}/HR/scoreQuery.jsp" target="mainFrame">成绩查询</a>
					</li>
					<li role="presentation">
						<a href="${pageContext.request.contextPath}/HR/nameQuery.jsp" target="mainFrame">姓名查询</a>
					</li>
				</ul>
			</li>
		</ul>
		</div>
	</body>

</html>