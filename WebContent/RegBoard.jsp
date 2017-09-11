<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  /*  div{
      height: 30px;
   } */
   span{
      display: inline-block;
      width: 70px;
      font-size: 12px;
      font-weight: bold;
   }
   .B_Content{
      padding:8px;
      height:500px;
      width:800px;
   }
   #all{
      
      position: center;
      height: 30px;
   }
   #down{
   	  margin-left: 20%;
   }
   #btn{
	  margin-left: 25%;	   	
   }
   #cancel a{
   	color:black;
   	text-decoration: none;
   	
   }
</style>
</head>
<body>
<div id="all">
<form method="post" id = "RegBoardSubmit" enctype="multipart/form-data">
	<div id="down">
		   <div>
		      <span>닉네임 : </span>
		      <input type="text" name="B_Name" style="width: 200px" maxlength="10" autocomplete="off"/>
		   </div><br/>
		   <div>
		      <span>비밀번호 : </span>
		      <input type="password" name="B_PW" style="width: 200px" maxlength="15"/>
		   </div><br/>
		   <div>
		      <span>제목 : </span>
		      <input type="text" name="B_Title" style="width: 730px" maxlength="50" autocomplete="off"/>
		   </div><br/>
		   <br />
		   <div class="B_Content">
		      <textarea class="B_Content" name="B_Content" contenteditable="true"
		          maxlength="2000"></textarea>
		   </div>
		   <br />
		   <!-- <div>
		      <span>파일 찾기</span><br/>
		      <input type="file" name="B_File"/>
		   </div> -->
		   <input type="hidden" name="B_Category" value="1"/><br/>
		   <button id="cancel"><a href="javascript:Aj('SearchBoard');">취소</a></button>
		   <input type="button" id="btn" style="width: 200px" maxlength="50" autocomplete="off" value="등록" />
	 	   
	 </div>
</form>
</div>
</body>
<script>
$('#btn').click(function(){
	location.href="javascript:ajbb('RegBoardSubmit')";
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