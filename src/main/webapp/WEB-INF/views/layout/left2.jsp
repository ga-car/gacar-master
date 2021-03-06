<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginForm() {
		/* $.simpleBlock('hide'); */
		var url = "/rentacar/member/login.do";
		open(
				url,
				"로그인",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
	
	 window.onload = function(){
		var invalid="${invalid}";
		if(invalid==1){
			alert("잘못된 접근으로 가치같이타의 메인으로 이동되었습니다.");
		}
	} 
</script>

<script type="text/javascript">
	function bookmarksite(url, title) {
		// Internet Explorer
		if (document.all || window.external) {
			/* alert(url); */
			/*  alert(title);  */
			window.external.AddFavorite(url, title);
		}
		// Google Chrome
		else if (window.chrome) {
			alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
		}
		// Firefox
		else if (window.sidebar) // firefox 
		{
			window.sidebar.addPanel(title, url, "");
		}
		// Opera
		else if (window.opera && window.print) { // opera 
			var elem = document.createElement('a');
			elem.setAttribute('href', url);
			elem.setAttribute('title', title);
			elem.setAttribute('rel', 'sidebar');
			elem.click();
		}
	}
</script>

</head>
<body>

	<c:if test="${session_email==null}">
		<a href="/rentacar/member/memberAgree.do" class="log">회원가입</a>
		<!-- 팝업용 로그인 -->
		<a href="#" onclick="loginForm()">로그인</a>
		<br />
		<a href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')">즐겨찾기 추가</a>
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
	</c:if>

	<c:if test='${session_email!=null}'>
		<strong>${session_name}&nbsp;님</strong>
		<a href="/rentacar/member/logout.do">로그아웃</a>
		<br />
		<a href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '가치같이타')">즐겨찾기 추가</a>
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
			<li><a href="#">카풀 이용현황</a></li>
			<li><a href="/rentacar/mypage/mypageList.do">내가쓴글보기</a></li>
			<li><a href="/rentacar/mypage/memberDelPre.do">회원탈퇴</a></li>
		</ul>
	</c:if>
</body>
</html>