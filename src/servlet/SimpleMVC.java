package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;


  public class SimpleMVC extends HttpServlet {
  
	  /*
	   클라이언트의 요청이 get이든post이든 하나의 메소드에 처리하기 위해 
	   porcessReqeust()메소드를 만들었다.
	   */
	  @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req,resp);
	}
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 processRequest(req,resp);
		
	}
	 
	 /*
	 doget()혹은 doPost()의 요청을 그대로 전달받기 위해서는 아래와 같이
	 메소드를 정의해야한다, request,response객체를 매개변수로 사용하고
	 두가지 예외를 반드시 처리해야한다.(서블릿 제작시 규칙)
	  */
	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");
		Object resultObj = null;
		//파라미터 요청을 분석한다.
		if(type==null) {
			resultObj = "파라미터 없움";
		}
		//데이터 베이스와 연결하기 위해 모델을 호출함
		else if(type.equals("greeting")) {
			//서블릿 클ㄹ래스에서 어플리케이션 내장객체를 사용하기 우해
			//getServletContext()를 사용해 얻어온다.
			ServletContext application = this.getServletContext();
			String drv = 
					application.getInitParameter("JDBCDriver");
			String url =
					application.getInitParameter("ConnectionURL");
		
			MemberDAO dao = new MemberDAO(drv,url);
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			boolean isMember = dao.isMember(id, pw);
					
			if(isMember==true) {
				resultObj = "회원님 하윙~";
			}
			else {
				resultObj = "넌 회원이 아니시군ㅡ_ㅡ";
			}
		}
		else if(type.equals("date")) {
			resultObj = new java.util.Date();
		}
		else {
			resultObj = "헐~?";
		}
		req.setAttribute("result", resultObj);
		
		RequestDispatcher dis =
				req.getRequestDispatcher("/13Servlet/SimpleMVC.jsp");
		dis.forward(req, resp);
				
	
	}
	  
	  
  }
 





































