<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardReplyForm" id="boardReplyForm" method="post" action="/SpringProject/board/boardReply.do">

<input type="hidden" name="pseq" value="${pseq }">
<input type="hidden" name="pg" value="${pg }">

<h2>답글쓰기</h2>
<table border="1" cellpadding="3" cellspacing="0">
	<tr>
		<td width="70" align="center">제목
		<td>
			<input type="text" name="subject" id="subject" size="45" placeholder="제목입력">
			<div id="subjectDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="center">내용
		<td>
			<textarea name="content" id="content" cols="45" rows="15" placeholder="내용입력"></textarea>
			<div id="contentDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" id="checkBoardReply" value="답글쓰기">
		<input type="reset" value="다시작성"></td>
	</tr>
</table>
</form>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 
<script type="text/javascript" src="../js/board.js?ver=1"></script>
ver=1 크롬에서 자바스크립트 최신버젼을 읽어올 수 있게 한다
-->
<script type="text/javascript">
$(document).ready(function() {
	$('#checkBoardReply').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()=='')
			$('#subjectDiv').text('제목 입력').css('color', 'red').css('font-size','9pt');
		else if($('#content').val()=='')
			$('#contentDiv').text('내용 입력').css('color', 'red').css('font-size','9pt');
		else
			$('#boardReplyForm').submit();
	});
});
</script>
</body>
</html>




