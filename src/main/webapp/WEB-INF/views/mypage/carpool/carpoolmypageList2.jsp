<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<!-- <script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet">
<title>Insert title here</title>
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

.menu-wrap {
	text-align: right;
}

.form-wrap {
	text-align: center;
}

#page-wrapper {
	margin: auto;
}
</style> -->
</head>
<body>
	<div class="category_top">
		<ul>
			<li class="post1">MyPage</li>
			<li>>CarPool</li>
			<li class="post2">>>내가 쓴 글</li>

		</ul>
	</div>
	<div id="wrapper">

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<img src="/rentacar/resources/images/SkinImg/2.jpg"> <strong><font
							size="6px">CarPool</font></strong>&nbsp;&nbsp; <font color="red">내가 쓴 글</font>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
				<!-- <div class="row">
				<div style="text-align: center;">
					<div id="dataTables-example_filter" class="dataTables_filter">
						<form action="">
						<input type="hidden" name="searchNum" id="searchNum" value="0">
						<input class="txte" type="text" name="isSearch" id="isSearch" placeholder="출발지"  />
						<input class="txte" type="text" name="isSearch" id="isSearch" placeholder="도착지" />
						<input type="submit" value="검색"/> 
						</form>
					</div>
				</div>
			</div> -->
			<!-- /.row -->
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
										<th width="10%">제목</th>
										<th width="20%">출발지</th>
										<th width="20%">도착지</th>
										<th width="10%">작성자</th>
										<th width="20%">작성일</th>
										<th width="10%">조회수</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="list" items="${carpoolList}">
										<c:url var="viewURL" value="detail.do">
											<c:param name="no" value="${list.no }" />
											<c:param name="currentPage" value="${currentPage }" />
										</c:url>
										<tr>
											<td>${list.no}</td>
											<td style="text-align: left;"><a href="${viewURL}">${list.subject}</a>
											<td style="text-align: left;">${list.saddr}</td>
											<td style="text-align: left;">${list.eaddr}</td>
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
						<button type="button" onclick="onWrite()" class="btn btn-primary">쓰기</button>

						<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
					</div>
				</div>
			</div>
			<c:if test="${fn:length(carpoolList) le 0}">
				<br />
				<center>등록된 게시물이 없습니다</center>
				<br />
			</c:if>
			<div class="paging" align="center">${pagingHtml}</div>
		</div>
	</div>
</body>
 <script type="text/javascript">
	$('.searchOption').val($('.searchOptionVal').val());
	var onWrite = function() {
		location.href = 'write.do';
	};
	var onList = function(){
		location.href='list.do'
	};
</script> 
</html>
