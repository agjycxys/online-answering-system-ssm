<%@page import="domain.Users"%>
<%@page import="java.util.List"%>
<%@page import="service.UsersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/public.css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
	layui
			.use(
					[ 'form', 'layer', 'table', 'laytpl' ],
					function() {
						var form = layui.form, layer = parent.layer === undefined ? layui.layer
								: top.layer, $ = layui.jquery, laytpl = layui.laytpl, table = layui.table;
					});
</script>
<style>
td {
	text-align: center;
}
</style>
</head>

<body>
	<%
		UsersService usersService = new UsersService();
		List<Users> allUsers = usersService.queryUsers();
		request.setAttribute("allUsers", allUsers);
	%>
	<form class="layui-form">
		<blockquote class="layui-elem-quote quoteBox">
			<form class="layui-form">
				<div class="layui-inline">
					<div class="layui-input-inline">
						<input type="text" class="layui-input searchVal"
							placeholder="请输入姓名" />
					</div>
					<a class="layui-btn search_btn" data-type="reload">搜索</a>
				</div>
			</form>
		</blockquote>
		<table class="layui-table">
			<thead>
				<tr>
					<td>序号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>电话</td>
					<td>学校</td>
					<td>专业</td>
					<td>学历</td>
					<td>微信昵称</td>
					<td>所在考场</td>
					<td>客观题成绩</td>
					<td>主观题成绩</td>
					<td>总成绩</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allUsers }" var="allUsers" varStatus="status">
					<tr onmouseover="this.style.backgroundColor = 'white'"
						onmouseout="this.style.backgroundColor = '#F5FAFE';">
						<td>${status.count }</td>
						<td>${allUsers.usersname }</td>
						<td>${allUsers.xingbie }</td>
						<td>${allUsers.dianhua }</td>
						<td>${allUsers.xuexiao }</td>
						<td>${allUsers.zhuanye }</td>
						<td>${allUsers.xueli }</td>
						<td>${allUsers.wxname }</td>
						<td>${allUsers.kcid }</td>
						<td>${allUsers.kgtscore }</td>
						<td>${allUsers.zgtscore }</td>
						<td>${allUsers.score }</td>
						<td><a href="download.jsp?usersname=${allUsers.usersname }&xingbie=${allUsers.xingbie }&dianhua=${allUsers.dianhua }&xuexiao=${allUsers.xuexiao }&zhuanye=${allUsers.zhuanye }&xueli=${allUsers.xueli }&wxname=${allUsers.wxname }&kcid=${allUsers.kcid }&kgtscore=${allUsers.kgtscore }&zgtscore=${allUsers.zgtscore }&score=${allUsers.score }" class="layui-btn">导出</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>

</html>