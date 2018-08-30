<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardViewForm" >

<input type="hidden" name="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" value="${pg }">

<table border="1" frame="hsides" rules="rows" cellpadding="5">
<tr>
	<td colspan="3"><font size="5">${boardDTO.subject }</font></td>
</tr>

<tr>
	<td width="150">글번호 : ${boardDTO.seq }</td>
	<td width="150">작성자 : ${boardDTO.id }</td>
	<td width="150">조회수 : ${boardDTO.hit }</td>
</tr>

<tr>
	<td colspan="3" height="200" valign="top"><pre>${boardDTO.content }</pre></td>
</tr>
</table>
<input type="button" value="목록" 
onclick="location.href='/SpringProject/board/boardList.do?pg=${pg}'">
<input type="button" value="답글" 
onclick="location.href='/SpringProject/board/boardReplyForm.do?pseq=${boardDTO.seq }&pg=${pg}'">

<c:if test="${memId==boardDTO.id }"><!-- 본인이 쓴 글이 맞는지 확인 -->
	<input type="button" value="글수정" onclick="mode(1)">
	<input type="button" value="글삭제" onclick="mode(2)">
</c:if>



<script type="text/javascript">
function mode(num){
	if(num==1){
		document.boardViewForm.method="post";
		document.boardViewForm.action="/SpringProject/board/boardModifyForm.do";
		document.boardViewForm.submit();
	}else if(num==2){
		if(confirm("정말 삭제하시겠습니까?")){
			document.boardViewForm.method="post";
			document.boardViewForm.action="/SpringProject/board/boardDelete.do";
			document.boardViewForm.submit();
		}
	}
}

</script>
</form>
</body>
</html>

