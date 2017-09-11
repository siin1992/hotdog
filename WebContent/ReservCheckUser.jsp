<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#ReservList{
	text-align:center;
}
</style>
</head>
<body>
<h3>예약확인</h3>
<h3>${UserName} 님의 예약 목록</h3>
${MakeUserReservList}
</body>
<script>
$('#ReservDelete').click(function(){
	var Num = $('td[name=ReservNum]').text();
	console.log(Num);
		$.ajax({
		      url: 'ReservDelete',
		      type: "post",
		      data : 'ReservNum='+Num,
		      success: 
		         function(data){
		         $('body').html(data);
		      },
		      error:
		         function(error){
		         console.log(error);
		      }
		   });//ajax End
		/* $('#msg').css("display", "block");  */
});

</script>
</html>