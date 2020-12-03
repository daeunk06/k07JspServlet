<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
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
<!-- 
	forEach 태그 : 확장 for문
		주로 배열이나 컬렉션에서 값을 순차적으로 접근하고 싶을때 사용한다
		varStatus에 저장된 값들 중 index속성은 0 부터 시작한다
		필수 속성으로 items와 var가 있다.
	 -->
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
	
	<!-- JSP의 스크립트릿에서 생성한 배열을 JSTL에서 사용하기 위해
	set 태그로 변수를 선언한다. 즉 영역에 저장한다. -->
	<h3>JSTL및 EL로 배열 출력</h3>
	<c:set  var="colors" value="<%=colors %>"/>
	<c:forEach items="${colors }" var="c">
		<h4 style="color:${c};">
			JSTL로 출력
		</h4>
	</c:forEach>		
		
	<!-- 
	확장형 forEach태그의 varStatus속성
	-index : 현재루프내에서의 인덱스를 표시한다. 0부터 시작한다.
	-current : 현재 루프의 실제요소를 반환한다.
	-count : 실제 반복횟수를 반환한다. 1부터 시작한다.
	 -->
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
	List lists = new Vector();
	lists.add(new MemberDTO("Hong","1111","홍씨",null));
	lists.add(new MemberDTO("Park","2222","박씨",null));
	lists.add(new MemberDTO("Sung","3333","성씨",null));
	%>
	<!-- set태그를 통해 page영역에 리스트 컬렉션을 저장한다. -->
	<c:set var="lists" value="<%=lists %>"/>
	
	<h3>일반 for문 형태의 JSTL의 forEach태그</h3>
	<ul>
		<c:forEach begin="0" end="${lists.size()-1 }" var="i">
			<!-- index를 사용하므로 배열자체에 []를 사용한다. -->
			<li>
				아이디:${lists[i].id },
				패스워드:${lists[i].pass },
				이름:${lists[i].name }
			</li>
		</c:forEach>
	</ul>
	
	<h3>확장 for문 형태의 JSTL의 forEach태그</h3>
	<!-- 확장ㅎ형에서는 ㅈ참조변수를 바로 사용한다. -->
	<ul>
		<c:forEach items="${lists }" var="list">
			<li>
				아이디: ${list.id},
				패스워드: ${list.pass},
				이름: ${list.name}
			</li>
		</c:forEach>
	</ul>
	
	<h3>맵 계열 컬렉션 사용</h3>	
	<%
	Map maps = new HashMap();
	//리스으틔 객체를 인덱스로 얻어와서 맵에 저장함
	maps.put("first", lists.get(0));
	maps.put("second", lists.get(1));
	maps.put("third", lists.get(2));
	%>
	<c:set var="maps" value="<%=maps %>" ></c:set>
	<h4>키값을 알고 있을 때 : EL변수 , 키값 혹은  EL변수["키값"]</h4>	
	<ul>
		<li>아이디:${maps.first.id }</li>
		<li>비번:${maps.first.pass }</li>
		<li>이름:${maps.first.name }</li>
	</ul>
	<ul>
		<li>아이디:${maps.second.id }</li>
		<li>비번:${maps.second.pass }</li>
		<li>이름:${maps.second.name }</li>
	</ul>
	<ul>
		<li>아이디:${maps.third.id }</li>
		<li>비번:${maps.third.pass }</li>
		<li>이름:${maps.third.name }</li>
	</ul>
	<h4>키값을 모를때 홗장 for문 사용</h4>
	
	<%-- 루프내에서 객체를 전달할 변수 map을 통해 맵의 key와 value를 알아낼 수있다
		key => ${맵의이름.key}
		value => ${맵의이름.value}
	 --%>
	<ul>
		<c:forEach items="${maps }" var="map">
		<li>
			<dl>
				<dt>key값: ${map.key }</dt>
				<dd>Value값=>
					아이디:${map.value.id },
					비번:${map.value.pass },
					이름:${map.value.name }
					</dd>
			</dl>
		</li>
		</c:forEach>
	</ul>
		
		
		
</body>
</html>