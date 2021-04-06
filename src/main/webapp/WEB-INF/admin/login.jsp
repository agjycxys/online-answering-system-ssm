<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loginHtml">
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/cache.js"></script>
		<script type="text/javascript">
			layui.use(['form', 'layer', 'jquery'], function() {
				var form = layui.form,
					layer = parent.layer === undefined ? layui.layer : top.layer
				$ = layui.jquery;
				//表单输入效果
				$(".loginBody .input-item").click(function(e) {
					e.stopPropagation();
					$(this).addClass("layui-input-focus").find(".layui-input").focus();
				})
				$(".loginBody .layui-form-item .layui-input").focus(function() {
					$(this).parent().addClass("layui-input-focus");
				})
				$(".loginBody .layui-form-item .layui-input").blur(function() {
					$(this).parent().removeClass("layui-input-focus");
					if($(this).val() != '') {
						$(this).parent().addClass("layui-input-active");
					} else {
						$(this).parent().removeClass("layui-input-active");
					}
				})
			})
		</script>
	</head>

	<body class="loginBody">
		<form class="layui-form" method="post" action="${pageContext.request.contextPath }/login">
			<div class="login_face"><img src="images/face.jpg" class="userAvatar"></div>
			<div class="layui-form-item input-item">
				<label for="userName">用户名</label>
				<input type="text" placeholder="请输入用户名" autocomplete="off" id="adname" name="adname" class="layui-input" lay-verify="required">
			</div>
			<div class="layui-form-item input-item">
				<label for="password">密码</label>
				<input type="password" placeholder="请输入密码" autocomplete="off" id="adpwd" name="adpwd" class="layui-input" lay-verify="required">
			</div>
			<div class="layui-form-item">
				<button class="layui-btn layui-block" type="submit">登录</button>
			</div>
		</form>
	</body>

</html>