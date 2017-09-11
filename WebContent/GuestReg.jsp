<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="sylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<!-- <style>
#div3{
margin-left: 45%;
}
#check, #reset{
   display:none;
}
#div2{
text-align: center;
}
</style> -->
<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url("temp/love4.png");
  background-size: 430px;
  background-repeat: no-repeat;
}
/* body.half.bg{
  margin-top : 25%;
} */
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(4), body .container .content input:nth-of-type(4), body .container .content .more:nth-of-type(4) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(5), body .container .content input:nth-of-type(5), body .container .content .more:nth-of-type(5) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}
body .container .content .submit-wrap {
  bottom: 0;
  width: 100%;
  margin-top : 0
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}
#div3{
margin-left: 45%;
}
#check, #reset{
   display:none;
}
#div2{
text-align: center;
}

/* body {
  font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
  color: #404040;
  background: #fafafa;
}

.container {
  margin: 50px auto;
  width: 640px;
  text-align: center;
}
.container .button {
  margin: 0 10px 25px;
}

.button {
  margin: 0 0 5px;
  padding: 0 12px;
  height: 28px;
  line-height: 28px;
  font-size: 11px;
  font-weight: bold;
  color: #555555;
  text-decoration: none;
  text-shadow: 0 1px white;
  background: #dfdfdf;
  border-width: 1px 1px 0;
  border-style: solid;
  border-color: #cecece #bababa #a8a8a8;
  border-radius: 3px 3px 2px 2px;
  outline: 0;
  display: inline-block;
  vertical-align: baseline;
  zoom: 1;
  *display: inline;
  *vertical-align: auto;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  background-image: -webkit-linear-gradient(top, #f1f1f1, #dfdfdf 70%, #dadada);
  background-image: -moz-linear-gradient(top, #f1f1f1, #dfdfdf 70%, #dadada);
  background-image: -o-linear-gradient(top, #f1f1f1, #dfdfdf 70%, #dadada);
  background-image: linear-gradient(to bottom, #f1f1f1, #dfdfdf 70%, #dadada);
  -webkit-box-shadow: inset 0 1px #fdfdfd, inset 0 0 0 1px #eaeaea, 0 1px #a8a8a8, 0 3px #bbbbbb, 0 4px #a8a8a8, 0 5px 2px rgba(0, 0, 0, 0.25);
  box-shadow: inset 0 1px #fdfdfd, inset 0 0 0 1px #eaeaea, 0 1px #a8a8a8, 0 3px #bbbbbb, 0 4px #a8a8a8, 0 5px 2px rgba(0, 0, 0, 0.25);
}
.button:hover, .button:active {
  background: #dfdfdf;
  border-top-color: #c9c9c9;
}
.button:active{
  vertical-align: -5px;
  margin-bottom: 0;
  padding: 1px 13px 0;
  border-width: 0;
  border-radius: 3px;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3), inset 0 1px 1px rgba(0, 0, 0, 0.4), 0 1px white;
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3), inset 0 1px 1px rgba(0, 0, 0, 0.4), 0 1px white;
}
 */
</style>
</head>

<body>
<div id="div2">
	<br/><br/>
	<a href="javascript:Aj('GuestReg');"><button>객실등록</button></a>
	<a href="javascript:Aj('GuestRoom');"><button>객실보기</button></a>
	<a href="javascript:Aj('GuestRoomImage');"><button>객실사진 등록</button></a><br/>
</div>
<div id = "div3">
</div>

<section class="container">
	<article class="half">
		<h1>객실등록</h1><br/>
	 		    <div class="content">
				            <div class="signin-cont cont">
					                <form action="insertRoom" method="post" enctype="multipart/form-data">
						                    <input type="text" name="R_Name" class="inpt" required="required" placeholder="객실이름" >
						                    <input type="text" name="R_Price" class="inpt" required="required"  placeholder="가격(1박)">
                						    <input type="file" name="R_Image" class="inpt" required="required" placeholder="사진첨부">
                						    <input type="text" name="R_Limit" class="inpt" required="required" placeholder="최대인원">
                						    <input type="text" name="R_Exp" class="inpt" required="required" placeholder="객실설명">
						                    <div class="submit-wrap">
							                	<input type="submit" value="Sign in" class="submit">
						                    </div>
        					        </form>
    				        </div>
    			</div>
	</article>
	 <div class="half bg"></div>
</section>
</body>
<script>
$("input[type=button]").click(function(){
   if($("#name").val() == ""||$("#price").val() == ""||$("#image").val() == ""||
         $("#limit").val() == ""||$("#exp").val() == ""){
      alert("빈공간을 채워주세요");
   }else{
      $("#check").css("display","block");
      $("input[type=button]").css("display","none");
      $("input[type=text]").attr("readonly",true);
      $("input[type=file]").css( "display","none");
      $("span").html($("input[type=file]").val());
   }
});
</script>
</html>