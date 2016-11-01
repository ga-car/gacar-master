<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script>
<body onLoad="focus()">
	<form enctype="multipart/form-data" method="post" name="infoinput">
		<table>
			<tr>
				<td colspan="2">
					<center>차량등록폼</center>
				</td>
			</tr>
			<tr>
				<td>차량번호</td>
				<td><input type="text" name="car_no"></td>
			</tr>
			<tr>
				<td>차종</td>
				<td><input type="text" name="car_type"></td>
			</tr>
			<tr>
				<td>차량브랜드</td>
				<td><input type="text" name="car_brand"></td>
			</tr>
			<tr>
				<td>차량명</td>
				<td><input type="text" name="car_name"></td>
			</tr>
			<tr>
				<td>인승</td>
				<td><input type="text" name="car_pnum"></td>
			</tr>
			<tr>
				<td colspan="2">서비스위치</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="car_zipcode"
					name="car_zipcode" value="${rentacarModel.car_zipcode}" readonly />&nbsp;<a
					href="#" onClick="addrSearch()"> 찾기 </a></td>
			</tr>
			<tr>
				<td colspan="2">주 &nbsp;&nbsp;&nbsp;&nbsp;소</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="car_addr"
					name="car_addr" value="${rentacarModel.addr}" readonly />
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="car_addr2"
					name="car_addr2" value="${rentacarModel.addr2}" /><input
					type="hidden" name="car_lat" value="${rentacarModel.car_lat}"
					id="car_lat" /> <input type="hidden" name="car_lng"
					value="${rentacarModel.car_lng}" id="car_lng" /></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="car_image" size="30" value='' />
					<p class="help-block">상품설명 이미지 입니다 1000x1000사이즈 권장</p></td>
			</tr>
			<tr>
				<td>요금</td>
				<td><input type="text" name="car_charge"></td>
			</tr>
			<tr>
				<td><input type="submit"><input type="reset"></td>
			</tr>
		</table>

		<HR>
		<script>
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();

			function addrSearch() {
				var frm = eval("document.infoinput");
				new daum.Postcode(
						{
							oncomplete : function(data) {

								var fullAddr = data.address;
								var zipcode = data.postcode;
								var extraAddr = '';

								if (data.addressType === 'R') {
									if (data.bname !== '') {
										extraAddr += data.bname;
									}
									if (data.buildingName !== '') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									fullAddr += (extraAddr !== '' ? ' ('
											+ extraAddr + ')' : '');
								}

								document.getElementById("car_addr").value = fullAddr;
								document.getElementById("car_zipcode").value = zipcode;
								geocoder
										.addr2coord(
												data.address,
												function(status, result) {
													frm.car_addr2.focus();

													if (status === daum.maps.services.Status.OK) {
														var coords = new daum.maps.LatLng(
																result.addr[0].lat,
																result.addr[0].lng);
														document
																.getElementById("car_lat").value = coords
																.getLat();
														document
																.getElementById("car_lng").value = coords
																.getLng();
													}
												});
							}
						}).open();
			}
		</script>
	</form>
</body>
</html>
