<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="lapComLogin" style="display:none;">

<!-- [s]팝업 -->
	<!-- [s]login-wrap -->
	<div class="login-wrap layer_area">
	<form id="frmComLogin" name="frmComLogin" method="post" action="https://www.greencar.co.kr/doLapLogin.do" onsubmit="return doLoginFrame(this);">

		<input type="hidden" name="curl" value="" />
		<input type="hidden" name="pwdSha1" value="" />

		<!-- [s]cont -->
		<div class="cont">
			<!-- [s]top -->
			<div class="top">
				<h1>로그인</h1>
				<a href="#1" class="close"><img src="/images/popup/btn_close01.gif" alt="닫기" /></a>
			</div>
			<!-- [e]top -->

			<!-- [s]bottom -->
			<div class="bottom">

				<!-- [s]loginbox -->
				<div class="loginbox">
					<dl>
						<dt><label for="loginIdCom">아이디</label></dt>
						<dd><input type="text" class="input_txt01 w130" name="loginId" id="loginIdCom" /></dd>
						<dt class="last"><label for="loginPwdCom">비밀번호</label></dt>
						<dd class="last"><input type="password" title="비밀번호" class="input_txt01 w130 noautocomplete" name="loginPwd" id="loginPwdCom" /></dd>
					</dl>
					<p class="btn"><input type="image" src="/images/popup/btn_login01.gif" alt="로그인" title="로그인" /></p>
				</div>
				<!-- [e]loginbox -->

				<!-- [s]join_txt -->
				<!--  2015-12-23 고도화
				<p class="join_txt">
					<span><a href="/member/index.jsp">회원가입</a></span>
					<span class="last"><a href="#1" onclick="openFindId('T');">아이디 / 비밀번호 찾기</a></span>
				</p>
				-->
				<div class="join_txt01">
<!-- 					<span class="join_chk"><label for="" class="input_check01"><input type="checkbox" id="" name="" value=""  checked=""  /> 자동 로그인</label></span> -->
					<div class="join_find">
						<span><a href="javascript:void(0);" onclick="openFindId('T');">아이디 찾기</a></span>
						<span class="last"><a href="javascript:void(0);" onclick="openFindId('P');">비밀번호 찾기</a></span>
					</div>
				</div>
				<!-- [e]join_txt -->
				<div class="btn_group center pdb20" id="joinLink"><!-- // 버튼추가 (2015-12-16) -->
					<a href="https://www.greencar.co.kr/member/index.jsp" class="btn btn_gm" style="width:306px;"><span>회원가입</span></a>
				</div>

				<!-- [s]snsbox -->

				<div class="snsbox">
					<h4 class="stit03">SNS계정 로그인 </h4>
					<ul class="list">
						<li><a href="javascript:void(0);" onclick="doLapComSNSLogin('FB');"><img src="/images/popup/ico_sns02.gif" alt="페이스북" /></a></li>
						<li><a href="javascript:void(0);" onclick="doLapComSNSLogin('GG');"><img src="/images/popup/ico_sns04.gif" alt="구글 플러스" /></a></li>
						<li><a href="javascript:void(0);" onclick="doLapComSNSLogin('NV');"><img src="/images/popup/ico_sns03.gif" alt="네이버" /></a></li>
						<li><a href="javascript:void(0);" onclick="doLapComSNSLogin('KK');"><img src="/images/popup/ico_sns05.gif" alt="카카오톡" /></a></li>
						<li class="last"><a href="javascript:void(0);" onclick="doLapComSNSLogin('TW');"><img src="/images/popup/ico_sns01.gif" alt="트위터" /></a></li>
					</ul>
				</div>
				<!-- [e]snsbox -->

			</div>
			<!-- [s]bottom -->


		</div>
		<!-- [e]cont -->
	</form>
	</div>
	<!-- [e]login-wrap -->
<!-- [e]팝업 -->

</div>
</body>
</html>