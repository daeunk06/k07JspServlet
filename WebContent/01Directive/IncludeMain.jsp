<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%--
	include지시어 : 공통으로 사용할 jsp파일을 생성한 후 
		현재문서에 포함시킬때 사용한다. 각각의 jsp 파일 상단에는
		반드시 page지시어가 삽입되어야 한다.
 --%>
<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재문서에 링크시킨다. -->
<link rel="stylesheet" href="./Css/div_layout.css" />

</head>
<body>
<div class="AllWrap">
	<div class="header">
		<%@ include file="../common/Top.jsp" %>
	</div>
	<div class="body">
		<div class="left_menu">
		<%@ include file ="../common/Left.jsp" %>
		</div>
		<div class="contents">
		<%--
		해당 변수는 외부파일에 선언하여 본 문서에 인클루드 처리되었다
		문서자체를 포함시키는 개념이므로 에러가 발생ㅇ하지 않는다. --%>
			<h2>오늘의 날짜 : <%=todayStr %></h2>
			<br /><br />
			최근 tvN에서 방영된 예능 프로그램 ‘온앤오프’를 통해 혜민스님의 일상이 공개되었는데요. 대다수의 사람들이 예상하는 것과는 다르게 혜민스님은 산속 절이 아닌 남산뷰가 보이는 단독주택에서 지내고 있었습니다. 이에 대해 ‘무소유’가 아닌 ‘풀소유’를 실천하는 스님이라는 비판과 더불어 건물주라는 의혹까지 불거졌는데요.  이렇듯 혜민스님을 비롯해서 종교인들의 수익구조는 어떻게 되어 있는 걸까요? 더 알아보도록 하겠습니다.
			<br /><br />	
		</div>
	</div>
	<div class="copyright">
	<%@ include file="../common/Copyright.jsp" %>
	</div>
</div>






















</body>
</html>