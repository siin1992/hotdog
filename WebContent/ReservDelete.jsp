<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%     
String id=request.getParameter("id");
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs = null;

try{
   Context init = new InitialContext();
    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    con=ds.getConnection();
    
    pstmt=con.prepareStatement("update reservation set reservstatus=1 where reservnum=?");
    pstmt.setNString(1, id);
    rs = pstmt.executeQuery();
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
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>

</head>
<body>
</body>
<script>
window.opener='Self';
window.open('','_parent','');
window.close();
location.href="AdminMain.jsp";
alert('삭제되었습니다.');
</script>
</html>