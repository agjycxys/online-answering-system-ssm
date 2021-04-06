<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
	</head>
	<body>
		<div id="main" style="width: 600px;height:400px; margin: 0 auto;">
		</div>
		<div style="width: 600px;height:400px; margin: 0 auto;" align="center">
			<button type="button" onclick="history.go(-1)" class="layui-btn layui-btn-normal" style="height: 50px; width: 200px;">返回</button>
		</div>
		<script type="text/javascript">
			var sum = 100;
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			// 指定图表的配置项和数据
			var option = {
				title: {
					text: '${kcname}(${tkname})正确率统计与分析'
				},
				tooltip: {},
				legend: {
					data: ['准确率']
				},
				tooltip: {
					trigger: 'axis',
					axisPointer: { // 坐标轴指示器，坐标轴触发有效
						type: 'shadow', // 默认为直线，可选为：'line' | 'shadow'

					},
					formatter: '{b}:{c}%'
				},

				grid: {
					show: false,
					height: '78%',
					width: '90%',
					top: '8%',
					left: '7%',

				},
				xAxis: {
					data: [
					<c:forEach items="${allTM }" var="alltm" varStatus="status">
						<c:if test="${alltm.tmtype != '简答题'}">
							"${status.count}",
						</c:if>
					</c:forEach>
					]
				},
				yAxis: [{
					type: 'value',
					axisLabel: {
						show: true,
						textStyle: {
							color: '#3398DB',
							fontSize: '50%',
						},
						interval: 0,
						showMinLabel: true,
						formatter: '{value} %'
					},
					splitNumber: 10
				}],
				series: [{
					name: '准确率',
					type: 'bar',
					itemStyle: {
						normal: {
							label: {
								show: true,
								position: 'inside', //数据在中间显示
								formatter: '{c}%' //百分比显示
							}
						}
					},
					data: [
					<c:forEach items="${list }" var="list">      
						${list},
					</c:forEach>
					]
				}]	
			};

			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>
	</body>

</html>