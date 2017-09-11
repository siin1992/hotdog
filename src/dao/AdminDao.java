package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.History;
import bean.Reservation;

public class AdminDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds; //추가
	public AdminDao(){
		try{
		Context init=new InitialContext();
		ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		con=ds.getConnection();
		System.out.println("커넥션풀 연결 성공");
		}catch(Exception ex){
			System.out.println("커넥션풀 연결 실패");
		}
	}
	public void close(){  //커넥션풀에 커넥션 반납
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();  //Connection ��ü�� ����Ŭ�� ��ȯ
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean login(String id, String pw) {
		boolean success = false;
		String sql="SELECT ADMINID FROM ADMIN WHERE ADMINID=? AND ADMINPW=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			success = rs.next();
			return success;
		} catch (SQLException e) {
			e.printStackTrace();
		}/*finally{
			try {
				rs.close();
				pstmt.close();
				con.close();
				//conn 가장먼저 열렸기때문에 가장나중에 닫아준다.
			} catch (SQLException e) {
				e.printStackTrace();
			}*/
		return success;
	}
	public boolean insertHistory(History his) {
		String sql="INSERT INTO HISTORY(H_IP,H_WORK,H_DATE) VALUES(?,?,Default)";
		int result=0;
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, his.getH_ip());
			pstmt.setNString(2, his.getH_work() );
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("History INSERT 실패");
			e.printStackTrace();
		}finally{
			close();
		}
		return boolConvert(result);
		
	}
	private boolean boolConvert(int result) {
		return (result!=0)?true:false;
	}
	public ArrayList<History> list() {
		String sql = "SELECT * FROM HISTORY ORDER BY H_DATE DESC";
		ArrayList<History> lists = new ArrayList<History>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				History his = new History();
				his.setH_ip(rs.getString("H_ip"));
				his.setH_work(rs.getString("H_work"));
				his.setH_date(rs.getString("H_date"));
				lists.add(his);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				con.close();
				//con 가장먼저 열렸기때문에 가장나중에 닫아준다.
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}
	public ArrayList<Reservation> ReservList() {
		ArrayList<Reservation> RList = new ArrayList<Reservation>(); 
		try {
			String sql="select * from reservation r inner join reservqty q on r.reservnum = q.rq_reservnum WHERE RESERVSTATUS=0";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Reservation R = new Reservation();
				R.setReservNum(rs.getInt("ReservNum"));
				R.setReservName(rs.getString("ReservName"));
				R.setReservPhone(rs.getString("ReservPhone"));
				R.setReservR_Name(rs.getString("ReservR_Name"));
				R.setReservIn(rs.getString("ReservIn").substring(0,10));
				R.setReservOut(rs.getString("ReservOut").substring(0,10));
				R.setRQ_qty_D(rs.getInt("RQ_QTY_D"));
				R.setRQ_qty_P(rs.getInt("RQ_QTY_P"));
				if(rs.getInt("ReservCheck")==0){
					R.setReservCheck("미납");
				}else{
					R.setReservCheck("입금확인");
				}
				R.setReservPay(rs.getInt("ReservPay"));
				
				
				RList.add(R);
			}
			return RList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
