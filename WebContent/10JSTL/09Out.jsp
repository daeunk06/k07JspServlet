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
	<h2>out 태그</h2>
	
	<c:set var="htmlStr">
		<h3>h3 태그로 감싼 문자열</h3>
	</c:set>
	
	<h3>escapeXml=true(기본값)일때</h3>
	<c:out value="${htmlStr }" escapeXml="true"/>
	<br />
	\${htmlStr } : ${htmlStr }
	
	<h3>escapeXml=false일때</h3>
	<c:out value="${htmlStr }" escapeXml="false"/>
	<br />
	\${htmlStr } : ${htmlStr }
	
	<h3>default속성</h3>

	<h4>값이 빈 문자열 : 값이 있는 경우에 해당</h4>
	출력 : <c:out value="" default="값이 빈 문자열"/>

	<h4>값이 빈 문자열 : 값이 없는 경우에 해당</h4>
	출력 : <c:out value="${null }" default="값이 null인경우"/>

	<h3>페이지 링크에 응용하기</h3>
	<c:url value="/08Board1/BoardList.jsp?nowPage="/><c:out value="${null }" default="1"></c:out>
	<hr />
	<!-- 주의 한줄로 붙여서 작성하세요 줄바꿈시 공백들어감 -->
	<a href="<c:url value='/08Board1/BoardList.jsp?nowPage='/><c:out
	value='${null }' default='1'/>">회원제게시판 리스트 바로가기</a>















</body>
</html>