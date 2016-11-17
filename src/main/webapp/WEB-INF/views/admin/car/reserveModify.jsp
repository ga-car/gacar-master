<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	 function rentacarModify(type) {
		 if(type==1)
			 var url = "reserveModifyCar.do";
		open(
				url,
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=400");
	}
</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td colspan="2" align="right">예약내역</td>
			</tr>
			<tr>
				<td>차량</td>
				<td>${rentacarOne.car_brand}&nbsp;${rentacarOne.car_type}&nbsp;${rentacarOne.car_name}(${rentacarOne.car_no})<input
					type="button" value="예약차량변경" onclick="rentacarModify(1)" /></td>
			</tr>

			<tr>
				<td>일정</td>
				<td>${reserveOne.reserve_sdate}&nbsp;~&nbsp;${reserveOne.reserve_edate}<input
					type="button" value="예약일정변경" onclick="reserveModify(2)" /></td>
			</tr>
			<tr>
				<td>보험가입 확인</td>
				<td><input type="radio" name="reserve_insure"
					id="reserve_insure" value="true" checked="checked" /> 가입<input
					type="radio" name="reserve_insure" id="reserve_insure"
					value="false" /> 비가입</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="변경" /></td>
			</tr>
		</table>
	</form>
</body>
</html>