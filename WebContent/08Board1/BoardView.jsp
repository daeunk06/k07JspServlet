<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터로 전송된 게시물의 일련번호를 받음
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);

//조회수를 업데이트하여 visitcount컬럼을 1증가시킴
dao.updateVisitCount(num);

//일련번호에 해당하는 게시물을 DTO객체로 반환함
BbsDTO dto = dao.selectView(num);

dao.close(); 

%>
<!-- 회원제 게시판이라 할지라도 상세보기는 로그인 없이 확인할 수 있어야 한다
특수한 경우에만 제한을 건다 비밀이나 1:1문의 등.. -->
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
<div class="container">
	<div class="row">		
		<jsp:include page="../common/boardTop.jsp"/>
	</div>
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp"></jsp:include>
		<div class="col-9 pt-3">
		<!-- ###게시판의 body 부분 start -->
		
			<div class="row mt-3 mr-1">
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center table-active align-middle">아이디</th>
						<td><%=dto.getId() %></td>
						<th class="text-center table-active align-middle">작성일</th>
						<td><%=dto.getPostDate() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td><%=dto.getName() %></td>
						<th class="text-center table-active align-middle">조회수</th>
						<td><%=dto.getVisitcount() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							<!-- textarea에 입력시 엔터키를 사용하면 \r\n으로 저장된다. 이를 브라우저 상에 출력할땐
							<br/>태그로 변경한후 출력한다. -->
							<%=dto.getTitle() %>
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							<%=dto.getContent().replace("\r\n", "<br/>") %>	 
						</td>
					</tr>					 
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col-6">
					<button type="button" class="btn btn-secondary"
						onclick="';">수정하기</button>
					<button type="button" class="btn btn-success"
						onclick="">삭제하기</button>
				</div>
				<div class="col-6 text-right pr-5">					
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
				</div>	
			</div>

			
			
				
		<!--  ###게시판의 body 부분 end   -->
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp"></jsp:include>
</div>
</body>
</html>
