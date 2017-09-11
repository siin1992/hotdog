<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%     
HttpSession ss=request.getSession();
String name=request.getParameter("name");
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs = null;

try{
   Context init = new InitialContext();
    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    con=ds.getConnection();
    
    pstmt=con.prepareStatement("select * from ROOMIMAGE where RI_NAME=?");
    pstmt.setNString(1, name);
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
#td1{
   width:120px;
   font-weight:bolder;
}
.ta1{
    margin: 3px;
    margin-left:58px;
    width:380px;
    height:300px;
    float:left;
}
.line{
   border-bottom:1px dashed silver;
   
}
table{
   height:300px;
   float:left;
   margin-left:180px;
}
#tr1{
   background-color:#d4d9dd;
   width:90px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>
</head>
<body>
   <center>
      <h1>- A동 -</h1><br/>
      <input type="button" onclick="back()" value="뒤로가기"/>
   </center><br/><br/>

   
   <table border='0' width='580'>
      <tr>
         <td class="line" id="td1">인원</td>
         <td class="line">기준(2)명/최대(4)명</td>         
      </tr>
      <tr>
         <td class="line" id="td1">구조</td>
         <td class="line"><커플/가족 룸-건물1층>원룸형, 주방1개, 화장실1개, 침대1개, 발코니(개별바베큐)</td>      
      </tr>
      <tr>
         <td class="line" id="td1">타입</td>
         <td class="line">커플, 가족</td>      
      </tr>
      <tr>
         <td class="line" id="td1">크기</td>
         <td class="line">49.59㎡(15평)</td>      
      </tr>
      <tr>
         <td class="line" id="td1">추가요금</td>
         <td class="line">대인(20,000원) 소인(10,000원)</td>         
      </tr>
      <tr>
         <td class="line" id="td1">구비시설</td>
         <td class="line">에어컨, 개별바베큐장, 주방용품일절, TV( VOD시청 가능:휴대폰결제, 무선와이파이, 냉장고, 세면도구, 수전, 전기밥통,토스트기,전기포트, 헤어드라이어, 애견용품(식기, 용변기, 쿠션).전자렌지,조식서비스(공지사항참고)</td>   
      </tr>
   </table>
 
   
   <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
   <div><div align="center"><font color="#ff0000" size="4">
<div align="center"><font color="#ff0000" size="4">
<div align="center"><font color="#ff0000" size="3">
<div align="center"><font color="#953734" size="5"><strong>◀기준 2인 최대4인&nbsp; 동반견 최대4견▶</strong></font></div>
<div align="center"></div>
<div align="center"><font color="#ff0000" size="4"><strong>◁(<strong>객실/인원</strong> 선택 후 <strong>부가서비스</strong> 란에서 동반견 <strong>체크</strong>해주세요~)▷</strong></font></div></font></font>
<div align="center"><font color="#000000"><br></font></div>
<div align="center"><font color="#000000">(10kg 이하 동반견만 이용할수 있는 객실입니다)</font></div>
<div align="center"><font color="#000000"><br></font></div>
<div align="center"><font color="#000000" size="2">( 10kg~12kg 동반견 입실은 순한 아이만 예약가능합니다. 예약전 문의전화주세요 070-123-4567))</font></div>
<div align="center"><font color="#000000" size="2">(본관동은 소형견동으로 키로수와 제한 견종이 있습니다.&nbsp;예약안내와 이용규정을 꼭&nbsp;필독하여 주세요)</font></div>
<div align="center"><font color="#000000"><br></font></div>
<div align="center"><font color="#000000">
<div align="center"><font color="#000000">조식을 서비스해드립니다^^<br></font></div>
<div align="center">
<div align="center"><font color="#000000"></font>&nbsp;
<font color="#000000"><br></font></div></div><font color="#76923c"><font color="#76923c"><font size="4"><strong>「HOTDOG 펜션」</strong>은<strong> 인더스트리얼 스타일 애견펜션</strong> 입니다.</font></font>
<div align="center">
<div align="center">
<div align="center">&nbsp;</div>
<div align="center"></div>
<div align="center"></div>
<div align="center"><font color="#76923c"></font></div>
<div align="center"><font color="#76923c"><font size="3"><strong>D동</strong>을<strong> 커플 </strong>또는<strong> 소규모가족 </strong>분 들께 권해드립니다.</font></font></div>
<div align="center"><br></div>
<div align="center">사진상에 보이는 쇼파가&nbsp;현재는&nbsp;쿠션가죽쇼파로 바뀌었습니다 </div>
<div align="center">편안하게 쉬실수 있도록 업그레이드 되었습니다
</div>
<div align="center"></div>
<div align="center"><br></div>
<div align="center"><br></div>
<div align="center"></div>
<div align="center">바베큐장과 운동장사이 계단이 설치되어 있어서 아이들이 자유롭게 이동할수 있습니다.<br>
<div style="text-align: center"><br></div><br></div></div></div></font>
<div align="center">
<div align="center"></div></div></font></div></font></div></font></div></div>
<%while(rs.next()){ %>
<table class = 'ta1'>
   <tr>
      <td><img src="upload/<%=rs.getString("RI_PATH")%>" width="420", height="300"/></td>
   </tr>
   <tr align=center>
      <td><a href="RDdelete.jsp?id=<%=rs.getString("RI_PATH")%>&&name=<%=rs.getString("RI_NAME")%>"><button>▲삭제▲</button></a>
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