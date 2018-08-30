<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<script type="text/javascript" src="../js/member.js"></script>
<script>
window.onload=function(){
	document.modifyForm.gender['${memberDTO.gender}'].checked = true;
	
	//document.modifyForm.email2.value = '${memberDTO.email2}';
	document.getElementById('myEmail2').value = '${memberDTO.email2}';
	
	//document.modifyForm.tel1.value = '${memberDTO.tel1}';
	document.getElementById('myTel1').value = '${memberDTO.tel1}';
}
</script>
</head>
<body>
<form name="modifyForm" method="post" action="modify.do">
<h2>회원정보수정</h2>
<table border="1" cellpadding="3" cellspacing="0">
<tr>
	<td width="90" align="center">이름</td>
	<td><input type="text" name="name" value="${memberDTO.name }" placeholder="이름 입력"></td>
</tr>
<tr>
	<td align="center">아이디</td>
	<td>
		<input type="text" name="id" size="25" value="${memberDTO.id }" readonly placeholder="아이디 입력">
	</td>
</tr>
<tr>
	<td align="center">비밀번호</td>
	<td><input type="password" name="pwd" size="30"></td>
</tr>
<tr>
	<td align="center">재확인</td>
	<td><input type="password" name="repwd" size="30"></td>
</tr>
<tr>
	<td align="center">성별</td>
	<td><input type="radio" name="gender" id="gen" value="0" checked>남
		<input type="radio" name="gender" id="gen" value="1">여</td>
</tr>
<tr>
	<td align="center">이메일</td>
	<td><input type="text" name="email1" value="${memberDTO.email1 }" size="15"> 
	@ 
	<select name="email2" id="myEmail2" style="width:120px;">
	<option value = "naver.com">naver.com</option>
	<option value = "daum.net">daum.net</option>
	<option value = "gmail.com">gmail.com</option>
	<option value = "nate.com">nate.com</option>
	</select>
	</td>
</tr>
<tr>
	<td align="center">핸드폰</td>
	<td>
	<select name="tel1" id="myTel1" style="width:60px;">
	<option value="010">010
	<option value="011">011
	<option value="019">019
	</select>
	 - 
	 <input type="text" name="tel2" value="${memberDTO.tel2 }" size="5"> 
	 - 
	 <input type="text" name="tel3" value="${memberDTO.tel3 }" size="5"></td>
</tr>
<tr>
	<td align="center" >주소</td>
	<td><input type="text" name="zipcode" id="zipcode" value="${memberDTO.zipcode }" size="6"> 
	<input type="button" value="우편번호검색" onclick="checkPost()">
	<br>
	<input type="text" name="addr1" id="addr1" value="${memberDTO.addr1 }" size="50" placeholder="주소">
	<br>
	<input type="text" name="addr2" id="addr2" value="${memberDTO.addr2 }" size="50" placeholder="상세 주소">
</tr>

<tr>
	<td colspan="2" align="center">
	<input type="button" value="회원정보수정" onclick="checkModify()"> 
	<input type="reset" value="다시작성">
</tr>
</table>
</form>
</body>
</html>











