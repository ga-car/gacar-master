<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
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
		javascript: location.replace = "/rentacar/car/list.do?car_lat="
				+ car_lat + "&car_lng=" + car_lng;
	}
	function carclause() {
		open(
				"/rentacar/car/carclause.do",
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=800");
	}
	$(document).keydown(function(e) {
		if (e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA") {
			if (e.keyCode === 8) {
				return false;
			}
		}
	});
	window.history.forward(0);
	function reserveChange() {
		var no = "${rentacarOne.car_no}"
		var url = "reserveChangeForm.do?car_no=" + no;
		open(
				url,
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=400");
	}
	function Rradio_OnOff(id) {
		//  <tr> id로 값을 비교한다!
		if (id == "Radio_On") {
			document.all["Radio_On"].style.display = '';
			document.reserveRight.reserve_insure.value = "true";
			document.reserveRight.reserve_price.value = "${Price2}";
		} else {
			document.all["Radio_On"].style.display = 'none';
			document.reserveRight.reserve_insure.value = "false";
			document.reserveRight.reserve_price.value = "${Price1}";
		}
	}
</script>
</head>
<body>
<div id="article" class="content" role="main">
	<div id="containerLeft"
		style="background: #FFDDDD; height: 750px; width: 35%; float: left; margin: 0 0 10px 0;">
		<form name="reserveRight" id="reserveRight"
			enctype="multipart/form-data" method="post" onsubmit="return check()">
			<input type="hidden" name="reserve_car_no" id="reserve_car_no"
				value="${rentacarOne.car_no}"> <input type="hidden"
				name="reserve_mem_no" id="reserve_mem_no" value="${session_num}">
			<input type="hidden" name="reserve_sdate" id="reserve_sdate"
				value="${car_dt1}"> <input type="hidden"
				name="reserve_edate" id="reserve_edate" value="${car_dt2}">
			<input type="hidden" name="reserve_slat" id="reserve_slat"
				value="${rentacarOne.car_lat}"> <input type="hidden"
				name="reserve_slng" id="reserve_slng" value="${rentacarOne.car_lng}">
			<input type="hidden" name="reserve_insure" id="reserve_insure"
				value="true">
			<table>
				<tr>
					<td align="left">결재금액</td>
					<c:choose>
						<c:when test="${Price1 == null && Price2 == null}">
							<td>일정을 입력해주세요.</td>
						</c:when>
						<c:otherwise>
							<td><input type="text" name="reserve_price"
								id="reserve_price" value="${Price2}" size="5"
								style="text-align: right;" readonly>원</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr id="Radio_On" style="display: '';">
					<td align="left" class="input_text">보험료</td>
					<td>하루 ${premium }원</td>
				</tr>
				<tr>
					<td>자동차 대여표준약관</td>
					<td><input type="button" value="전체보기" onclick="carclause()"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="16" cols="26">제1조 (목적)
		이 약관은 (주)그린카, 롯데렌탈(주) (이하 "임대인"/회사라 합니다)와 고객(이하 "임차인"이라 합니다.)
			사이의 대여용자동차 임대차계약(이하 "대여계약"이라 합니다.)상의 권리, 의무에 관한 사항을 규정함을 목적으로 합니다.</textarea></td>
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
	</div>
	<div id="containerRight"
		style="background: #FFCCCC; height: 750px; width: 65%; float: left; margin: 0 0 10px 0;">
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
				<c:when test="${Day == null}">
				</c:when>
				<c:when test="${Day != 0}">
					<tr>
						<td>이용시간</td>
						<td>${Day}일</td>
					</tr>
				</c:when>
			</c:choose>
			<tr>
				<td>차량위치</td>
				<td>${rentacarOne.car_addr}&nbsp;${rentacarOne.car_addr2}</td>
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
	</div>
	</div>
</body>
</html>