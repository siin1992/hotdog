<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.util.*,java.text.*"%>
<%
java.util.Date currentDate = new java.util.Date();
java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
String Indate = format.format(currentDate);  //당일날짜
long lCurTime = currentDate.getTime();
currentDate = new java.util.Date(lCurTime+(1000*60*60*24*+1));
String Outdate = format.format(currentDate);  //당일다음날짜
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>풀캘린더</title>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
#CheckReserv{
	text-align : center;
	font-size: 16px;
	color: #263238;
}
#button{
	color : white;
	background-color : #562c19;
	font-size: 20px;
	font-weight: nomal;
	border : #562c19;
}
#button:hover{
	color : black;
	background-color : white;
	transition: all 0.2s;
}

#calendar{
	background-color : #f8f8f8;
	box-shadow: rgba(0, 0, 0, 0.15) 10px 10px 10px;
}
#rstart,#rend{
	color: #ccb2ab;
}
.fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-today.fc-state-highlight,
	.fc-day-top.fc-sat.fc-future {
	color: blue;
}

.fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future {
	color: red;
}
</style>
<link href="fullcalendar/fullcalendar.css" rel="stylesheet" />
<link href="fullcalendar/fullcalendar.print.css" rel="stylesheet"
	media="print" />
<script type="text/javascript" src="fullcalendar/moment.min.js"></script>
<script type="text/javascript" src="fullcalendar/jquery.min.js"></script>
<script type="text/javascript" src="fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="fullcalendar/ko.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#calendar").fullCalendar({
              editable : false
            , eventLimit : true
            , events: [
                ${ReservList}
            ]
        });
    });
    
    $('.fc-content').click(function() {
        var moment = $('#calendar').fullCalendar('getDate');
        alert(getDate);
    });
	$("#c").click(function() {
		var a = $("#a").val();
		var b = $("#b").val();
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
			$('#button').hide();
			$('#msg').hide();
		} else if (c > 10) {
			alert("최대 10일 까지입니다. 다시 지정해주세요.");
			$("#a").val("");
			$("#b").val("");
			$("#c").val("");
			$("#a").focus();
			$('#button').hide();
			$('#msg').hide();
		} else {
			$("#c").val(c);
			$('#button').show();
		}
		if ($("#c").val() == "NaN") {
			alert("날짜를 지정해주세요.");
			$("#c").val("");
			$('#button').hide();
			$('#msg').hide();
			if ($("#a").val() == "") {
				$("#a").focus();
			} else {
				$("#b").focus();
			}
		}
	});
	$("#a").click(function() {
		$('#button').hide();
		$('#msg').hide();
	});
	$("#b").click(function() {
		$('#button').hide();
		$('#msg').hide();
	});
</script>
<script>
$('#button').hide();
$('#msg').hide();
$('#button').click(function(){
	var Start = $("#a").val();
	var End = $("#b").val();
	var day = $("#c").val();
	console.log(Start+End);
		$.ajax({
		      url: 'CheckReserv',
		      type: "post",
		      data : 'rstart='+Start+'&'+'rend='+End+'&'+'rday='+day,
		      success: 
		         function(data){
		         $('#msg').html(data);
		         $('#msg').show();
		      },
		      error:
		         function(error){
		         console.log(error);
		      }
		   });//ajax End
		/* $('#msg').css("display", "block");  */
});
</script>
</head>
<body>
<!-- <form action='DetailReserv' method='post'> -->
	<div id="CheckReserv">
		예약시작날짜 : <input type="date" id="a" min="<%=Indate%>" name="rstart" /> <br />
		예약종료날짜 : <input type="date" id="b" min="<%=Outdate%>" name="rend" /> <br />
		 예 약 일 수 : <input type="text" id="c" size="20" placeholder="날짜 지정후 눌러주세요." name="rday"
			readonly /> <br /><br/>
		<input type="button" id="button" name="button" value="예약 가능한 방 확인하기" />
		<div id="calendar">
			<%-- <div id="msg" style="display:none">${RoomList}aaaaaaa</div> --%>
			<div id="msg">${RoomList}</div>
		</div>
	</div>
<!-- 	</form> -->
</body>
<script>
</script>
</html>