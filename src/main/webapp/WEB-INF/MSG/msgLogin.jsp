<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">

	<head>
		<title>面试官登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" type="text/css" />
	</head>

	<body background="${pageContext.request.contextPath}/images/bodybg.jpg">
		<section id="content" class="m-t-lg wrapper-md animated fadeInUp ">
			<div class="container aside-xl" style="margin-top: 48px;">
				<a class="navbar-brand block"><span class="h1 font-bold" style="color: #ffffff">面试官登录</span></a>
				<div style="text-align: center;color: red">
					<%=request.getAttribute("error")==null?"":request.getAttribute("error")%>
				</div>
				<section class="m-b-lg">
					<form action="${pageContext.request.contextPath }/MSGLoginServlet" method="post">
						<div class="form-group">
							<input type="text" name="msgaccount" id="msgaccount" placeholder="账号" class="form-control  input-lg text-center no-border">
						</div>
						<div class="form-group">
							<input type="password" name="msgpwd" id="msgpwd" placeholder="密码" class="form-control  input-lg text-center no-border">
						</div>

						<button type="submit" class="btn btn-lg btn-danger lt b-white b-2x btn-block" id="validate-submit">
                    <i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span></button>
					</form>
				</section>
			</div>
		</section>
	</body>

</html>