<%@page import="domain.SNSUserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<title>填写信息</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type='text/css' media="all" />
		<link href="${pageContext.request.contextPath}/css/userInfo_style.css" rel="stylesheet" type='text/css' media="all" />
	</head>

	<body>
		<h1 class="w3ls">请填写个人信息</h1>
		<div class="content-agileits">
			<form action="${pageContext.request.contextPath }/addUserInfoServlet" method="post" data-toggle="validator" role="form">
				<% 
					// 获取由OAuthServlet中传入的参数
					SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
					if(null != user) {
				%>
				<input type="hidden" id="wxname" name="wxname" value="<%=user.getNickname()%>">
				<input type="hidden" id="openid" name="openid" value="<%=user.getOpenId()%>">
				<input type="hidden" id="kcid" name="kcid" value="${kcid }">
				<%
					}
					else 
						out.print("用户不同意授权,未获取到用户信息！");
				%>
				<div class="form-group w3layouts w3 w3l">
					<label for="usersname" class="control-label">姓名</label>
					<input type="text" class="form-control" id="usersname" name="usersname" placeholder="姓名" data-error="请填写你的姓名" required>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group agileits w3layouts w3">
					<label for="xingbie" class="control-label">性别</label>
					<select name="xingbie" id="xingbie" class="form-control">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group w3l agileinfo wthree w3-agileits">
					<label for="dianhua" class="control-label">电话号码</label>
					<input type="text" class="form-control" id="dianhua" name="dianhua" placeholder="电话号码" data-error="请输入电话号码!" required>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group agileinfo wthree w3-agileits agile">
					<label for="xuexiao" class="control-label">学校</label>
					<input type="text" class="form-control" id="xuexiao" name="xuexiao" placeholder="学校" data-error="请填写你的学校!" required>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group agileinfo wthree w3-agileits agile">
					<label for="zhuanye" class="control-label">专业</label>
					<input type="text" class="form-control" id="zhuanye" name="zhuanye" placeholder="专业" data-error="请填写你的专业!" required>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group agileinfo wthree w3-agileits agile">
					<label for="xueli" class="control-label">学历</label>
					<select name="xueli" id="xueli" class="form-control">
						<option value="研究生以上">研究生以上</option>
						<option value="本科">本科</option>
						<option value="大专">大专</option>
						<option value="其他">其他</option>
					</select>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-lg">提交</button>
				</div>
			</form>
		</div>
		<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/validator.min.js"></script>
	</body>

</html>