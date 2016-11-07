<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function openAuth() {
		if (document.getElementById("email").value == "") {
			alert("이메일을 입력하세요");
			return false;
		}
		if (document.getElementById("mailauth").value == "email변경") {
			document.joinform.email.value = "";
			document.joinform.email.readOnly = false;
			document.getElementById("mailauth").value = "이메일인증";
			document.getElementById("mailcheck").value = "인증전";
		} else {
			var email = document.getElementById("email").value
			var url = "emailAuth.do?email=" + email;

			open(
					url,
					"이메일인증",
					"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
		}
	}

	function authCheck() {
		if (document.getElementById("name").value == "") {
			alert("이름을 입력하세요.");
			return false;
		}
		if (document.getElementById("mailcheck").value == "인증전") {
			alert("이메일 인증을 받으세요.");
			return false;
		}
		if (document.getElementById("password").value == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.getElementById("password2").value == "") {
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
		if (document.getElementById("password2").value != document
				.getElementById("password").value) {
			alert("비밀번호와 비밀번호 확인 값이 다릅니다.");
			return false;
		}
		if (document.getElementById("zipcode").value == ""
				|| document.getElementById("addr").value == "") {
			alert("주소를 입력하세요");
			return false;
		}
		if (document.getElementById("phone").value == "") {
			alert("전화번호를 입력하세요");
			return false;
		}
		if (document.getElementById("jumin1").value == ""
				|| document.getElementById("jumin2").value == "") {
			alert("주민번호를 입력하세요");
			return false;
		}
	}

	function numCheck() {
		if (isNaN(document.getElementById("phone").value)) {
			document.getElementById("phone").value = document
					.getElementById("phone").value.slice(0, -1);
		}
	}

	function zipOpen() {
		var url = "zipcodeCheckForm.do";
		open(
				url,
				"우편번호검색",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<div id="container">
			<div class="contents1">
				<form:form commandName="mem" action="memberEnd.do" method="post" name="joinform" onSubmit="return authCheck();">
					<div class="boardWrite ">
						<h2>기본정보</h2>
						<p class="required">회원가입을 위한 필수입력 항목입니다.</p>
						<div class="boardWrite "></div>
						<table border="1" summary="">
							<tbody>
								<tr>
									<th scope="row" id="nameTitle">이름</th>
									<td><form:input type="text" class="txt w200" path="name" id="name" />
										<font color="red"><form:errors path="name" /></font>
									</td>
								</tr>

								<tr>
									<th scope="row">이메일</th>
									<td><form:input type="text" class="txt w200" path="email" id="email" name="email" />
										<font color="red"><form:errors path="email" /></font>&nbsp; <input type="button" value="이메일인증" id="mailauth" onclick="openAuth()" />&nbsp;&nbsp; 
										<input type="text" name="mailcheck" id="mailcheck" value="인증전" readonly style="background-color: transparent; border: 0 solid black;" /></td>
								</tr>

								<tr>
									<th scope="row">비밀번호</th>
									<td><form:input type="password" class="txt w200" path="password" id="password" /> 
										<font color="red"><form:errors path="password" /></font>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인</th>
									<td><form:input type="password" class="txt w200" path="password2" id="password2" />
										<font color="red"><form:errors path="password2" /></font>
									</td>
								</tr>

								<tr>
									<th scope="row">주소</th>

									<td><form:input type="text" class="txt w200" path="zipcode" id="zipcode" readOnly="true" />
										<input type="button" value="우편번호 검색" onclick="zipOpen()" /><br />
										<form:input type="text" class="inputTypeText" path="addr" id="addr" readOnly="true" size="60" /><br />
										<form:input type="text" class="inputTypeText" path="addr2" id="addr2" placeholder="상세주소" size="60" />
									</td>
								</tr>

								<tr>
									<th scope="row">휴대전화</th>
									<td><form:input type="text" class="txt w200" path="phone" onkeyup="numCheck()" maxlength="11" /> <span class="ibk">" - " 없이 숫자만 입력하세요.</span>
									</td>
								</tr>

								<tr>
									<th scope="row">주민번호</th>
									<td><form:input type="text" class="txt w200" path="jumin1" onkeyup="numCheck()" maxlength="6" /> - <form:input type="password" class="txt w200" path="jumin2" onkeyup="numCheck()" maxlength="7" /></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="boardWrite2">
						<h2>부가정보</h2>
						차량예약 및 카풀 모집을 이용하시려면 입력하세요.
						<div class="boardWrite2"></div>
						<font size="4"><strong>*면허정보</strong></font>
						<table border="1" summary="">
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허종류</td>
								<td width="740" valign="middle" class="indigo"><select name="licensetype">
										<option value="0">면허선택</option>
										<option value="1종소형">1종소형</option>
										<option value="1종보통">1종보통</option>
										<option value="1종대형">1종대형</option>
										<option value="1종특수">1종특수</option>
										<option value="2종소형">2종소형</option>
										<option value="2종중형">2종중형</option>
										<option value="2종오토">2종오토</option>
										<option value="국제면허증">국제면허증</option>
								</select></td>
							</tr>
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허번호</td>
								<td width="740" valign="middle" class="indigo"><input type="text" name="licensenum" size="28" /> <font color="red">(예: 서울01-123456-01)</font></td>
							</tr>
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허유효일자</td>
								<td width="740" valign="middle" class="indigo"><input type="text" name="licensedate" id="licensedate" size="28" /></td>
							</tr>
						</table>
					</div>

					<div class="boardWrite2"></div>
					<font size="4"><strong>*차량정보</strong></font>
					<table border="1" summary="">
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량종류</td>
							<td width="740" valign="middle" class="indigo"><input type="text" name="cartype" id="cartype" size="28" /></td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량번호</td>
							<td width="740" valign="middle" class="indigo"><input type="text" name="carnum" size="28" /> <font color="red">(예: 12가 1234)</font></td>
						</tr>
					</table>
			</div>

			<div class="btnArea" align="center">
				<a href="/rentacar/main.do"><input type="button" value="회원가입취소" /></a> <input type="submit" value="회원가입" />
			</div>
		</div>
		</form:form>

	</div>
</body>
</html>