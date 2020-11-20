<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public int getBeasu( int a, int b , int c){
	int sum = 0;
	for(int i=a; i<=b;i++){
		if(i%c==0){
			sum +=i;
		}
	}
	return sum;
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
	<h2>선언부에서 메소드 정의</h2>
	<h3>스크립트렛에서 결과값 출력</h3>
	<%
		/*
		연습문제] 1부터 100사이숫자중 3의 배수합을 반환하는 함수 선언후 결과출력*/
		int hapResult = getBeasu(1,100,3);
		out.println("1~100사이의 3의 배수 합"+ hapResult);
	%>
	<h3>표현식의 결과값 출력</h3>
	1~200사이의 숫자중 5의 배수 합은?
	<%=getBeasu(1,200,5) %>
</body>
</html>