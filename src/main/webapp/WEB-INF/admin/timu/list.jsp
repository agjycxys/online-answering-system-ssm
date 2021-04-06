<%@page import="domain.TiMu"%>
<%@page import="java.util.List"%>
<%@page import="service.TiMuService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			function addTiMu() {
				window.location.href = "${pageContext.request.contextPath}/admin/timu/add.jsp";
			}
		</script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	</head>
	<body>
	<% 	TiMuService tiMuService = new TiMuService();
		List<TiMu>	allTiMu = tiMuService.queryTiMuAll();
		//存放数据在request域
		request.setAttribute("allTiMu", allTiMu);
	%>
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<tbody>
				<tr>
					<td height="10px">
						<blockquote class="layui-elem-quote quoteBox">
							<form class="layui-form">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input type="text" class="layui-input searchVal"
											placeholder="请输入搜索的内容" />
									</div>
									<a class="layui-btn search_btn " data-type="reload">搜索</a>
								</div>
								<div class="layui-inline">
									<button type="button" id="add" name="add" value="添加" class="layui-btn layui-btn-normal" onclick="addTiMu()">添加题目</button>
								</div>
							</form>
						</blockquote>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" height="26"><strong>题目列表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1" style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="8%">序号</td>
								<td align="center" width="8%">题目名称</td>
								<td align="center" width="8%">题目类型</td>
								<td align="center" width="8%">选项A</td>
								<td align="center" width="8%">选项B</td>
								<td align="center" width="8%">选项C</td>
								<td align="center" width="8%">选项D</td>
								<td align="center" width="8%">答案</td>
								<td align="center" width="8%">分数</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<c:forEach items="${allTiMu }" var="alltimu" varStatus="status">
								<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${status.count}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="7%">${alltimu.tmname }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.tmtype }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.optionA }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.optionB }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.optionC }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.optionD }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.answer }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${alltimu.tmscore }</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/admin/timu/edit.jsp?tmname=${alltimu.tmname }&tmtype=${alltimu.tmtype }&optionA=${alltimu.optionA }&optionB=${alltimu.optionB }&optionC=${alltimu.optionC }&optionD=${alltimu.optionD }&answer=${alltimu.answer }&tmscore=${alltimu.tmscore}&tmid=${alltimu.tmid}">
											<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
	
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/timuDelServlet?tmid=${alltimu.tmid}">
										<img src="${pageContext.request.contextPath}/images/i_del.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
								</tr>
							</c:forEach>
								
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
