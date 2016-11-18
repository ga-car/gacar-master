<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
	<div id="list-article" class="content scaffold-list" role="main">
		<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>고객센터 > FAQ</h4>
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
		<!-- 게시판 리스트 시작 -->
		<div class="panel panel-default">
			<ul class="list-group">
				<c:forEach var="list" items="${faqList}">
					<c:url var="viewURL" value="view.do">
						<c:param name="no" value="${list.no }" />
						<c:param name="currentPage" value="${currentPage }" />
					</c:url>
					<li class="list-group-item  list-group-has-note clearfix">
						<div class="list-title-wrapper clearfix">
							<div class="list-tag clearfix">
								<span class="list-group-item-text article-id">${list.no}</span>
							</div>
							<h3 class="list-group-item-heading ">
									${list.subject}
							</h3>
							<ul class="subnav">  
      						<li>${list.content }</li>  
  							</ul>  
						</div>
						<div class="list-summary-wrapper clearfix">
							<div class="list-group-item-summary clearfix">
								<ul>
									<li class=""><i class="item-icon fa fa-eye"></i>${list.readcount}</li>
								</ul>
							</div>
						</div>
						<div class="list-group-item-author clearfix">
							<div class='avatar avatar-list clearfix '>
								<div class="avatar-info">
									${list.email}
									<div class="date-created">
										<fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd" />
									</div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<ul class="list-group">
				<c:if test="${fn:length(faqList) le 0}">
					<br />
					<center>등록된 게시물이 없습니다</center>
					<br />
				</c:if>
			</ul>
		</div>
		<!-- 게시판 리스트 끝 -->
		<!-- 글목록 버튼 시작 -->
		<div class="menu-wrap pull-left">
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</div>
		<!-- 글목록 버튼 끝 -->
		<!-- 글쓰기 버튼 시작 -->
		<div class="menu-wrap pull-right">
			<c:if test="${session_email != null }">
				<!-- 로그인을 해야 글을 쓸수 있음 -->
				<button type="button" onclick="onWrite()" class="btn btn-primary">쓰기</button>
			</c:if>
		</div>
		<!-- 글쓰기 버튼 끝 -->
		<!-- 페이지 넘버 시작 -->
		<div class="paging">${pagingHtml}</div>
		<!-- 페이지 넘버 끝 -->
	</div>
</body>
<%-- <body>
<div class="category_top">
	<ul>
	 	<li class="post1">고객센터</li><li>></li><li class="post2">FAQ</li>			
	</ul>
</div>
	<div id="wrapper">

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<img src="/rentacar/resources/images/SkinImg/2.jpg">
					<strong><font size="6px">FAQ</font></strong>&nbsp;&nbsp;
					<font color="red">FAQ 게시판입니다.</font>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
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
						<th style="width: 7%; text-align:center;"></th>
						<th style="width: ; text-align:center;">제목</th>
						<th style="width: 15%; text-align:center;">작성자</th>										
						<th style="width: 15%; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${faqList}">
					<tr>
						<td><strong><font size="4px" color="pink">Q</font></strong>&nbsp;&nbsp;</td>
						<td style="text-align:left;"><h6>${list.subject}</h6></td>
						<td>${list.email}</td> 
						<td><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd"/></td>
					</tr>
					<tr>
						<td colspan = 5 >${list.content }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>
			<c:if test="${fn:length(faqList) le 0}">
				<br />
				<center>등록된 게시물이 없습니다</center>
				<br />
			</c:if>
			
					<div class="paging" style= "font-size: 15px; text-align:center;">
			${pagingHtml}
		</div>
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

	</div>
</div>



</body> --%>
<script type="text/javascript">

$('.searchOption').val($('.searchOptionVal').val());
var onWrite = function(){
	location.href = 'faq/write.do'; 
};
</script>
</html>
