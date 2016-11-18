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
		<div class="sidebar ">
			<a href="javascript://" class="sidebar-header"> <i
				class="fa fa-bars sidebar-header-icon"></i>
			</a>
			<h1>
				<div class="logo">
					<a href="/rentacar/main.do"><img
						src="http://okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png"
						alt="OKKY" title="OKKY" /></a>
				</div>
			</h1>
			<div class="nav-user nav-sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="#" onclick="loginForm()"><i
							class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
					<li><a href="/rentacar/member/memberAgree.do" class="link"><i
							class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
				</ul>
			</div>

			<ul class="nav nav-sidebar nav-main">
				<li><a href="/rentacar/car/list.do" class="link"> <i
						class="nav-icon fa fa-database"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">가카예약</span></a></li>
				<li><a href="/rentacar/carpool/list.do" class="link"><i
						class="nav-icon fa fa-code"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">카풀모임</span></a></li>
				<li><a href="#" class="link"><i
						class="nav-icon fa fa-comments"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용안내</span></a></li>
				<li><a href="/rentacar/review/list.do" class="link"><i
						class="nav-icon fa fa-quote-left"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용후기</span></a></li>
				<li><a href="/rentacar/notify/list.do" class="link"><i
						class="nav-icon fa fa-group"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">고객센터</span></a></li>
			</ul>
			<ul class="nav nav-sidebar nav-bottom">
				<li><a href="https://github.com/ga-car/gacar-master"><i
						class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">
							Github Issues</span></a></li>
				<li><a
					href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')">
						<i class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">즐겨찾기
							추가</span>
				</a></li>
			</ul>
		</div>
	</c:if>
	<c:if test='${session_email!=null}'>
		<div class="sidebar ">
			<a href="javascript://" class="sidebar-header"> <i
				class="fa fa-bars sidebar-header-icon"></i>
			</a>
			<h1>
				<div class="logo">
					<a href="/rentacar/main.do"><img
						src="http://okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png"
						alt="OKKY" title="OKKY" /></a>
				</div>
			</h1>
			<h3>
				<div class="avatar-info">
					<a class="nickname" href="/rentacar/mypage/memberConfirm.do">${session_name}&nbsp;님</a>
				</div>
			</h3>
			<div class="nav-user nav-sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="/rentacar/member/logout.do" class="link"><i
							class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그아웃</span></a></li>
					<li><a href="/rentacar/mypage/memberConfirm.do" class="link"><i
							class="fa fa-user"></i> <span class="nav-sidebar-label">정보수정</span></a></li>
				</ul>
			</div>

			<ul class="nav nav-sidebar nav-main">
				<li><a href="/rentacar/car/list.do" class="link"> <i
						class="nav-icon fa fa-database"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">가카예약</span></a></li>
				<li><a href="/rentacar/carpool/list.do" class="link"><i
						class="nav-icon fa fa-code"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">카풀모임</span></a></li>
				<li><a href="#" class="link"><i
						class="nav-icon fa fa-comments"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용안내</span></a></li>
				<li><a href="/rentacar/review/list.do" class="link"><i
						class="nav-icon fa fa-quote-left"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">이용후기</span></a></li>
				<li><a href="/rentacar/notify/list.do" class="link"><i
						class="nav-icon fa fa-group"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">고객센터</span></a></li>
				<li><a href="/rentacar/mypage/mypage.do" class="link"><i
						class="nav-icon fa fa-group"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">마이페이지</span></a></li>
			</ul>
			<ul class="nav nav-sidebar nav-bottom">
				<li><a href="https://github.com/ga-car/gacar-master"><i
						class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">
							Github Issues</span></a></li>
				<li><a
					href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')">
						<i class="fa fa-github"></i> <span
						class="nav-sidebar-label nav-sidebar-category-label">즐겨찾기
							추가</span>
				</a></li>
			</ul>
		</div>
	</c:if>

	<%-- 
	<c:if test='${session_email!=null}'>
		<strong>${session_name}&nbsp;님</strong>
		<a href="/rentacar/member/logout.do">로그아웃</a>
		<br />
		<a
			href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')">즐겨찾기
			추가</a>
		<h4>
			<a href="#">이용안내</a>
		</h4>
		<ul>
			<li><a href="#">이용방법</a></li>
			<li><a href="#">이용요금</a></li>
			<li><a href="#">이용규칙</a></li>
		</ul>
		<h4>
			<a href="/rentacar/car/list.do">가카예약</a>
		</h4>
		<h4>
			<a href="/rentacar/carpool/list.do">카풀모임</a>
		</h4>
		<h4>
			<a href="/rentacar/review/list.do">이용후기</a>
		</h4>
		<h4>
			<a href="/rentacar/notify/list.do">고객센터</a>
		</h4>
		<ul>
			<li><a href="/rentacar/notify/list.do">공지사항</a></li>
			<li><a href="/rentacar/faq/list.do">FAQ</a></li>
			<li><a href="/rentacar/qna/list.do">1:1문의</a></li>

		</ul>
		<h4>
			<a href="/rentacar/mypage/mypage.do">마이페이지</a>
		</h4>
		<ul>
			<li><a href="/rentacar/mypage/memberConfirm.do">개인정보</a></li>
			<li><a href="/rentacar/car/reserveList.do">렌트카 이용현황</a></li>
			<li><a href="/rentacar/mypage/carpool/list.do">카풀 이용현황</a></li>
			<li><a href="/rentacar/mypage/carpool/attendlist.do">카풀 참가 내역</a></li>
			<li><a href="/rentacar/mypage/carpool/applylist.do">카풀 신청자 현황</a></li>
			<li><a href="/rentacar/mypage/mypageList.do">내가쓴글보기</a></li>
			<li><a href="/rentacar/mypage/memberDelPre.do">회원탈퇴</a></li>
		</ul>
	</c:if> --%>
</body>
</html>