<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs = null;
   try{
      Context init = new InitialContext();
       DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
       con=ds.getConnection();
       
       pstmt=con.prepareStatement("delete from ROOMIMAGE where RI_PATH=?");
       pstmt.setNString(1, id);
       pstmt.executeUpdate();
      }catch(Exception e){
       e.printStackTrace();
   }
   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

</body>
<script>
window.opener='Self';
window.open('','_parent','');
window.close();
location.href='RoomDetail.jsp?name=<%=name%>'
alert('삭제되었습니다.')
</script>
</html>