<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="service.KCService"%>
<%@ page import="domain.KC"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		</script>
	</head>

	<body>
		<div class="table-responsive">
				<table class="table table-striped">
				<tr>
					<td colspan="3" style="text-align: center; font-size: 18px;">该考场题库信息</td>
					<td>
						<a href="${pageContext.request.contextPath}/kcQueryAllServlet"><button>返回</button></a>
					</td>
				</tr>
					<tr>
						<td>序号</td>
						<td>题库名称</td>
						<td>总分数</td>
						<td>所在考场</td>
					</tr>
					<c:forEach items="${alltk }" var="alltk" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${alltk.tkname }</td>
								<td>${alltk.tkscore }</td>
								<td>${alltk.kcnames }</td>
							</tr>
					</c:forEach>
				</table>
		</div>
	</body>

</html>