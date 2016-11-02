<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td><input type="text" id="Search" name="Search"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
			<c:if test="${Search != null}">
				<tr>
					<td>${Search}</td>
				</tr>
				<c:forEach var="rentacarList" items="${rentacarList}"
					varStatus="stat">
					<tr>
						<td>차량번호</td>
						<td><a href="#"
							onClick="panTo(${rentacarList.car_lat},${rentacarList.car_lng})">${rentacarList.car_no}</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</body>
</html>