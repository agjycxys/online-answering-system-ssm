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
		<title>姓名查询</title>
		<style type="text/css">
			#label_1 {
				font-size: 20px;
			}
			button{
				width: 100%;
				height: 50px;
			}
			#content {
				width: 200px;
				height: 200px;
				position: absolute;
				left: 50%;
				top: 50%;
				margin-left: -100px;
				margin-top: -100px;
				text-align: center;
			}
		</style>
	</head>

	<body>
		<div id="content">
		<form action="${pageContext.request.contextPath}/HR_NameQueryServlet" method="post">
			<div class="form-group">
				<label for="usersname" id="label_1">请输入姓名</label>
				<input type="text" class="form-control" id="usersname" name="usersname" placeholder="请输入姓名" required="required">
			</div>
			<button type="submit" class="btn btn-default">查询</button>
		</form>
		</div>
	</body>

</html>