<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
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
	set태그 속성
		var : 변수명 문자열만가능
		value : 값을 설정함 표현식 , el식 모두 가능
		scope : 영역을 지정하여 변수를 저장함
			4가지 영역을 지정할 수 있고 기본값은 가장 좁은 page영역
		즉, set으로 변수를 저장하면 지정된 영역에 저장됨
	 -->
	<h2>set태그</h2>
	<h3>set태그로 el에서 사용할수 있는 변수 설정하기</h3>
	<ul>
		<li>
		1.value 속성에 직접 값 대입:
			<c:set value="100" var="directVar"/>
		</li>
		<li>
		2.value 속성에 EL로 값 대입:
			<c:set value="${directVar mod 5 }" var="elVar"/>
		</li>
		<li>
		3.value 속성에 표현식으로 값 대입:
			<c:set var="expVa" value="<%=new Date() %>"/>
				<!-- java.util -->			
		</li>
		<li>
		4.시작태그와 종료태그 사이에 값 설정:
			<c:set var="betweenVar">
				변수값 요렇게 설정
			</c:set>
		</li>
	</ul>
	
	<h3>set태그로 설정한 데이터 표현식으로 출력</h3>
	<ul>
		<li>
			directVar : <%=pageContext.getAttribute("directVar") %>
		</li>
		<li>
			elVar : <%=pageContext.getAttribute("elVar") %>
		</li>
		<li>
			expVa : <%=pageContext.getAttribute("expVa") %>
		</li>
		
		<li>
			betweenVar : <%=pageContext.getAttribute("betweenVar") %>
		</li>
	</ul>
	
	<h3>el로 출력</h3>
	<!-- 
	el로 영역의 속성을 읽어올때는 xxxscope를 생략하면 가장 좁은
	영역인 page영역을 읽어오게 되므로, 속성명이 동일하지 않다면
	내장객체는 생략할 수있다.
	 -->
	<ul>	
		<li>directVar : ${pageScope.directVar}</li>
		<li>elVar : ${pageScope.elVar}</li>
		<li>expVa : ${pageScope.expVa}</li>
		<li>betweenVar : ${pageScope.betweenVar}</li>
	</ul>
	<h2>set태그로 자바빈 객체 설정</h2>
	
	<h3>인자 생성자로 설정</h3>
	<!-- 인자생성자를 통해 DTO객체를 생성한 후 request영역에 속성을 저장함 -->
	<c:set var="argsMember"
		value='<%=new MemberDTO("KIM","1111","김태희",null) %>'
		scope="request"/> 
	
	<h3>JSP코드로 출력</h3>
	<!-- 영역에 저장될때 Object타입으로 자동형변환되므로 사용시
		해당 자료형으로 캐스팅(형변환)해야한다. -->
	<ul>
		<li>아이디:
			<%=((MemberDTO)request.getAttribute("argsMember")).getId() %>
		</li>
		<li>이름:
			<%=((MemberDTO)request.getAttribute("argsMember")).getName() %>
		</li>
	</ul>
	<!-- el로 출력시에는 별도의 형변환이 필요없고 속성명이 중복되지 
	않는다면 xxscope계열의 내장객체를 쓸 필요가 없다.  -->
	<h3>EL로 출력</h3>
	<ul>
	<li>아이디 : ${requestScope.argsMember.id }</li>
	<li>이름: ${argsMember.name}</li>
	</ul>
	<h3>target속성과 property 속성 사용하기</h3>
	<c:set var="defaultMember" value="<%=new MemberDTO() %>"
	scope="request"/>
	<c:set target="${defaultMember }" property="id"
	 value="Jung"/>
	<c:set target="${defaultMember }" property="pass"
	 value="9999"/>
	<c:set target="${defaultMember }" property="name"
	 value="정지훈"/>
	
	<h3>target및 property속성으로 설정후 출력</h3>
	<ul>
		<li>아이디:${requestScope.defaultMember.id }</li>
		<li>비번:${requestScope.defaultMember.pass }</li>
		<li>이름:${requestScope.defaultMember.name }</li>
	</ul>
	
	<h2>List 컬렉션 사용하기</h2>
	<%
	List list = new Vector();
	list.add(request.getAttribute("defaultMember"));
	list.add(request.getAttribute("argsMember"));
	%>
	
	<h4>1단계 : set태그로 리스트 계열 컬렉션 설정</h4>
	<c:set var="list" value="<%=list %>" scope="request"/>
	
	<h4>target및 property속성으로 미 설정 후 출력</h4>
	<ul>
		<li>아이디:${requestScope.list[0].id }</li>
		<li>비번:${requestScope.list[0].pass }</li>
		<li>이름:${requestScope.list[0].name }</li>
	</ul>
	
	<h4>2단계 :target 및 property속성으로 속성값 변경</h4>
	<c:set target="${list[0] }" property="id" value="BTS"/>	
	<c:set target="${list[0] }" property="pass" value="0000"/>	
	<c:set target="${list[0] }" property="name" value="방탄소년단"/>	

	
	<h4>target 및 property속성으로 설정 후 출력</h4>
	<ul>
		<li>아이디:${requestScope.list[0].id }</li>
		<li>비번:${list[0].pass }</li>
		<li>이름:${list[0].name }</li>
	</ul>
	
	<h2>Map 컬렉션 이용하기</h2>
	<%
	Map map = new HashMap();
	map.put("def", request.getAttribute("defaultMember"));
	map.put("args", request.getAttribute("argsMember"));
	%>
	
	<h4>1단계 : set태그로 맵 컬렉션 설정</h4>
	<c:set value="<%=map %>" var="map" scope="request"/>
	
	<h4>2단계 target및  property 속성으로 속성값 설정</h4>
		<c:set target="${map.args}" property="id" value="BTOB"/>	
		<c:set target="${map.args}" property="pass" value="7777"/>	
		<c:set target="${map.args}" property="name" value="성재짱"/>	
	<h4>속성값 변경후 출력</h4>
	<ul>
		<li>아이디 :${map.args.id }</li>
		<li>아이디 :${map.args.pass }</li>
		<li>아이디 :${map.args.name }</li>
	</ul>
	
	
</body>
</html>