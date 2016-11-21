<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko">
<head>
<!-- 재영이가 작업한 부분 시작 -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>GaCar - 같이 가치타 카쉐어링 ~~ 가카</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta property="og:image"
	content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
<link rel="stylesheet" href="/rentacar/resources/css/gacar.css" />
<!--[if lt IE 9]>
            <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
        <![endif]-->
<meta name="layout" content="main" />
<script type="text/javascript"
	src="http://gc.kis.scr.kaspersky-labs.com/2937C990-247C-3A45-876C-A01E499A9025/main.js"
	charset="UTF-8"></script>

<meta name="google-site-verification"
	content="DkGncyJVqYFVekHithdbYnKgklkyKVwruPZ18WUDjr0">

<style type="text/css"></style>
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
<script
	src="https://api.dexplode.com/dFv1pZ/?key=7f52f8c3-852c-f7c9-2daf-271ffe50464a"></script>
<!-- 재영이가 작업한 부분 끝 -->
<!-- 미령이가 작업한 부분 시작 -->
<!-- 로그인 팝업 시작 -->
<script type="text/javascript">
	function loginForm() {
		/* $.simpleBlock('hide'); */
		var url = "/rentacar/member/login.do";
		open(
				url,
				"로그인",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}

	window.onload = function() {
		var invalid = "${invalid}";
		if (invalid == 1) {
			alert("잘못된 접근 경로 입니다.");
		}
	}
</script>
<!-- 로그인 팝업 끝 -->
<!-- 즐겨찾기 시작 -->
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
<!-- 즐겨찾기 끝 -->

<!-- 미령이가 작업한 부분 끝 -->
</head>
<body>
<c:if test='${session_email!=null && session_email!="admin" ||session_nick!=null}'>
<!-- Tocplus -->
<script type="text/javascript">
if('${session_nick}'!=""){
	var nickname = '${session_nick}';
} else{
	var nickname = '${session_name}';
}
tocplusAwayImage='https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQNh9gerNq1DFGPaL-Vmc3Ymf2fVEzTcD7kDud-drVbklUuKW9M';
tocplusTop=1150;
tocplusLeft=5;
tocplusMinimizedImage='http://kr02.tocplus007.com/img/minimized_ko.gif';
tocplusHAlign='right';
tocplusWidth=180;
tocplusHeight=220;
tocplusUserName=nickname;
tocplusFrameColor='#FF5757';
tocplusFloatingWindow=true;
var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%"+"3Cscript src='" + tocplusHost + "kr02.tocplus007.com/chatLoader.do?userId=rrryung' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
</script>
<!-- End of Tocplus -->
</c:if>
	<div class="layout-container">
		<div class="main index">
			<!-- header -->
			<tiles:insertAttribute name="left" />
			<!-- // header -->

			<!-- container -->
			<tiles:insertAttribute name="body" />
			<!-- // container -->
			<!-- footer -->
			<tiles:insertAttribute name="footer" />
			<!-- // footer -->
			<script>
				var contextPath = "", encodedURL = "%2F";
			</script>
			<script
				src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js"
				type="text/javascript"></script>
			<script
				src="http://okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js"
				type="text/javascript"></script>

			<script
				src="http://okky.kr/assets/apps/notification-f91d194e3ba2944508aa3af101c4498a.js"
				type="text/javascript"></script>



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
		</div>
	</div>
</body>
</html>
