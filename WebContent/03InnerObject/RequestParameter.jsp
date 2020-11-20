<%@page import="java.util.Enumeration"%>
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
<%
//한글깨짐 방지
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
if(!(name==null || name.equals(""))){
	out.println("이름:"+name);
}
else{
	/*
	스크립트릿 안에서 js를 선언할때는 out.println을 통해 아래처럼 사용가능
	
	*/
	out.println("<script>");
	out.println(" alert('이름을 입력하세요');");
	out.println("	history.back();");
	out.println("</script>");	
}
String sexStr = request.getParameter("sex");

String[] favo = request.getParameterValues("favorite");
String favStr = "";

if(favo != null){
	//잔송된 항목을 하나의 문자열로 결하여 저장한다.
	for(int i=0; i<favo.length ; i++){
		if(i==favo.length-1){
		favStr += favo[i];			
		}
		else{
			favStr += favo[i]+",";
		}
	}
}
/*
textarea를 통해 입력받은 값은 엔터키 (줄바꿈 기호) 가 포함되어있다
웹브라우저에 출력할때는 특수기호를 <br>로 변환후 출력해야한다.
*/
String self_intro=
	request.getParameter("self_intro").replace("\r\n","<br/>");
Enumeration names = request.getParameterNames();
while(names.hasMoreElements()){
	String paramName = (String)names.nextElement();
	System.out.println("파라미터명:"+paramName);
	/*
	radio는 선택할수 있는 항목이1개이므로  getparmeternames로 받을 수 있고
	checkbox는 선택가능항목이 여러개라 getParameterValues()로 받는다.
	항목중 선택된것만 서버로 전송, 파라매타명이 틀리거나 값이 없으면  null반환
	*/
	if(paramName.equals("sex") ||
			paramName.equals("favorite")){
		System.out.println("파라미터명을  getParameterValues()로"
			+"로 얻어서 값 출력함<br/>"	);
	}
	else{
		System.out.println("getParameter()로 읽기");
		out.println("파라미터명을 메소드로 얻어서 값출력 :");
		out.println(request.getParameter(paramName)+"<br/>");
	}
}
%>
<ul>
	<li>이름 : <%=name %></li>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sexStr %></li>
	<li>관심사항 : <%=favStr %></li>
	<li>자기소개 : <%=self_intro %></li>
</ul>






















</body>
</html>