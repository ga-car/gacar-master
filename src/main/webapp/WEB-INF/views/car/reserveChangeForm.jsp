<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/datetimepicker-master-css/jquery.datetimepicker.css" />
<style type="text/css">
.custom-date-style {
	background-color: red !important;
}
</style>
<script type="text/javascript">
	function windowClose() {
		
		var ev = eval("document.reserveChangeForm");
		var rTime = "${rTime}";
		var no = "${car_no}";
		var car_dt1 = ev.car_dt1.value;
		var car_dt2 = ev.car_dt2.value;
		if (car_dt1 == "") {
			alert("대여시간을 정해주세요");
			ev.car_dt1.focus();
			return false;
		} else if (car_dt2 == "") {
			alert(car_dt1);
			alert("반납시간을 정해주세요");
			ev.car_dt2.focus();
			return false;
		} else if (car_dt1 < rTime) {
			alert("대여시간이 현재 시간보다 빠를 수 없습니다.");
			ev.car_dt1.focus();
			return false;
		}else if (car_dt1 > car_dt2) {
			alert("반납시간이 대여시간보다 빠를 수 없습니다.");
			ev.car_dt2.focus();
			return false;
		}
		opener.location.href = "/rentacar/car/reserve.do?car_no=" + no
				+ "&car_dt1=" + car_dt1 + "&car_dt2=" + car_dt2;
		window.close();
	}
</script>
</head>
<body>
	<form name="reserveChangeForm">
		<table>
			<tr>
				<td>대여</td>
				<td>&nbsp;</td>
				<td>반납</td>
			</tr>
			<tr>
				<td><input type="text" id="car_dt1" name="car_dt1" /></td>
				<td>&nbsp;</td>
				<td><input type="text" id="car_dt2" name="car_dt2" /></td>
			</tr>
			<tr>
				<td colspan="3" align="right"><input type="button" value="결정"
					onclick="windowClose()"><input type="button" value="취소"></td>
			</tr>
		</table>

	</form>
</body>
<script src="../resources/js/datetimepicker-master-js/jquery.js"></script>
<script
	src="../resources/js/datetimepicker-master-js/jquery.datetimepicker.js"></script>
<script>
	var dateToDisable = new Date();
	/* if ((date.getYear() == dateToDisable.getYear())
			&& (date.getMonth() == dateToDisable.getMonth())
			&& (date.getDate() == dateToDisable.getDate())) {
		var t = new Date().getHours()
	} */
	dateToDisable.setDate(dateToDisable.getDate());
	$('#car_dt1')
			.datetimepicker(
					{
						beforeShowDay : function(date) {
							if (date.getYear() < dateToDisable.getYear()
									|| (date.getYear() == dateToDisable
											.getYear() && date.getMonth() < dateToDisable
											.getMonth())
									|| (date.getYear() == dateToDisable
											.getYear()
											&& date.getMonth() == dateToDisable
													.getMonth() && date
											.getDate() < dateToDisable
											.getDate())) {
								return [ false, "" ]
							}
							return [ true, "" ];
						},
					});
	$('#car_dt2')
			.datetimepicker(
					{
						beforeShowDay : function(date) {
							if (date.getYear() < dateToDisable.getYear()
									|| (date.getYear() == dateToDisable
											.getYear() && date.getMonth() < dateToDisable
											.getMonth())
									|| (date.getYear() == dateToDisable
											.getYear()
											&& date.getMonth() == dateToDisable
													.getMonth() && date
											.getDate() <= dateToDisable
											.getDate())) {
								return [ false, "" ]
							}
							return [ true, "" ];
						},
					});
</script>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script>
	$(function() {
		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy/mm/dd',
			firstDay : 0,
			isRTL : false,
			duration : 200,
			showAnim : 'show',
			showMonthAfterYear : true,
			yearSuffix : '년',
			beforeShowDay : disableAllTheseDays
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy/mm/dd',
					changeMonth : true,
					changeYear : true,
					minDate : 1, //오늘날짜 이전 비활성화
					onSelect : function(selectedDate) {

						var option = this.id == "datepicker" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						jQuery("#datepicker, #datepicker1").not(this)
								.datepicker("option", option, date);
						$('input[type=text][id=datepicker]').val(
								$("#datepicker").val())
					}
				});
	});

	$(function() {
		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy/mm/dd',
			firstDay : 0,
			isRTL : false,
			duration : 200,
			showAnim : 'show',
			showMonthAfterYear : true,
			yearSuffix : '년'
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#datepicker1").datepicker(
				{
					dateFormat : 'yy/mm/dd',
					changeMonth : true,
					changeYear : true,
					minDate : 1, //오늘날짜 이전 비활성화

					onSelect : function(selectedDate) {

						var option = this.id == "datepicker" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						jQuery("#datepicker, #datepicker1").not(this)
								.datepicker("option", option, date);
						$('input[type=text][id=datepicker1]').val(
								$("#datepicker1").val());
					}
				});
	});

	function disableAllTheseDays(date) {
		var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
		for (i = 0; i < disabledDays.length; i++) {

			if ($.inArray(y + '/' + (m + 1) + '/' + d, disabledDays) != -1) {
				return [ false ];
			}
		}
		return [ true ];
	}

	var disabledDays = new Array();
	var i = 0;
	<c:forEach var="expiryDate" items="${expiryDate}"
		varStatus="stat">
	disabledDays[i] = "${expiryDate}";
	i++;
	</c:forEach>

	function windowClose() {
		var ev = eval("document.reserveChangeForm");
		var rTime = "${rTime}";
		var no = "${car_no}";
		var car_dt1 = ev.datepicker.value;
		var car_dt2 = ev.datepicker1.value;
		if (car_dt1 == "") {
			alert("대여시간을 정해주세요");
			return false;
		} else if (car_dt2 == "") {
			alert("반납시간을 정해주세요");
			return false;
		} else if (car_dt1 <= rTime) {
			alert("당일은 대여할 수 없습니다.");
			ev.car_dt1.focus();
			return false;
		}
		<c:forEach var="expiryDate" items="${expiryDate}"
				varStatus="stat">
		if (car_dt1 < "${expiryDate}" && car_dt2 > "${expiryDate}") {
			alert("예약이 중복되었습니다.");
			return false;
		}
		</c:forEach>
		opener.location.href = "/rentacar/car/reserve.do?car_no=" + no
				+ "&car_dt1=" + car_dt1 + "&car_dt2=" + car_dt2;
		window.close();
	}
	function windowClose2() {
		window.close();
	}
</script>
</head>
<body>
	<form name="reserveChangeForm">
		<table>
			<tr>
				<td width="325" align="left">
					<div id="datepicker">
						<font class="indigo">시작날짜</font>&nbsp;&nbsp;<input type="text"
							id="datepicker" name="st_day"
							style="border: 0px solid #eee; margin: 10px;" size="20">
					</div>
				</td>
				<td width="325" align="left">
					<div id="datepicker1">
						<font class="indigo">종료날짜</font>&nbsp;&nbsp;<input type="text"
							id="datepicker1" name="end_day"
							style="border: 0px solid #eee; margin: 10px;" size="20">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right"><input type="button" value="결정"
					onclick="windowClose()"><input type="button" value="취소"
					onclick="windowClose2()"></td>
			</tr>
		</table>
	</form>
</body>
<!-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Datepicker - Select a Date Range</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1,
			minDate : 1
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#to").datepicker({
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
</script>
</head>
<body>

	<label for="from">From</label>
	<input type="text" id="from" name="from">
	<label for="to">to</label>
	<input type="text" id="to" name="to">


</body> -->
</html>