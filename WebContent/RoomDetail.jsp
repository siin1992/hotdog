<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%     
HttpSession ss=request.getSession();
String name=request.getParameter("name");
String iname=request.getParameter("name")+"I";
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs1 = null;
ResultSet rs2 = null;

try{
   Context init = new InitialContext();
    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    con=ds.getConnection();
    
    pstmt=con.prepareStatement("select * from ROOMIMAGE where RI_NAME=?");
    pstmt.setNString(1, name);
    rs1 = pstmt.executeQuery();
   }catch(Exception e){
    e.printStackTrace();
}
try{
   Context init = new InitialContext();
    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    con=ds.getConnection();
    
    pstmt=con.prepareStatement("select * from ROOMIMAGE where RI_NAME=?");
    pstmt.setNString(1, iname);
    rs2 = pstmt.executeQuery();
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
.ta1{
 	margin: 3px;
 	margin-left:58px;
 	width:380px;
 	height:300px;
 	float:left;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>

</head>
<body>
	<center>
		<h1><상세사진 페이지></h1><br/>
		<input type="button" onclick="back()" value="뒤로가기"/>
	</center><br/><br/>
	<%if(rs2.next()){ %>
<table class = ''>
   <tr>
      <td><img src="upload/<%=rs2.getString("RI_PATH")%>"/></td>
   </tr>
   <tr align=center>
      <td><a href="RDdelete.jsp?id=<%=rs2.getString("RI_PATH")%>&&name=<%=rs2.getString("RI_NAME")%>"><button>▲삭제▲</button></a>
   </tr>
</table>
<%} %>
<%while(rs1.next()){ %>
<table class = 'ta1'>
   <tr>
      <td><img src="upload/<%=rs1.getString("RI_PATH")%>" width="420", height="300"/></td>
   </tr>
   <tr align=center>
      <td><a href="RDdelete.jsp?id=<%=rs1.getString("RI_PATH")%>&&name=<%=rs1.getString("RI_NAME")%>"><button>▲삭제▲</button></a>
   </tr>
</table>
<%} %>
</body>
<script>
if(<%=ss.getAttribute("id")%>==null){
	$('button').css('display','none');
}
function back(){
	   history.back();
	}
</script>
</html>