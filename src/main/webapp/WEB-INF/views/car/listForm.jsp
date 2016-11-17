<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 350px;
	height: 25px;
	margin: 10px 0 30px 17%;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}
</style>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script>
<script type="text/javascript">
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('Ű���带 �Է����ּ���!');
			return false;
		}

		javascript: location.href = "/rentacar/car/list.do?car_addr=" + keyword
	}
	function selectEvent(selectObj) {
		if (selectObj.value != "") {
			javascript: location.href = "/rentacar/car/list.do?car_addr="
					+ selectObj.value
		}
	}
</script>
<body>
	<div id="map" style="width: 100%; height: 100%;"></div>
	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				<form onsubmit="searchPlaces(); return false;">
					<select name="car_addr" onChange="javascript:selectEvent(this);">
						<option value="" selected="selected">����</option>
						<option value="������">������</option>
						<option value="������">������</option>
						<option value="���ϱ�">���ϱ�</option>
						<option value="������">������</option>
						<option value="���Ǳ�">���Ǳ�</option>
						<option value="������">������</option>
						<option value="���α�">���α�</option>
						<option value="��õ��">��õ��</option>
						<option value="�����">�����</option>
						<option value="������">������</option>
						<option value="���빮��">���빮��</option>
						<option value="���۱�">���۱�</option>
						<option value="������">������</option>
						<option value="���빮��">���빮��</option>
						<option value="���ʱ�">���ʱ�</option>
						<option value="������">������</option>
						<option value="���ϱ�">���ϱ�</option>
						<option value="���ı�">���ı�</option>
						<option value="��õ��">��õ��</option>
						<option value="��������">��������</option>
						<option value="��걸">��걸</option>
						<option value="����">����</option>
						<option value="���α�">���α�</option>
						<option value="�߱�">�߱�</option>
						<option value="�߶���">�߶���</option>
					</select> Ű���� : <input type="text" value="" id="keyword" size="15">
					<button type="submit">�˻��ϱ�</button>

				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var mapCenter = new daum.maps.LatLng("${car_lat}", "${car_lng}")
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		mapOption = {
			center : mapCenter, // ������ �߽���ǥ
			level : 3
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

		// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
		var mapTypeControl = new daum.maps.MapTypeControl();

		// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
		// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	</script>
</body>
</html>
