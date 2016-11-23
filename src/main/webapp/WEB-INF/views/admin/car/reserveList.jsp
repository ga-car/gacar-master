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
<body>
	<div class="row" style="padding-left: 15px; width: 900px;">
		<h1 class="page-header">가카관리 > 예약목록</h1>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">가카 예약 목록 확인, 취소 기능하는 페이지입니다.</div>
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<div id="dataTables-example_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row" style="margin-bottom: 5px;">
							<div class="col-sm-6">
								<a href="/rentacar/admin/car/reserveList.do?searchNum=0&isSearch="><button
										type="button" class="btn btn-outline btn-default">전체</button></a>
							</div>
							<div class="col-sm-6" style="text-align: right;">
								<div class="dataTables_info" id="dataTables-example_info"
									role="status" aria-live="polite">총 예약수 : ${totalCount}</div>
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
											<th style="width: 25%; text-align: center;">차량정보</th>
											<th style="width: 10%; text-align: center;">대여일</th>
											<th style="width: 10%; text-align: center;">반납일</th>
											<th style="width: 25%; text-align: center;">대여위치</th>
											<th style="width: 5%; text-align: center;">금액</th>
											<th style="width: 10%; text-align: center;">상태</th>
																						</tr>
										</thead>
										<tbody>
											<c:forEach var="reserveList" items="${reserveList}"
												varStatus="stat">
												<tr class="gradeA even" role="row">
													<td style="text-align: center; vertical-align: middle;">
														<c:forEach var="rentacarList" items="${rentacarList}"
															varStatus="stat">
															<c:if
																test="${reserveList.reserve_car_no == rentacarList.car_no}">
								${rentacarList.car_brand}&nbsp;${rentacarList.car_type}&nbsp;${rentacarList.car_name}
							</c:if>
														</c:forEach> (${reserveList.reserve_car_no})
													</td>
													<td style="text-align: center; vertical-align: middle;">${reserveList.reserve_sdate}</td>
													<td style="text-align: center; vertical-align: middle;">${reserveList.reserve_edate}</td>
													<td style="text-align: center; vertical-align: middle;"><c:set
															var="doneLoop" value="false" /> <c:forEach
															var="rentacarList" items="${rentacarList}"
															varStatus="stat">
															<c:if test="${not doneLoop}">
																<c:if
																	test="${reserveList.reserve_slat eq rentacarList.car_lat && reserveList.reserve_slng eq rentacarList.car_lng}">${rentacarList.car_addr}&nbsp;${rentacarList.car_addr2}
						  			<c:set var="doneLoop" value="true" />
																</c:if>
															</c:if>
														</c:forEach></td>
													<td style="text-align: center; vertical-align: middle;">${reserveList.reserve_price}</td>
													<td style="text-align: center; vertical-align: middle;"><c:choose>
															<c:when test="${reserveList.reserve_cancel == 'true'}">
															예약 취소
															</c:when>
															<c:when test="${reserveList.reserve_sdate >= rTime}">
																예약중 /<a href="/rentacar/admin/car/reserveDelete.do?reserve_no=${reserveList.reserve_no}">취소</a>
																</td>
															</c:when>
															<c:when
																test="${reserveList.reserve_sdate <= rTime && reserveList.reserve_edate >= rTime}">
															운행중
															</c:when>
															<c:when test="${reserveList.reserve_edate <= rTime}">
															예약 완료
															</c:when>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
										<div class="paging">${pagingHtml}</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>