<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#subjectA:link{color:black; text-decoration: none;}
#subjectA:visited{color:black; text-decoration: none;}
#subjectA:hover{color:green; text-decoration: underline; font-weight: bold;}
#subjectA:active{color:black; text-decoration: none;}

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<form name="imageboardListForm" id="imageboardListForm" method="post" action="/SpringProject/imageboard/imageboardDelete.do">
<table border="1" id="imageboardTable" cellpadding="3" frame="hsides" rules="rows">
<tr>
	<th width="100">
		<input type="checkbox" id="checkAll">
		번호
	</th>
	<th width="250">이미지</th>
	<th width="100">상품명</th>
	<th width="150">단가</th>
	<th width="100">개수</th>
	<th width="150">합계</th>
</tr>
</table>

<div style="float:left;">
	<input type="button" value="선택삭제" id="choiceDelete">
</div>

<div id="imageboardPagingDiv" style="float: left; width: 800px;" align="center"></div>
</form>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/SpringProject/imageboard/getImageboardList.do',
		data : {'pg' : '${pg}'},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, item){
				$('<tr/>',{
					align : 'center'
				}).append($('<td/>').append($('<input/>',{
					type : 'checkbox',
					value : item.seq,
					name : 'box',
					class : 'box'
					}),item.seq
				)).append($('<td/>').append($('<img/>',{
					src : '../storage/'+item.image1,
					width : '70',
					height : '70',
					id : 'image1'
				}))).append($('<td/>',{
					text : item.imageName
				})).append($('<td/>',{
					text : item.imagePrice
				})).append($('<td/>',{
					text : item.imageQty
				})).append($('<td/>',{
					text : (item.imagePrice * item.imageQty).toLocaleString()
				})).appendTo('#imageboardTable');
			});
			
			$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML);
		}
	});
	//이미지 클릭했을때
	$('#imageboardTable').on('click','#image1',function(){
		var seq = $(this).parent().prev().text();
		location.href='/SpringProject/imageboard/imageboardView.do?seq='+seq+'&pg=${pg}';
	});
	
	//전체선택
	$('#checkAll').click(function(){
		//alert($('.box').length());
		if($('#checkAll').prop('checked')){
			//$('.box')[i].checked = true;
			$('.box').prop('checked',true);
		}else {
			//$('.box')[i].checked = false;
			$('.box').prop('checked',false);
		}
	});
	//선택 삭제
	$('#choiceDelete').click(function(){
		var count = $('.box:checked').length;
		if(count==0) alert("항목을 선택하세요");
		else $('#imageboardListForm').submit();
	});
});
</script>

<script>
function imageboardPaging(pg){
	location.href="/SpringProject/imageboard/imageboardList.do?pg="+pg;
}

</script>














  


























