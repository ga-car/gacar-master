<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	window.onload = function() {
		if ("${alert}" != "") {
			alert("${alert}");
			history.back();
		}
	}
	function selectEvent(selectObj) {
		if (selectObj.value != "") {
			javascript: location.href = "/rentacar/car/list.do?car_addr="
					+ selectObj.value
		}
	}
</script>
</head>
<body>
	<form name="reserveRight" id="reserveRight"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><select name="car_addr"
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
				</select></td>
				<td></td>
			</tr>
			<c:forEach var="rentacarLatlng" items="${rentacarLatlng}"
				varStatus="stat">
				<tr>
				<td><img
					src="../resources/carUpload/${rentacarLatlng.car_image}"></td>
					<td>브랜드</td>
					<td><a
						href="/rentacar/car/reserve.do?car_no=${rentacarLatlng.car_no}">${rentacarLatlng.car_brand}</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>