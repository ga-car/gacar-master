<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script>
<body>
	<div id="map" style="width: 100%; height: 700px;"></div>

	<script type="text/javascript">
	
		var mapCenter = new daum.maps.LatLng("${car_lat}", "${car_lng}")
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : mapCenter, // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		<c:forEach var="rentacarList" items="${rentacarList}"
			varStatus="stat">
		// 마커를 생성합니다
		var moveLatLon = new daum.maps.LatLng("${rentacarList.car_lat}",
				"${rentacarList.car_lng}");
		var marker = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : moveLatLon
		// 마커의 위치
		});
		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new daum.maps.InfoWindow({
			content : "${rentacarList.car_no}"
		// 인포윈도우에 표시할 내용
		});
		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		// 이벤트 리스너로는 클로저를 만들어 등록합니다 
		// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
				marker, infowindow));
		daum.maps.event.addListener(marker, 'mouseout',
				makeOutListener(infowindow));
		daum.maps.event.addListener(marker, 'click', clickEvent(
				"${rentacarList.car_lat}", "${rentacarList.car_lng}"));
		</c:forEach>

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
		function clickEvent(lat, lng) {
			return function() {
				location.href = "/rentacar/car/list.do?car_lat=" + lat
						+ "&car_lng=" + lng
			};

		}
		function panTo(lan, lng) {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new daum.maps.LatLng(lan, lng);
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
	</script>
</body>
</html>
