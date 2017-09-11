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
</head>
<style>
/* #tr01 {
	text-align: center;
}

#td01, #td02, #td03, #td04, #td05{
	border-color:white;
	font-weight:bolder;
	height:40px;
	background-color: #cccccc;
	color:black;
}
#td01{
	width:10px;
}

td {
	text-align: center;
	background-color: white;
	height:30px;
	width: 270px;
	color:black;
	border:1px solid black;
	
}

div.BoardList {
	text-align: center;
	width: 900px;
}
div.Search {
	text-align: center;
	padding : 50px;
}
select{
	height : 26px;
}
div.WriteBoard{
	float : right;
} */
h3 {
	text-align: center;
}
div.Search {
	text-align: center;
	padding : 50px;
}
div.BoardList {
	text-align: center;
}	
#board{
	width:1050px;
}
#bt{
margin-right:230px;

}
#DDog{
	width:70%;
	margin-left:14%;
}
.WriteBoard{
	margin-right:16%;
}
 .tdCenter{
 	text-align: center;
 }
 #tr01{
 	text-align: center;
 }
</style>
<body>
<div id="DDog" align="center">
		<table class="table table-striped">
			<!-- <tr>
				<td colspan="5">
					게시글 등록
				</td>
			</tr> -->
				<div class='BoardList'>
					<h2>게시판 리스트</h2><br/><br/>
						<tr id='tr01'>
							<th id='td01' width="100px;">게시글 번호</th>
							<th id='td02'>제목</th>
							<th id='td03' width="100px;">글쓴이</th>
							<th id='td04' width="100px;">날짜</th>
							<th id='td05' width="100px;">조회수</th>
						</tr>
				${BoardList}
				</div>
		</table><br/>
	</div>
				<form action="javascript:ajb('RegBoard','#main');">
					<div class='WriteBoard'>
						<a class="btn btn-default pull-right" href="javascript:Aj('RegBoard')">글쓰기 </a>
					</div><br/>
				</form>
			<form action="javascript:ajb('SearchBoard','#main');">
		<table>
					<div class="Search">
					<select id='SelectCategory' name='SelectCategory'>
						<option value='B_TITLE'>제목</option>
						<option value='B_NAME'>글쓴이</option>
					</select>
						<input type='text' id='SearchWord' name='SearchWord'/>
					<button class = "searchBT">검색</button>
					</div>
		</table>
		</form>	
</body>
<script>
var ajb = function(url,position) {
	if (url == '/') {
		console.log(url);
		location.reload(true);
		return;
	}
	
	 console.log('Board');
	$.ajax({
	      url: url,
	      type: "get",
	      data :{ 
       	  SelectCategory: $("#SelectCategory").val(),
       	  SearchWord: $("#SearchWord").val()
         } , 
	      success: 
	         function(data){
	         $(position).html(data);
	      },
	      error:
	         function(error){
	         console.log(error);
	      }
	   });//ajax End
}	
</script>
</html>