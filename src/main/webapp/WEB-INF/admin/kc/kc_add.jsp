<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/jquery.datetimepicker.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<form action="${pageContext.request.contextPath}/kcAddServlet" method="post">
			<input type="hidden" name="method" value="save">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>添加考场</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						考场名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="kcname" value="" id="kcname" class="bg" placeholder="请输入考场名称" required="required"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						开始时间：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="starttime" value="" id="starttime" class="bg" placeholder="请选择开始时间" required="required"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						结束时间：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="endtime" value="" id="endtime" class="bg" placeholder="请选择结束时间" required="required"/>
					</td>
				</tr>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js" ></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datetimepicker.full.js" ></script>
				<script type="text/javascript">
						$('#starttime').datetimepicker({
								datepicker: false,
								format: 'H:i',
								step: 5
						});
						$('#endtime').datetimepicker({
								datepicker: false,
								format: 'H:i',
								step: 5
						});
				</script>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>