<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="" method="post" action="">
<input type="hidden" name="id" value="${sessionScope.memId }">
	${sessionScope.memName }님 로그인
	<br><br>
	<input type="button" value="로그아웃" 
	onclick="location.href='/SpringProject/member/logout.do'">
	<input type="button" value="회원정보수정"
	onclick="location.href='/miniproject/member/modifyForm.do'">
</form>












