<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>car List</title>
</head>
<body>
<body>
	<form enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td>차량번호</td>
				<td>차종</td>
				<td>차량브랜드</td>
				<td>차량명</td>
				<td>인승</td>
				<td colspan="2">서비스위치</td>
			</tr>
			<c:forEach var="rentacarList" items="${rentacarList}"
				varStatus="stat">
				<tr>
					<td>${rentacarList.car_no}</td>
					<td>${rentacarList.car_type}</td>
					<td>${rentacarList.car_brand}</td>
					<td>${rentacarList.car_name}</td>
					<td>${rentacarList.car_pnum}</td>
					<td>${rentacarList.car_addr}&nbsp;${rentacarList.car_addr2}<input
						type="hidden" name="car_lat" value="${rentacarList.car_lat}"
						id="car_lat" /> <input type="hidden" name="car_lng"
						value="${rentacarList.car_lng}" id="car_lng" />
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td>${pagingHtml}</td>
			</tr>
			<tr>
				<td colspan="6" align="right"><a href="/rentacar/admin/car/write.do">글쓰기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>