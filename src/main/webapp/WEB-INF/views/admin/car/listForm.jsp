<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function delchk() {
		return confirm("삭제하시겠습니까?");
	}

	function onWrite() {
		location.href = 'write.do';
	}
</script>
<!-- <style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style> -->
</head>
<body>
	<div class="row" style="padding-left: 15px; width: 900px;">
		<h1 class="page-header">가카관리 > 가카목록</h1>
	</div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">가카목록 검색, 수정, 삭제 기능하는 페이지입니다.</div>
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<div id="dataTables-example_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row" style="margin-bottom: 5px;">
							<div class="col-sm-6">
								<a href="/rentacar/admin/car/list.do?searchNum=0&isSearch="><button
										type="button" class="btn btn-outline btn-default">전체</button></a>
							</div>
							<div class="col-sm-6" style="text-align: right;">
								<div class="dataTables_info" id="dataTables-example_info"
									role="status" aria-live="polite">총 게시물수 : ${totalCount}</div>
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
												<th style="width: 10%; text-align: center;">차량번호</th>
												<th style="width: 10%; text-align: center;">차종</th>
												<th style="width: 10%; text-align: center;">차량브랜드</th>
												<th style="width: 15%; text-align: center;">차량명</th>
												<th style="width: 5%; text-align: center;">인승</th>
												<th style="width: 40%; text-align: center;">서비스위치</th>
												<th style="width: 10%; text-align: center;">관리</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="rentacarList" items="${rentacarList}"
												varStatus="stat">
												<tr class="gradeA even" role="row">
													<td style="text-align: center; vertical-align: middle;">${rentacarList.car_no}</td>
													<td style="text-align: center; vertical-align: middle;">${rentacarList.car_type}</td>
													<td style="text-align: center; vertical-align: middle;">${rentacarList.car_brand}</td>
													<td style="text-align: center; vertical-align: middle;">${rentacarList.car_name}</td>
													<td style="text-align: center; vertical-align: middle;">${rentacarList.car_pnum}</td>
													<td style="text-align: center; vertical-align: middle;">${rentacarList.car_addr}&nbsp;${rentacarList.car_addr2}<input
														type="hidden" name="car_lat"
														value="${rentacarList.car_lat}" id="car_lat" /> <input
														type="hidden" name="car_lng"
														value="${rentacarList.car_lng}" id="car_lng" />
													</td>
													<td style="text-align: center; vertical-align: middle;"><a
														href="/rentacar/admin/car/modify.do?car_no=${rentacarList.car_no}">변경</a>/<a
														href="/rentacar/admin/car/delete.do?car_no=${rentacarList.car_no}">삭제</a></td>
												</tr>
											</c:forEach>
									</table>
									<c:url var="viewURL3" value="write.do">
										<%-- <c:param name="no" value="${notifyModel.no }" />	 --%>
									</c:url>
									<div class="menu-wrap">
										<button type="button" onclick="onWrite()"
											class="btn btn-primary">가카등록</button>
									</div>
									<div class="paging">
										<div class="paging">${pagingHtml}</div>
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