<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
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
	<h2>확장 for문 형태의 forEach태그</h2>
	<%
	String[] colors = {"red","green","blue","#573838"};
	%>
	<h3>jsp코드로 배열 출력</h3>
	<%
	for(String c : colors){
	%>
		<h4 style="color:<%=c%>;">jsp코드로 출력</h4>
	<%} %>	
	
	<h3>JSTL및 EL로 배열 출력</h3>
	<c:set value="<%=colors %>" var="colors"/>
	<c:forEach items="${colors }" var="c">
		<h4 style="color:${c};">
			JSTL로 출력
		</h4>
	</c:forEach>		
		
	<h3>varStatus속성 알아보기</h3>
	<c:forEach items="${colors }" var="c" varStatus="loopStatus">
		<h4>${loopStatus.count } 번째 반복</h4>
		<ul>
			<li>index : ${loopStatus.index }</li>
			<li>first : ${loopStatus.first }</li>
			<li>last : ${loopStatus.last }</li>
			<li>current : ${loopStatus.current }</li>
		</ul>
	</c:forEach>
	
	<h3>리스트 계열의 컬렉션</h3>
	<%
	List list = new Vector();
	list.add(new MemberDTO("Hong","1111","홍씨",null));
	list.add(new MemberDTO("Park","2222","박씨",null));
	list.add(new MemberDTO("Sung","3333","성씨",null));
	%>
	<c:set var="lists" value="<%=lists %>"/>
	
	<h3>일반 for문 형태의 jstl의 forEach태그</h3>
	<ul>
		<c:forEach begin="0" end="${lists.size()-1 }" var="i">
			<li>
				아이디:${lists[i].id },
				패스워드:${lists[i].pass },
				이름:${lists[i].name }
			</li>
		</c:forEach>
	</ul>
	<h3>확장 for문 형태의 jstl의 forEach태그</h3>
	<ul>
		<c:forEach items="${lists }" var="list">
			<li>
				아이디:${lists.id },
				패스워드:${lists.pass },
				이름:${lists.name }
			</li>
		</c:forEach>
	</ul>
	
	<h3>맵 계열 컬렉션 사용</h3>	
	<%
	Map maps = new HashMap();
	maps.put("first", lists.get(0));
	maps.put("first", lists.get(0));
	maps.put("first", lists.get(0));
	%>
	<c:set value="<%=maps %>" var="maps"></c:set>
		
		
		
		
		
		
</body>
</html>