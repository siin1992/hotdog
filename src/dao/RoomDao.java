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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import bean.Room;

public class RoomDao {
	Connection con;	
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public RoomDao(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}
	
	public RoomDao(){
		try{
			Context init = new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			System.out.println("커넷션풀 연결 성공");
		}catch(Exception ex){
			System.out.println("커넥션풀 연결 실패");
		}
	}

	//커넥션풀에 커넥션 반납
	public void close(){
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean insertRoom(Room room) {
			String sql = "INSERT INTO ROOM(R_NAME,R_PRICE,R_IMAGE,R_LIMIT,R_EXP) VALUES(?,?,?,?,?)";
			int result=0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, room.getR_Name());
			pstmt.setInt(2, room.getR_Price());
			pstmt.setNString(3, room.getR_Image());
			pstmt.setInt(4, room.getR_Limit());
			pstmt.setNString(5, room.getR_Exp());
			result = pstmt.executeUpdate();
			System.out.println("객실 등록 성공");
		} catch (SQLException e) {
			System.out.println("객실 등록 에러");
			e.printStackTrace();
		}finally{
			close();
		}
		return boolConvert(result);

	}

	private boolean boolConvert(int result) {
		return (result!=0)?true:false;
	}

	public List<Room> roomList() {
		try {
			String sql = "SELECT * FROM ROOM";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Room> rList = new ArrayList<Room>();
			Room room = null;
			while(rs.next()){
				room = new Room();
				room.setR_Name(rs.getNString("r_name"));
				room.setR_Price(rs.getInt("r_price"));
				room.setR_Image(rs.getNString("r_image"));
				room.setR_Limit(rs.getInt("r_limit"));
				room.setR_Exp(rs.getNString("r_exp"));
				rList.add(room);
			}
			return rList;	//0개 ~ n개 List를 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;	//검색 실패시 (0개도 실패하고 싶을때는 pList로 해준다.)
	}
}
	
