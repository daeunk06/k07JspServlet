<%@page import="util.FirstFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<h3>구구단 출력 - 표현식으로 구현</h3>
	<table border="1">
	<%
	//단만큼 반복시킨다
	for(int dan=2; dan<=9; dan++){
	%>
		<tr>
		<%
		//수만큼 반복
		for(int su=1; su<=9; su++){
		%>
			<td><%=dan %>*<%=su %>=<%=(dan*su) %></td>
		<%
		}
		%>
		</tr>
	<%
	}
	%>
	</table>
	
	<%!
	//위와 동일한 결과가 출력되도록 구현하쇼
	public void showGugudan(JspWriter out){
		try{
			out.print("<table border='1'>");
			for(int dan=2; dan<=9; dan++){
					//수만큼 반복
				out.print("<tr>");
				for(int su=1; su<=9; su++){
					out.println("<td>"+dan+"*"+su+"="+(su*dan)+"</td>");
				}
				out.print("</tr>");
			}
			out.print("</table>");
		}
		catch(Exception e){}	
		
	}
	
	%>
	<h3>구구단 출력- 선언부에서 함수 선언후 호출</h3>
	<%
		showGugudan(out);
	%>

	<h3>구구단 출력- src부분에 클래스 선언후 함수 호출</h3>
	<%
		FirstFunction.srcGUGUdan(out);
	%>





















</body>
</html>