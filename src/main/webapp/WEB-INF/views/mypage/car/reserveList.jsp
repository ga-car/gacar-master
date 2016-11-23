<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<title>reserve List</title>
</head>
<body>
	<div class="row" style="padding-left: 15px; width: 900px;">
		<h1 class="page-header">��ī���� > ��ī���</h1>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">������ Ȯ��, ���, �̿��ı� �ۼ� ����ϴ� �������Դϴ�.</div>
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<div id="dataTables-example_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row" style="margin-bottom: 5px;">
							<div class="col-sm-6">
							</div>
							<div class="col-sm-6" style="text-align: right;">
								<div class="dataTables_info" id="dataTables-example_info"
									role="status" aria-live="polite">�� ����� : ${totalCount}</div>
							</div>

						</div>
						<div class="row">
							<div class="col-sm-12">
								<form enctype="multipart/form-data" method="post">
									<table
										class="table table-striped table-bordered table-hover dataTable no-footer"
										id="dataTables-example" role="grid"
										aria-describedby="dataTables-example_info">
										<thead>
											<tr role="row">
												<th style="width: 7%; text-align: center;">�귣��</th>
												<th style="width: 7%; text-align: center;">����</th>
												<th style="width: 10%; text-align: center;">������</th>
												<th style="width: 10%; text-align: center;">������ȣ</th>
												<th style="width: 10%; text-align: center;">�뿩��</th>
												<th style="width: 10%; text-align: center;">�ݳ���</th>
												<th style="width: 20%; text-align: center;">�뿩��ġ</th>
												<th style="width: 7%; text-align: center;">�ݾ�</th>
												<th style="width: 7%; text-align: center;">����</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="reserveList" items="${reserveList}" varStatus="stat">
												<tr class="gradeA even" role="row">
												<c:forEach var="rentacarList" items="${rentacarList}" varStatus="stat">
													<c:if test="${reserveList.reserve_car_no == rentacarList.car_no}">
														<td style="text-align: center; vertical-align: middle;">${rentacarList.car_brand}</td>
														<td style="text-align: center; vertical-align: middle;">${rentacarList.car_type}</td>
														<td style="text-align: center; vertical-align: middle;">${rentacarList.car_name}</td>
													</c:if>
													</c:forEach>
													<td style="text-align: center; vertical-align: middle;"> (${reserveList.reserve_car_no})</td>
													<td style="text-align: center; vertical-align: middle;">${reserveList.reserve_sdate}</td>
													<td style="text-align: center; vertical-align: middle;">${reserveList.reserve_edate}</td>
													<td style="text-align: center; vertical-align: middle;"><c:set var="doneLoop" value="false" /> <c:forEach var="rentacarList" items="${rentacarList}" varStatus="stat">
														<c:if test="${not doneLoop}">
														<c:if test="${reserveList.reserve_slat eq rentacarList.car_lat && reserveList.reserve_slng eq rentacarList.car_lng}">${rentacarList.car_addr}&nbsp;${rentacarList.car_addr2}
						  								<c:set var="doneLoop" value="true" />
														</c:if>
														</c:if>
														</c:forEach>
													</td>
													<td style="text-align: center; vertical-align: middle;">${reserveList.reserve_price}</td>
													<td style="text-align: center; vertical-align: middle;">
													<c:choose>
													<c:when test="${reserveList.reserve_cancel == 'true'}">
													���� ���
													</c:when>
													<c:otherwise>
												<c:choose>
												<c:when test="${reserveList.reserve_sdate >= rTime}">
												������/<a href="/rentacar/car/reserveDelete.do?reserve_no=${reserveList.reserve_no}">���</a></td>
												</c:when>
												<c:when test="${reserveList.reserve_sdate <= rTime && reserveList.reserve_edate >= rTime}">
												������
												</c:when>
												<c:when test="${reserveList.reserve_edate <= rTime}">
												���� �Ϸ�
							 	<div class="menu-wrap pull-right">
									<!-- �α����� �ؾ� ���� ���� ���� -->
								<button type="button" onclick="onWrite(${reserveList.reserve_no})" class="btn btn-primary">�̿��ı� �ۼ�</button>
							</div>
		<!-- �۾��� ��ư �� -->
							</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose></td>
						</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<div class="paging">${pagingHtml}</div>
		</div>
	</form>
<script type="text/javascript">
var onWrite = function(no) {
	location.href = '/rentacar/review/write.do?reserve_no='+no;
};
</script>
</body>
</html>