<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.datetimepicker.css" />
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			label {
				font-size: 20px;
			}
			
			.btn-default {
				width: 100%;
				height: 50px;
			}
		</style>
	</head>

	<body>
		<form action="${pageContext.request.contextPath}/MSG_EditServlet" method="post">
			<input type="hidden" value="${param.msgid }" name="msgid" id="msgid"> 
			<div class="form-group">
				<label for="msgname">姓名</label>
				<input class="form-control" type="text" value="<%=new String(request.getParameter("msgname").getBytes("ISO-8859-1"),"utf-8")%>" readonly="readonly" id="msgname" name="msgname">
			</div>
			<div class="form-group">
				<label for="msgphone">电话</label>
				<input type="text" name="msgphone" id="msgphone" value="${param.msgphone }" class="form-control" required="required" placeholder="请填写电话"/>
			</div>
			<div class="form-group">
				<label for="msgaccount">账号</label>
				<input type="text" name="msgaccount" id="msgaccount" value="${param.msgaccount }" class="form-control" required="required" readonly="readonly"/>
			</div>
			<div class="form-group">
				<label for="msgpwd">密码</label>
				<input type="text" name="msgpwd" id="msgpwd" value="${param.msgpwd }" class="form-control" required="required" readonly="readonly"/>
			</div>
			<div>
				<input type="submit" class="btn btn-default" value="提交" />
			</div>
		</form>
 	</body>
</html>