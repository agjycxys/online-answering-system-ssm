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
				<input type="hidden" id="tkid" name="tkid" value=<%=request.getAttribute("tkid") %>>
				<table class="table table-striped">
				<tr>
					<td colspan="4" style="text-align: center; font-size: 18px;">添加题目</td>
					<td style="text-align: center; font-size: 18px;">
						题库总分数:<font color="red"> <%=request.getAttribute("tkscore") %> </font>
					</td>
					<td style="text-align: center; font-size: 18px;">
						已添加题目总分:<font color="red"> 
						<% if(request.getAttribute("tmscores")==null){
							out.print(0);
						}else{
							out.print(request.getAttribute("tmscores"));
						} %> </font>
					</td>
				</tr>
					<tr>
						<td>序号</td>
						<td>题目名称</td>
						<td>题目类型</td>
						<td>分数</td>
						<td>所在题库</td>
						<td>请点击</td>
					</tr>
					<c:forEach items="${allTM }" var="allTM" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${allTM.tmname }</td>
								<td>${allTM.tmtype }</td>
								<td>${allTM.tmscore }</td>
								<c:if test="${allTM.tknames == NULL }">
									<td>无</td>
								</c:if>
								<c:if test="${allTM.tknames != NULL }">
									<td>
										${allTM.tknames }
									</td>
								</c:if>
								<td>
									<a href="${pageContext.request.contextPath}/AddTM_TKServlet?tkid=${tkid}&tmid=${allTM.tmid}"><button>添加</button></a>
									<a href="${pageContext.request.contextPath}/DelTM_TKServlet?tkid=${tkid}&tmid=${allTM.tmid}"><button>清除</button></a>
									<a href="${pageContext.request.contextPath}/tikuQueryAllServlet"><button>返回</button></a>					
								</td>
							</tr>
					</c:forEach>
				</table>
		</div>
	</body>

</html>