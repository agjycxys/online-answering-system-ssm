<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<style type="text/css"> 
			button{
				width: 100%;
				height: 50px;
			}
		</style>
	</head>

	<body>
		<div class="table-responsive">
			<c:forEach items="${usersInfo }" var="usersInfo" varStatus="status">
				<table class="table table-striped table-bordered">
					<tr>
						<td>姓名</td><td>${usersInfo.usersname }</td>
					</tr>
					<tr>
						<td>性别</td><td>${usersInfo.xingbie }</td>
					</tr>
					<tr>
						<td>电话</td><td>${usersInfo.dianhua }</td>
					</tr>
					<tr>
						<td>学校</td><td>${usersInfo.xuexiao }</td>
					</tr>
					<tr>
						<td>专业</td><td>${usersInfo.zhuanye }</td>
					</tr>
					<tr>
						<td>学历</td><td>${usersInfo.xueli }</td>
					</tr>
					<tr>
						<td>客观题成绩</td><td>${usersInfo.kgtscore }</td>
					</tr>
					<tr>
						<td>主观题成绩</td><td>${usersInfo.zgtscore }</td>
					</tr>
					<tr>
						<td>总成绩</td><td>${usersInfo.score }</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		<div class="but">
			<button type="button" onclick="javascript:history.back(-1);">返回</button>
		</div>
	</body>

</html>