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
	</head>

	<body>
		<div class="table-responsive">
			<c:forEach items="${msgInfo }" var="msgInfo">
				<table class="table table-striped">
					<tr>
						<td>姓名</td><td>${msgInfo.msgname }</td>
					</tr>
					<tr>
						<td>电话</td><td>${msgInfo.msgphone }</td>
					</tr>
					<tr>
						<td>账号</td><td>${msgInfo.msgaccount}</td>
					</tr>
					<tr>
						<td>密码</td><td>${msgInfo.msgpwd }</td>
					</tr>
					<tr>
						<td>编辑</td>
						<td>
							<a href="${pageContext.request.contextPath}/MSG/msg_edit.jsp?msgname=${msgInfo.msgname }&msgphone=${msgInfo.msgphone }&msgaccount=${msgInfo.msgaccount}&msgpwd=${msgInfo.msgpwd }&msgid=${msgInfo.msgid}"><img src="${pageContext.request.contextPath}/images/i_edit.gif"></a>
						</td>
					</tr>
				</table>
			</c:forEach>					
		</div>
	</body>
</html>