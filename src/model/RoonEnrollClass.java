package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.Forward;
import bean.Room;
import bean.RoomImage;
import dao.RoomDao;
import dao.RoomImageDao;

public class RoonEnrollClass {
	HttpServletRequest request;
	HttpServletResponse response;
	Forward fw;	//포워딩 주소 
	//HttpSession ss;
	Room room = new Room();
	RoomImage roomimage;
	RoomDao rDao;
	RoomImageDao RIDao;

	public RoonEnrollClass(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
		HttpSession ss = request.getSession();
		String id;
	}
	//현재 클래스의 제어 메소드
	public Forward execute(int code) {
		switch(code){
		case 1:
			insertRoom(); 
			break; //객실등록
		case 2:
			GuestReg(); 
			break;
		case 3:
			getRoomList();
			break;
		case 4:
			insertRoomImage();
		default:
		}
		return fw;
	}

	private void insertRoomImage() {
		RIDao = new RoomImageDao();

		try {
			int size = 10 * 1024 * 1024;	//1MB
			String uploadPath = request.getRealPath("upload");	//업로드 폴더 만듬.
			//String uploadPath = request.getSession().getServletContext().getRealPath("test");
			MultipartRequest multi = new MultipartRequest(
					request, 
					uploadPath, //업로드 경로
					size, 	//업로드 이미지 최대크기
					"UTF-8", 
					new DefaultFileRenamePolicy()
					);
			String name = multi.getParameter("RI_Name");
			System.out.println(name);
			String image = multi.getFilesystemName("RI_Path");
	
			RoomImage roomimg = new RoomImage(name,image);
			RIDao = new RoomImageDao();
			fw = new Forward();
			if(RIDao.insertRoomImage(roomimg)){
				System.out.println("객실사진 등록 성공");
			}else{
				System.out.println("객실사진 등록 실패");
			}
			fw.setPath("AdminMain.jsp");
			fw.setRedirect(false);
		} catch (IOException e) {
			System.out.println("업로드 에러");
			e.printStackTrace();
		}

	}
	private void GuestReg() {
		fw=new Forward();
		fw.setRedirect(true);
		fw.setPath("GuestReg.jsp");
	}
	
	private void insertRoom() {
		rDao = new RoomDao();

		try {
			int size = 10 * 1024 * 1024;	//1MB
			String uploadPath = request.getRealPath("upload");	//업로드 폴더 만듬.
			//String uploadPath = request.getSession().getServletContext().getRealPath("test");
			MultipartRequest multi = new MultipartRequest(
					request, 
					uploadPath, //업로드 경로
					size, 	//업로드 이미지 최대크기
					"UTF-8", 
					new DefaultFileRenamePolicy()
					);
			String name = multi.getParameter("R_Name");
			int price = Integer.parseInt(multi.getParameter("R_Price"));
			String image =multi.getFilesystemName("R_Image");
			int limit = Integer.parseInt(multi.getParameter("R_Limit"));
			String exp = multi.getParameter("R_Exp");

			Room room = new Room(name, price, image, limit, exp);
			rDao = new RoomDao();
			fw = new Forward();
			if(rDao.insertRoom(room)){
				System.out.println("객실 등록 성공");
			}else{
				System.out.println("객실 등록 실패");
			}
			fw.setPath("AdminMain.jsp");
			fw.setRedirect(false);
		} catch (IOException e) {
			System.out.println("업로드 에러");
			e.printStackTrace();
		}

	}
	private void getRoomList() {
		fw = new Forward();
		rDao = new RoomDao();
		HttpSession ss = request.getSession();
		List<Room> rList = null;//arrayList나 linkedList 가져오고 싶을때 부모인 list를 가져온다.
		rList = rDao.roomList();
		String html = null;
		if(rList != null){
			html = makeHtml_rList(rList);
			request.setAttribute("rList", html);
		}
			fw.setPath("GuestRoom.jsp");
			fw.setRedirect(false);
		rDao.close();
	}
	
	private String makeHtml_rList(List<Room> rList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<div id='guestRoom'>");
		for(int i = 0; i < rList.size(); i++){
			Room r = rList.get(i);
				sb.append("<table class = 'ta1' id='"+i+"' border='1'>");
				sb.append("<tr><td colspan='2'>"+r.getR_Name()+"</td></tr>");
				sb.append("<tr><td colspan='2'><a href='RoomDetail.jsp?name="+r.getR_Name()+"'><img src='upload" +"/" + r.getR_Image() + "' width = '550', height = '400'></a>"+"</td></tr>");
				sb.append("<tr><td>"+"1박기준 금액 : " + r.getR_Price()+"원"+"</td><td>"+"인원(기준:2명/최대:10명) : "+r.getR_Limit()+"명"+"</td></tr>");
				sb.append("<tr><td colspan='2'>"+r.getR_Exp()+"</td></tr>");
				sb.append("<tr><td colspan='2'><a href='RoomDelete.jsp?name="+r.getR_Name()+"'><button>삭제</button></a></td></tr>"); 
				sb.append("</table>");
		}
		sb.append("</div>");
	return sb.toString();	
	}
}

