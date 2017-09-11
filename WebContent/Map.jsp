<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
   #phnum{
      height: 62px;
      width:300px;
      background-color: azure;
      margin-left: 600px;
      margin-top: -62px;
      text-align: center;
   }
   
</style>
</head>
   <body>
      <div style="margin-left: 15%;" >
      <div>
      <!-- style="border: 3px solid cornflowerblue; width: 706px; height: 468px;" -->
         <div id="map" style="width: 900px; height: 400px;"></div>
         <div>
            <div style="width: 600px;height: 62px;  color : darkblue ; background-color: cornsilk;">
               주소 :인천 남구 매소홀로488번길 6-32 
               <br />
               태승빌딩 5층 (우)22223 
               <br /> 
               지번: 학익동 663-1 
               <br />
            </div>
            <div id="phnum">
               <br/>문의 번호 : 010 - 1111 - 2222
            </div>
         </div>
      </div>
      <br />
      <button onclick="zoomIn()">확대</button>
      <button onclick="zoomOut()">축소</button>
      <a href="http://map.daum.net/link/to/핫또그,37.438716, 126.675094" target="_blank">
         <input type="button" value="길 찾기" />
      </a>
      </div>
      <br/>
      <div style="margin-top: 5%; margin-left: 15%;">
         <div style="height: 150px;"><img src="temp/car1.jpg" style="float: left;" alt="car1">
            <p style="width: 500px;;">
            <br/><br/>
            문학 경기장에서<br/>
            인천 지방 검찰청 방향으로 <br/>
            가다가 터널지나 좌회전<br/>
            </p>
            </div>
            <br/>
         <div style="height: 150px;"><img src="temp/car2.jpg" style="float: left;" alt="car2"> 
            <p style="width: 500px;;">
            <br/><br/>
            111-2번 이용 - 신동아 아파트 하차<br/>
            515번 이용 - 신동아 아파트 하차 <br/>
            27 번 이용 - 문학고개 하차<br/>
            </p>
         </div>
      </div>
   
   <script type="text/javascript"
      src="//apis.daum.net/maps/maps3.js?apikey=f718c747e774d2b1a06702e34ab89b24"></script>
   <script>
      var container = document.getElementById('map');
      var options = {
         center : new daum.maps.LatLng(37.438716, 126.675094),
         level : 2,
         mapTypeId : daum.maps.MapTypeId.ROADMAP
      };

      var map = new daum.maps.Map(container, options);

      var markerPosition = new daum.maps.LatLng(37.438716, 126.675094);

      // 마커를 생성합니다
      var marker = new daum.maps.Marker({
         position : markerPosition
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      function zoomIn() {
         // 현재 지도의 레벨을 얻어옵니다
         var level = map.getLevel();

         // 지도를 1레벨 내립니다 (지도가 확대됩니다)
         map.setLevel(level - 1);

         // 지도 레벨을 표시합니다
         displayLevel();
      }

      function zoomOut() {
         // 현재 지도의 레벨을 얻어옵니다
         var level = map.getLevel();

         // 지도를 1레벨 올립니다 (지도가 축소됩니다)
         map.setLevel(level + 1);

         // 지도 레벨을 표시합니다
         displayLevel();
      }
   </script>
</body>
<script>
</script>
</html>