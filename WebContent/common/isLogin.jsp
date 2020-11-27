<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 파일명   : isLogin.jsp
 해당 페이지 처럼 jsp코드를 포함한 파일을 include할때는 지시어를 통해 기술하는게 좋다
 액션태그를 사용하는 경우 먼저 컴파일 후 페이지에 삽입되므로 문제가 될수 있다.
  -->
 <%
 if(session.getAttribute("USER_ID")==null){
 
 %>
 	<script>
 	/*
 	만약 로그인 되지 않았다면 로그인 페이지로 이동시킨다.*/
 		alert("로그인 후 이용해 주십시요.");
 		location.href = "../06Session/Login.jsp";
 	</script>
<%
	//js코드보다 jsp코드가 우선순위가 높으므로  만약 if문 뒤에 jsp코드가 있으면 
	//위의 js코드가 실행 안될수 있다. 따라서 if문을 벗어나지 못하도록 return을 건다.
	return;
 }
%>
