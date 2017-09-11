<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- style -->
<!-- a{
color: black;
text-align: center;
text-decoration: none;
height: 50px;
width: 100%;
border: 0;
outline: 0;
}
#td1:HOVER,#td2:HOVER,#td3:HOVER,#td4:HOVER,#td5:HOVER{
background-color: aquamarine;
}
tr{
height: 50px;
}
#tr01 {
   text-align: center;
}
td {
   text-align: center;
   background-color: #337ab7;
   width: 300px;
}
#td01, #td02, #td03, #td04, #td05, #td06, #td07, #td08, #td09{
   background-color: #337ab7;
   color:white;
}
#div1{
text-align: center;
}
div.history {
   text-align: center;
   width: 900px;
   margin-left: 15%;
}

h2 {
   text-align: center;
} -->

<style rel="stylesheet">
.tabs {
	font-size: 16px; line-height: 20px; width:1000px;
}
.tabs ul:before, .tabs ul:after {
	content: "\0020"; display: block; height: 0; visibility: hidden;	
} 
.tabs ul:after { clear: both; }
.tabs ul {
	margin:0;
	list-style:none;
	padding: 0 6%;
	border-bottom: 1px solid #e0e0e0;
	zoom: 1;
}

.tabs ul li {
	position: relative;
	float: left;
	margin: 0;
}
.tabs ul li a {
	background: #f6f6f6;
	font-weight: bold;
	text-align: center;
	display: block;
	border: 1px solid #e0e0e0;
	color: #909090;
	text-shadow: 0 1px 0 rgba(255,255,255, 0.75);
	padding: 6px 18px; margin: 0 5px -1px 0;
	/* Border Radius */
	-webkit-border-top-left-radius: 6px;
	-webkit-border-top-right-radius: 6px;
	-moz-border-radius-topleft: 6px;
	-moz-border-radius-topright: 6px;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	text-decoration:none;
}
.tabs ul li a:hover {
	border-color: #ccc;
	color: #606060;
}
.tabs ul li.active a {
	background: #fff;
	border-color: #d4d4d4;
	border-bottom: 1px solid #fff;
	color: #337ab7;
	margin-top: -4px;
	padding-top: 10px;
}
#td1:HOVER, #td2:HOVER, #td3:HOVER, #td4:HOVER{
	color: #dd390d;
}
#logo{
	color:black;
	font-size:30px;
	text-decoration:none;
}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<!-- new menu -->
<div id="header"></div>
		<div id="container">
			<div id="menu">
				<form name = "Logout" action = "Logout" method = "post">
				<div id="div1" align="center">
					<br/><h2><a href = "AdminMain.jsp" id="logo">관리자 페이지</a></h2>
<br/><br/><br/>
		<div class="tabs">
		  <ul>
			<li class="active" ><a href="Logout" id="td1">로그아웃</a></li>
			<li class="active" ><a href="javascript:Aj('ReservationCheck');" id="td2">예약관리</a></li>
			<li class="active" ><a href="javascript:Aj('GuestManagement');" id="td3">객실관리</a></li>
			<li class="active" ><a href="javascript:Aj('History');" id="td4">히스토리</a></li>
		  </ul>
		</div>
				</div>
				</form>
			</div>
			<div id="AdminMain">
			</div>
		</div>
	<div id="footer"></div>
	</body>

<script>
var Aj = function(url){

	if(url == '/'){
		console.log(url);
		location.reload(true);
		return;
	}
	
	$.ajax({
		url: url,
		type: "post",
		success: 
			function(data){
			$('#AdminMain').html(data);
		},
		error:
			function(error){
			console.log(error);
		}
	});//ajax End
}
function ajd(url, data, position) {
	$.ajax({
		url : url,
		type : "post",
		data : data,
		success : function(data) {
			$(position).html(data);
		},
		error : function(error) {
			console.log(error);
		}
	});//ajax End
}

</script>
</html>