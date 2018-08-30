function checkBoardWrite(){
	if(document.boardWriteForm.subject.value=="")
		alert("제목을 입력하세요");
	else if(document.boardWriteForm.content.value=="")
		alert("내용을 입력하세요");
	else
		document.boardWriteForm.submit();
}

function checkBoardReply(){
	if(document.boardReplyForm.subject.value=="")
		alert("제목을 입력하세요");
	else if(document.boardReplyForm.content.value=="")
		alert("내용을 입력하세요");
	else
		document.boardReplyForm.submit();
}
