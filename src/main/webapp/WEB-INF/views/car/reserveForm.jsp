<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	function reserveChange() {
		var no = "${rentacarOne.car_no}"
		var url = "reserveChangeForm.do?car_no=" + no;
		open(
				url,
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
	function Rradio_OnOff(id) {
		//  <tr> id로 값을 비교한다!
		if (id == "Radio_On") {
			document.all["Radio_On"].style.display = '';
			document.reserveRight.reserve_insure.value = "true";
		} else {
			document.all["Radio_On"].style.display = 'none';
			document.reserveRight.reserve_insure.value = "false";
		}
	}
</script>
</head>

<body>
	<table>
		<tr>
			<td colspan="2" align="right">예약내역</td>
		</tr>
		<tr>
			<td>차량</td>
			<td>${rentacarOne.car_brand}&nbsp;${rentacarOne.car_type}&nbsp;${rentacarOne.car_name}(${rentacarOne.car_no})</td>
		</tr>

		<tr>
			<td>일정</td>
			<c:choose>
				<c:when test="${car_dt1 == null && car_dt2 == null }">
					<td>일정을 입력해주세요.<input type="button" value="예약일정입력"
						onclick="reserveChange()" /></td>
				</c:when>
				<c:otherwise>
					<td>${car_dt1}&nbsp;~&nbsp;${car_dt2}<input type="button"
						value="예약일정변경" onclick="reserveChange()" /></td>

				</c:otherwise>
			</c:choose>


		</tr>
		<c:choose>
			<c:when test="${Day == null && Hours == null }">
			</c:when>
			<c:when test="${Day == 0 && Hours != 0 }">
				<tr>
					<td>이용시간</td>
					<td>${Hours}시간</td>
				</tr>
			</c:when>
			<c:when test="${Day != 0 && Hours == 0 }">
				<tr>
					<td>이용시간</td>
					<td>${Day}일간</td>
				</tr>
			</c:when>
			<c:when test="${Day != 0 && Hours != 0 }">
				<tr>
					<td>이용시간</td>
					<td>${Day}일${Hours}시간</td>
				</tr>
			</c:when>
		</c:choose>
		<tr>
			<td>차량위치</td>
			<td>${rentacarOne.car_addr}</td>
		</tr>
		<tr>
			<td>보험가입 확인</td>
			<td><input type="radio" name="reserve_insure"
				id="reserve_insure" value="true" checked="checked"
				onclick="Rradio_OnOff('Radio_On');" /> 가입<input type="radio"
				name="reserve_insure" id="reserve_insure" value="false"
				onclick="Rradio_OnOff('Radio_Off');" /> 비가입 (보험가입시 별도의 비용이 발생할수
				있습니다.)</td>

		</tr>
	</table>

</body>
</html>