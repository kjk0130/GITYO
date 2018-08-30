<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<form name="loginForm" method="post" action="/miniproject/member/login.do">
		<div>ID:<br>
			<input type="text" name="id" id="id"><br>
			<div id="idDiv"></div>
		</div>
		
		<br>
		<div>Password:<br/>
			<input type="password" name="pwd" id="pwd" size="30"><br>
			<div id="pwdDiv"></div>
		</div>
		<br>
		<div>	
			<input type="button" id="loginBtn" value="LOGIN">
			<input type="button" id="registerBtn" value="REGISTER">
		</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#loginBtn').click(function(){
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#id').val()=='')
			$('#idDiv').text('아이디를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#pwd').val()=='')
			$('#pwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$.ajax({
				type : 'POST',
				url : '/SpringProject/member/login.do',
				//data : 'id='+$('#id').val()+'&pwd='+$('#pwd').val(),
				data : {'id':$('#id').val(), 'pwd':$('#pwd').val()},
				dataType : 'text',
				success : function(data){
					if(data=='exist') 
						location.href='/SpringProject/main/index.do';
					else if(data=='not_exist')
						$('#pwdDiv').text('로그인 실패').css('color','red').css('font-size','9pt');
				}
			});
	});
	
	$('#registerBtn').click(function(){
		location.href='/SpringProject/member/writeForm.do';
	});
});
</script>
</body>
</html>














