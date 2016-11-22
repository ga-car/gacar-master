<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
	<div id="article" class="content" role="main">
	<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>고객센터 > 1:1문의 > 답변확인</h4>
			<!-- 게시판 검색 시작 -->
			<div class="category-filter-wrapper">
				<div class="category-filter-wrapper">
					<form action="" name="category-filter-form"
						id="category-filter-form">
						<div class="category-filter-query pull-right">
							<div class="input-group input-group-sm">
								<input type="text" name="isSearch" id="isSearch"
									class="form-control" placeholder="검색어" value="" /> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-default">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</div>
						<ul class="list-sort pull-left">
							<li><select name="searchNum" id="searchNum">
									<option value="0">제목</option>
									<option value="1">내용</option>
									<option value="2">글쓴이</option>
							</select></li>

						</ul>
						<input type="hidden" name="sort" id="category-sort-input"
							value="id" /> <input type="hidden" name="order"
							id="category-order-input" value="desc" />
					</form>
				</div>
			</div>
			<!-- 게시판 검색 끝 -->
		</div>
		<!-- 상단 끝 -->
		<!--게시판 뷰 시작-->
		<div class="panel panel-default clearfix">
			<!--작성 정보 시작-->
			<div class="panel-heading clearfix">
				<div class='avatar avatar-medium clearfix pull-left'>
					<!-- 제목 -->
					<h2 class="panel-title">${notifyModel.subject }</h2>
				</div>
				<div class="content-identity pull-right">

							<!-- 작성자명 -->
							<div class="content-identity-count">${notifyModel.name }</div>

							<!-- 조회수 -->
							<div class="content-identity-count">
								<i class="fa fa-eye"></i> ${notifyModel.readcount}
							</div>


							<!-- 작성일 -->
							<div class="content-identity-count">
								<span class="timeago"> <fmt:formatDate
										value="${notifyModel.regdate }" pattern="yy-MM-dd" />
								</span>
							</div>

	
				</div>
				<!--작성자 정보 끝 -->
			</div>
			<!--작성 정보 끝-->
			<div class="content-container ">
				<div id="content-body" class="panel-body pull-left">
					<!-- 글내용 -->
					<article class="content-text">${notifyModel.content }</article>

				</div>
			</div>
		</div>
		<form class="viewForm" method="post">
			<input type="hidden" name="${notifyModel.no }" />
			<%-- <input type="hidden" name="seq" value="${item.seq }" /> --%>
			<c:if test="${session_member_id == 'admin' }">
				<button type="button" onclick="onModify(${notifyModel.no })"
					class="btn btn-primary">수정</button>
			</c:if>
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</form>
		<!--게시판 뷰 끝-->
	</div>
</body>


<script type="text/javascript">
/* 	var onModify = function(no){
		var form = $('.viewForm')[0];
		form.action = 'noticeModify.dog?no='+no;
		form.submit();
	}; */
	
	var onList = function(){
		location.href='list.do'
	};
</script>
</html>

