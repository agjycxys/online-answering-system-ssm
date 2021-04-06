<%@page import="domain.TiKu"%>
<%@page import="service.TiKuService"%>
<%@page import="domain.KC"%>
<%@page import="java.util.List"%>
<%@page import="service.KCService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		<script type="text/javascript">
			//一般直接写在一个js文件中
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
					form = layui.form;
			});
		</script>
		<style type="text/css">
			.divForm {
				margin: 0 auto;
				/* 居中 这个是必须的，，其它的属性非必须 */
				width: 500px;
				/* 给个宽度 顶到浏览器的两边就看不出居中效果了 */
			}
		</style>
	</head>
	<body>
		<% KCService kcService = new KCService();
			List<KC> allKC =  kcService.queryKCAll();
			request.setAttribute("allKC", allKC);
			TiKuService tiKuService = new TiKuService();
			List<TiKu> allTK = tiKuService.queryTiKuAll();
			request.setAttribute("allTK", allTK);
		%>
		<div>
			<div class="divForm">
				<form action="${pageContext.request.contextPath}/AnalysisServlet" method="post" class="layui-form">
					<div class="layui-form-item">
						<label class="layui-form-label">考场</label>
						<div class="layui-input-inline">
							<select id="kcid" name="kcid" lay-verify="required" required="required">
								<option value=""></option>
								<c:forEach items="${allKC }" var="allKC">
									<option value="${allKC.kcid }">${allKC.kcname }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">题库</label>
						<div class="layui-input-inline">
							<select id="tkid" name="tkid" lay-verify="required" required="required">
								<option value=""></option>
								<c:forEach items="${allTK }" var="allTK">
									<option value="${allTK.tkid }">${allTK.tkname }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="submit">立即查看</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>

</html>