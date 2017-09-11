package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;
import model.BoardManagement;
import model.RoonEnrollClass;

/**
 * Servlet implementation class controller
 */
@WebServlet({"/RegBoard","/RegBoardSubmit","/DetailBoard","/DetailBoardSubmit","/ajaxcomment","/insertRoom","/GuestReg","/GuestRoom","/insertRoomImage"
	,"/GuestRoomImage","/SearchBoard"})
public class controller extends HttpServlet {
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
		
		switch(url){
		case "/RegBoard":
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("RegBoard.jsp");
			break;
		case "/RegBoardSubmit":
			BM = new BoardManagement(request,response);
			BM.execute(1);
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("DetailBoard.jsp");
			break;
		case "/DetailBoardSubmit":
			BM = new BoardManagement(request,response);
			BM.execute(2);
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("DetailBoard.jsp");
			break;
		case "/SearchBoard":
			BM = new BoardManagement(request,response);
			BM.execute(4);
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("BoardList.jsp");
			break;
		case "/DetailBoard":
			BM = new BoardManagement(request,response);
			BM.execute(5);
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("DetailBoard.jsp");
			break;
		case "/insertRoom":
			rc = new RoonEnrollClass(request, response);
			fw = rc.execute(1);
			break;
		case "/GuestReg":
			rc = new RoonEnrollClass(request, response);
			fw = rc.execute(2);
			break;
		case "/GuestRoom" :
			rc = new RoonEnrollClass(request, response);
			fw = rc.execute(3);
			break;
		case "/insertRoomImage" :
			rc = new RoonEnrollClass(request, response);
			fw = rc.execute(4);
			break;
		case "/GuestRoomImage":
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("GuestRoomImage.jsp");
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
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
