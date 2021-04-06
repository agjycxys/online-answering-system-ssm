<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/left.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	</head>

	<body>
		<table width="100" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="12"></td>
			</tr>
		</table>
		<table width="100%" border="0">
			<tr>
				<td>
					<div class="dtree">
						<a href="javascript: d.openAll();">展开所有</a> |
						<a href="javascript: d.closeAll();">关闭所有</a>
						<script type="text/javascript">
							d = new dTree('d');
							d.add('01', -1, '系统菜单树'); //01代表本级节点的编号  -1代表根节点
							d.add('0102', '01', '题库管理', '${ pageContext.request.contextPath }/tikuQueryAllServlet', '', 'mainFrame'); //0102代表本级节点的编号   01代表父级节点
							d.add('0103', '01', '题目管理', '${ pageContext.request.contextPath }/timuQueryAllServlet', '', 'mainFrame');
							d.add('0104', '01', '面试官管理', '${ pageContext.request.contextPath }/msgQueryAllServlet', '', 'mainFrame');
							d.add('0105', '01', '考场管理', '${ pageContext.request.contextPath }/kcQueryAllServlet', '', 'mainFrame');
							document.write(d);
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>

</html>