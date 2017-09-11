package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import bean.RoomImage;


public class RoomImageDao {
   Connection con = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   DataSource ds;
   HttpServletRequest request; 
   HttpServletResponse response;
   
   public RoomImageDao(){
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
   public boolean insertRoomImage(RoomImage RoomImage){
      String sql="INSERT INTO ROOMIMAGE VALUES(?,?)";
      int result=0;
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setNString(1, RoomImage.getRI_Name());   
         pstmt.setNString(2, RoomImage.getRI_Path());
         result = pstmt.executeUpdate();
         System.out.println("roomimg insert 성공");
      } catch (SQLException e) {
         System.out.println("roomimg insert 실패");
         e.printStackTrace();
      }
      return boolConvert(result);
   }//insertMembers end
   private boolean boolConvert(int result) {
      return (result!=0)?true:false;
   }
}