<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

pageContext.setAttribute("pageVar", "페이지영역이다");
pageContext.setAttribute("requestVar", "리퀘스트영역이다");

%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h2>액션태그를 이용한 포워딩</h2>
<h2>액션태그를 이용한 포워딩</h2>
	<%
	response.sendRedirect(request.getContextPath()+
			"/07ActionTag/ForwardActionREsult.jsp");
	//request.getRequestDispatcher("/07ActionTag/ForwardActionREsult.jsp").forward(request, response);
	%>

























</body>
</html>