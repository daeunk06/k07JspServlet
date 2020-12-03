<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 영역에 저장된 속성을 제거하기에 로그아웃에 사용된다. -->
	<h2>remove 태그</h2>
	<c:set var="pageVar" value="페이지영역"/>
	<c:set var="pageVar" value="리퀘스트영역1번" scope="request"/>
	<c:set var="requestVar" value="리퀘스트영역2번" scope="request"/>
	<c:set var="sessionVar" value="세션영역" scope="session"/>
	<c:set var="appVar" value="어플리케이션 영역" scope="application"/>

	<h3>삭제전 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li>
		<li>리퀘스트1 : ${requestScope.pageVar }</li>
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션: ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
	
	<h3>remove로 삭제하기</h3>
	<!-- 속성명은 존재하지만 영역설정이 잘못된다면 아무것도 제거 안됌 -->
	<c:remove var="requestVar" scope="session"/>

	<h3>영역이 다른 속성명 삭제후  출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li>
		<li>리퀘스트1 : ${requestScope.pageVar }</li>
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션: ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>

	<!-- 영역에 동일한 이름의 속성이 존재하는 경우 둘다 삭제된다. -->
	<h3>remove로 삭제하기</h3>
	<c:remove var="pageVar" />

	<h3>스코프 미 지정후 속성명 삭제후 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li><!-- 삭제됨 -->
		<li>리퀘스트1 : ${requestScope.pageVar }</li><!-- 삭제됨 -->
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션: ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
















</body>
</html>