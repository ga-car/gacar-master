<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${session_email==null}">
		<div class="sidebar sidebar-category ">
			<a href="javascript://" class="sidebar-header"> <i
				class="fa fa-bars sidebar-header-icon"></i>
			</a>

			<h1>
				<div class="logo">
					<a href="/rentacar/main.do"><img
						src="/rentacar/resources/images/GC_log.png" alt="OKKY"
						title="OKKY" /></a>
				</div>
			</h1>


			<div class="nav-user nav-sidebar">



				<ul class="nav nav-sidebar">
					<li data-toggle="tooltip" data-container="body" title="로그인"><a
						href="#" onclick="loginForm()"><i class="fa fa-sign-in"></i> <span
							class="nav-sidebar-label">로그인</span></a></li>
					<li data-toggle="tooltip" data-container="body" title="회원가입"><a
						href="/rentacar/member/memberAgree.do" class="link"><i
							class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
				</ul>

			</div>

			<ul class="nav nav-sidebar nav-main">

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="가카예약"><a
					href="/rentacar/car/list.do" class="link"><i
						class="nav-icon fa fa-database"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">가카예약</span></a></li>

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="카풀모임"><a
					href="/rentacar/carpool/list.do" class="link"><i
						class="nav-icon fa fa-code"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">카풀모임</span></a></li>

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="이용안내"><a href="#" class="link"><i
						class="nav-icon fa fa-comments"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용안내</span></a></li>

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="이용후기"><a
					href="/rentacar/review/list.do" class="link"><i
						class="nav-icon fa fa-quote-left"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용후기</span></a></li>

				<li class="active" data-toggle="tooltip" data-placement="right"
					data-container="body" title="고객센터"><a
					href="/rentacar/notice/list.do" class="link"><i
						class="nav-icon fa fa-group"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">고객센터</span></a></li>

			</ul>

			<ul class="nav nav-sidebar nav-bottom">
				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="Github Issues"><a
					href="https://github.com/ga-car/gacar-master" class="" target=""><i
						class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">Github
							Issues</span></a></li>
				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="즐겨찾기 추가"><a
					href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')"
					class="" target=""><i class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">즐겨찾기
							추가</span></a></li>
			</ul>
		</div>


		<div class="sidebar-category-nav">
			<h3 class="sub-title">고객센터</h3>
			<ul class="nav">
				<li><a href="/rentacar/notify/list.do" class="link"> <span
						class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span
						class="nav-indicator nav-selected"> <span
							class="nav-selected-dot"></span></span></a></li>

				<li><a href="/rentacar/faq/list.do" class="link"> <span
						class="nav-sidebar-label nav-sidebar-category-label">FAQ</span> <span
						class="nav-indicator nav-selected "> <span
							class="nav-selected-dot"></span></span></a></li>

				<li><a href="/rentacar/qna/list.do" class="link"> <span
						class="nav-sidebar-label nav-sidebar-category-label">1:1문의</span>
						<span class="nav-indicator nav-selected"> <span
							class="nav-selected-dot"></span></span></a></li>

			</ul>
			<div class="special-nav"></div>
		</div>
	</c:if>
	<c:if test='${session_email!=null}'>
		<div class="sidebar sidebar-category ">
			<a href="javascript://" class="sidebar-header"> <i
				class="fa fa-bars sidebar-header-icon"></i>
			</a>

			<h1>
				<div class="logo">
					<a href="/rentacar/main.do"><img
						src="/rentacar/resources/images/GC_log.png" alt="OKKY"
						title="OKKY" /></a>
				</div>
			</h1>


			<div class="nav-user nav-sidebar">



				<ul class="nav nav-sidebar">
					<li data-toggle="tooltip" data-container="body" title="로그인"><a
						href="#" onclick="loginForm()"><i class="fa fa-sign-in"></i> <span
							class="nav-sidebar-label">로그인</span></a></li>
					<li data-toggle="tooltip" data-container="body" title="회원가입"><a
						href="/rentacar/member/memberAgree.do" class="link"><i
							class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
				</ul>

			</div>

			<ul class="nav nav-sidebar nav-main">

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="가카예약"><a
					href="/rentacar/car/list.do" class="link"><i
						class="nav-icon fa fa-database"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">가카예약</span></a></li>

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="카풀모임"><a
					href="/rentacar/carpool/list.do" class="link"><i
						class="nav-icon fa fa-code"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">카풀모임</span></a></li>

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="이용안내"><a href="#" class="link"><i
						class="nav-icon fa fa-comments"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용안내</span></a></li>

				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="이용후기"><a
					href="/rentacar/review/list.do" class="link"><i
						class="nav-icon fa fa-quote-left"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용후기</span></a></li>

				<li class="active" data-toggle="tooltip" data-placement="right"
					data-container="body" title="고객센터"><a
					href="/rentacar/notice/list.do" class="link"><i
						class="nav-icon fa fa-group"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">고객센터</span></a></li>

			</ul>

			<ul class="nav nav-sidebar nav-bottom">
				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="Github Issues"><a
					href="https://github.com/ga-car/gacar-master" class="" target=""><i
						class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">Github
							Issues</span></a></li>
				<li data-toggle="tooltip" data-placement="right"
					data-container="body" title="즐겨찾기 추가"><a
					href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')"
					class="" target=""><i class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">즐겨찾기
							추가</span></a></li>
			</ul>
		</div>


		<div class="sidebar-category-nav">
			<h3 class="sub-title">고객센터</h3>
			<ul class="nav">
				<li><a href="/rentacar/notify/list.do" class="link"> <span
						class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span
						class="nav-indicator nav-selected"> <span
							class="nav-selected-dot"></span></span></a></li>

				<li><a href="/rentacar/faq/list.do" class="link"> <span
						class="nav-sidebar-label nav-sidebar-category-label">FAQ</span> <span
						class="nav-indicator nav-selected "> <span
							class="nav-selected-dot"></span></span></a></li>

				<li><a href="/rentacar/qna/list.do" class="link"> <span
						class="nav-sidebar-label nav-sidebar-category-label">1:1문의</span>
						<span class="nav-indicator nav-selected"> <span
							class="nav-selected-dot"></span></span></a></li>

			</ul>
			<div class="special-nav"></div>
		</div>
	</c:if>
</body>

<script>
	var contextPath = "", encodedURL = "%2Farticles%2Ftech";
</script>
<script
	src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js"
	type="text/javascript"></script>


<script>
	$(function() {
		$('.category-sort-link').click(function(e) {
			$('#category-sort-input').val($(this).data('sort'));
			$('#category-order-input').val($(this).data('order'));
			e.preventDefault();
			$('#category-filter-form')[0].submit();
		});
	});
</script>


<script
	src="http://okky.kr/assets/libs/gwgpot-3b14d378cf04380fd7cf54ccc317c6a9.js"
	type="text/javascript"></script>



<div id="userPrivacy" class="modal" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<div id="userAgreement" class="modal" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>
</html>
