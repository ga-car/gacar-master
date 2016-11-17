<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script>
<script type="text/javascript">
	function check() {

		var f = document.writeFrom; //문서.Form name="";
		if (f.car_no.value == "") {
			alert("차량번호를 입력해주세요.");
			f.car_no.focus();
			return false;
		}
		<c:forEach var="rentacarList" items="${rentacarList}"
			varStatus="stat">
		if (f.car_no.value == "${rentacarList.car_no}") {
			alert("이미 등록된 차량입니다.");
			f.car_no.focus();
			return false;
		}
		</c:forEach>
		if (f.car_type.value == "") {
			alert("차종를 입력해주세요.");
			f.car_type.focus();
			return false;
		}
		if (f.car_brand.value == "") {
			alert("브랜드를 입력해주세요.");
			f.car_brand.focus();
			return false;
		}
		if (f.car_name.value == "") {
			alert("차량명를 입력해주세요.");
			f.car_name.focus();
			return false;
		}
		if (f.car_pnum.value == "") {
			alert("탑승인원을 입력해주세요.");
			f.car_pnum.focus();
			return false;
		}
		if (f.car_zipcode.value == "" || f.car_addr.value == "") {
			alert("주소를 상세히 입력해주세요.");
			f.car_addr2.focus();
			return false;
		}
		if (f.car_image.value == "") {
			alert("이미지를 등록해주세요.");
			f.car_image.focus();
			return false;
		}
		if (f.car_charge.value == "") {
			alert("요금을 입력해주세요.");
			f.car_charge.focus();
			return false;
		}
	}
	function onlyNumber(event) {
		var key = window.event ? event.keyCode : event.which;

		if ((event.shiftKey == false)
				&& ((key > 47 && key < 58) || (key > 95 && key < 106)
						|| key == 35 || key == 36 || key == 37 || key == 39 // 방향키 좌우,home,end  
						|| key == 8 || key == 46)) {
			return true;
		} else {
			return false;
		}
	};
</script>
</head>
<body onLoad="focus()">
	<form enctype="multipart/form-data" method="post" name="writeFrom"
		onsubmit="return check()">
		<table>
			<tr>
				<td colspan="2" align="center">
					<center>차량등록폼</center>
				</td>
			</tr>
			<tr>
				<td align="right">차량번호</td>
				<td><input type="text" name="car_no"></td>
			</tr>
			<tr>
				<td align="right">차종</td>
				<td><select name="car_type"><option value=""
							selected="selected"></option>
						<option value="경형">경형</option>
						<option value="소형">소형</option>
						<option value="준중형">준중형</option>
						<option value="중형">중형</option>
						<option value="대형">대형</option>
						<option value="스포츠카">스포츠카</option>
				</select></td>
			</tr>
			<tr>
				<td align="right">브랜드</td>
				<td><input type="text" name="car_brand"></td>
			</tr>
			<tr>
				<td align="right">차량명</td>
				<td><input type="text" name="car_name"></td>
			</tr>
			<tr>
				<td align="right">인승</td>
				<td><select name="car_pnum"><option value=""
							selected="selected"></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center">서비스위치</td>
			</tr>
			<tr>
				<td align="right">주 &nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td><input type="text" size="15" id="car_zipcode"
					name="car_zipcode" value="${rentacarModel.car_zipcode}" readonly />&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onClick="addrSearch()"> 찾기 </a></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" size="50" id="car_addr" name="car_addr"
					value="${rentacarModel.addr}" readonly />
			</tr>
			<tr>
				<td></td>
				<td><input type="text" size="50" id="car_addr2"
					name="car_addr2" value="${rentacarModel.addr2}" /><input
					type="hidden" name="car_lat" value="${rentacarModel.car_lat}"
					id="car_lat" /> <input type="hidden" name="car_lng"
					value="${rentacarModel.car_lng}" id="car_lng" /></td>
			</tr>
			<tr>
				<td align="right">이미지</td>
				<td><input type="file" name="car_image" size="30" value='' />
					<p class="help-block">상품설명 이미지 입니다 1000x1000사이즈 권장</p></td>
			</tr>
			<tr>
				<td align="right">요금</td>
				<td><input type="text" name="car_charge"
					style="ime-mode: disabled;" onkeydown="return onlyNumber(event)"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록" />&nbsp;&nbsp;<input
					type="reset" value="다시" />&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><a
					href="/rentacar/admin/car/list.do">목록</a></td>
			</tr>
		</table>

		<HR>
		<script>
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();

			function addrSearch() {
				var frm = eval("document.writeFrom");
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
