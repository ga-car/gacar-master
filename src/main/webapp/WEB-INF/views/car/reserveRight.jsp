<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function Cancel() {
		var car_lat = "${rentacarOne.car_lat}";
		var car_lng = "${rentacarOne.car_lng}";
		javascript: location.href = "/rentacar/car/list.do?car_lat=" + car_lat
				+ "&car_lng=" + car_lng;
	}
</script>
</head>
<body>
	<form action="/rentacar/reserve/complete.do" enctype="multipart/form-data" method="post">
	<input type="hidden" name="reserve_car_no" id="reserve_car_no" value="${rentacarOne.car_brand}">
	<input type="hidden" name="reserve_mem_no" id="reserve_mem_no" value="${session_num}">
	<input type="hidden" name="reserve_sdate" id="reserve_sdate" value="${car_dt1}">
	<input type="hidden" name="reserve_edate" id="reserve_edate" value="${car_dt2}">
	<input type="hidden" name="reserve_slat" id="reserve_slat" value="${rentacarOne.car_lat}">
	<input type="hidden" name="reserve_slng" id="reserve_slng" value="${rentacarOne.car_lng}">
	<input type="hidden" name="reserve_price" id="reserve_price" value="${Price}">
		<table>
			<tr>
				<td>결재금액</td>
				<c:choose>
					<c:when test="${Price == null }">
						<td>일정을 입력해주세요.</td>
					</c:when>
					<c:otherwise>
						<td>${Price}원</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>자동차 대여표준약관</td>
				<td><input type="button" value="전체보기"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="16" cols="26"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="예약/결제"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="취소"
					onclick="Cancel()"></td>
			</tr>
		</table>
	</form>
</body>
</html>