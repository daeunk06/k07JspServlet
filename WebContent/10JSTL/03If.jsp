<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
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
<h2>if태그</h2>
<!-- jstl의 if문은 시작태그와 종료태그를 통해서 조건을 판단한다
	else문이 없으므로 다중조건일 때 choose문을 사용한다.
 -->
<c:set var="numVar" value="100"/>
<c:set var="strVar" value="JAVA"/>

<h3>JSTL의 if태그로 짝수/홀수 판단하기</h3>
<c:if test="${numberVar mod 2 eq 0 }" var="result">
	${numVar }는 짝수입니다. <br />
</c:if>
\${result } : ${result } <br />

<h3>위 if문을 el식의 삼항식으로 표현</h3>
${numVar } : ${numVar mod 2 == 0 ? "는 짝수" : "는 홀수" }

<!-- jstl의 if문은 else가 없기때문에 참 거지의 형태로 구문을 만들때
	참,조건으로 각각 블럭을 만든다. -->
<h3>문자열 비교</h3>
<c:if test="${JAVA eq '자바'}">
	${strVar }는 자바다 <br />
</c:if>
<c:if test="${JAVA ne '자바'}">
	${strVar }는 자바가 아니다 <br />
</c:if>

<!-- 
test속성에 el식이 아닌 일반값이 들어가면 무조건 false를 반환
el식이더라도 {}양쪽에 공백이 들어가면 무조건 false를 반환
단, 일반식이라도 true인 경우 true를 반환한다.
 -->
<h2>if문 사용시 주의 사항</h2>
<h3>항상 출력되거나 출력되지 않는 조건식</h3>
<c:if test="${true }">난 항상 출력돼</c:if>
<c:if test="${false }">난 절대 출력안돼</c:if>

<h3>test속성에 일반값으로 조건지정</h3>
<c:if test="100" var="result">
100은 일반값이므로 무조건 false반환
</c:if>
\${result } : ${result } <br />

<c:if test="tRue" var="result">
	TRUE(true)대소문자 구분 없음 항상 참임. <br />
</c:if>
\${result } : ${result } <br />

<h3>el식으로 조건 판단시 {}양쪽에 공백있으면 무조건 false반환</h3>
<c:if test=" ${true} " var="result">
	빈 공백이 있으므로 false처리된다.</c:if>
\${result } : ${result } <br />


<!-- 
	아이디, 패스워드를 입력후 submit 한후 EL식을 통해 파라미터로 받은후
	"kosmo", "1234" 인 경우에는 "kosmo님 하이룽~" 이라고 출력한다. 
	만약 틀렸다면 "아이디와 비번을 확인하세요" 를 출력한다. 
	EL과 JSTL의 if태그만을 이용해서 구현하시오.
	 -->

	<h3>연습문제 : if태그</h3>
	<form method="get" name="fn">
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>	
	<!-- 내 코드 -->
	<c:if test='${param.user=="kosmo" and param.pass =="1234"}' var="result"/>
	<c:if test='${!(empty param.user and empty param.pass)}'>
	${result==true ? "kosmo님 하이룽~" : "아이디와 비번을 확인하세요" }
	</c:if>
	<!-- 쌤 코드 -->
























</body>
</html>