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
<script type="text/javascript">
function boardSearch(pg){
	//location.href="boardSearch.do?pg="+pg+"&searchOption=${searchOption}&keyword="+encodeURIComponent("${keyword}");
	$('#pg').val(pg);
	$('#boardSearchBtn').trigger('click','trigger');
	
}

/*
window.onload=function(){
	if('${searchOption}'=='subject' || '${searchOption}'=='id'){
		document.getElementById("searchOption").value = '${searchOption}';
	}
}
*/
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/SpringProject/board/getBoardList.do',
		data : 'pg=${pg}',
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, item){
				var head = "";
				for(var i=0; i<item.lev; i++) {
					head += '&emsp;';
				}
				if(item.pseq!=0)
					head += '<img src="../image/reply.gif">';

				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : item.seq
				})).append($('<td/>',{
					//html : head
					}).append($('<a/>',{
						id : 'subjectA',
						class : item.seq+"",
						href : 'javascript:void(0)',
						text : item.subject
				}))).append($('<td/>',{
					align : 'center',
					text : item.id
				})).append($('<td/>',{
					align : 'center',
					text : item.logtime
				})).append($('<td/>',{
					align : 'center',
					text : item.hit
				})).appendTo($('#boardTable'));
				
				if(item.pseq!=0){//답글
					for(i=0; i<item.lev; i++){
						/*
						 $('#subjectA')를 쓰면 5줄 모두 id="subjectA"로 붙는다
						 그러면 첫번째줄의 subjectA에 이미지가 붙는다
						*/
						$('.'+item.seq).before('&emsp;');
					}//for
					$('.'+item.seq).before($('<img/>',{
						src : '../image/reply.gif'
					}));
				}
			});
			
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		}
	});
	
	//로그인 여부
	$('#boardTable').on('click','#subjectA',function(){
		if('${memId}'==''){
			alert("먼저 로그인 하세요");
		}else{
			//alert($(this).parent().prev().prop('tagName'));
			var seq = $(this).parent().prev().text();
			location.href = "/SpringProject/board/boardView.do?seq="+seq+"&pg=${pg}";         
		}
	});
	
	$('#boardSearchBtn').click(function(event, str){
		if(str!='trigger') $('#pg').val(1);
		
		if($('#keyword').val()=='')
			alert("검색어를 입력하세요");
		else{
			
			$.ajax({
				type : 'POST',
				url : '/SpringProject/board/boardSearch.do',
				data : {'pg':$('#pg').val(),
						'searchOption':$('#searchOption').val(),
						'keyword':$('#keyword').val()},
				dataType : 'json',
				success : function(data){
					$('#boardTable tr:gt(0)').remove();
					
					$.each(data.list, function(index, item){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : item.seq
						})).append($('<td/>',{
							
							}).append($('<a/>',{
								id : 'subjectA',
								href : 'javascript:void(0)',
								text : item.subject
						}))).append($('<td/>',{
							align : 'center',
							text : item.id
						})).append($('<td/>',{
							align : 'center',
							text : item.logtime
						})).append($('<td/>',{
							align : 'center',
							text : item.hit
						})).appendTo($('#boardTable'));     
					});
					
					$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				}
			});
		}
	});
	
});
</script>
</head>
<body>
<table id="boardTable" border="1" cellpadding="3" frame="hsides" rules="rows">
<tr>
	<th width="100">글번호</th>
	<th width="350">제목</th>
	<th width="100">작성자</th>
	<th width="150">작성일</th>
	<th width="100">조회수</th>
</tr>
</table>
<div id="boardPagingDiv" style="float: left; width: 800px;" align="center">
</div>
<br><br>

<form name="boardSearchForm" method="post">
<input type="hidden" name="pg" id="pg" value="1">

<div style="width:800px; text-align:center">
<select name="searchOption" id="searchOption" style="width:80px;">
	<option value="subject" selected>제목</option>
	<option value="id">아이디</option>
</select>
<input type="text" name="keyword" id="keyword" value="${keyword }">
<input type="button" id="boardSearchBtn" value="검색">
</div>
</form>
</body>





















