<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%     
String num = request.getParameter("id");
request.setAttribute("num", num);
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs = null;

try{
   	Context init = new InitialContext();
    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    con=ds.getConnection();
    
    pstmt=con.prepareStatement("select * from room");
    rs = pstmt.executeQuery();
   }catch(Exception e){
    e.printStackTrace();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
div.ReservUpdate {
	text-align: center;
}
input{
	text-align: center;
}
</style>
<body>
<form name="ReservUpdateForm">
<div class='ReservUpdate'>
<div>견종 및 인원정보</div>
<div>
	<table name="ReservDetail">
		<tr><td>견종분류</td><td>단위금액</td><td>견수</td><td>합계</td></tr>
		<tr><td>소형견</td><td><input type="text" id="du1" size="5" value="10000" style=border:0 solid black; readonly/></td><td><select id="d1" name="dog1" onchange="javascript:selectEvent(this)"><option value=''>마릿수</option><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td><td><span id="dp1"></span></td></tr>
		<tr><td>중형견</td><td><input type="text" id="du2" size="5" value="15000" style=border:0 solid black; readonly/></td><td><select id="d2" name="dog2" onchange="javascript:selectEvent(this)"><option value=''>마릿수</option><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td><td><span id="dp2"></span></td></tr>
		<tr><td>대형견</td><td><input type="text" id="du3" size="5" value="20000" style=border:0 solid black; readonly/></td><td><select id="d3" name="dog3" onchange="javascript:selectEvent(this)"><option value=''>마릿수</option><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td><td><span id="dp3"></span></td></tr>
	</table>
</div></br>
<div>
	<table>
		<tr><td>연령분류</td><td>단위금액</td><td>인원수</td><td>합계</td></tr>
		<tr><td>소인</td><td><input type="text" id="pu1" size="5" value="10000" style=border:0 solid black; readonly/></td><td><select id="p1" name="people1" onchange="javascript:selectEvent(this)"><option value="">인원수</option><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td><td><span id="pp1"></span></td></tr>
		<tr><td>대인</td><td><input type="text" id="pu2" size="5" value="20000" style=border:0 solid black; readonly/></td><td><select id="p2" name="people2" onchange="javascript:selectEvent(this)"><option value="">인원수</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td><td><span id="pp2"></span></td></tr>
	</table>
</div></br>
<div>
	<table>
		<tr><td>견수</td><td><input type="text" id="dq" name="totdog" size="2" style=border:0 solid black; readonly/>마리</span></td></tr>
		<tr><td>인원수</td><td><input type="text" id="pq" name="totpeople" size="2" style=border:0 solid black; readonly/>명</td></tr>
		<tr><td>금액합계</td><td><input type="text" id="tp" name="totpay" size="5" style=border:0 solid black; readonly/>원</td></tr>
	</table>
</div></br>

<div>예약자 상세정보</div>
	<table>
		<tr>
			<td>예약자번호: </td>
			<td><input type="text" id="reservnum" name="reservnum" value="${num}" readonly/>번</td>
		</tr>
		<tr>
			<td>예약자명: </td>
			<td><input type="text" id="name" name="name"/></td>
		</tr>
		<tr>
			<td>전화번호: </td>
			<td><input type="text" id="phonenum" name="phonenum"/></td>
		</tr>
		<tr>
			<td>방이름: </td>
			<td>
			<select id="rname" name="rname" onchange="javascript:selectEvent(this)">
			<option></option>
			<%while(rs.next()){%>
				<option value='<%=rs.getString("R_PRICE")%>'><%=rs.getString("R_NAME")%></option>
			<%}%>
			</select>
			<input type="text" id="rprice" name="rprice" size="5" style=border:0 solid black; readonly/>
			</td>
		</tr>
		<tr>
			<td>입실일: </td>
			<td><input type="date" id="a" name="rstart" /></td>
		</tr>
		<tr>
			<td>퇴실일: </td>
			<td><input type="date" id="b" name="rend" /></td>
		</tr>
		<tr>
			<td>숙박일수: </td>
			<td><input type="text" id="c" size="18" placeholder="날짜 지정후 눌러주세요." name="rday" 
			readonly />일</td>
		</tr>
		<tr>
			<td>결제금액: </td>
			<td><input type="text" id="totprice" size="7" name="totprice" style=border:0 solid black; readonly/>원</td>
		</tr>
	</table>
</div>
	<input type="button" id="back" value="메인으로">
	<input type="button" id="updateReserv" value="수정하기"/>
</div>
</form>
</body>
<script>

function selectEvent(selectObj) {
	var a1=$("#d1").val();
	a1 = Number(a1);
	var b1=$("#d2").val();
	b1 = Number(b1);
	var c1=$("#d3").val();
	c1 = Number(c1);
	var d1=$("#p1").val();
	d1 = Number(d1);
	var e1=$("#p2").val();
	e1 = Number(e1);
	var a=$("#d1").val()*$("#du1").val();
	var b=$("#d2").val()*$("#du2").val();
	var cc=$("#d3").val()*$("#du3").val();
	var d=$("#p1").val()*$("#pu1").val();
	var e=$("#p2").val()*$("#pu2").val();
	var p = $("#rname").val();
	p=Number(p);
	$("#rprice").val(p+"원");
    $("#dp1").html(a+"원");
    $("#dp2").html(b+"원");
    $("#dp3").html(cc+"원");
    $("#pp1").html(d+"원");
    $("#pp2").html(e+"원");
    $("#dq").val(a1+b1+c1);
    $("#pq").val(d1+e1);
 	$("#tp").val(a+b+cc+d+e);
 	$("#totprice").val(a+b+cc+d+e+p);
 	if( $("#dq").val()>4){
 		alert("견수는 최대4마리 입니다.");
 		$("#d1").val("");
 		$("#d2").val("");
 		$("#d3").val("");
 		$("#dp1").html("");
 		$("#dp2").html("");
 		$("#dp3").html("");
 		$("#dq").val("");
 		$("#tp").val("");
 		$("#totprice").val("");
 	}
 	if( $("#pq").val()>4){
 		alert("인원수는 최대4명 입니다.");
 		$("#p1").val("");
 		$("#p2").val("");
 		$("#pp1").html("");
 		$("#pp2").html("");
 		$("#pq").val("");
 		$("#tp").val("");
 		$("#totprice").val("");
 	}
};

$("#updateReserv").click(function(){
	$('#reservnum').val('${num}');
	if($("#d1").val()==""||$("#d2").val()==""||$("#d3").val()==""||$("#p1").val()==""||$("#p2").val()==""||
		$("#name").val()=="" || $("#name").val()==null || $("#phonenum").val()=="" || $("#phonenum").val()==null){
		alert("필수사항을 입력해야합니다.");
		if($("#d1").val()==""){
			$("#d1").focus();
		}else if($("#d2").val()==""){
			$("#d2").focus();
		}else if($("#d3").val()==""){
			$("#d3").focus();
		}else if($("#p1").val()==""){
			$("#p1").focus();
		}else if($("#p2").val()==""){
			$("#p2").focus();
		}else if($("#name").val()==""){
			$("#name").focus();
		}else if($("#phonenum").val()==""){
			
			$("#phonenum").focus();
		}
	}else{
		alert("수정완료");
		ReservUpdateForm.action="Reservupdate";
		ReservUpdateForm.submit();
	}
});
$("#c").click(function() {
	var a = $("#a").val();
	var b = $("#b").val();
	var aa=$("#d1").val()*$("#du1").val();
	var bb=$("#d2").val()*$("#du2").val();
	var cc=$("#d3").val()*$("#du3").val();
	var d=$("#p1").val()*$("#pu1").val();
	var e=$("#p2").val()*$("#pu2").val();
	var p = $("#rname").val();
	p=Number(p);
	var arr1 = a.split('-');
	var arr2 = b.split('-');
	var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	var diff = dat2 - dat1;
	var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	var c = parseInt(diff / currDay);
	if (c < 0) {
		alert("날짜가 잘못되었습니다.");
		$("#a").val("");
		$("#b").val("");
		$("#c").val("");
		$("#a").focus();
	} else if (c > 10) {
		alert("최대 10일 까지입니다. 다시 지정해주세요.");
		$("#a").val("");
		$("#b").val("");
		$("#c").val("");
		$("#a").focus();
	} else {
		$("#c").val(c);
		$("#totprice").val(aa+bb+cc+d+e+p*c);
	}
	if ($("#c").val() == "NaN") {
		alert("날짜를 지정해주세요.");
		$("#c").val("");
		if ($("#a").val() == "") {
			$("#a").focus();
		} else {
			$("#b").focus();
		}
	}
});
$("#back").click(function(){
	history.back();
});



</script>
</html>