<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function delchk() {
		return confirm("삭제하시겠습니까?");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css"
	rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css"
	rel="stylesheet">
<title>Q & A 게시판</title>
<style type="text/css">
thead>tr>th {
	text-align: center;
}

tbody>tr>td:nth-child(1) {
	width: 80px;
	text-align: center;
}

tbody>tr>td:nth-child(3) {
	width: 110px;
	text-align: center;
}

tbody>tr>td:nth-child(4) {
	width: 130px;
	text-align: center;
}

tbody>tr>td:nth-child(5) {
	width: 70px;
	text-align: center;
}

tbody>tr:HOVER {
	color: #da8c92;
	cursor: pointer;
}

</style>
</head>


<div class="row" style="padding-left: 15px; width: 900px;">
	<h1 class="page-header">Q&A</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">Q&A 검색, 수정, 삭제 기능하는 페이지입니다.</div>
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom: 5px;">

						<div class="col-sm-6" style="text-align: right;">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">총 게시물수 : ${totalCount}</div>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-12">
		<!-- 답변상태 -->

								<select class="form-control" name="sortNum" onchange="window.open(value,'_self');"
									style="width: 120px; display: inline-block;">
									<option value="/rentacar/admin/qna/list.do?sortNum=null">-답변분류-</option>
									<option value="/rentacar/admin/qna/list.do?sortNum=1">답변 완료</option>
									<option value="/rentacar/admin/qna/list.do?sortNum=2">답변 전</option>
								</select>

							<!-- 글번호 글제목 작성자 작성일 -->
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align: center;">번호</th>
										<th style="width: 40%; text-align: center;">제목 [ 댓글갯수 ]</th>
										<th style="width: 10%; text-align: center;">작성자</th>
										<th style="width: 15%; text-align: center;">등록일자</th>
										<th style="width: 7%; text-align: center;">조회수</th>
										<th style="width: 8%; text-align: center;">관리</th>
									</tr>
								</thead>
								<tbody>
									<!-- 관리자 -->
									<c:if test="${session_email == 'admin'}">

										<c:forEach var="list" items="${list}">
											<c:url var="viewURL" value="view.do">
												<c:param name="no" value="${list.no}" />
											</c:url>
											<tr>
												<!-- 글번호 -->
												<td align="center">${list.no}</td>

												<!-- 제목[댓글수] -->
												<td style="text-align: left; padding-left: 20px;">
													<!-- 제목 옆에 있는 코맨트수가 0이 아니면 댓글 개수가 출력이 된다. --> <c:if
														test="${list.commcount != 0 }">
														<a href="${viewURL}">${list.subject}
															[${list.commcount}]</a>
													</c:if> <!-- 코맨트수가 0이면 갯수가 출력이 안된다. --> <c:if
														test="${list.commcount == 0 }">
														<a href="${viewURL}">${list.subject} </a>
													</c:if> <!-- 관리자가 1개 이상의 댓글을 달면 답변완료라는 이미지가 뜬다 --> <c:if
														test="${list.admin>=1}">
														<img src="/rentacar/resources/images/consult_end.gif">
													</c:if>
												</td>

												<!-- 작성자 -->
												<td align="center">${list.email}</td>
												<!-- 작성일 -->
												<td><fmt:formatDate value="${list.regdate}"
														pattern="YYYY-MM-dd, hh:mm" /></td>
												<!-- 조회수 -->
												<td align="center">${list.readcount}</td>
												<td style="text-align: center; vertical-align: middle;">
													<c:url var="viewURL2" value="delete.do">
														<c:param name="no" value="${list.no }" />
													</c:url> <a href="${viewURL2}"><input type="image"
														src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
														onclick="return delchk()"></a>
												</td>
											</tr>
										</c:forEach>
									</c:if>



								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">${pagingHtml}</div>
					<div class="row">
						<div style="text-align: center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">제목</option>
										<option value="1">내용</option>
										<option value="2">글쓴이</option>

									</select> <input class="form-control" type="text" name="isSearch"
										id="isSearch" /> <span>
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>