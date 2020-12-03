<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
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
<fieldset>
	<legend>EL에서 에러가 발생하거나 값이 출력되지 않는경우</legend>
	
	<h2>+를 숫자가 아닌 무자열 연겨에 사용시 에러</h2>
	<ul>
		<li>\${"100"+10 } : ${"100"+10 } </li>
		<%-- <li>\${"백"+10 } : \${"백"+10 } </li> 에러--%>
		<%-- <li>\${"Hello"+"EL" } : \${"Hello"+"EL"} </li> 에러 --%>
	<%-- 문자열 쓰고싶으면 +말고 ${} ${}이렇게 따로 쓰면 된다. --%>
	</ul>
	
	<h2>인덱스로 접근시( 배열이나 리스트계열 컬렉션)</h2>
	<%
	/* String형 배열을 선언후 각 요소들을 list컬렉션에 삽입. */
		String mountains[] = {"한라산","지리산","설악산"};
		
		List list = new Vector();
		for(String mountain : mountains) list.add(mountain);
	%>
	<!-- jstl의 set태그를 통해 변수를 생성 및 값을 할당한다
	해당변수는 page영역에 저장된다. -->
	<c:set var="elArray" value="<%=mountains%>" />
	<c:set var="elCollection" value="<%=list%>" />
	<ul>
		<li>\${elArray[0] } : ${elArray[0] } [정상]</li>
		<li>\${elCollection[0] } : ${elCollection[0] } [정상]</li>
		<%--<li>\${elArray.0 } : ${elArray[0] } [500에러]</li>--%>
<%-- 	<li>\${elCollection.0 } : ${elCollection.0 } [500에러]</li> --%>
		
	</ul>
	<%-- el에서 속성에 접근시 -이 포함되는경우에는 .으로 표현할 수 엇고
	반드시 [를 통해 표현한다. ${header["ueser-agent"]} ok
	$header.user-agent 이건 오류 --%>
	<h2>배열과 리스트 계열 컬렉션 출력</h2>
	<h4>배열</h4>
	<!-- jstl의 forEach태그를 통해 반복출력한다. -->
	<c:forEach items="${elArray }" var="mountain">
		${mountain}&nbsp;
	</c:forEach>
	
      <h4>컬렉션</h4>
      <c:forEach items="${elCollection }" var="mountain">
         ${mountain }&nbsp;
      </c:forEach>
	
	
	<h2>인덱스를 벗어난 경우</h2>
	<!-- 인덱스를 초과하면 예외가 발생해야하지만 el에서는 잡아주므로
		발생하지 않는다. -->
	<ul>
		<li>\${elArray[3] }
			:${elArray[3]} [에러NO, 미출력]</li>
		<li>\${elCollection[3] }
			:${elCollection[3]} [에러NO, 미출력]</li>
	</ul>

	<h2>없는 속성이거나, 속성은 존재하지만 getter가 엇는 경우(자바빈)</h2>
	<%
	MemberDTO member = new MemberDTO("SUNG","1234","성길동",null);
	%>
	<c:set var="eldto" value="<%=member%>"/>
	<ul>
		<li>존재하지 않는 속성 : \${eldto.addr }
		:
		\${eldto.addr} [PropertyNoFoundExceotion발생]
		</li>
		<li>속성은 존재 getter가 없는 경우: ${eldto.id }
		:
		\${eldto.id} [500에러발생]
		</li>
		<li>el변수명이 틀린경우 : \${noeldto.pwd }
		:
		\${noeldto.pwd} [에러no, 미출력]
		</li>
	</ul>
	
	<h2>EL내장객체의 없는 속성으로 접근시</h2>
	<ul>
		<li>\${requestScope.nop }: ${requestScope.nop }
		[Scope계열 내장객체 , 에러no, 미출력 -> 속성명은 개발자 마음대로 정할 수 있기 때문]
		</li>
		<li>\${pageContext.nop }: \${pageContext.nop}
		[컴파일 오류발생-> 내장객체명은 정해져  있기 때문]
		</li>
	</ul>

	<h2>El의 내장객체중 사용자가 정의한 속성에 접근하는 내장객체 및 맵 컬렉션인 경우</h2>
	<%
	 request.setAttribute("reqProperty","리퀘스트 영역저장");
	 Map map = new HashMap();
	 map.put("mapKey", "맵에 저장한 문자열");
	%>
	<c:set var="elMap" value="<%=map%>"/>
	<ul>
		<li>\${requestScope.reqProperty} :
				${requestScope.reqProperty } [정상]</li>
		<li>\${requestScope.REQProperty} :
				${requestScope.REQProperty } [에러no , 미출력]</li>
		<li>\${elMap.mapKey} :
				${elMap.mapKey } [정상]</li>
		<li>\${elMap.MAPKey} :
				${elMap.MAPKey } [에러no 미출력]</li>
	</ul>
	
	<h2>숫자를 0으로 나누면 INFINITE</h2>
	\${10 div 0 } : ${10 div 0 }
	<h2>EL변수에 값 할당시 [톰캣8.0부터는 정상. 이전버전은 에러]</h2>
	<c:set var="number" value="100" scope="request"></c:set>
	
	데이터 저장전 : ${number } <br />
	데이터 저장후 : ${number=1 } <br />
</fieldset>

</body>
</html>