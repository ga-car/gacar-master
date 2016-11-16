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
			javascript: location.href = "/rentacar/car/list.do"
		}
	}
</script>
</head>
<body>
	<form name="reserveRight" id="reserveRight"
		enctype="multipart/form-data">

		<c:forEach var="rentacarLatlng" items="${rentacarLatlng}"
			varStatus="stat">
			<table>
				<tr></tr>
			</table>
			<table
				onClick="location.href='/rentacar/car/reserve.do?car_no=${rentacarLatlng.car_no}'"
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
</body>
</html>