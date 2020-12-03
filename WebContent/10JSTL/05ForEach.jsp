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
	<h2>일반 for문 형태의 forEach태그</h2>
	<!-- step 증가치-->
	<h3>JSTL 및 EL태그로 Hn태그 출력하기</h3>
	<c:forEach begin="1" end="6" var="i">
		<h${i }난 H${i }태그 입니다.></h${i }>
	</c:forEach>
	
	<h3>varStatus 속성 살펴보기</h3>
	<c:forEach begin="3" end="6" var="i" varStatus="loop">
		<h4>${loop.count }번째 반복입니다.</h4>
		<ul>
			<li>index : ${loop.index }</li>
			<li>first : ${loop.first }</li>
			<li>last : ${loop.last }</li>
			<li>current : ${loop.current }</li>
		</ul>
	</c:forEach>
	
	<h3>1에서 100까지 정수중 홀수의 합</h3>
	<c:forEach begin="1" end="100" var="a">
		<c:if test="${a mod 2 ne 0 }">
			<c:set  var="sum" value="${sum+a }"/>
		</c:if>
	</c:forEach>
	
	1~100 사이의 정수중 홀수의 합은? ${sum }
	
	<h3>중첩된 for문 활용하기</h3>
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach와 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->
	<h4>if문 사용하기</h4>
	<c:forEach begin="1" end="5" var="x">
		<c:forEach begin="1" end="5" var="y">
			<c:if test="${x eq y}">
				<c:set value="1" var="p"/>
			</c:if>
			<c:if test="${x ne y}">
				<c:set value="0" var="p"/>
			</c:if>
			${p }
		</c:forEach>
		<br>
	</c:forEach>





<h2>구구단 출력하기</h2>
	<!-- 
	시나리오] JSTL의 forEach문을 이용하여 구구단을 출력하시오.
		table태그를 사용해야 하고, 짝수행에 마우스 오버시 빨간색으로
		홀수행에 마우스 오버시 노란색으로 바뀌게 코드를 작성하시오.
	 -->
<h3>JSTL로 출력하기</h3>
	<h3>구구단출력1 - 표현식으로 구현</h3>
	
	
	<table border="1">
	
	<c:forEach begin="2" end="9" var="dan">
		<c:if test="${ dan mod 2 eq 0}">
			<tr onmouseover="style.backgroundColor='yellow';"
			onmouseout="style.backgroundColor='white';">
			<c:forEach begin="1" end="9" var="su">
				<td >${dan }*${su }=${dan*su }</td>
			</c:forEach>
			</tr>
		</c:if>
		<c:if test="${dan mod 2 ne 0}">
			<tr onmouseover="style.backgroundColor='red';"
			onmouseout="style.backgroundColor='white';">
			<c:forEach begin="1" end="9" var="su">
				<td >${dan }*${su }=${dan*su }</td>
			</c:forEach>
			</tr>
		</c:if>
	</c:forEach>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>