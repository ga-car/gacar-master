<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>reserve List</title>
</head>
<body>
<body>
	<form enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td>��������</td>
				<td>�뿩��</td>
				<td>�ݳ���</td>
				<td>�뿩��ġ</td>
				<td>�ݾ�</td>
				<td>����</td>
				<td></td>
			</tr>
			<c:forEach var="reserveList" items="${reserveList}" varStatus="stat">
				<tr>
					<td><c:forEach var="rentacarList" items="${rentacarList}"
							varStatus="stat">
							<c:if test="${reserveList.reserve_car_no == rentacarList.car_no}">
								${rentacarList.car_brand}&nbsp;${rentacarList.car_type}&nbsp;${rentacarList.car_name}
							</c:if>
						</c:forEach> (${reserveList.reserve_car_no})</td>
					<td>${reserveList.reserve_sdate}</td>
					<td>${reserveList.reserve_edate}</td>
					<td><c:set var="doneLoop" value="false" /> <c:forEach
							var="rentacarList" items="${rentacarList}" varStatus="stat">
							<c:if test="${not doneLoop}">
								<c:if
									test="${reserveList.reserve_slat eq rentacarList.car_lat && reserveList.reserve_slng eq rentacarList.car_lng}">${rentacarList.car_addr}&nbsp;${rentacarList.car_addr2}
						  			<c:set var="doneLoop" value="true" />
								</c:if>
							</c:if>
						</c:forEach></td>
					<td>${reserveList.reserve_price}</td>
					<td><c:choose>
							<c:when test="${reserveList.reserve_cancel == 'true'}">
							���� ���
							</c:when>
							<c:when test="${reserveList.reserve_sdate >= rTime}">
							������
							<td>
									<%-- <a
									href="/rentacar/admin/car/reserveModify.do?reserve_no=${reserveList.reserve_no}">����</a>/ --%>
									<a
									href="/rentacar/admin/car/reserveDelete.do?reserve_no=${reserveList.reserve_no}">���</a></td>
							</c:when>
							<c:when
								test="${reserveList.reserve_sdate <= rTime && reserveList.reserve_edate >= rTime}">
							������
							</c:when>
							<c:when test="${reserveList.reserve_edate <= rTime}">
							���� �Ϸ�
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
			<tr>
				<td>${pagingHtml}</td>
			</tr>
		</table>
		<HR>
	</form>
</body>
</html>