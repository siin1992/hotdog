package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;
import dao.AdminDao;
import model.BoardManagement;
import model.ReservManagement;

@WebServlet({"/Introduce","/Map","/BoardList","/SelectReserv","/Calendar","/Reservation","/Facility"})
public class MovingController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doProcess(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String conPath=request.getContextPath();
		int len = conPath.length();
		String uri=request.getRequestURI();
		String url=uri.substring(len);
		System.out.println("url="+url);
		String path = null;
		Forward fw = null;
		AdminDao aDao = null;
		BoardManagement BM = null;
		ReservManagement RM = null;
		switch(url){
		case "/Introduce" :
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Introduce.jsp");
			break;
		case "/Map" :
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Map.jsp");
			break;
		case "/BoardList":
			BM = new BoardManagement(request,response);
			BM.execute(3);
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("BoardList.jsp");
			break;
		case "/SelectReserv" :
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("SelectReserv.jsp");
			break;
		case "/Calendar" :
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Calendar.jsp");
			RM = new ReservManagement(request,response);
			RM.execute(1);
			break;
		case "/Reservation" :
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Reservation.jsp");
			break;
		case "/Facility" :
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Facility.jsp");
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