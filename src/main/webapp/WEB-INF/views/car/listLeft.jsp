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
			<c:forEach var="rentacarLatlng" items="${rentacarLatlng}"
				varStatus="stat">
				<tr>
					<td>�귣��</td>
					<td>${rentacarLatlng.car_brand}</td>
				</tr>
				<%-- <tr>
						<td colspan="2"><a href="#"
							onClick="panTo(${rentacarLatlng.car_lat},${rentacarLatlng.car_lng})">${rentacarLatlng.car_addr}
								${rentacarLatlng.car_addr2}</a></td>
					</tr> --%>
			</c:forEach>
		</table>
	</form>
</body>
</html>