package controller;

import java.io.IOException;   

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Forward;
import bean.History;
import dao.AdminDao;
import model.AdminM;

/**
 * Servlet implementation class AdminController
 */
@WebServlet({"/Login","/Logout","/Index","/ReservationCheck","/GuestManagement",
	"/Board","/History","/HistoryView","/UpdateForm"})
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void doStart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
		String id;
		History his=new History();
		AdminM am=new AdminM(request,response);
		HttpSession ss=request.getSession();
		switch(url){
		case "/Login" :
			fw=am.execute(1);
			break;
		case "/Logout" :
			fw=am.execute(2);
			break;
		case "/Index" :
			id=(String) ss.getAttribute("id");
			his.setH_ip(request.getRemoteHost());
			his.setH_work(request.getRequestURI());
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Index.jsp");
			break;
		case "/ReservationCheck" :
			if(ss.getAttribute("id")!=null){
				fw=new Forward();
				fw.setRedirect(false);
				fw.setPath("ReservCheck.jsp");
				his.setH_ip(request.getRemoteHost());
				his.setH_work(request.getRequestURI());
				aDao = new AdminDao();
				aDao.insertHistory(his);
				fw=am.execute(3);
			}
			break;
		case "/UpdateForm" :
			if(ss.getAttribute("id")!=null){
				fw=new Forward();
				fw.setRedirect(false);
				fw.setPath("ReservCheck.jsp");
				his.setH_ip(request.getRemoteHost());
				his.setH_work(request.getRequestURI());
				aDao = new AdminDao();
				aDao.insertHistory(his);
				fw=am.execute(4);
			}
			break;
		case "/GuestManagement" :
			if(ss.getAttribute("id")!=null){
				fw=new Forward();
				fw.setRedirect(false);
				fw.setPath("/GuestRoom");
				his.setH_ip(request.getRemoteHost());
				his.setH_work(request.getRequestURI());
				aDao = new AdminDao();
				aDao.insertHistory(his);
			}
			break;
		case "/Board" :
			if(ss.getAttribute("id")!=null){
				fw=new Forward();
				fw.setRedirect(false);
				fw.setPath("SearchBoard.jsp");
				his.setH_ip(request.getRemoteHost());
				his.setH_work(request.getRequestURI());
				aDao = new AdminDao();
				aDao.insertHistory(his);
			}
			break;
		case "/History" :
			if(ss.getAttribute("id")!=null){
				his.setH_ip(request.getRemoteHost());
				his.setH_work(request.getRequestURI());
				aDao = new AdminDao();
				aDao.insertHistory(his);
				fw=am.execute(6);
			}
			break;
		default:
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
		doStart(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doStart(request,response);	
	}

}
