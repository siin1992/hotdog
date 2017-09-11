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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=f718c747e774d2b1a06702e34ab89b24"></script>
<style>
a {
	text-decoration: none;
}

li {
	list-style: none;
	float: left;
	padding: 35px;
}

li:hover {
	font-weight: bolder;
	color: #dd390d;
}

#doReserv, #checkReserv {
	float: left;
	text-align: center;
	height: 20px;
	width: 80px;
	color: white;
	background-color: black;
}

#book {
	display: none;
	margin-left: 16%;
}

#main {
	padding-bottom: 70px;
	background-color : #f8f8f8;
}

#footer {
	position: absolute;
	margin-top: 1350px;
	width: 100%;
	height: 75px;
	background-color: silver;
	
}

.move {
	text-decoration: none;
	color: white;
}

#all {
	position: relative;
	display: grid;
	margin-left: 0px;
	min-width: 100%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	width: 100%;
}

#hi {
	position: absolute;
	margin-left: 8.5%;
	height: 200px;
}

#hi2 {
	position: absolute;
	margin-top: 39%;
}

#doc {
	float: left;
	margin-left: 110px;
	margin-top: 100px;
}

.doctd {
	width: 260px;
}

#banner {
	float: left;
	margin-left: 110px;
}

#banner {
	position: absolute;
	margin-top: 800px;
}

.item {
	position: absolute;
	margin-top: 0px;
	height: 600px;
}

#book a {
	color: white;
	text-decoration: none;
}
div.container#container{
	margin-left:65px; 
}
</style>
</head>
<body>
	<div id="all">
		<div id="total">
			<div id="header" align="center">
				<a href="Index.jsp"><img src="./temp/puppy.jpg" width='120px'
					height='120px' /></a>
			</div>
			<div class="container" id="container">
				<div class="row">
					<!-- <div class="col-md-1"></div> -->
					<div class="col-md-2">
						<a href="javascript:Aj('Introduce');"><li id="other">펜션소개</li></a>
					</div>
					<div class="col-md-2">
						<a href="javascript:Aj('Calendar');"><li id="res">객실예약</li></a>
					</div>
					<div class="col-md-2">
						<a href="javascript:Aj('GuestRoom');"><li id="other">객실보기</li></a>
					</div>
					<div class="col-md-2">
						<a href="javascript:Aj('Facility');"><li id="other">부대시설</li></a>
					</div>
					<div class="col-md-2">
						<a href="javascript:Aj('Map');"><li id="other">오시는길</li></a>
					</div>
					<div class="col-md-2">
						<a href="javascript:Aj('SearchBoard');"><li id="other">게시판</li></a>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div id="book">
					<div id="doReserv">
						<a href="javascript:Aj('Calendar');">예약하기</a>
					</div>
					<div id="checkReserv">
						<a href="javascript:Aj('SelectReserv');">예약확인</a>
					</div>
				</div>
			</div>
			<br />
			<br />
			<div id="main" class="col-md-12">

				<!-- 캐러셀 -->
				<div id="hi">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
							<li data-target="#myCarousel" data-slide-to="4"></li>
							<li data-target="#myCarousel" data-slide-to="5"></li>
							<li data-target="#myCarousel" data-slide-to="6"></li>
							<li data-target="#myCarousel" data-slide-to="7"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<img src="temp/bootstrap1.PNG" alt="bootstrap1" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap2.PNG" alt="bootstrap2" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap3.PNG" alt="bootstrap3" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap4.PNG" alt="bootstrap4" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap5.PNG" alt="bootstrap5" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap6.PNG" alt="bootstrap6" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap7.PNG" alt="bootstrap7" width='1000px'
									height='300px'>
							</div>

							<div class="item">
								<img src="temp/bootstrap8.PNG" alt="bootstrap8" width='1000px'
									height='300px'>
							</div>
						</div>

						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<!-- 캐러셀 -->
				<br />
				<br />
				<br />
				<div id="hi2">
					<table>
						<tr id="doc">
							<td class="doctd"><a href="javascript:Aj('Facility');"
								class="move"><img src="temp/doc1.png" width='220px'
									height='160px'></a></td>
							<td class="doctd"><a href="javascript:Aj('Map');"
								class="move"><img src="temp/doc5.png" width='220px'
									height='160px'></a></td>
							<td class="doctd"><a href="javascript:Aj('GuestRoom');"
								class="move"><img src="temp/doc3.png" width='220px'
									height='160px'></a></td>
							<td class="doctd"><a href="javascript:Aj('Calendar');"
								class="move"><img src="temp/doc4.png" width='220px'
									height='160px'></a></td>
						</tr>
					</table>
				</div>

				<div id="banner">
					<img src="temp/banner.png" width='1000px' height='150px' />
				</div>
				<br />
				<br />
			</div>
		</div>
		<!-- 캐러셀 -->
		<div id="footer">
			<h7>팀장 : <a href="AdminLogin.jsp" id="move">김재원</a>
			<br />
			팀원 : 조광익 , 심영호, 안유진 , 박시인 </h7>
			<h5>Copyright @ Allrights Reserved</h5>
	</div>
	</div>
	
</body>
<script>
	res.addEventListener("mouseenter", function() {
		$("#book").css({
			"display" : "block"
		});
	});

	/* a.addEventListener("mouseenter",function(){
	 $("#book").css({
	 "display":"block"
	 });
	 }); */
	other.addEventListener("mouseenter", function() {
		$("#book").css({
			"display" : "none"
		});
	});

	book.addEventListener("mouseout", function() {
		$("#book").css({
			"display" : "none"
		});
	});
	/*a.addEventListener("mouseout",function(){
	 $("#book").css({
	 "display":"none"
	 });
	 }); */
</script>
<script>
	var Aj = function(url) {
		if (url == '/') {
			console.log(url);
			location.reload(true);
			return;
		}

		$.ajax({
			url : url,
			type : "get",
			success : function(data) {
				$('#main').html(data);
			},
			error : function(error) {
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
<script>
	function ajc(url) {
		var FormData = $('#DetailBoardForm').serialize();
		$.ajax({
			url : 'DetailBoardSubmit',
			type : 'get',
			data : FormData,
			success : function(data) {
				$('#RBoard').html(data);
			},
			error : function(error) {
				console.log(error);
			}
		});//ajax End
	}
</script>
<script>
	function ajbb(url) {
		var FormData = $('#RegBoardSubmit').serialize();
		alert('홧인')
		$.ajax({
			url : 'RegBoardSubmit',
			type : 'get',
			data : FormData,
			success : function(data) {
				$('#main').html(data);
			},
			error : function(error) {
				console.log(error);
			}
		});//ajax End
	}
	
	  function onlyNumber(){
          if((event.keyCode<48)||(event.keyCode>57))
             event.returnValue=false;
	}
</script>
<script>
$(document).keydown(function(e) {
    key = (e) ? e.keyCode : event.keyCode;
     
    var t = document.activeElement;
     
    if (key == 8 || key == 116 || key == 17 || key == 82) {
        if (key == 8) {
            if (t.tagName != "INPUT") {
                if (e) {
                    e.preventDefault();
                } else {
                    event.keyCode = 0;
                    event.returnValue = false;
                }
            }
        } else {
            if (e) {
                e.preventDefault();
            } else {
                event.keyCode = 0;
                event.returnValue = false;
            }
        }
    }
});
</script>
</html>
