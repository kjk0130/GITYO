<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
</head>
<body>
<form name="writeForm" id="writeForm" method="post" 
action="/SpringProject/member/write.do">
 <table border="1" cellpadding="3" cellspacing="0">
 	<h2>
 	<image src="../image/lion3.gif" width="100" height="100" style="cursor: pointer;"
 	onclick="location.href='../main/index.jsp'">SIGN UP</h2>
 	<tr>
 		<td width="70" align="center">이름</td>
 		<td>
 			<input type="text" name="name" id="name" style="width:150px" placeholder="이름입력">
 			<div id="nameDiv"></div>
 		</td>
 	</tr>
	<tr>
		<td align="center">아이디</td>
		<td>
			<input type ="text" name="id" id="ID" style="width:200px" placeholder="아이디입력">
			<input type="button" id="checkId" value="중복체크">
			<input type="hidden" name="check" id="check" value="">
			<div id="IDDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td>
			<input type="password" name="pwd" id="PWD" style="width:250px">
			<div id="PWDDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="center">재확인</td>
		<td>
			<input type="password" name="repwd" id="repwd" style="width:250px">
			<div id="repwdDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="center">성별</td>
		<td>
			<input type="radio" name="gender" value="0" checked>남 &nbsp;
			<input type="radio" name="gender" value="1">여
		</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td>
			<input type="text" name="email1" size="15"> @
			<select name="email2" style="width:120px">
				<option value="naver.com">naver.com
				<option value="gmail.com">gmail.com
				<option value="hanmail.net">hanmail.net	
				<option value="hanmail.net">nate.com
			</select>	
		</td>
	</tr>
	<tr>
		<td align="center">핸드폰</td>
		<td>
			<select name="tel1" style="width:60px">
				<option value="010">010
				<option value="011">011
				<option value="019">019
			</select>
			- <input type="text" name="tel2" size="4">
			- <input type="text" name="tel3" size="4">
		</td>
	</tr>
	<tr>
		<td align="center">주소</td>
		<td>
			<input type="text" name="zipcode" id="zipcode" size="6">
			<input type="button" id="checkPost" value="우편번호검색"><br>
			<input type="text" name="addr1" id="addr1" size="50" placeholder="주소"><br>
			<input type="text" name="addr2" id="addr2" size="50" placeholder="상세주소">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<!-- 자동 submit -->		
			<input type="image" id="writeBtn" src="../image/11.jpg" width="50" height="30"
			onclick="return false;">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</body>
</html>









