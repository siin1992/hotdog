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

import bean.ReservQTY;
import bean.Reservation;
import bean.Room;

public class ReservDao {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds;
	HttpServletRequest request; 
	HttpServletResponse response;

	public ReservDao(){
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
	public List<Reservation> getReservList() {
		List<Reservation> ReservList = new ArrayList<Reservation>();
		try {
			String sql="SELECT * FROM RESERVATION";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Reservation R = new Reservation();
				R.setReservName(rs.getNString("ReservName"));
				if(rs.getInt("ReservCheck")==0){
					R.setReservCheck("대기");
				}else{
					R.setReservCheck("완료");
				}
				R.setReservR_Name(rs.getNString("ReservR_Name"));
				R.setReservIn(rs.getNString("ReservIn").substring(0,10));
				R.setReservOut(rs.getNString("ReservOut").substring(0,10));
				R.setReservStatus(rs.getInt("ReservStatus"));
				ReservList.add(R);
			}
			return ReservList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Reservation> CheckReserv(String ReservIn, String ReservOut) {
		List<Reservation> RList = new ArrayList<Reservation>();
		try {
			String sql="select r_name, r_price,r_image from room where r_name not in(select reservr_name from reservation where (reservout>?and reservin<?)or(reservin>=? and reservin<?)or(reservout>? and reservout<?))";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,ReservIn);
			pstmt.setString(2,ReservOut);
			pstmt.setString(3,ReservIn);
			pstmt.setString(4,ReservOut);
			pstmt.setString(5,ReservIn);
			pstmt.setString(6,ReservOut);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Reservation R = new Reservation();
				R.setReservR_Name(rs.getNString("R_NAME"));
				R.setReservR_Price(rs.getInt("R_PRICE"));
				RList.add(R);
			}
			return RList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean reservinsert(String name, String phonenum, String roomname, String roomin, String roomout,
			int totprice) {
			int result=0;
		try {
			String sql = "INSERT INTO reservation VALUES(seq_r_num.nextval,?,?,?,?,?,default,?,default)";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, name);
			pstmt.setNString(2, phonenum);
			pstmt.setNString(3, roomname);
			pstmt.setNString(4, roomin);
			pstmt.setNString(5, roomout);
			pstmt.setInt(6, totprice);
			result = pstmt.executeUpdate();
			System.out.println("예약 등록 성공");
		} catch (SQLException e) {
			System.out.println("예약 등록 에러");
			e.printStackTrace();
		}
		return boolConvert(result);
	}
	private boolean boolConvert(int result) {
		return (result!=0)?true:false;
	}
	
	public Reservation reservselect(String name, String phonenum, String roomname, String roomin, String roomout,
			int totprice) {
		Reservation r=null;
		try {
			String sql="select * from reservation where reservname=? and reservphone=? and reservr_name=? and reservin=? and reservout=? and reservpay=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, name);
			pstmt.setNString(2, phonenum);
			pstmt.setNString(3, roomname);
			pstmt.setNString(4, roomin);
			pstmt.setNString(5, roomout);
			pstmt.setInt(6, totprice);
			rs=pstmt.executeQuery();
			if(rs.next()){
				r=new Reservation();
				r.setReservNum(rs.getInt("RESERVNUM")); ;
			}
			return r;
		}catch (SQLException e) {
				System.out.println("오류");
				e.printStackTrace();
		}
		return r;
	}
	public boolean reservqtyinsert(int totdog, int rnum, int totpeople) {
		int result=0;
		try {
			String sql = "INSERT INTO reservqty VALUES(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			pstmt.setInt(2, totdog);
			pstmt.setInt(3, totpeople);
			result = pstmt.executeUpdate();
			System.out.println("견수 등록 성공");
		} catch (SQLException e) {
			System.out.println("견수 등록 에러");
			e.printStackTrace();
		}
		return boolConvert(result);
	}
	
	public ArrayList<Reservation> ReservCheckUser(String name, String phone) {
		Reservation R = null;
		ArrayList<Reservation> Rlist=new ArrayList<Reservation>();
		try {
			String sql="select * from reservation r inner join reservqty q on r.reservnum=q.rq_reservnum where reservname=? and reservphone=? and reservstatus=0";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, name);
			pstmt.setNString(2, phone);
			rs = pstmt.executeQuery();
			while(rs.next()){
				R=new Reservation();
				R.setReservNum(rs.getInt("ReservNum"));
				R.setReservName(rs.getString("ReservName"));
				R.setReservPhone(rs.getString("ReservPhone"));
				R.setReservR_Name(rs.getString("ReservR_Name"));
				R.setReservIn(rs.getString("ReservIn").substring(0,10));
				R.setReservOut(rs.getString("ReservOut").substring(0,10));
				R.setRQ_qty_D(rs.getInt("RQ_QTY_D"));
				R.setRQ_qty_P(rs.getInt("RQ_QTY_P"));
				if(rs.getInt("ReservCheck")==0){
					R.setReservCheck("대기");
				}else{
					R.setReservCheck("완료");
				}
				R.setReservPay(rs.getInt("ReservPay"));
				R.setReservStatus(rs.getInt("ReservStatus"));
				Rlist.add(R);
			}
			return Rlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public int DeleteReserv(String num) {
		int result = 0;
		try {
			String sql="UPDATE RESERVATION SET RESERVSTATUS=1 WHERE RESERVNUM=?";
			System.out.println("들어감");
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, num);
			System.out.println(num);
			result = pstmt.executeUpdate();
			if(result==1){
				return result=1;
			}else {
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
		
	}
	public void reservupdate(int reservnum, String name, String phonenum, String rname, String rstart,
			String rend, int totprice) {
		try {
			String sql="update reservation set reservname=?, reservphone=?, reservr_name=?, reservin=?, reservout=?, reservpay=? where reservnum =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, name);
			pstmt.setNString(2, phonenum);
			pstmt.setNString(3, rname);
			pstmt.setNString(4, rstart);
			pstmt.setNString(5, rend);
			pstmt.setInt(6, totprice);
			pstmt.setInt(7, reservnum);
			pstmt.executeUpdate();
			System.out.println("수정 성공");
		}catch (SQLException e) {
				System.out.println("수정 오류");
				e.printStackTrace();
		}
		return;
	}
	
	public void reservupdate_qty(int reservnum, int totdog, int totpeople) {
		try {
			String sql="update reservqty set RQ_QTY_D = ?, RQ_QTY_P = ? where RQ_reservnum = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, totdog);
			pstmt.setInt(2, totpeople);
			pstmt.setInt(3, reservnum);
			pstmt.executeUpdate();
			System.out.println("수정 성공");
		}catch (SQLException e) {
				System.out.println("수정 오류");
				e.printStackTrace();
		}
		return;
	}
	public Room rooname(int rn) {
		Room R=null;
		try {
			String sql="select * from room where R_Price=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rn);
			rs=pstmt.executeQuery();
			if(rs.next()){
				R=new Room();
				R.setR_Name(rs.getString("R_NAME"));
			}
		}catch (SQLException e) {
				e.printStackTrace();
		}
		return R;
	}
}
