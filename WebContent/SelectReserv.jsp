<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#Select{
	text-align : center;
}
</style>
</head>
<body>
<div id="Select">
	예약자명 <input type="text" id="ReservUserName"/><br/><br/>
	전화번호 <input type="text" id="ReservUserPhone"/><br/><br/>
	<button id="SelectReserv"> 조회 </button>
</div>
</body>
<script>
$('#SelectReserv').click(function(){
	if($("#ReservUserName").val()==null||$("#ReservUserName").val()==""){
		alert("예약자명을 입력해주세요.");
		$("#ReservUserName").focus();
	}
	else if($("#ReservUserPhone").val()==""||$("#ReservUserPhone").val()==null){
		alert("전화번호를 입력해주세요.");
		$("#ReservUserPhone").focus();
	}else{
		var Name = $('#ReservUserName').val(); 
		var Phone = $('#ReservUserPhone').val();
			$.ajax({
			      url: 'ReservCheckUser',
			      type: "post",
			      data : 'Name='+Name+'&Phone='+Phone,
			      success: 
			         function(data){
			         $('#main').html(data);
			      },
			      error:
			         function(error){
			         console.log(error);
			      }
			});//ajax End
	}
});
</script>
</html>
