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
		<c:forEach items="${allKC }" var="allkc" varStatus="status">
			<table class="table table-striped table-bordered">
				<tr>
					<td>序号</td>
					<td>${status.count}</td>
				</tr>
				<tr>
					<td>考场名称</td>
					<td>${allkc.kcname }</td>
				</tr>
				<tr>
					<td>开考时间</td>
					<td>${allkc.starttime }</td>
				</tr>
				<tr>
					<td>结束时间</td>
					<td>${allkc.endtime }</td>
				</tr>
				<tr>
					<td>编辑</td>
					<td>
						<a href="${pageContext.request.contextPath}/HR/kc_edit.jsp?kcname=${allkc.kcname }&starttime=${allkc.starttime }&endtime=${allkc.endtime }&kcid=${allkc.kcid}"><img src="${pageContext.request.contextPath}/images/i_edit.gif"></a>
					</td>
				</tr>
				<tr>
					<td>生成二维码</td>
					<td>
						<a href="${pageContext.request.contextPath}/HR/erWeiMa.jsp?kcid=${allkc.kcid }&kcname=${allkc.kcname }"><input type="button" value="生成"/></a>
					</td>
				</tr>
			</table>
		</c:forEach>
		</div>
	</body>

</html>