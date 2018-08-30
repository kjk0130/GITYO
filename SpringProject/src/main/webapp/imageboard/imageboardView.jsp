<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<a href="javascript:void(0)" onclick="bigImage()">
<span style="display:block; background: yellow; width:30px; height:30px; margin-left:10px;">
	<img src="../image/zoom.png" width="20" height="20">
</span>
</a>
<table border="1" cellpadding="3" frame="hsides" rules="rows">
<tr>
	<td rowspan="4">
		<img width="200" heigth="200" src="../storage/${imageboardDTO.image1}">
		<br>
	</td>
	<td>상품명 : ${imageboardDTO.imageName}</td>
</tr>

<tr>
	<td>단가 : ${imageboardDTO.imagePrice}</td>
</tr>

<tr>
	<td>개수 : ${imageboardDTO.imageQty}</td>
</tr>

<tr>
	<td>합계 : ${imageboardDTO.imagePrice * imageboardDTO.imageQty}</td>
</tr>

<tr>
	<td colspan="2" height="200" valign="top">${imageboardDTO.imageContent} </td>
</tr>
</table>
<input type="button" value="이미지목록" 
onclick="location.href='/SpringProject/imageboard/imageboardList.do?pg=1'">

<script>
function bigImage(){
	var newWindow = window.open("","","width=500 height=500");
	   
	var img = newWindow.document.createElement("img");
	img.setAttribute("src", "http://localhost:8080/SpringProject/storage/${imageboardDTO.image1}");
	img.setAttribute("height", "500");
	img.setAttribute("width", "500");
	newWindow.document.body.appendChild(img);
}
</script>












