<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#checkImageboardWrite').click(function(){
		$('#imageIdDiv').empty();
		$('#imageNameDiv').empty();
		$('#imagePriceDiv').empty();
		$('#imageQtyDiv').empty();
		
		if($('#imageId').val()=='') 
			$('#imageIdDiv').text("상품코드를 입력하세요").css('color','red').css('font-size','9pt');
		else if($('#imageName').val()=='') 
			$('#imageNameDiv').text("상품명을 입력하세요").css('color','red').css('font-size','9pt');
		else if($('#imagePrice').val()=='') 
			$('#imagePriceDiv').text("단가를 입력하세요").css('color','red').css('font-size','9pt');
		else if($('#imageQty').val()=='') 
			$('#imageQtyDiv').text("개수를 입력하세요").css('color','red').css('font-size','9pt');
		else
			$('#imageboardWriteForm').submit();
	});	
});
</script>
</head>
<body>
<div align="center">
	<h3>이미지등록</h3>
	<form name="imageboardWriteForm" id="imageboardWriteForm" method="post" enctype="multipart/form-data" 
	action="/SpringProject/imageboard/imageboardWrite.do">
		<table border="1" cellspacing="0" width="600">
			<tr>
				<th>상품코드</th>
				<td>
					<input type="text" name="imageId" id="imageId" value="img_" style="width: 95%;">
					<div id="imageIdDiv"></div>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" name="imageName" id="imageName" style="width: 95%;">
					<div id="imageNameDiv"></div>
				</td>
			</tr>
			<tr>
				<th>단가</th>
				<td>
					<input type="text" name="imagePrice" id="imagePrice" style="width: 95%;">
					<div id="imagePriceDiv"></div>
				</td>
			</tr>
			<tr>
				<th>개수</th>
				<td>
					<input type="text" name="imageQty" id="imageQty" style="width: 95%;">
					<div id="imageQtyDiv"></div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="imageContent" id="imageContent" rows="20" cols="50" style="width: 95%;"></textarea>
					<div id="imageContentDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="img" style="width: 95%;">
				</td>
			</tr>
			
			<!-- 
			<tr>
				<td colspan="2">
					<input type="file" name="img" style="width: 95%;">
				</td>
			</tr>
			-->
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="이미지등록" id="checkImageboardWrite">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>