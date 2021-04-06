<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/iconfont.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/exam_style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mui.css">

		<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/TouchSlide.1.1.js"></script>
		<style type="text/css">
			.style1 li input {
				-webkit-appearance: none;
				vertical-align: top;
				border: 1px solid #ddd;
				display: inline-block;
				width: 1rem;
				height: 1rem;
				border-radius: 50%;
				float: right;
				position: relative;
				margin-right: 0.74rem;
				margin-top: 0.375rem;
			}
			
			.style1 li input[type='radio']:checked {
				-webkit-appearance: none;
				display: inline-block;
				vertical-align: top;
				width: 1rem;
				height: 1rem;
				border-radius: 50%;
				border: 1px solid #ff6a2e;
				position: relative;
			}
			
			.style1  li input[type='radio']:checked:after {
				content: '';
				width: 0.80rem;
				height: 0.80rem;
				position: absolute;
				top: 0.09rem;
				left: 0.09rem;
				background: #ff6a2e;
				border-radius: 50%;
				display: block;
			}
			.style1 li input[type='checkbox']:checked {
				-webkit-appearance: none;
				display: inline-block;
				vertical-align: top;
				width: 1rem;
				height: 1rem;
				border-radius: 50%;
				border: 1px solid #ff6a2e;
				position: relative;
			}
			
			.style1  li input[type='checkbox']:checked:after {
				content: '';
				width: 0.80rem;
				height: 0.80rem;
				position: absolute;
				top: 0.09rem;
				left: 0.09rem;
				background: #ff6a2e;
				border-radius: 50%;
				display: block;
			}
			#tmscore{
				float: right;
				font-family: simhei;
				color: red;
			}
		</style>
		<script type="text/javascript">
			pushHistory();
			window.addEventListener("popstate", function(e) {
				pushHistory();
			}, false);

			function pushHistory() {
				var state = {
					title: "title",
					url: "#"
				};
				window.history.pushState(state, "title", "#");
			}
		</script>
	</head>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
			function jiaojuan(){
				answers = new Array();
				<c:forEach items="${allTM }" var="alltm">
					var ss = $('input[name = "${alltm.tmid}"]:checked').val();
					if("${alltm.tmtype}"!="简答题"){
						var id = document.getElementsByName('${alltm.tmid}');
						var value = new Array();
						for(var i = 0; i < id.length; i++) {
							if(id[i].checked)
								value.push(id[i].value);
						}
						answers.push(value);
					}
					if("${alltm.tmtype}"=="简答题"){
						var text =$("#${alltm.tmid}").val();
						answers.push(text);
					}
				</c:forEach>
				var tkid ="${tkid}";
				var openid = "${openid}";
				var kcid = "${kcid}";
				$.ajax({
					  type: 'POST',
					  url: '${pageContext.request.contextPath}/ExamEndServlet',
					  data: {
						  	"answers":answers,
						  	"tkid":tkid,
						  	"openid":openid,
						  	"kcid":kcid
					  },
					  traditional: true,
					  dataType : 'json',
					  success:function(data){
						  window.location.href="${pageContext.request.contextPath}/users/examend.jsp?kgtscore="+data.kgtscore;
					  }
					});
			}
	</script>
	<body>
		<header>
			<div class="titlebar reverse">
				<div>
					<i class="iconfont">&#xe639;</i>
					<i style="color:#ffffff;font-size:20px;font-weight:bold;margin-left:10px;">左右滑动翻题</i>
				</div>
			</div>
		</header>	
		<form action="#" method="post" onsubmit="return false">
		<input type="hidden" id="answers" name="answers" />
		<article style="padding-bottom:44px;padding-top:44px;" id="leftTabBox">
			<div class="bd" id="bd12">
			<c:forEach items="${allTM }" var="allTM" varStatus="status">
				<input type="hidden" name="${allTM.tmtype }" id="${allTM.tmtype }" value="${allTM.tmtype }" />
				<input type="hidden" name="${allTM.tmscore }" id="${allTM.tmscore }" value="${allTM.tmscore }" />
				<div class="test" style="margin-top:10px;">
					<div class="test_con">
						<div class="item">
							<div class="tit">
								<span>${status.count }</span>&nbsp;&nbsp;
								<input type="hidden" id="${allTM.tmname }" name="${allTM.tmname }" value="${allTM.tmname }"></input>${allTM.tmname } [<font color="red">*</font>${allTM.tmtype }]
								<span id="tmscore">(${allTM.tmscore }分)</span>
							</div>
							<div class="item_con">
								<div class="answ">
									<input type='hidden' name='${allTM.answer }' class='answ' id='${allTM.answer }' value='${allTM.answer }' />
								<c:if test="${allTM.tmtype =='单选题'}">
									<div id="danxuan" class="style1"><!--单选题-->
										<ul>
											<li><i><input type="radio" id="${allTM.tmid }" name="${allTM.tmid }" value="A"/>${allTM.optionA }</i></li>
											<li><i><input type="radio" id="${allTM.tmid }" name="${allTM.tmid }" value="B"/>${allTM.optionB }</i></li>
											<li><i><input type="radio" id="${allTM.tmid }" name="${allTM.tmid }" value="C"/>${allTM.optionC }</i></li>
											<li><i><input type="radio" id="${allTM.tmid }" name="${allTM.tmid }" value="D"/>${allTM.optionD }</i></li>
										</ul>
									</div>
								</c:if>
								<c:if test="${allTM.tmtype =='多选题'}">
									<div id="duoxuan" class="style1"><!--多选题-->
										<ul>
											<li><i><input type="checkbox" value="A" id="${allTM.tmid }" name="${allTM.tmid }">${allTM.optionA }</i></li>
											<li><i><input type="checkbox" value="B" id="${allTM.tmid }" name="${allTM.tmid }">${allTM.optionB }</i></li>
											<li><i><input type="checkbox" value="C" id="${allTM.tmid }" name="${allTM.tmid }">${allTM.optionC }</i></li>
											<li><i><input type="checkbox" value="D" id="${allTM.tmid }" name="${allTM.tmid }">${allTM.optionD }</i></li>
										</ul>
									</div>
								</c:if>
								<c:if test="${allTM.tmtype =='判断题'}">
									<div id = "panduan" class="style1"><!--判断题-->
										<ul>
										<li><i><input type="radio" name="${allTM.tmid }" value="正确" id="${allTM.tmid }"/>正确</i></li>
										<li><i><input type="radio" name="${allTM.tmid }" value="错误" id="${allTM.tmid }"/>错误</i></li>
										</ul>
									</div>
								</c:if>
								<c:if test="${allTM.tmtype =='简答题'}">
									<div id="jianda"><!--简答题-->
										<ul><li><i><textarea rows="5" cols="30" id="${allTM.tmid }" name="${allTM.tmid }"></textarea></i></li></ul>
									</div>
								</c:if>
								</div>
							</div>
							<!--item_con结束-->
						</div>
						<!--item结束-->
					</div>
					<!--test_con结束-->
				</div>
			</c:forEach>
				<!--test结束-->
			<div class="test" style="margin-top:10px;">
					<div class="test_con">
						<div class="item">
							<div class="tit">
								<font style="font-size: 20px"></font> 题目已全部答完!
							</div>
							<div class="item_con">
								<div class="answ">
									<ul>
										<li><i>请认真核对答案!</i></li>
										<li><i>确认无误后请交卷!</i></li>
									</ul>
								</div>
							</div>
							<!--item_con结束-->
						</div>
						<!--item结束-->
					</div>
					<!--test_con结束-->
				</div>
			</div>
			<!--bd结束-->
			
			<div class="clear"></div>
		</article>
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script type="text/javascript">
			TouchSlide({
				slideCell: "#leftTabBox"
			});
		</script>
		<div style="text-align:center;margin:0 auto; font:normal 14px/24px;" class="test_title">
			<p class="test_time">
				<span style="float: left;font-size: 18px;">所考题库:<font color="red">${tkname }</font></span>
				<span style="font-size: 18px;">总分:<font color="red">${tmscores }分</font></span>
			</p><br />
			<p class="test_time">
				<br />
				<span style="float: left;font-size: 18px; color: #000000;">离考试结束还有:</span>
				<span style="font-size: 18px; color: red;" class="alt-1">${jstime }</span>
			</p>
			<br />
			<font><input type="button" name="test_jiaojuan" value="交卷" onclick="jiaojuan()"></font>
		</div>
	</form>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.countdown.js"></script>
		<script>
			window.jQuery(function($) {
				"use strict";
				$('time').countDown({
					with_separators: false
				});
				$('.alt-1').countDown({
					css_class: 'countdown-alt-1'
				});
				$('.alt-2').countDown({
					css_class: 'countdown-alt-2'
				});

			});
		</script>
		<style type="text/css">
			.test_title font input {
				margin: auto;
				background: #389fc3;
				border: none;
				display: block;
				width: 50%;
				height: 45px;
				cursor: pointer;
				color: #fff;
				font-size: 16px;
				font-weight: bold;
			}
		</style>
	</body>

</html>