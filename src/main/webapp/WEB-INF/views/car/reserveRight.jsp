<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check() {

		var f = document.reserveRight; //문서.Form name="";

		if (f.reserve_mem_no.value == "") {
			alert("로그인 해주세요.");
			return false;
		}
		if (f.reserve_sdate.value == "" || f.reserve_edate.value == "") {
			alert("일정을 입력해주세요.");
			return false;
		}
	}
	function Cancel() {
		var car_lat = "${rentacarOne.car_lat}";
		var car_lng = "${rentacarOne.car_lng}";
		javascript: location.href = "/rentacar/car/list.do?car_lat=" + car_lat
				+ "&car_lng=" + car_lng;
	}
</script>
</head>
<body>
	<form name="reserveRight" id="reserveRight"
		enctype="multipart/form-data" method="post" onsubmit="return check()">
		<input type="hidden" name="reserve_car_no" id="reserve_car_no"
			value="${rentacarOne.car_no}"> <input type="hidden"
			name="reserve_mem_no" id="reserve_mem_no" value="${session_num}">
		<input type="hidden" name="reserve_sdate" id="reserve_sdate"
			value="${car_dt1}"> <input type="hidden" name="reserve_edate"
			id="reserve_edate" value="${car_dt2}"> <input type="hidden"
			name="reserve_slat" id="reserve_slat" value="${rentacarOne.car_lat}">
		<input type="hidden" name="reserve_slng" id="reserve_slng"
			value="${rentacarOne.car_lng}"> <input
			type="hidden" name="reserve_insure" id="reserve_insure" value="true">
		<table>
			<tr>
				<td align="left">결재금액</td>
				<c:choose>
					<c:when test="${Price1 == null && Price2 == null}">
						<td>일정을 입력해주세요.</td>
					</c:when>
					<c:otherwise>
						<td><input type="text" name="reserve_price"
							id="reserve_price" value="${Price1}" readonly>원</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr id="Radio_On" style="display: '';">
				<td align="left" class="input_text">보험료</td>
				<td>시간당 400원</td>
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