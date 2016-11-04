<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	admin left
	<br />
	<strong>관리자님</strong>
	<a href="/rentacar/member/logout.do">로그아웃</a>
	<br />
	<h4>
		<a href="#">회원관리</a>
	</h4>
	<ul>
		<li><a href="#">회원목록</a></li>
	</ul>

	<h4>
		<a href="#">이용안내</a>
	</h4>
	<ul>
		<li><a href="#">이용방법</a></li>
		<li><a href="#">이용요금</a></li>
		<li><a href="#">이용규칙</a></li>
	</ul>

	<h4>
		<a href="/rentacar/admin/car/list.do">가카관리</a>
	</h4>
	<ul>
		<li><a href="/rentacar/admin/car/list.do">가카목록</a></li>
		<li><a href="/rentacar/admin/car/write.do">가카등록</a></li>
	</ul>

	<h4>
		<a href="#">카풀모임관리</a>
	</h4>

	<h4>
		<a href="/rentacar/admin/review/list.do">이용후기관리</a>
	</h4>

	<h4>
		<a href="/rentacar/notify/list.do">고객센터관리</a>
	</h4>
	<ul>
		<li><a href="/rentacar/admin/notify/list.do">공지사항</a></li>
		<li><a href="/rentacar/admin/faq/list.do">FAQ</a></li>
		<li><a href="#">1:1문의</a></li>
	</ul>

</body>
</html>