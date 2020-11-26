<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String content = request.getParameter("content);//내용

BbsDTO dto = new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("USER_ID").toString());

BbsDAO dao = new BbsDAO(application);

int affected = dao.insertWrite(dto);
if(affected==1){
	response.sendRedirect("BoardList.jsp");
}
else{
%>
	<script >
		alert("글쓰기에 실패하였습니다.")
		history.go(-1);
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

</body>
</html>