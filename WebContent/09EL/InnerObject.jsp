<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("scopeVar", "페이지영역");
request.setAttribute("scopeVar", "리퀘스트영역");
session.setAttribute("scopeVar", "세션영역");
application.setAttribute("scopeVar", "어플리케이션 영역");
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
	<h2>EL에서 내장객체 사용하기 : xxxScope계열</h2>
	<h3>각 영역에 저장된 속성읽기</h3>
	<ul>
		<li>페이지 영역 : ${scopeVar }</li>
		<li>리쿼스트 영역 : ${requestScope.scopeVar }</li>
		<li>세션 영역 : ${sessionScope.scopeVar }</li>
		<li>어플리케이션 영역 : ${applicationScope.scopeVar }</li>
	</ul>
	
	<h3>xxxScope 미지정 후 속성읽기</h3>
	<ul>
		<li>가장좁은 영역읽음  :  ${scopeVar }</li>
		<li>위처럼 영역부분을 생략한 후 EL로 읽게 된다면 가장 좁은
		영역인 page영역이 읽혀 지게 된다</li>
	</ul>
	
	<jsp:forward page="InnerForward.jsp"></jsp:forward>


</body>
</html>