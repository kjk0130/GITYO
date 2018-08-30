<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="100%">
<tr>
	<td colspan="2" align="center">
		<jsp:include page="../template/top.jsp"/>
	</td>
</tr>

<tr>
	<td width="200" height="500" valign="top">
		<jsp:include page="../template/left.jsp"/>
	</td>
	<td>
		<jsp:include page="${display }"/>
	</td>
</tr>

<tr>
	<td colspan="2">
		<jsp:include page="../template/bottom.jsp"/>
	</td>
</tr>
</table>
</body>
</html>







