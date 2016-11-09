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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		mapOption = {
			center : mapCenter, // ������ �߽���ǥ
			level : 5
		// ������ Ȯ�� ����
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		<c:forEach var="rentacarList" items="${rentacarList}"
			varStatus="stat">
		// ��Ŀ�� �����մϴ�
		var moveLatLon = new daum.maps.LatLng("${rentacarList.car_lat}",
				"${rentacarList.car_lng}");
		var marker = new daum.maps.Marker({
			map : map, // ��Ŀ�� ǥ���� ����
			position : moveLatLon
		// ��Ŀ�� ��ġ
		});
		// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		var infowindow = new daum.maps.InfoWindow({
			content : "${rentacarList.car_no}"
		// ���������쿡 ǥ���� ����
		});
		// ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
		// �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
		// for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
		daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
				marker, infowindow));
		daum.maps.event.addListener(marker, 'mouseout',
				makeOutListener(infowindow));
		daum.maps.event.addListener(marker, 'click', clickEvent(
				"${rentacarList.car_lat}", "${rentacarList.car_lng}"));
		</c:forEach>

		// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
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
			// �̵��� ���� �浵 ��ġ�� �����մϴ� 
			var moveLatLon = new daum.maps.LatLng(lan, lng);
			// ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
			// ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
			map.panTo(moveLatLon);
		}
	</script>
</body>
</html>
