<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!
 public int add(int a, int b){
	 int result = a+b;
	 return result;
 }
 public int subtract(int a, int b){
	 int result = a-b;
	 return result;
 }
 public void showprint(String str, JspWriter out){
	try{
		out.println("받은문자열:"+str);
	}
	catch(Exception e){
		e.printStackTrace();
	}
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
	<h2>JSP의 스크립트 요소들(scripting Elements)</h2>
	
	<%@ include file="../01Directive/IncludePage.jsp" %>
	
	<%-- 지시자: 페이지 속성 또는 외부문서 include시 사용
		선언부: 메소드 선언시 사용
		스크립트렛 : jsp코드를 작성하고 실행할때 사용 영역 상관없이 사용가능
		표현식 : document.write()랑 동일한 기능 변수출력시 사용
		단, (세미콜론)은;빼야한다.
  	--%>
	<%
	int value1 =3;
	int value2 = 9;
	
	int addResult = add(value1, value2);
	int subResult = subtract(value1, value2);
	
	%>
	
	<h3>표현식으로 변수를 화면에 출력하기</h3>
	<%=value1%> + <%=value2%> = <%=addResult%>
	<br />
	<%=value1%> - <%=value2%> = <%=subResult%>
	<br />
	<%
		showprint("우리는KOSMO", out);
	%>
	<br />
	오늘 날짜는 : <%=todayStr %>[인클루드 된 파일에서 가져옴]		

	
</body>
</html>