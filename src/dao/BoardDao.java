package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import bean.Board;
import bean.Comment;

public class BoardDao {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<Board> BoardList = null;
	ArrayList<Comment> commList =null;
	DataSource ds;
	HttpServletRequest request; 
	HttpServletResponse response;

	public BoardDao(){
		try{
			Context init=new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			con=ds.getConnection();
			System.out.println("연결 성공");
		}catch(Exception ex){
			System.out.println("연결 실패");
		}
	}
	public void close(){  //而ㅻ꽖�뀡���뿉 而ㅻ꽖�뀡 諛섎궔
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();  //Connection 占쏙옙체占쏙옙 占쏙옙占쏙옙클占쏙옙 占쏙옙환
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insert(Board board) {

		try {
			String sql="INSERT INTO BOARD VALUES(?,?,?,?,?,DEFAULT,?,SEQ_B_NUM.NEXTVAL,0)";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, board.getB_Name());
			pstmt.setNString(2, board.getB_PW());
			pstmt.setNString(3, board.getB_Title());
			pstmt.setNString(4, board.getB_Content());
			pstmt.setNString(5, board.getB_File());
			pstmt.setInt(6, board.getB_Category());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("BoardInsert SQL 오류");
			e.printStackTrace();
		}

	}
	public void detail(Board board) {

		try {
			String sql="SELECT * FROM BOARD WHERE B_NAME=? AND B_PW=? AND B_TITLE=? AND B_CONTENT=? AND B_FILE=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, board.getB_Name());
			pstmt.setNString(2, board.getB_PW());
			pstmt.setNString(3, board.getB_Title());
			pstmt.setNString(4, board.getB_Content());
			pstmt.setNString(5, board.getB_File());
			rs=pstmt.executeQuery();
			Board Board = null;
			List<Board> BoardList = new ArrayList<Board>();
			while(rs.next()){
				Board = new Board();
				Board.setB_Name(rs.getNString("B_Name"));
				Board.setB_PW(rs.getNString("B_PW"));
				Board.setB_Title(rs.getNString("B_Title"));
				Board.setB_Content(rs.getNString("B_Content"));
				Board.setB_File(rs.getNString("B_File"));
				Board.setB_Date(rs.getNString("B_DATE"));
				Board.setB_Num(rs.getInt("B_NUM"));
				Board.setB_ViewCnt(rs.getInt("B_VIEWCNT"));

				BoardList.add(Board);
				System.out.println("Select성공");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public Board select(String B_Name, String B_Title) {
		Board b=null;
		try {
			String sql="select * from board where B_Name=? and B_Title=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, B_Name);
			pstmt.setNString(2, B_Title);
			rs=pstmt.executeQuery();
			if(rs.next()){
				System.out.println("성공");
				b=new Board();
				b.setB_Title(rs.getNString("B_TITLE"));
				b.setB_Name(rs.getNString("B_Name"));
				b.setB_Content(rs.getNString("B_CONTENT"));
				b.setB_Date(rs.getNString("B_DATE"));
				b.setB_ViewCnt(rs.getInt("B_VIEWCNT"));
				b.setB_Category(rs.getInt("B_CATEGORY"));
				b.setB_Num(rs.getInt("B_NUM"));
			}
		} catch (SQLException e) {
			System.out.println("오류");
			e.printStackTrace();
		}
		return b;
	}
	public void coinsert(Comment cm) {

		try {
			String sql="INSERT INTO B_COMMENT(C_B_NUM,C_Name,C_PW,C_Content,C_BC_Num) VALUES(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cm.getC_B_Num());
			pstmt.setNString(2, cm.getC_Name());
			pstmt.setInt(3, cm.getC_PW());
			pstmt.setNString(4, cm.getC_Content());
			pstmt.setInt(5, cm.getC_BC_Num());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("coInsert SQL 오류");
			e.printStackTrace();
		}

	}
	public ArrayList<Comment> coselect(int c_B_Num) {
		Comment c=null;
		commList = new ArrayList<Comment>();
		String sql="SELECT * FROM B_COMMENT WHERE C_B_NUM=? ORDER BY C_DATE";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_B_Num);
			rs=pstmt.executeQuery();
			while(rs.next()){
				c=new Comment();
				c.setC_Name(rs.getNString("C_NAME"));
				c.setC_Content(rs.getNString("C_CONTENT"));;
				c.setC_Date(rs.getNString("C_DATE"));
				commList.add(c);
			}
			return commList;
		} catch (SQLException e) {
			System.out.println("오류");
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Board> SelectList(String searchWord, String selectCategory) {
		System.out.println(selectCategory +"+"+ searchWord);
		Board sb=null;
		BoardList = new ArrayList<Board>();
		if(selectCategory.equals("B_TITLE")){
		String sql="SELECT B_NUM,B_TITLE,B_NAME,B_DATE,B_VIEWCNT "
				+ "FROM BOARD "
				+ "WHERE B_TITLE "
				+ "LIKE ? "
				+ "ORDER BY B_NUM DESC";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, "%"+searchWord+"%");
			rs=pstmt.executeQuery();
			while(rs.next()){
				sb = new Board();
				sb.setB_Num(rs.getInt("B_NUM"));
				sb.setB_Title(rs.getNString("B_TITLE"));
				sb.setB_Name(rs.getNString("B_NAME"));
				sb.setB_Date(rs.getNString("B_DATE"));
				sb.setB_ViewCnt(rs.getInt("B_VIEWCNT"));
				System.out.println(rs.getInt("B_NUM"));
				BoardList.add(sb);
			}
			System.out.println(rs);
			System.out.println(rs.next());
			System.out.println(BoardList);
			return BoardList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		}else{
			String sql="SELECT B_NUM,B_TITLE,B_NAME,B_DATE,B_VIEWCNT "
					+ "FROM BOARD "
					+ "WHERE B_NAME "
					+ "LIKE ? "
					+ "ORDER BY B_NUM DESC";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setNString(1, "%"+searchWord+"%");
				rs=pstmt.executeQuery();
				while(rs.next()){
					sb = new Board();
					sb.setB_Num(rs.getInt("B_NUM"));
					sb.setB_Title(rs.getNString("B_TITLE"));
					sb.setB_Name(rs.getNString("B_NAME"));
					sb.setB_Date(rs.getNString("B_DATE"));
					sb.setB_ViewCnt(rs.getInt("B_VIEWCNT"));
					System.out.println(rs.getInt("B_NUM"));
					BoardList.add(sb);
				}
				System.out.println(rs);
				System.out.println(rs.next());
				System.out.println(BoardList);
				return BoardList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;	
		}
		}
	
	
	
	public ArrayList<Board> SelectList() {
		String sql="SELECT * FROM BOARD ORDER BY B_NUM DESC";
		Board sb=null;
		ArrayList<Board> BoardList =null;
		BoardList = new ArrayList<Board>();
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				sb = new Board();
				sb.setB_Num(rs.getInt("B_NUM"));
				sb.setB_Title(rs.getNString("B_TITLE"));
				sb.setB_Name(rs.getNString("B_NAME"));
				sb.setB_Date(rs.getNString("B_DATE"));
				sb.setB_ViewCnt(rs.getInt("B_VIEWCNT"));
				BoardList.add(sb);
			}
			System.out.println(BoardList);
			return BoardList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Board SelectDetail(String B_Num) {
		//조회수가 증가된 후 게시글 정보를 가져옴
		Board B = new Board();
		try {
			String sql="UPDATE BOARD SET B_VIEWCNT = B_VIEWCNT+1 WHERE B_NUM=?";		
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, B_Num);
			int result = pstmt.executeUpdate();
			System.out.println(result);
			if(result!=0){
				System.out.println("조회수 증가 완료");
				String sql2="SELECT * FROM BOARD WHERE B_NUM=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setNString(1, B_Num);
				rs=pstmt.executeQuery();
				if(rs.next()){				//조회수 증가가 완료되었을때만 게시글정보를 가져옴
					B.setB_Title(rs.getNString("B_TITLE"));
					B.setB_Num(rs.getInt("B_NUM"));
					B.setB_Name(rs.getNString("B_NAME"));
					B.setB_Date(rs.getNString("B_DATE"));
					B.setB_ViewCnt(rs.getInt("B_VIEWCNT"));
					B.setB_Content(rs.getNString("B_Content"));
					B.setB_File(rs.getNString("B_FILE"));
					B.setB_Category(rs.getInt("B_CATEGORY"));
				}
			}
			return B;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return B;
	}
}
