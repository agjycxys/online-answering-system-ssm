<%@page import="service.Users_ZGTService"%>
<%@page import="service.UsersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<%	Users_ZGTService users_ZGTService = new Users_ZGTService();
		String openid = request.getParameter("openid");
		users_ZGTService.updateIsPY("1", openid);
	%>
		<form action="${pageContext.request.contextPath}/PingYueServlet" method="post">
			<input type="hidden" value="${param.openid }" name="openid" id="openid"> 
			<div class="form-group">
				<label for="tmname">题目名称</label>
				<input class="form-control" type="text" value="<%=new String(request.getParameter("tmname").getBytes("ISO-8859-1"),"utf-8")%>" readonly="readonly" id="tmname" name="tmname">
			</div>
			<div class="form-group">
				<label for="zgtanswer">答案</label>
				<textarea class="form-control" rows="5" cols="30" name="zgtanswer" id="zgtanswer" readonly="readonly"><%=new String(request.getParameter("zgtanswer").getBytes("ISO-8859-1"),"utf-8")%></textarea>
			</div>
			<div class="form-group">
				<label for="tmscore">题目分数</label>
				<input type="text" name="tmscore" id="tmscore" value="${param.tmscore }" class="form-control" required="required"  readonly="readonly"/>
			</div>
			<div class="form-group">
				<label for="zgtscore">分数</label>
				<input type="text" name="zgtscore" id="zgtscore" value="" class="form-control" required="required" placeholder="请输入分数" />
			</div>
			<div>
				<input type="submit" class="btn btn-default" value="提交" />
			</div>
		</form>
	</body>

</html>