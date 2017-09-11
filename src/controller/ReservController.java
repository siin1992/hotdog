package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;
import model.BoardManagement;
import model.ReservManagement;
import model.RoonEnrollClass;

/**
 * Servlet implementation class ReservController
 */
@WebServlet({"/CheckReserv","/DetailReserv","/Reservinsert","/ReservCheckUser","/ReservDelete","/Reservupdate"})
public class ReservController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String conPath=request.getContextPath();
		int len=conPath.length();
		String uri=request.getRequestURI();
		String url=uri.substring(len);
		System.out.println("url="+url);
		String path=null;
		Forward fw=null;
		String htmlStr=null;
		BoardManagement BM =null;
		RoonEnrollClass rc = null;
		ReservManagement RM = null;
		switch(url){
		case "/CheckReserv":		
			RM = new ReservManagement(request,response);
			RM.execute(2);
			break;
		case "/DetailReserv":		
			RM = new ReservManagement(request,response);
			fw = RM.execute(3);
			break;
		case "/Reservinsert":		
			RM = new ReservManagement(request,response);
			fw = RM.execute(4);
			break;
		case "/ReservCheckUser":		
			RM = new ReservManagement(request,response);
			fw = RM.execute(5);
			break;
		case "/ReservDelete":		
			RM = new ReservManagement(request,response);
			fw = RM.execute(6);
			break;
		case "/Reservupdate":		
			RM = new ReservManagement(request,response);
			fw = RM.execute(7);
			break;
		
		default :
			break;
		}
		if(fw!=null){
			if(fw.isRedirect()){
				System.out.println("path="+fw.getPath());
				response.sendRedirect(fw.getPath());
			}else{
				System.out.println("path="+fw.getPath());
				RequestDispatcher dis=
						request.getRequestDispatcher(fw.getPath());
				dis.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
