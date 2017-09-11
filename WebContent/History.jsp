<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#tr01{
	text-align: center;
}
#td01,#td02,#td03{
	border-color:#337ab7;
	font-weight:bolder;
	height:50px;
	background-color: #337ab7;
	color:white;
}
td{	
	border : 1px solid black;
	background-color:white;
	width: 300px;
	height:40px;
}

div.history{
	text-align: center;
	width: 900px;
	margin-left: 15%;
}
h2{
	text-align: center;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<br/><br/><br/>
<div class="history">
<table>
	<tr id="tr01">
		<td id=td01>아이피</td>
		<td id=td02>이동 경로</td>
		<td id=td03>조회 날짜</td>
	</tr>
 ${result}
 </table>
 </div>
</body>
</html>