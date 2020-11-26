<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
String directivePath = "./include/DirectivePage.jsp";
String actionTagPath = "./include/ActionTagPage.jsp";

pageContext.setAttribute("pageVar", "페이지영역에 저장");
pageContext.setAttribute("requestVar", "리퀘스트영역에 저장");

%>
<h2>include액션태그</h2>
<h3>include 지시어로 페이지 포함하기</h3>

<%@ include file="<%=directivePath %>"%>
<%@ include file="./include/DirectivePage.jsp" %>

<h2>각가의 포함된 페이지 안에서 선언한 변수 사용하기</h2>

<h3>디렉티브 페이지에서 선언한 변수사용</h3>
변수출력 : <%=dirString%>

<h3>디렉티브 페이지에서 선언한 변수사용</h3>
변수출력 : <%=actionString%>




















</body>
</html>