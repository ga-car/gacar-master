<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=87e19089507641031c40df670c4c1fed&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<div id="list-article" class="content scaffold-list" role="main">
		<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>가카예약</h4>
		</div>
						<div class="panel-heading clearfix">

					<div class="avatar avatar-medium clearfix pull-left">
					<!-- 왼쪽 페이지 시작 -->
		<div id="containerLeft"
			style="background: #FFDDDD; height: 750px; width: 35%; float: left; margin: 0 0 10px 0; overflow: scroll;">
			<form name="reserveRight" id="reserveRight"
				enctype="multipart/form-data">

				<c:forEach var="rentacarLatlng" items="${rentacarLatlng}"
					varStatus="stat">
					<table>
						<tr></tr>
					</table>
					<table
						onClick="location.replace='/rentacar/car/reserve.do?car_no=${rentacarLatlng.car_no}'"
						style="cursor: pointer;">
						<tr></tr>
						<tr>
							<td rowspan="3"><img
								src="../resources/carUpload/${rentacarLatlng.car_image}"
								style="width: 70px; height: 70px;"></td>
							<td>차종</td>
							<td>${rentacarLatlng.car_type}</td>
						</tr>
						<tr>
							<td>브랜드</td>
							<td>${rentacarLatlng.car_brand}</td>

						</tr>
						<tr>
							<td>모델명</td>
							<td>${rentacarLatlng.car_name}</td>
						</tr>
					</table>
					<table>
						<tr></tr>
					</table>
				</c:forEach>
			</form>
		</div>
			<!-- 왼쪽 페이지 끝 -->
		<div id="containerRight"
			style="background: #FFCCCC; height: 750px; width: 65%; float: left; margin: 0 0 10px 0;">

<!-- 지도시작 -->
			<div id="map" style="width: 100%; height: 100%;"></div>
			<!-- 검색페이지  -->
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div style="float: left;">
						<select name="car_addr" id="car_addr"
							onChange="javascript:selectEvent(this);">
							<option value="" selected="selected">지역</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
						</select>
					</div>
					<form onsubmit="searchPlaces(); return false;">
						<div style="float: left;">
							키워드 : <input type="text" value="" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</div>
					</form>
					<form onsubmit="searchDate()">
						<div style="float: left;">
							<label for="from">From</label> <input type="text" id="from"
								name="from" value="${from}"> <label for="to">to</label>
							<input type="text" id="to" name="to" value="${to}">
							<button type="submit">검색하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	window.onload = function() {
		if ("${alert}" != "") {
			alert("${alert}");
			javascript: location.href = "/rentacar/car/list.do"
		}
	}
	$(function() {
		var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1,
			minDate : 1
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		})
		to = $("#to").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1,
			minDate : 1
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
	});
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(keyword, placesSearchCB);
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
			if (status === daum.maps.services.Status.OK) {
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new daum.maps.LatLngBounds();
				for (var i = 0; i < data.places.length; i++) {
					bounds.extend(new daum.maps.LatLng(data.places[i].latitude,
							data.places[i].longitude));
				}
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}
	}
	function searchDate() {
		var sdate = document.getElementById('from').value;
		var edate = document.getElementById('to').value;
		if (sdate == "" && edate == "") {
			alert('날짜를 입력해 주세요');
			return false;
		}
	}
	function selectEvent(selectObj) {
		if (selectObj.value != "") {
			var geocoder = new daum.maps.services.Geocoder();
			geocoder.addr2coord(selectObj.value, function(status, result) {
				if (status === daum.maps.services.Status.OK) {
					var coords = new daum.maps.LatLng(result.addr[0].lat,
							result.addr[0].lng);
					panTo(coords.getLat(), coords.getLng());
					document.getElementById("car_addr").selectedIndex = "0";
				}
			});
		}
	}
</script>
<script type="text/javascript">
	var mapCenter = new daum.maps.LatLng("${car_lat}", "${car_lng}")
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : mapCenter, // 지도의 중심좌표
		level : 3
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
	daum.maps.event
			.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
		var sdate = document.getElementById('from').value;
		var edate = document.getElementById('to').value;
		if (sdate == "" && edate == "") {
			return function() {
				location.href = "/rentacar/car/list.do?car_lat=" + lat
						+ "&car_lng=" + lng
			};
		} else {
			return function() {
				location.href = "/rentacar/car/list.do?car_lat=" + lat
						+ "&car_lng=" + lng + "&from=" + sdate + "&to=" + edate
			};
		}
	}
	function panTo(lan, lng) {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new daum.maps.LatLng(lan, lng);
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
</script>
</html>
