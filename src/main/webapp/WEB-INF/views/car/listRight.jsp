<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
</head>
<body>
	<form>
		<table>
			<c:forEach var="rentacarLatlng" items="${rentacarLatlng}"
				varStatus="stat">
				<tr>
					<td>브랜드</td>
					<td><a
						href="/rentacar/car/reserve.do?car_no=${rentacarLatlng.car_no}">${rentacarLatlng.car_brand}</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>