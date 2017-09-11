<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%     
HttpSession ss=request.getSession();
String rname=(String)ss.getAttribute("rname");
String ReservIn=(String)ss.getAttribute("ReservIn");
String ReservOut=(String)ss.getAttribute("ReservOut");
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
	#ReservDetail{
		text-align : center;
	}
</style>
<body>
<form name="ReservinsertForm">
<div id="main">
${roominfo}
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
		<tr><td>견수</td><td><input type="text" id="dq" name="totdog" size="3" style=border:0 solid black; readonly/>마리</td></tr>
		<tr><td>인원수</td><td><input type="text" id="pq" name="totpeople" size="3" style=border:0 solid black; readonly/>명</td></tr>
		<tr><td>금액합계</td><td><input type="text" id="tp" name="totpay" size="7" style=border:0 solid black; readonly/>원</td></tr>
	</table>
</div></br>
</div>
<div>
	<div>예약자 상세정보</div>
	<table>
		<tr>
			<td>*예약자명: </td>
			<td><input type="text" id="name" name="name" size="5"/></td>
		</tr>
		<tr>
			<td>*전화번호: </td>
			<td><input type="text" id="phonenum" name="phonenum" size="5"/  onkeypress="onlyNumber();"></td>
		</tr>
		<tr>
			<td>방이름: </td>
			<td><input type="text" name="roomname" size="5" value="<%=rname%>" style=border:0 solid black; readonly/></td>
		</tr>
		<tr>
			<td>입실일: </td>
			<td><input type="text" name="roomin" size="7" value="<%=ReservIn%>" style=border:0 solid black; readonly/></td>
		</tr>
		<tr>
			<td>퇴실일: </td>
			<td><input type="text" name="roomout" size="7" value="<%=ReservOut%>" style=border:0 solid black; readonly/></td>
		</tr>
		<tr>
			<td>결제금액: </td>
			<td><input type="text" id="totprice" name="totprice" size="7" style=border:0 solid black; readonly/>원</td>
		</tr>
	</table>
</div>
<input type="button" id="back"value="뒤로가기">
<input type="button" id="confirm" value="예약하기"/>
</form>
</body>
<script>
$('#back').click(function(){
		$.ajax({
		      url: "Calendar",
		      type: "post",
		      success: 
		         function(data){
		         $('#main').html(data);
		      },
		      error:
		         function(error){
		         console.log(error);
		      }
		   });//ajax End
});
function selectEvent(selectObj) {
	var a=$("#d1").val()*$("#du1").val();
	var b=$("#d2").val()*$("#du2").val();
	var c=$("#d3").val()*$("#du3").val();
	var d=$("#p1").val()*$("#pu1").val();
	var e=$("#p2").val()*$("#pu2").val();
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
    $("#dp1").html(a);
    $("#dp2").html(b);
    $("#dp3").html(c);
    $("#pp1").html(d);
    $("#pp2").html(e);
    $("#dq").val(a1+b1+c1);
    $("#pq").val(d1+e1);
 	$("#tp").val(a+b+c+d+e);
 	var rprice=<%=ss.getAttribute("rprice")%>;
 	rprice=Number(rprice);
 	$("#totprice").val(rprice+a+b+c+d+e);
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

$("#confirm").click(function(){
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
		alert("예약완료");
		alert("예약확인 페이지에서 확인가능합니다.");
		ReservinsertForm.action="Reservinsert";
		ReservinsertForm.submit();
	}
});



</script>
</html>