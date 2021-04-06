<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
	</head>
	<frameset cols="25%,*" frameborder=0 border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/MSG/msgLeft.jsp" name="topFrame" noresize="noresize" scrolling="auto"/>
		<frame src="${pageContext.request.contextPath}/MSG/msgRight.jsp" name="mainFrame"/>
	</frameset>
	<%session.setAttribute("msgid", request.getAttribute("msgid"));%>
</html>