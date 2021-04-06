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
			div{
				height: 50%;
				width: 50%;
				margin: auto;
				padding: 50% 0px;
				font-size: large;
			}
		</style>
	</head>
	<body>
		<div>
		<span style="font-size: 18px">您的客观题成绩为:</span><span style="font-size: 18px">${param.kgtscore }</span><br /><br />
			<font color="red">
				请退出系统!
			</font>
		</div>
	</body>
</html>
