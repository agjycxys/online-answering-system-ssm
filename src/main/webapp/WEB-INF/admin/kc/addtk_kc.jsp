<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.TiKu"%>
<%@page import="service.TiKuService"%>
<%@page import="domain.KC"%>
<%@page import="domain.KC_TK"%>
<%@page import="dao.KC_TKDao"%>
<%@page import="service.KC_TKService"%>
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
		<script type="text/javascript">
		</script>
	</head>

	<body>
		<div class="table-responsive">
				<input type="hidden" id="kcid" name="kcid" value=<%=request.getAttribute("kcid") %>>
				<table class="table table-striped">
				<tr>
					<td colspan="5" style="text-align: center; font-size: 18px;">添加题库</td>
				</tr>
					<tr>
						<td>序号</td>
						<td>题库名称</td>
						<td>总分数</td>
						<td>所在考场</td>
						<td>请点击</td>
					</tr>
					<c:forEach items="${allTK }" var="allTK" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${allTK.tkname }</td>
								<td>${allTK.tkscore }</td>
								<c:if test="${allTK.kcnames==NULL }">
									<td>无</td>
								</c:if>
								<c:if test="${allTK.kcnames!=null }">
									<td>${allTK.kcnames }</td>
								</c:if>
								<td>
									<a href="${pageContext.request.contextPath}/AddTK_KCServlet?kcid=${kcid}&tkid=${allTK.tkid}"><button>添加</button></a>
									<a href="${pageContext.request.contextPath}/DelTK_KCServlet?kcid=${kcid}&tkid=${allTK.tkid}"><button>清除</button></a>
									<a href="${pageContext.request.contextPath}/kcQueryAllServlet"><button>返回</button></a>
								</td>
							</tr>
					</c:forEach>
				</table>
		</div>
	</body>

</html>