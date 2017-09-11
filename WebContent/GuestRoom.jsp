<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*" %>
<%     
HttpSession ss=request.getSession();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 .ta1{
    margin: 100px;
    margin-left:18px;
    width:550px;
    height:400px;
    float:left;
}
#div2{
text-align: center;
}
#div3{
margin-left: 11%;
}

 #check, #reset{
   display:none;
}
/* body{
	width:100%;
	margin:0 auto;
}
#guestRoom{
	margin-left:10%;
}

body {
  font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
  color: #404040;
  background: #fafafa;
}

.container {
  margin: 50px auto;
  width: 950px;
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
<a href="javascript:Aj('GuestReg');"><button>객실등록</button></a>
	<a href="javascript:Aj('GuestRoom');"><button>객실보기</button></a>
	<a href="javascript:Aj('GuestRoomImage');"><button>객실사진 등록</button></a><br/><br/><br/><br/>
</div> 
<div id="div3">
   ${rList}
</div>
</body>
<script>
if(<%=ss.getAttribute("id")%>==null){
   $('button').css('display','none');
}
</script>
</html>