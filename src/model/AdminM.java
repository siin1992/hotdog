package model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import bean.Forward;
import bean.History;
import bean.Reservation;
import dao.AdminDao;

public class AdminM {
	HttpServletRequest request; 
	HttpServletResponse response;
	private Forward fw;
	AdminDao aDao=new AdminDao();
	History his=new History();
	public AdminM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}
	
	public Forward execute(int code) throws IOException, ServletException {
		switch(code){
		case 1 :
			AdminLogin(); break;
		case 2 :
			AdminLogout(); break;
		case 3 :
			ReservCheck(); break;
		case 4 :
			ReservUpdate(); break;			
		case 6 :
			History(); break;
		default :
			break;
		}
		return fw;
	}

	private void ReservUpdate() {
		String ReservNum = request.getParameter("ReservNum");
		String ReservName = request.getParameter("ReservName");
		String ReservPhone = request.getParameter("ReservPhone");
		String ReservR_Name = request.getParameter("ReservR_Name");
		String ReservIn = request.getParameter("ReservIn");
		String ReservOut = request.getParameter("ReservOut");
		String ReservCheck = request.getParameter("ReservCheck");
		String ReservPay = request.getParameter("ReservPay");
		
		System.out.println(ReservNum+ReservName+ReservPhone+ReservR_Name+ReservIn+ReservOut+ReservCheck+ReservPay);
		request.setAttribute("ReservNum", ReservNum);
		request.setAttribute("ReservName", ReservName);
		request.setAttribute("ReservPhone", ReservPhone);
		request.setAttribute("ReservR_Name", ReservR_Name);
		request.setAttribute("ReservIn", ReservIn);
		request.setAttribute("ReservOut", ReservOut);
		request.setAttribute("ReservCheck", ReservCheck);
		request.setAttribute("ReservPay", ReservPay);
	}

	private void ReservCheck() {
		HttpSession ss=request.getSession();
		ArrayList<Reservation> RList = aDao.ReservList();
		String ReservList = makeReservList(RList);
		ss.setAttribute("ReservList", ReservList);
		fw=new Forward();
	    fw.setRedirect(false);
	    fw.setPath("/ReservCheck.jsp");
	}

	private String makeReservList(ArrayList<Reservation> RList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<div class='ReservCheck'><h3><예약정보 리스트></h3><br/><br/><table><tr id='tr01'><td id='td01'>예약번호</td>"
				+ "<td id='td02'>예약자명</td><td id='td03'>전화번호</td><td id='td04'>방이름</td>"
				+ "<td id='td05'>입실일</td><td id='td06'>퇴실일</td><td id='td07'>입금상태</td>"
				+ "<td id='td08'>결제금액</td><td id='td09'>사용인원</td><td id='td10'>견수</td><td id='td11'>입금확인</td><td id='td12'>예약수정</td><td id='td13'>예약삭제</td></tr>");
		
		for(int i=0; i<RList.size(); i++)
		{
			Reservation Reserv=RList.get(i);
			
			sb.append("<form action='UpdateForm' method='post'><tr><td><div name='ReservNum'>"+Reserv.getReservNum()+"</td>");
			sb.append("<td><div name='ReservName'>"+Reserv.getReservName()+"</div></td>");
			sb.append("<td><div name='getReservPhone'>"+Reserv.getReservPhone()+"</div></td>");
			sb.append("<td><div name='getReservR_Name'>"+Reserv.getReservR_Name()+"</div></td>");
			sb.append("<td><div name='getReservIn'>"+Reserv.getReservIn()+"</div></td>");
			sb.append("<td><div name='getReservOut'>"+Reserv.getReservOut()+"</div></td>");
			sb.append("<td><div name='getReservCheck'>"+Reserv.getReservCheck()+"</div></td>");
			sb.append("<td><div name='getReservPay'>"+Reserv.getReservPay()+"</div></td>");
			sb.append("<td><div name='getReservPay'>"+Reserv.getRQ_qty_P()+"</div></td>");
			sb.append("<td><div name='getReservPay'>"+Reserv.getRQ_qty_D()+"</div></td>");
			if(Reserv.getReservCheck().equals("미납")){
				sb.append("<td><a href='Confirmpay1.jsp?id="+Reserv.getReservNum()+"'><button>입금완료</button></a></td>");
			}else{
				sb.append("<td><a href='Confirmpay2.jsp?id="+Reserv.getReservNum()+"'><button>미납</button></a></td>");
			}
			sb.append("<td><a href='ReservUpdate.jsp?id="+Reserv.getReservNum()+"'><button>수정하기</button></a></td>");
			sb.append("<td><a href='ReservDelete.jsp?id="+Reserv.getReservNum()+"'><button>삭제하기</button></a></td></tr></form>");
			//sb.append("<td><a href='javascript:Aj("+"'ReservUpdate.jsp?id="+Reserv.getReservNum()+"')'<button>삭제하기</button></a></td></tr>");
		}
		sb.append("</table></div>");
		
		return sb.toString();
	}

	private void History() throws ServletException, IOException {
		HttpSession ss=request.getSession();
		String id=(String) ss.getAttribute("id");
      ArrayList<History> lists= aDao.list();
      String result=makeHtml(lists);
      request.setAttribute("result", result);
      fw=new Forward();
      fw.setRedirect(false);
      fw.setPath("/History.jsp");
	
}
 public String makeHtml(ArrayList<History> lists) {
	   StringBuilder mb=new StringBuilder();
		for(int i=0; i<lists.size();i++)
		{
			
			History his=lists.get(i);
			mb.append("<tr><td>"+his.getH_ip()+"</td>");
			mb.append("<td>"+his.getH_work().substring(8)+"</td>");
			mb.append("<td>"+his.getH_date()+"</td></tr>");
		}
		return mb.toString();
	}

	private void AdminLogout() {
		HttpSession ss=request.getSession();
		String id=(String) ss.getAttribute("id");
		his.setH_ip(request.getRemoteHost());
		his.setH_work(request.getRequestURI());
		aDao.insertHistory(his);
		request.getSession().invalidate();
		fw=new Forward();
		fw.setRedirect(false);
		fw.setPath("/Index");
	}

	private void AdminLogin() throws IOException, ServletException {
		String id=request.getParameter("id");
		System.out.println(id);
		String pw=request.getParameter("pw");
		boolean success = aDao.login(id,pw);
		String page = "AdminLogin.jsp";
		String msg = "로그인 실패";
		System.out.println(success);
		if(success == true){
			request.getSession().setAttribute("id", id);
			his.setH_ip(request.getRemoteHost());
			his.setH_work(request.getRequestURI());
			aDao.insertHistory(his);
			page = "AdminMain.jsp";
		}
		request.setAttribute("msg", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request,response);
	}
}
