<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<script type="text/javascript">
			function answerShow(){
				if(tmtype.value=="判断题"){
					anDisplay.style.display="table-row";
					answer1.style.display="none";
					answer2.style.display="inline";
					isDisplay();
				}
				if(tmtype.value=="简答题"){
					anDisplay.style.display="none";
					isDisplay();
				}
				if(tmtype.value=="单选题"||tmtype.value=="多选题"){
					anDisplay.style.display="table-row";
					answer1.style.display="inline";
					answer2.style.display="none";
					OPDisplayA.style.display="table-row";
					OPDisplayB.style.display="table-row";
					OPDisplayC.style.display="table-row";
					OPDisplayD.style.display="table-row";
				}
			}
			function isDisplay(){
				OPDisplayA.style.display="none";
				OPDisplayB.style.display="none";
				OPDisplayC.style.display="none";
				OPDisplayD.style.display="none";				
			}
		
		</script>
	</HEAD>
	
	<body>
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/timuAddServlet" method="post">
			<input type="hidden" name="method" value="save">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>添加题目</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						题目名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="tmname" value="" id="tmname" class="bg" placeholder="名称不能超过50个字符" required="required"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						题目类型：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select name="tmtype" id="tmtype" onchange="answerShow()">
							<option value="单选题">单选题</option>
							<option value="多选题">多选题</option>
							<option value="判断题">判断题</option>
							<option value="简答题">简答题</option>
						</select>
					</td>
				</tr>
				<tr id="OPDisplayA">
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						选项A：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="optionA" value="" id="optionA" class="bg" placeholder="默认为空"/>
					</td>
				</tr>
				<tr id="OPDisplayB">
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						选项B：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="optionB" value="" id="optionB" class="bg"  placeholder="默认为空"/>
					</td>
				</tr>
				<tr id="OPDisplayC">
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						选项C：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="optionC" value="" id="optionC" class="bg"  placeholder="默认为空"/>
					</td>
				</tr>
				<tr id="OPDisplayD">
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						选项D：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="optionD" value="" id="optionD" class="bg"  placeholder="默认为空"/>
					</td>
				</tr>
				<tr id="anDisplay">
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						正确答案：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="answer1" value="" id="answer1" class="bg"  placeholder="请输入答案内容,多选题答案请用,隔开"/>
						<select name="answer2" id="answer2" style="display: none">
							<option value="正确">正确</option>
							<option value="错误">错误</option>	
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						题目分数：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="tmscore" value="" id="tmscore" class="bg"  required="required"/>
					</td>
				</tr>
			
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
