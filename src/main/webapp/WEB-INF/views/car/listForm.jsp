<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script>
<body>
<body>
	<div id="map" style="width: 100%; height: 500px;"></div>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
			level : 3
		// ������ Ȯ�� ����
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
		var positions = [ {
			content : '<div>īī��</div>',
			latlng : new daum.maps.LatLng(33.450705, 126.570677)
		}, {
			content : '<div>���¿���</div>',
			latlng : new daum.maps.LatLng(33.450936, 126.569477)
		}, {
			content : '<div>�Թ�</div>',
			latlng : new daum.maps.LatLng(33.450879, 126.569940)
		}, {
			content : '<div>�ٸ�����</div>',
			latlng : new daum.maps.LatLng(33.451393, 126.570738)
		} ];
		for (var i = 0; i < positions.length; i++) {
			// ��Ŀ�� �����մϴ�
			var marker = new daum.maps.Marker({
				map : map, // ��Ŀ�� ǥ���� ����
				position : positions[i].latlng
			// ��Ŀ�� ��ġ
			});

			// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
			var infowindow = new daum.maps.InfoWindow({
				content : positions[i].content
			// ���������쿡 ǥ���� ����
			});

			// ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
			// �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
			// for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
			daum.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			daum.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

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
	</script>
</body>
</html>
