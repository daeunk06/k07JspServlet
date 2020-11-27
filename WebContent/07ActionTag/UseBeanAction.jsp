 
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanAction.jsp</title>
</head>
<body>
   <h2>useBean 액션태그</h2>
   
   <h3>useBean 액션태그로 좁은의미의 자바빈 객체 생성하기</h3>
   
   <%  

	MemberDTO memberDTO = new MemberDTO();
   	
   //위 Java코드를 액션태그로 표현하면 아래와 같이된다.
   %>   
   <!--  
      액션태그를 통해 빈을 생성할때 클래스명은  패키지명을 포함한
      풀경로를 사용해야한다. 
   -->
    
</body>
</html>