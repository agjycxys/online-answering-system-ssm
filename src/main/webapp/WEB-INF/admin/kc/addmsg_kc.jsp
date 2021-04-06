<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="service.KCService"%>
<%@page import="domain.KC"%>
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
				<input type="hidden" id="kcid" name="kcid" value=<%=request.getAttribute("kcid") %>>
				<table class="table table-striped">
				<tr>
					<td colspan="5" style="text-align: center; font-size: 18px;">添加面试官</td>
				</tr>
					<tr>
						<td>序号</td>
						<td>面试官姓名</td>
						<td>面试官电话</td>
						<td>监考考场</td>
						<td>请点击</td>
					</tr>
					<c:forEach items="${allMSG }" var="allmsg" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${allmsg.msgname }</td>
								<td>${allmsg.msgphone }</td>
								<c:if test="${allmsg.kcid == 0 }">
									<td>无</td>
								</c:if>
								<c:if test="${allmsg.kcid != 0 }">
									<td>
										${allmsg.kcid }
									</td>
								</c:if>
								<td>
									<a href="${pageContext.request.contextPath}/AddMSG_KCServlet?kcid=${kcid}&msgid=${allmsg.msgid}"><button>添加</button></a>
									<a href="${pageContext.request.contextPath}/DelMSG_KCServlet?kcid=${kcid}&msgid=${allmsg.msgid}"><button>清除</button></a>
									<a href="${pageContext.request.contextPath}/kcQueryAllServlet"><button>返回</button></a>					
								</td>
							</tr>
					</c:forEach>
				</table>
		</div>
	</body>

</html>