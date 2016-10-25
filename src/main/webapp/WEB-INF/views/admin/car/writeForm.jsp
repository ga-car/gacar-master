<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
	<table>
		<tr>
			<td colspan="2">
				<center>차량등록폼</center>
			</td>
		</tr>
		<tr>
			<td>차량번호</td>
			<td><input type="text" name="car_no"></td>
		</tr>
		<tr>
			<td>차종</td>
			<td><input type="text" name="car_type"></td>
		</tr>
		<tr>
			<td>차량브랜드</td>
			<td><input type="text" name="car_brand"></td>
		</tr>
		<tr>
			<td>차량명</td>
			<td><input type="text" name="car_name"></td>
		</tr>
		<tr>
			<td>인승</td>
			<td><input type="text" name="car_pnum"></td>
		</tr>
		<tr>
			<td>위도(시작점)</td>
			<td><input type="text" name="car_lat"></td>
		</tr>
		<tr>
			<td>경도(시작점)</td>
			<td><input type="text" name="car_long"></td>
		</tr>
		<tr>
			<td>서비스위치</td>
			<td><input type="text" name="car_local"></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="car_orgname"></td>
		</tr>
		<tr>
			<td>요금</td>
			<td><input type="text" name="car_charge"></td>
		</tr>
		<tr>
			<td><input type="submit"></td>
		</tr>
	</table>
	</form>
</body>
</html>
