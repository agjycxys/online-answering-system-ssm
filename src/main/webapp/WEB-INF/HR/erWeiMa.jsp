<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://static.runoob.com/assets/qrcode/qrcode.min.js"></script>
		<style type="text/css">
			div {
				margin: 0 auto;
				width: 250px;
				text-align: center;
			}
			button{
				width: 100%;
				height: 50px;
			}
		</style>
	</head>

	<body>
		<input type="hidden"  value="${param.kcid }"  name="kcid" id="kcid"/>
		<div id="qrcode">
		</div>
		<div class="but">
			<button type="button" onclick="javascript:history.back(-1);">返回</button>
		</div>
		<script type="text/javascript">
			window.onload = function() {
				var kcid = document.getElementById("kcid").value;
				// 设置参数方式 
				var qrcode = new QRCode(document.getElementById("qrcode"), {
					text: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxcdc94f5bd03aa8e6&redirect_uri=http://sxlg.tunnel.echomod.cn/WeiXin/OAuthServlet?kcid='+kcid+'&response_type=code&scope=snsapi_userinfo&state=STATE&kcid=2#wechat_redirect',
					width: 256,
					height: 256,
					colorDark: '#000000',
					colorLight: '#ffffff',
					correctLevel: QRCode.CorrectLevel.L
				});
			}
		</script>
	</body>

</html>