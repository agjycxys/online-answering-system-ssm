<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.datetimepicker.css" />
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			label {
				font-size: 20px;
			}
			
			.btn-default {
				width: 100%;
				height: 50px;
			}
		</style>
	</head>

	<body>
		<form action="${pageContext.request.contextPath}/KC_EditServlet" method="post">
			<input type="hidden" value="${param.kcid }" name="kcid" id="kcid"> 
			<div class="form-group">
				<label for="kcname">考场名称</label>
				<input class="form-control" type="text" value="<%=new String(request.getParameter("kcname").getBytes("ISO-8859-1"),"utf-8")%>" readonly="readonly" id="kcname" name="kcname">
			</div>
			<div class="form-group">
				<label for="starttime">开始时间</label>
				<input type="text" name="starttime" id="starttime" value="${param.starttime }" class="form-control" required="required" placeholder="请选择时间"/>
			</div>
			<div class="form-group">
				<label for="endtime">结束时间</label>
				<input type="text" name="endtime" id="endtime" value="${param.endtime }" class="form-control" required="required" placeholder="请选择时间" />
			</div>
			<div>
				<input type="submit" class="btn btn-default" value="提交" />
			</div>
		</form>
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
	</body>

</html>