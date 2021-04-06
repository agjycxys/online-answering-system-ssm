<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
		<style>
			td {
				text-align: center;
			}
		</style>
	</head>

	<body>
		<table class="layui-table">
			<tr>
				<td>姓名</td>
				<td><%=new String(request.getParameter("usersname").getBytes("ISO-8859-1"),"utf-8") %></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><%=new String(request.getParameter("xingbie").getBytes("ISO-8859-1"),"utf-8") %></td>
			</tr>
			<tr>
				<td>电话</td>
				<td>${param.dianhua }</td>
			</tr>
			<tr>
				<td>学校</td>
				<td><%=new String(request.getParameter("xuexiao").getBytes("ISO-8859-1"),"utf-8") %></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><%=new String(request.getParameter("zhuanye").getBytes("ISO-8859-1"),"utf-8") %></td>
			</tr>
			<tr>
				<td>学历</td>
				<td><%=new String(request.getParameter("xueli").getBytes("ISO-8859-1"),"utf-8") %></td>
			</tr>
			<tr>
				<td>微信昵称</td>
				<td><%=new String(request.getParameter("wxname").getBytes("ISO-8859-1"),"utf-8") %></td>
			</tr>
			<tr>
				<td>所在考场</td>
				<td>${param.kcid }</td>
			</tr>
			<tr>
				<td>客观题成绩</td>
				<td>${param.kgtscore }</td>
			</tr>
			<tr>
				<td>主观题成绩</td>
				<td>${param.zgtscore }</td>
			</tr>
			<tr>
				<td>总成绩</td>
				<td>${param.score }</td>
			</tr>
		</table>
		<div align="center">
			<p style="text-align: center;" >
				<a href="#" class="layui-btn">保存</a>
				<button type="button" onclick="history.go(-1)" class="layui-btn layui-btn-normal">返回</button>
			</p>
		</div>
		<script>
			function fake_click(obj) {
				var ev = document.createEvent("MouseEvents");
				ev.initMouseEvent(
					"click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null
				);
				obj.dispatchEvent(ev);
			}

			function export_raw(name, data) {
				var urlObject = window.URL || window.webkitURL || window;

				var export_blob = new Blob([data]);

				var save_link = document.createElementNS("http://www.w3.org/1999/xhtml", "a")
				save_link.href = urlObject.createObjectURL(export_blob);
				save_link.download = name;
				fake_click(save_link);
			}
			var test = document.getElementsByTagName('html')[0].outerHTML;
			console.log(test);
			$('a').click(function() {
				export_raw('test.doc', test);
			});
		</script>
	</body>

</html>