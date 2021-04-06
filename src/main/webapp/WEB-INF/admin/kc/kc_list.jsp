<%@page import="domain.KC"%>
<%@page import="java.util.List"%>
<%@page import="service.KCService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			function addKC() {
				window.location.href = "${pageContext.request.contextPath}/admin/kc/kc_add.jsp";
			}
		</script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	</head>
	<body>
	<%  KCService kcService = new KCService();
		List<KC> allKC = kcService.queryKCAll();
		request.setAttribute("allKC", allKC);  
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
									<button type="button" id="add" name="add" value="添加" class="layui-btn layui-btn-normal" onclick="addKC()">
									添加考场</button>
								</div>
							</form>
						</blockquote>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" height="26"><strong>考场列表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1" style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="12%">序号</td>
								<td align="center" width="12%">考场名称</td>
								<td align="center" width="12%">开始时间</td>
								<td align="center" width="12%">结束时间</td>
								<td align="center" width="12%">面试官信息</td>
								<td align="center" width="12%">题库信息</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<c:forEach items="${allKC }" var="allkc" varStatus="status">
								<input type="hidden" id="kcid" name="kcid" value="${param.kcid }">
								<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 30px" align="center" width="12%">${status.count}</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center" width="12%">${allkc.kcname }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center" width="12%">${allkc.starttime }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center" width="12%">${allkc.endtime }</td>
									<td align="center" style="HEIGHT: 30px">
										<a href="${pageContext.request.contextPath}/QueryMSG_KCServlet?kcid=${allkc.kcid}"><button type="button" class="layui-btn layui-btn-xs">
										添加</button></a>
										<a href="${pageContext.request.contextPath}/LookMSG_KCServlet?kcid=${allkc.kcid}"> <button type="button" class="layui-btn layui-btn-xs" >
										查看</button></a>
									</td>
									<td align="center" style="HEIGHT: 30px">
										<a href="${pageContext.request.contextPath}/QueryTK_KCServlet?kcid=${allkc.kcid}"><button type="button" class="layui-btn layui-btn-xs" >
										添加</button></a>
										<a href="${pageContext.request.contextPath}/LookTK_KCServlet?kcid=${allkc.kcid}"><button type="button"class="layui-btn layui-btn-xs" >
										查看</button></a>
									</td>
									<td align="center" style="HEIGHT: 30px">
										<a href="${pageContext.request.contextPath}/admin/kc/kc_edit.jsp?kcname=${allkc.kcname }&starttime=${allkc.starttime }&endtime=${allkc.endtime }&kcid=${allkc.kcid }">
											<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
	
									<td align="center" style="HEIGHT: 30px">
										<a href="${pageContext.request.contextPath}/kcDelServlet?kcid=${allkc.kcid}">
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

</html>