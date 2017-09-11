package model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Board;
import bean.Forward;
import bean.ReservQTY;
import bean.Reservation;
import bean.Room;
import dao.ReservDao;

public class ReservManagement {
	private HttpServletRequest request;
	private HttpServletResponse response;
	Forward fw=null;
	public ReservManagement(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public Forward execute(int code) {
		switch(code){
		case 1:
			GetReservList();
			break;
		case 2:
			GetRoomList();
			break;
		case 3:
			ReservReg();
			break;
		case 4:
			reservinsert();
			break;
		case 5:
			GetUserReserv();
			break;
		case 6:
			DeleteUserReserv();
			break;
		case 7:
			UpdateUserReserv();
			break;
		default:
			break;
		}
		return fw;

	}
	private void UpdateUserReserv() {
		int reservnum = Integer.parseInt(request.getParameter("reservnum"));
		String name = request.getParameter("name");
		String phonenum = request.getParameter("phonenum");
		int rn = Integer.parseInt(request.getParameter("rname"));
		String rstart = request.getParameter("rstart");
		String rend = request.getParameter("rend");
		int totprice = Integer.parseInt(request.getParameter("totprice"));
		int totdog = Integer.parseInt(request.getParameter("totdog"));
		int totpeople = Integer.parseInt(request.getParameter("totpeople"));
		ReservDao RD = new ReservDao();
		Room R = new Room();
		R=RD.rooname(rn);
		String rname = R.getR_Name();
		RD.reservupdate_qty(reservnum,totdog,totpeople);
		RD.reservupdate(reservnum, name, phonenum, rname, rstart, rend,totprice);
		fw=new Forward();
		fw.setRedirect(false);
		fw.setPath("AdminMain.jsp");
	}

	private void DeleteUserReserv() {
		String Num = request.getParameter("ReservNum");
		System.out.println(Num);
		ReservDao RD = new ReservDao();
		int result = RD.DeleteReserv(Num);
		if(result==0){
			request.setAttribute("msg", "예약 취소 성공.");
		}else{
			request.setAttribute("msg", "예약 취소 실패.");
		}
		System.out.println("실행");
		fw=new Forward();
		fw.setRedirect(false);
		fw.setPath("Index.jsp");
	}

	private void GetUserReserv() {
		Reservation R = null;
		ReservQTY RQ = null;
		HttpSession ss = request.getSession();
		String Name = request.getParameter("Name");
		request.setAttribute("UserName", Name);
		String Phone = request.getParameter("Phone");
		ReservDao RD = new ReservDao();
		ArrayList<Reservation> Rlist=new ArrayList<Reservation>();
		Rlist=RD.ReservCheckUser(Name,Phone);
		System.out.println(Rlist.size());
		if(Rlist.size() == 0){
			try
			{
				response.getWriter().write("예약한 내용이 없습니다.");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			/*fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("Index.jsp");*/
		}else{
			String MakeUserReservList = MakeUserReservList(Rlist);
			System.out.println(MakeUserReservList);
			ss.setAttribute("MakeUserReservList", MakeUserReservList);
			fw=new Forward();
			fw.setRedirect(false);
			fw.setPath("ReservCheckUser.jsp");
		}
	}

	private String MakeUserReservList(ArrayList<Reservation> rlist) {
		StringBuilder SB = new StringBuilder();
		SB.append("<div id='ReservList'><table>");
		SB.append("<tr><td>예약번호</td><td>예약자명</td><td>전화번호</td><td>방이름</td><td>입실일</td><td>퇴실일</td>");
		SB.append("<td>사용인원</td><td>견수</td><td>입금상태</td><td>결제금액</td><td>예약취소</td></tr>");
		for(int i=0;i<rlist.size();i++){
			Reservation R =rlist.get(i);
			SB.append("<tr><td name='ReservNum'>"+R.getReservNum()+"</td><td>"+R.getReservName()+"</td><td>"+R.getReservPhone()+"</td><td>"+R.getReservR_Name()+"</td>"
					+ "<td>"+R.getReservIn()+"</td><td>"+R.getReservOut()+"</td><td>"+R.getRQ_qty_P()+"</td><td>"+R.getRQ_qty_D()+"</td>"
					+ "<td>"+R.getReservCheck()+"</td><td>"+R.getReservPay()+"</td>");
			if(R.getReservCheck().equals("대기"))
				SB.append("<td><button id='ReservDelete'>취소</button></td></tr>");
			else
				SB.append("<td>-</td></tr>");
		}
		SB.append("</table></div>");
		return SB.toString();
	}

	private void reservinsert() {
		String name=request.getParameter("name");
		String phonenum=request.getParameter("phonenum");
		String roomname=request.getParameter("roomname");
		String roomin=request.getParameter("roomin");
		String roomout=request.getParameter("roomout");
		int totprice=Integer.parseInt(request.getParameter("totprice"));
		ReservDao RD = new ReservDao();
		RD.reservinsert(name,phonenum,roomname,roomin,roomout,totprice);
		Reservation r=new Reservation();
		r=RD.reservselect(name,phonenum,roomname,roomin,roomout,totprice);
		int rnum=r.getReservNum();
		int totdog=Integer.parseInt(request.getParameter("totdog"));
		int totpeople=Integer.parseInt(request.getParameter("totpeople"));
		RD.reservqtyinsert(totdog,rnum,totpeople);
		fw=new Forward();
		fw.setRedirect(false);
		fw.setPath("Index.jsp");
	}

	private void ReservReg() {
		String rname=request.getParameter("rname");
		String rprice=request.getParameter("rprice");
		HttpSession ss=request.getSession();
		ss.setAttribute("rname", rname);
		ss.setAttribute("rprice", rprice);
		String Rlist = makeRlist(rname,rprice);
		request.setAttribute("roominfo",Rlist);
		System.out.println(Rlist);
		fw=new Forward();
		fw.setRedirect(false);
		fw.setPath("DetailReserv.jsp");
	}

	private String makeRlist(String rname,String rprice) {
		StringBuilder SB = new StringBuilder(); 
		SB.append("<div>객실정보</div>");
		SB.append("<div><table><tr><td>객실명</td><td>최대인원</td><td>객실금액</td></tr>");
		SB.append("<tr><td>"+rname+"</td><td>4명</td><td>"+rprice+"</td></tr></table></div></br>");
		return SB.toString();
	}

	/*	private String makePD() {
		StringBuilder SB = new StringBuilder(); 
		SB.append("<div>견종 및 인원정보</div>");
		SB.append("<div><table><tr><td>견종분류</td><td>단위금액</td><td>견수</td></tr>");
		SB.append("<tr><td>소형견</td><td>10000</td><td><select name='dog1'><option value=''>마릿수</option>"
				+ "<option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option></select></td></tr>");
		SB.append("<tr><td>중형견</td><td>15000</td><td><select name='dog2'><option value=''>마릿수</option>"
				+ "<option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option></select></td></tr>");
		SB.append("<tr><td>대형견</td><td>20000</td><td><select name='dog3'><option value=''>마릿수</option>"
				+ "<option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option></select></td></tr>");
		SB.append("</table></div></br>");
		SB.append("<div><table><tr><td>연령분류</td><td>단위금액</td><td>인원수</td></tr>");
		SB.append("<tr><td>소인</td><td>10000</td><td><select name='people1'><option value=''>인원수</option>"
				+ "<option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option></select></td></tr>");
		SB.append("<tr><td>대인</td><td>20000</td><td><select name='people2'><option value=''>인원수</option>"
				+ "<option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option></select></td></tr>");
		SB.append("</table></div></br>");
		SB.append("<div><table><tr><td>견수</td><td><input type='text' name='totdog' readonly/></td></tr>");
		SB.append("<tr><td>인원수</td><td><input type='text' name='totpeople' readonly/></td></tr>");
		SB.append("<tr><td>금액합계</td><td><input type='text' name='totpay' readonly/></td></tr></table></div></br>");
		return SB.toString();
	}*/

	private void GetReservList() {									//case 1:
		ReservDao RD = new ReservDao();
		List<Reservation> ReservList = RD.getReservList();
		String MakeReservList = MakeReservList(ReservList);
		request.setAttribute("ReservList", MakeReservList);
		RD.close();
	}

	private String MakeReservList(List<Reservation> ReservList) {	//case 1: MakeReserv
		StringBuilder SB = new StringBuilder();
		for(int i=0; i<ReservList.size(); i++){
			Reservation R =ReservList.get(i);
			if(R.getReservStatus()==0){
			SB.append("{ "
					+ "title : '"+R.getReservR_Name()+" "+R.getReservCheck()+" "+R.getReservName()+"'"
					+ ", start : '"+R.getReservIn()+"'"
					+ ", end : '"+R.getReservOut()+"'");
					if(R.getReservR_Name().equals("A동")){
						SB.append(", color : 'red'"
								+ ", textColor : 'white'");
					}else if(R.getReservR_Name().equals("B동")){
						SB.append(", color : 'blue'"
								+ ", textColor : 'white'");
					}else if(R.getReservR_Name().equals("C동")){
						SB.append(", color : 'yellow'"
							+ ", textColor : 'green'");
					}
					else if(R.getReservR_Name().equals("D동")){
						SB.append(", color : 'pink'"
							+ ", textColor : 'white'");
					}
					SB.append("},");
			}
		}
		return SB.toString();
	}

	private void GetRoomList() {									//case 2: 
		String ReservIn = request.getParameter("rstart");
		String ReservOut = request.getParameter("rend");
		int Rday = Integer.parseInt(request.getParameter("rday"));
		System.out.println(Rday);
		HttpSession ss=request.getSession();
		ss.setAttribute("ReservIn", ReservIn);
		ss.setAttribute("ReservOut", ReservOut);
		ReservDao RD = new ReservDao();
		List<Reservation> RervationList = new ArrayList<Reservation>();
		RervationList = RD.CheckReserv(ReservIn,ReservOut);
		if(RervationList==null){
			request.setAttribute("RoomList","예약가능한 방이 없습니다.");
		}else{
			String MakeRoomList = MakeRoomList(RervationList,Rday);
			/*request.setAttribute("RoomList", MakeRoomList);*/

			try {
				response.getWriter().write(MakeRoomList);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		RD.close();
	}

	private String MakeRoomList(List<Reservation> RervationList,int Rday) {	//case 2: MakeRoomList
		System.out.println(Rday);
		StringBuilder SB = new StringBuilder(); 
		for(int i=0;i<RervationList.size();i++){
			Reservation R =RervationList.get(i);
			int R_Price = R.getReservR_Price()*Rday;
			SB.append("<div><input type='text' name=rname value='"+R.getReservR_Name()+"'style='display:none'>"+R.getReservR_Name()+"</br>"
					+ "<input type='text' name=rprice value='"+R.getReservR_Price()+"'style='display:none'>"+R_Price+"원<br/><button id='room' onclick=\"ajd('DetailReserv','rname="+R.getReservR_Name()+"&rprice="+R.getReservR_Price()*Rday+"','#main')\">지금 예약하기</button></div>");
		}
		return SB.toString();
	}





}
