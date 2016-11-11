<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>