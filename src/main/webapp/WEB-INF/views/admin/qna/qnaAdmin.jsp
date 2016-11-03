<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript">
	function delchk() {
		return confirm("삭제하시겠습니까?");
	}
</script>
<style type="text/css">
.paging {
	text-align: center;
	height: 32px;
	margin-top: 5px;
	margin-bottom: 15px;
}

.paging a, .paging strong {
	display: inline-block;
	width: 36px;
	height: 32px;
	line-height: 28px;
	font-size: 14px;
	border: 1px solid #e0e0e0;
	margin-left: 5px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	-moz-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
}

.paging a:first-child {
	margin-left: 0;
}

.paging strong {
	color: #fff;
	background: #337AB7;
	border: 1px solid #337AB7;
}

.paging .page_arw {
	font-size: 11px;
	line-height: 30px;
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
						<div class="col-sm-6">
							<a href="/rentacar/admin/qna/qnaAdmin.do?searchNum=0&isSearch="><button
									type="button" class="btn btn-outline btn-default">전체</button></a>
						</div>
						<div class="col-sm-6" style="text-align: right;">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">총 게시물수 : ${totalCount}</div>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-12">

							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>

									<tr role="row">
										<th style="width: 6%; text-align: center;">번호</th>
										<th style="width: 12%; text-align: center;">비밀글 여부</th>
										<th style="width: 40%; text-align: center;">제목 [ 댓글갯수 ]</th>
										<th style="width: 9%; text-align: center;">관리자 답변여부</th>
										<th style="width: 9%; text-align: center;">작성자</th>
										<th style="width: 9%; text-align: center;">등록일자</th>
										<th style="width: 6%; text-align: center;">조회수</th>
										<th style="width: 9%; text-align: center;">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${list}" varStatus="stat">
										<c:url var="viewURL" value="/admin/qna/qnaAdminView.do">
											<c:param name="no" value="${list.no}" />
										</c:url>
										<tr class="gradeA even" role="row">
											<td style="text-align: center; vertical-align: middle;">${list.no}</td>
											<td style="text-align: center; vertical-align: middle;"><c:if
													test="${list.secret == 0}">일반</c:if> <c:if
													test="${list.secret == 1}">비밀</c:if></td>
											<td style="text-align: center; vertical-align: middle;">
												<a href="${viewURL}">${list.subject} [${list.commcount}]</a>
											</td>
											<td style="text-align: center; vertical-align: middle;"><c:if
													test="${list.admin eq 0}">미답변</c:if> <c:if
													test="${list.admin ne 0}">답변완료</c:if></td>
											<td style="text-align: center; vertical-align: middle;">${list.email}</td>
											<td style="text-align: center; vertical-align: middle;"><fmt:formatDate
													value="${list.regdate}" pattern="YY.MM.dd HH:mm" /></td>
											<td style="text-align: center; vertical-align: middle;">${list.readcount}</td>
											<td style="text-align: center; vertical-align: middle;">
												<c:url var="viewURL2" value="qnaAdminDelete.do">
													<c:param name="no" value="${list.no }" />
												</c:url> <a href="${viewURL2}"><input type="image"
													src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
													onclick="return delchk()"></a>
											</td>
										</tr>
									</c:forEach>
									<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(list) le 0}">
										<tr>
											<td colspan="9" style="text-align: center;">등록된 상품이 없습니다</td>
										</tr>
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
