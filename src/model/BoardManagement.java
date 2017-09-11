package model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.Board;
import bean.Comment;
import bean.Forward;
import bean.Reservation;
import dao.BoardDao;

public class BoardManagement {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Forward fw = new Forward();
	BoardDao BD = new BoardDao();
	ArrayList<Board> BoardList = null;
	ArrayList<Comment> CommList =null;
	String MakeBoard =  null;
	String MakeRBoard =  null;

	public BoardManagement(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public void execute(int code) {
		switch(code){
		case 1:
			insert();
			break;
		case 2:
			coinsert();
			break;
		case 4:
			SearchBoard();
			break;
		case 5:
			DetailBoard();
			coselect();
			break;
		default:
			break;
		}
	}


	private void coselect() {
		int C_B_Num = Integer.parseInt(request.getParameter("B_Num"));
		BoardDao BD = new BoardDao();
		CommList=BD.coselect(C_B_Num);
		String MakeRBoard = MakeRBoard(CommList);
		request.setAttribute("htmlStr", MakeRBoard);
		BD.close();
	}

	private void coinsert() {
		int C_B_Num = Integer.parseInt(request.getParameter("C_B_NUM"));
		String C_Name = request.getParameter("C_Name");
		int C_PW = Integer.parseInt(request.getParameter("C_PW"));
		String C_Content = request.getParameter("C_Content");
		int C_BC_Num = Integer.parseInt(request.getParameter("C_BC_Num"));
		System.out.println(C_Name+","+C_PW);
		Comment cm = new Comment(C_B_Num,C_Name,C_PW,C_Content,C_BC_Num);
		BoardDao BD = new BoardDao();
		BD.coinsert(cm);
		CommList=BD.coselect(C_B_Num);
		String MakeRBoard = MakeRBoard(CommList);
		request.setAttribute("htmlStr", MakeRBoard);
		request.setAttribute("B_NUM", C_B_Num );
		BD.close();
	}


	private void DetailBoard() {
		HttpSession ss = request.getSession();
		String B_Num = request.getParameter("B_Num");
		BoardDao BD = new BoardDao();
		Board B = new Board();
		B = BD.SelectDetail(B_Num);
		BD.close();
		String blist = makehtml(B);
		request.setAttribute("blist", blist);
		request.setAttribute("B_NUM", B.getB_Num());

	}

	private void SearchBoard() {
		System.out.println("dd");
		String SearchWord = request.getParameter("SearchWord");
		String SelectCategory = request.getParameter("SelectCategory");
		if(SearchWord != null){
			BoardList = BD.SelectList(SearchWord,SelectCategory);
		}else{
			BoardList = BD.SelectList();
		}
		MakeBoard = MakeBoard(BoardList);
		request.setAttribute("BoardList", MakeBoard);
		BD.close();
	}

	private String MakeBoard(ArrayList<Board> BoardList) {
		if(BoardList!=null){
			StringBuilder sb = new StringBuilder();
			for(int i=0; i<BoardList.size(); i++)
			{
				Board B=BoardList.get(i);
				sb.append("<form action='DetailBoard' method='post'><tr><td class='tdCenter'>"+B.getB_Num()+"</td>");
				sb.append("<td><a href='#' onclick=\"ajd('DetailBoard','B_Num="+B.getB_Num()+"','#main')\">"+B.getB_Title()+"</a></td>");
				sb.append("<td>"+B.getB_Name()+"</td>");
				sb.append("<td>"+B.getB_Date().substring(0,10)+"</td>");
				sb.append("<td class='tdCenter'>"+B.getB_ViewCnt()+"</td></tr></form>");
			}
			return sb.toString();
		}
		return null;
	}

	private String MakeRBoard(ArrayList<Comment> commList) {
	      if(commList!=null){
	         StringBuilder sb = new StringBuilder();
	         sb.append("<div><table id='cmt'>");
	         for(int i=0; i<commList.size(); i++)
	         {
	            Comment c=commList.get(i);
	            sb.append("<tr id='C_table'><td id='C_name'>"+c.getC_Name()+"</td>");
	            sb.append("<td id='C_content'>"+c.getC_Content()+"</td");
	            sb.append("<td id='C_date'>"+c.getC_Date()+"</td></tr>");
	         }
	         sb.append("</table></div><br/>");
	         return sb.toString();
	      }
	      return null;
	}

	private void insert() {
		//try {
			/*int size=1*1024*1024; //1MB
			String uploadPath=request.getSession().getServletContext().getRealPath("temp");
			MultipartRequest multi=new MultipartRequest(
					request,
					uploadPath,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);*/
			String B_Name = request.getParameter("B_Name");
			String B_PW = request.getParameter("B_PW");
			String B_Title = request.getParameter("B_Title");
			String B_Content = request.getParameter("B_Content");
			//String B_File = request.getFilesystemName("B_File");
			int B_Category = Integer.parseInt(request.getParameter("B_Category"));
			
			Board Board = new Board(B_Name,B_PW,B_Title,B_Content,B_Category);
			BoardDao BD = new BoardDao();
			BD.insert(Board);
			Board b = null;
			b =	BD.select(B_Name,B_Title);
			BD.close();

			String blist = makehtml(b);
			request.setAttribute("blist", blist);
			request.setAttribute("B_NUM", b.getB_Num());

		//}
			/*catch (IOException e){
			System.out.println("af�");
			e.printStackTrace();
		}*/
	}

	private String makehtml(Board b) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table id='board'>");
		sb.append("<tr><td id='td1'>글제목</td><td id='td2'>"+b.getB_Title()+"</td>");
		sb.append("<td id='td3'>작성일</td><td id='td4'>"+b.getB_Date()+"</td></tr>");
		sb.append("<tr><td id='td5'>글쓴이</td><td id='td6'>"+b.getB_Name()+"</td>");
		sb.append("<td id='td7'>조회수</td><td id='td8'>"+b.getB_ViewCnt()+"</td></tr>");
		sb.append("</table><br/>");
		sb.append("<div class='B_Content'><textarea class='B_Content' name='B_Content' contenteditable='true' maxlength='2000' readonly='readonly' <img src='"+b.getB_File()+"'>>"+b.getB_Content()+"</textarea></div>");
		return sb.toString(); 
	}
}
