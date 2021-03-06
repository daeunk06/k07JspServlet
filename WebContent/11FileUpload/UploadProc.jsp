<%@page import="model.MyFileDAO"%>
<%@page import="model.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
//파일업로드를 위한 multipartRequest객체의 파라미터 준비
/*
	1.파일이 업로드 될 서버의 물리적경로 가져오기
	: 운영체제별로 서버의 물리적 경로는 다르기때문에 파일이 업로드 되는
	정확한 위치를 가져오기 위해 반드시 필요한 정보임.
*/
String saveDirectory = application.getRealPath("/Upload");
/*
 2.업로드 할 파일이 최대용량 설정(바이트단위)
 :만약 파일이 여러개 업로드 된다면 각각의 용량을 합친 용량이 최대 용량이 된다
 ex) 500kb *2 = 1000kb
 */
int maxPostSize = 1024 * 5000;

 //3.인코딩 방식 설정 
String encoding = "UTF-8";

/*
	4.파일 중복처리
	:파일명이 중복되는 경우 자동인덱스를 부여하여 파일명을 수정해준다
	ex) apple.png apple1.png ,...와 같이 인덱스를 부여함
*/
FileRenamePolicy policy = new DefaultFileRenamePolicy();

//전송된 폼값을 저장하기 위한 변수 생성
//멀티파트 객체생성 및 전송된 폼값을 저장하기 위한 변수 선언
MultipartRequest mr = null;
String name = null;//이름
String title = null;//제목
StringBuffer inter = new StringBuffer();//관심사항을 저장함
File oldFile = null;
File newFile = null;
String realFileName = null;

try{
	/*
	1~4번까지 준비한 인자를 이용하여 아래 객체를 생성한다
	객체가 정상적으로 생성디면 파일업로드 완료
	최대용량 혹은 디렉토리 경로가 잘못된경우 예외
	*/
	mr = new MultipartRequest(request, saveDirectory, maxPostSize,
			encoding, policy);
	/*
	 파일외에 폼값을 받아옴 이때 폼값은 request객체가 아닌 
	 MultipartRequest객체를 통해 받아옴
	 */
	name = mr.getParameter("name");
	title = mr.getParameter("title");
	String[] interArr = mr.getParameterValues("inter");
	for(String s : interArr){
		inter.append(s + ",&nbsp;");
	}
	/////////db처리 소스 추가////////
	
	MyFileDTO dto = new MyFileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setInter(inter.toString());
	dto.setOfile(mr.getOriginalFileName("chumFile1"));
	dto.setSfile(realFileName);
	
	MyFileDAO dao = new MyFileDAO(application);
	dao.myfileInsert(dto);
	
	response.sendRedirect("FileList.jsp");
	
	////////추가부분 start ///////////////
	String fileName = mr.getFilesystemName("chumFile1");
	
	String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S")
				.format(new Date());
	int idx = -1;
	
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime + fileName.substring(idx,fileName.length());
	
	oldFile = new File(saveDirectory + oldFile.separator+fileName);
	newFile = new File(saveDirectory+oldFile.separator+realFileName);
	
	oldFile.renameTo(newFile); 
	////////추가부분end /////////////////////
}
catch(Exception e )
{
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head> 
<body>
	<h2>파일 업로드 결과</h2>
	<ul>
		<li>
			작성자 : <%=name %>
		</li>
		<li>
			제목 : <%=title %>
		</li>
		<li>
			관시사항 : <%=inter %>
		</li>
	</ul>
	<h2>첨부파일1</h2>
	<ul>
		<li>원본파일명:
		<%=mr.getOriginalFileName("chumFile1") %></li>
		<li>서버에 저장된 파일명:
		<%=mr.getFilesystemName("chumFile1") %></li>
		<li>컨텐츠 타입:
		<%=mr.getContentType("chumFile1") %></li>
		<li>파일크기:
		<%=(int)Math.ceil(mr.getFile("chumFile1").length() / 1024.0) %>
		kb</li>
		<li>이미지 표현 :
		<img  src="../Upload/<%=mr.getFilesystemName("chumFile1")%>"
		 width="200"/></li>
	</ul>
	
	<h2>첨부파일 2</h2>
	<ul>
		<li>원본파일명:
		<%=mr.getOriginalFileName("chumFile2") %></li>
		<li>서버에 저장된 파일명:
		<%=mr.getFilesystemName("chumFile2") %></li>
		<li>컨텐츠 타입:
		<%=mr.getContentType("chumFile2") %></li>
		<li>파일크기:
		<%=(int)Math.ceil(mr.getFile("chumFile2").length() / 1024.0) %>
		kb</li>
		<li>이미지 표현 :
		<img  src="../Upload/<%=mr.getFilesystemName("chumFile2")%>"
		 width="200"/></li>
	</ul>
	<a href="FileList.jsp">파일목록 바로가기</a>

























</body>
</html>