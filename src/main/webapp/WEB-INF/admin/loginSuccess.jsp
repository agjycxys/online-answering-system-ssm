<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
			body {
				SCROLLBAR-ARROW-COLOR: #ffffff;
				SCROLLBAR-BASE-COLOR: #dee3f7;
			}
		</style>
	</head>
	<%session.setAttribute("adname", request.getAttribute("adname"));%>
	<frameset rows="119,*,43" frameborder=0 border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/admin/top.jsp" name="topFrame" scrolling="no" noresize="noresize"/>
		<frameset cols="159,*" frameborder=0 border="0" framespacing="0">
			<frame src="${pageContext.request.contextPath}/admin/left.jsp" name="leftFrame" noresize scrolling="YES">
			<frame src="${pageContext.request.contextPath}/admin/right.jsp" name="mainFrame">
		</frameset>
		<frame src="${pageContext.request.contextPath}/admin/bottom.jsp" name="bottomFrame" scrolling="NO"  noresize/>
	</frameset>
</html>