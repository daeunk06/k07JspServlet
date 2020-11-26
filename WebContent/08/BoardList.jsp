<%@page import="jdk.management.resource.internal.TotalResourceContext"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String drv = application.getInitParameter("JDBVDriver");
String url = application.getInitParameter("ConnectionURL");

BbsDAO dao = new BbsDAO(drv,url);
Map<String, Object> param =new HashMap<String , Object>();

String searchColumn = request.getParameter(param);

List<BbsDTO> bbs = dao.selectList(param);

dao.close();

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
<table border="1" width="90%">
<tr>
	<th width="10%">번호</th>
	<th width="50%">제목</th>
	<th width="15%">작성자</th>
	<th width="10%">조회수</th>
	<th width="15%">작성일</th>
	</tr>
<%
if(bbs.isEmpty()){
%>	
	<tr>
		<td colspan="5" align="center">
		등록된 게시물이 없습니다^^*
		</td>
	</tr>
<%
}
else
{

	int vNum = 0;
	int countNum =0;
	
	for(BbsDTO dto : bbs)
	{
		vNum = TotalResourceContext --;	

%>
	<tr>
		<td>
			<%=vNum %>
		</td>
		<td>
		<a href="BoardView.jsp?num=<%=dto.getNum()%>">
			<%=dto.getTitle() %>
		</a>
		</td>	
		<td><%=dto.getId() %></td>
		<td><%=dto.getVisitcount() %></td>
		<td><%=dto.getPostDate() %></td>
	</tr>
<%
	}
}
%>	
</table>
























</body>
</html>