<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="sylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style>
#board{
	border:1px solid #ddd;
	background-color:#f8f8f8;
	border-top-color : #76bfed;
	border-top-width : 5px;
	border-bottom-color : #f8f8f8;
	border-left-color : #f8f8f8;
	border-right-color : #f8f8f8;
	margin-left:8%;
}
#td1{
	font-weight:bolder;
	width:100px;
	text-align:center;
}
#td2{
	width:660px;
	text-align:left;
}
#td3{
	font-weight:bolder;
	width:80px;
	text-align:center;
}
#td4{
	width:170px;
	text-align:center;
}
#td5{
	font-weight:bolder;
	text-align:center;
}
#td6{
	text-align:left;
}
#td7{
 	font-weight:bolder;
	text-align:center;
}
#td8{
	text-align:center;
}
.B_Content{
	width:1012px;
	margin-left:4.4%;
	height:600px;
}
#cmt{
      margin-left:9%;
}
#cmt2{
      margin:auto;
      width:30%;
      background-color : #f4f4f4;
}
#C_name{
	padding : 10px 0 0 0;
	width : 150px;
	background-color : #f4f4f4;
}
#C_content{
	padding : 10px 0 0 0;
	width : 680px;
	background-color : #f4f4f4;
}
#C_date{
	padding : 10px 0 0 0;
	width : 120px;
	background-color : #f4f4f4;
}
#DetailBoardForm{
	margin-left:-40%;
	
}


</style>
</head>
<body>	
${blist}
<br/>
<br/>
<div id = "RBoard">
<table>
${htmlStr}
</table>

<form method="post" id="DetailBoardForm" name="DetailBoardForm">
   <div id="cmt2">
	<div>
		<span>댓글 글쓴이</span>
		<input type="text" name="C_Name" style="width: auto" maxlength="10" autocomplete="off"/>
		<span>비밀번호</span>
		<input type="password" name="C_PW" style="width: auto" maxlength="15"/>
	</div>
	<!-- <div>
		<span>비밀번호</span>
		<input type="password" name="C_PW" style="width: 200px" maxlength="15"/>
	</div> -->
	<div>
		<span>댓글 내용</span>
		<textarea id="Ext" name="C_Content" style=width:500px;height:100px autocomplete="off"></textarea>
	</div>
	<div>
		<input type="button" id="CommentReg" style="width: 200px" maxlength="50" autocomplete="off" value="댓글등록" />	
	</div>
		<input type="hidden" name="C_BC_Num" value="1"/>
		<input type="hidden" name="C_B_NUM" value="${B_NUM}"/>
</form>
</div>
</div>
</body>
<script>
$('#CommentReg').click(function(){
	location.href="javascript:ajc('DetailBoardSubmit')";
});
$('textarea').on('keydown',function(e) {
    var deleteKeyCode = 8,
        value = $(this).val(),
        length = value.length,
        nextValue = value.substring(0, length-1);
    
    console.log(nextValue);

	if (e.which === deleteKeyCode) {
		$(this).val(nextValue);
    } 
});
</script>
</html>