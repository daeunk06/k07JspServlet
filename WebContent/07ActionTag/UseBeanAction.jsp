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
	<h2>useBean 액션태그</h2>
	<h3>useBean 액션태그로 좁은의미의 자바빈 객체 생성하기</h3>
	<jsp:useBean id="member" class="model.MemberDTO" scope="request" />
	<h3>setProperty 액션태그로 자바빈 객체 속성지정하기</h3>
	<jsp:setProperty property="id" name="member" value="KIM"/>
	<jsp:setProperty property="pass" name="member" value="1234"/>
	<jsp:setProperty property="name" name="member" value="김희선"/>
	
	
	
	
	
</body>
</html>