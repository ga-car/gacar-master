<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
	<div id="list-article" class="content scaffold-list" role="main">
		<div class="nav" role="navigation">
			<h4>고객센터 > 공지사항</h4>
			<div class="category-filter-wrapper">
				<form action="/articles/columns" method="get"
					name="category-filter-form" id="category-filter-form">
					<!-- okky 검색엔진 시작 -->
					<div class="category-filter-query pull-right">
						<div class="input-group input-group-sm">
							<input type="search" name="query" class="form-control"
								placeholder="검색어" value="" /> <span class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>

							</span>
						</div>
					</div>
					<!-- okky 검색엔진 끝 -->
					<input type="hidden" name="sort" id="category-sort-input"
						value="id" /> <input type="hidden" name="order"
						id="category-order-input" value="desc" />
				</form>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<!-- /.panel-heading -->

						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="danger">
										<th width="10%">글번호</th>
										<th width="40%">제목</th>
										<th width="20%">작성자</th>
										<th width="20%">작성일</th>
										<th width="10%">조회수</th>
									</tr>
								</thead>
								<%-- <tbody>

									<c:forEach items="${list }" var="list">
										<tr class="odd gradeX" onclick="onView('${list.no}');">
											<td>${list.no }</td>
											<td>${list.subject }</td>
											<td>${list.name }</td>
											<td class="center"><fmt:formatDate
													value="${list.regdate }" pattern="YYYY-MM-dd" /></td>
											<td class="center">${list.readcount }</td>
										</tr>
									</c:forEach>

								</tbody> --%>

								<tbody>
									<c:forEach var="list" items="${noticeList}">
										<c:url var="viewURL" value="detail.do">
											<c:param name="no" value="${list.no }" />
											<c:param name="currentPage" value="${currentPage }" />
										</c:url>
										<tr>
											<td>${list.no}</td>
											<td style="text-align: left;"><a href="${viewURL}">${list.subject}</a>
											</td>
											<td>${list.name}</td>
											<td><fmt:formatDate value="${list.regdate}"
													pattern="yyyy.MM.dd" /></td>
											<td>${list.readcount}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

					</div>
					<div class="menu-wrap">
						<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
					</div>
				</div>

			</div>


			<c:if test="${fn:length(noticeList) le 0}">
				<br />
				<center>등록된 게시물이 없습니다</center>
				<br />
			</c:if>




			<div class="row">
				<div style="text-align: center;">
					<div id="dataTables-example_filter" class="dataTables_filter">



						<form action="">
							<select class="slcte" name="searchNum" id="searchNum">

								<option value="0">제목</option>
								<option value="1">내용</option>
								<option value="2">글쓴이</option>
							</select> <input class="txte" type="text" name="isSearch" id="isSearch" />
							<span class="btn btnC_03 btnP_04 mr10"> <input
								type="submit" value="검색"
								style="font-size: 11px; padding-bottom: 20; vertical-align: middle;" />
							</span>
						</form>
					</div>
				</div>

			</div>
			<div class="paging">${pagingHtml}</div>
		</div>
	</div>



</body>
</html>
