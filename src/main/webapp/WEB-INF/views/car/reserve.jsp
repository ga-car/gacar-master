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
		<div class="nav" role="navigation">
			<h4>가카예약 > 날짜선택</h4>
		</div>
		<div class="panel panel-default clearfix">
		<div class="panel-heading clearfix">
		<!-- 이용약관 시작 -->
		<!-- 이용약관 끝  -->
		</div>
		</div>
	</div>
</body>
</html>
