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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		
		<script type="text/javascript">
			function ispingyue(){
				<c:forEach items="${usersZGT }" var="usersZGT">
					if("${usersZGT.ispingyue}"!="0"){
						alert("该用户试卷别的面试官正在评阅,请您另外选择!");
					}
					if("${usersZGT.ispingyue}"=="0"){
						window.location.href = "${pageContext.request.contextPath}/MSG/pingyue.jsp?openid=${usersZGT.openid }&tmname=${usersZGT.tmname }&tmscore=${usersZGT.tmscore }&zgtscore=${usersZGT.zgtscore }&zgtanswer=${usersZGT.zgtanswer}";
					}
				</c:forEach>
			}
		</script>
	</head>

	<body>
		<div class="table-responsive">
		<c:forEach items="${usersZGT }" var="usersZGT" varStatus="status">
			<table class="table table-striped table-bordered">
				<tr>
					<td>序号</td>
					<td>${status.count}</td>
				</tr>
				<tr>
					<td>考生姓名</td>
					<td>${usersZGT.usersname }</td>
				</tr>
				<tr>
					<td>题目名称</td>
					<td>${usersZGT.tmname }</td>
				</tr>
				<tr>
					<td>题目总分</td>
					<td>${usersZGT.tmscore }</td>
				</tr>
				<tr>
					<td>分数</td>
					<c:if test="${usersZGT.zgtscore == 0}">
							<td>未评分</td>
					</c:if>
					<c:if test="${usersZGT.zgtscore != 0}">
							<td>${usersZGT.zgtscore }</td>
					</c:if>
				</tr>
				<tr>
					<td>是否正在评阅</td>
					<c:if test="${usersZGT.ispingyue == '0'}">
							<td>没有正在被评阅</td>
					</c:if>
					<c:if test="${usersZGT.ispingyue != '0'}">
							<td>正在被评阅</td>
					</c:if>
				</tr>
				<tr>
					<td>评阅</td>
					<td>
						<a href="javascript:void(0)" class="layui-btn layui-btn-xs" onclick="ispingyue()">评阅</a>
					</td>
				</tr>
					</table>
			</c:forEach>
		</div>
	</body>

</html>