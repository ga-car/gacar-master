<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
 <!-- jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript">
	function authCheck() {
		if (document.getElementById("name").value == "") {
			alert("이름을 입력하세요.");
			return false;
		}

		if (document.getElementById("password").value == "") {
			alert("비밀번호를 입력하세요.");
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
		alert("정보가 변경되었습니다");

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

	window.onload = function() {
		/* 1. jQury방식 */
		var licensetype = '${mem.licensetype}';
		$("#licensetype").val(licensetype);

		/* 2. */
		//modifyform.licensetype.value='${mem.licensetype}';
		/* for(var i=0; i < 5; i++){
		   if($("#licensetype option:eq(" + i +")").val() == licensetype){
		      $("#licensetype option:eq(" + i +")").attr('selected', true);
		   }
		} */
		$(function() {
		    $( "#licensedate" ).datepicker({
		    	 changeMonth: true,
		    	 dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
		    	 monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         changeYear: true,
		         nextText: '다음 달',
		         prevText: '이전 달',
		         showButtonPanel: true, 
		         currentText: '오늘 날짜', 
		         closeText: '닫기', 
		         dateFormat: "yymmdd"
		         
		         
		    });
		});
	}
</script>
<title>Insert title here</title>
</head>

</head>
<body>



	<!-- 메뉴 시작 -->
	<div id="container" style="overflow: scroll; width: 100%; height: 100%;">
		<div class="titleArea">
			<h2>
				<!-- <img src="/pet/resources/images/SkinImg/join.gif" alt="회원가입"> -->
			</h2>
		</div>

		<form:form commandName="mem" action="adminMemModify.do" method="post" name="modifyform" onSubmit="return authCheck();">
			<!-- <div class="xans-element- xans-member xans-member-join"> -->
			<c:if test="${mem.email eq 'admin'}">
				<div class="boardWrite ">
					<h2>관리자정보</h2>
					<div class="boardWrite "></div>
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<form:input type="hidden" class="txt w200" path="num" value="${mem.num}" id="num" name="num" />
								<td>${mem.name}<form:input type="hidden" class="txt w200" path="name" id="name" /> <font color="red"><form:errors path="name" /></font></td>
							</tr>

							<tr>
								<th scope="row">이메일</th>
								<td>${mem.email}<form:input type="hidden" class="txt w200" path="email" value="${mem.email}" id="email" name="email" />
								</td>
							</tr>

							<tr>
								<th scope="row">비밀번호</th>
								<td><form:input type="text" class="txt w200" path="password" name="password" id="password" /> <font color="red"><form:errors path="password" /></font></td>
							</tr>
							<tr>
								<th scope="row">접속일</th>
								<td><fmt:formatDate value="${mem.accessdate}" pattern="YY.MM.dd HH:mm" /></td>
							</tr>

							<form:input type="hidden" class="txt w200" path="zipcode" id="zipcode" readOnly="true" />
							<form:input type="hidden" class="inputTypeText" path="addr" id="addr" readOnly="true" size="60" />
							<form:input type="hidden" class="inputTypeText" path="addr2" id="addr2" placeholder="상세주소" size="60" />
							<form:input type="hidden" class="txt w200" path="phone" onkeyup="numCheck()" maxlength="11" />
							<form:input type="hidden" class="txt w200" path="jumin1" onkeyup="numCheck()" maxlength="6" />
							<form:input type="hidden" class="txt w200" path="jumin2" onkeyup="numCheck()" maxlength="7" />						</tbody>
							<form:input type="hidden" name="licensetype" path="licensetype"/>
							<form:input type="hidden" name="licensenum" path="licensenum" size="28" />
							<form:input type="hidden" name="licensedate" id="licensedate" path="licensedate" size="28" />
							<form:input type="hidden" name="cartype" id="cartype" path="cartype" size="28" />
							<form:input type="hidden" name="carnum" path="carnum" size="28" />
							<form:input type="hidden" name="point" path="point" size="28" />
					 </tbody>
					</table>
				</div>
			</c:if>
			
			<c:if test="${mem.email ne 'admin'}">
				<div class="boardWrite ">
					<h2>기본정보</h2>
					<div class="boardWrite "></div>
					<table border="1" summary="">
						<tbody>
							<tr>
								<form:input type="hidden" class="txt w200" path="num" value="${mem.num}" id="num" name="num" />
								<th scope="row" id="nameTitle">이름</th>
								<td><form:input type="text" class="txt w200" path="name" id="name" /> <font color="red"><form:errors path="name" /></font></td>
							</tr>

							<tr>
								<th scope="row">이메일</th>
								<td>${mem.email}<form:input type="hidden" class="txt w200" path="email" value="${mem.email}" id="email" name="email" />
								</td>
							</tr>

							<tr>
								<th scope="row">비밀번호</th>
								<td><form:input type="text" class="txt w200" path="password" name="password" id="password" /> <font color="red"><form:errors path="password" /></font></td>
							</tr>

							<tr>
								<th scope="row">주소</th>
								<td><form:input type="text" class="txt w200" path="zipcode" id="zipcode" readOnly="true" /> <input type="button" value="우편번호 검색" onclick="zipOpen()" /> <br /> <form:input type="text" class="inputTypeText" path="addr" id="addr" readOnly="true" size="60" /> <br /> <form:input type="text" class="inputTypeText" path="addr2" id="addr2" placeholder="상세주소" size="60" /></td>
							</tr>

							<tr>
								<th scope="row">휴대전화</th>
								<td><form:input type="text" class="txt w200" path="phone" onkeyup="numCheck()" maxlength="11" /> <span class="ibk">" - " 없이 숫자만 입력하세요.</span></td>
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
					<font size="4"><strong>*면허정보</strong></font>
					<table border="1" summary="">

						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허종류</td>
							<td width="740" valign="middle" class="indigo">
								<%-- <input type="text" value="${mem.licensetype}" /> --%> <select name="licensetype" id="licensetype">
									<option value="0">면허선택</option>
									<option value="1종소형">1종소형</option>
									<option value="1종보통">1종보통</option>
									<option value="1종대형">1종대형</option>
									<option value="1종특수">1종특수</option>
									<option value="2종소형">2종소형</option>
									<option value="2종중형">2종중형</option>
									<option value="2종오토">2종오토</option>
									<option value="국제면허증">국제면허증</option>
							</select>
							</td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허번호</td>
							<td width="740" valign="middle" class="indigo"><form:input type="text" name="licensenum" path="licensenum" size="28" /> <font color="red">(예: 서울01-123456-01)</font></td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허유효일자</td>
							<td width="740" valign="middle" class="indigo"><form:input type="text" name="licensedate" id="licensedate" path="licensedate" size="28" /></td>
						</tr>
					</table>
				</div>

				<div class="boardWrite3">
					<font size="4"><strong>*차량정보</strong></font>
					<table border="1" summary="">

						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량종류</td>
							<td width="740" valign="middle" class="indigo"><form:input type="text" name="cartype" id="cartype" path="cartype" size="28" /></td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량번호</td>
							<td width="740" valign="middle" class="indigo"><form:input type="text" name="carnum" path="carnum" size="28" /> <font color="red">(예: 12가 1234)</font></td>
						</tr>
					</table>
				</div>
				<div class="boardWrite4">
					<font size="4"><strong>*이용정보</strong></font>
					<table border="1" summary="">
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">포인트</td>
							<td width="740" valign="middle" class="indigo"><form:input type="text" name="point" path="point" size="28" /></td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">등급</td>
							<td width="740" valign="middle" class="indigo">${mem.memlevel}</td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">이용수</td>
							<td width="740" valign="middle" class="indigo">${mem.usenum}</td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">가입일</td>
							<td width="740" valign="middle" class="indigo"><fmt:formatDate value="${mem.joindate}" pattern="YY.MM.dd HH:mm" /></td>
						</tr>
						<c:if test="${mem.deldate eq null}">
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">접속일</td>
								<td width="740" valign="middle" class="indigo"><fmt:formatDate value="${mem.accessdate}" pattern="YY.MM.dd HH:mm" /></td>
							</tr>
						</c:if>
						<c:if test="${mem.deldate ne null}">
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">탈퇴일</td>
								<td width="740" valign="middle" class="indigo"><fmt:formatDate value="${mem.deldate}" pattern="YY.MM.dd HH:mm" /></td>
							</tr>
						</c:if>
					</table>
				</div>
			</c:if>
			<input type="hidden" class="txt w200" value="${currentPage}" id="currentPage" name="currentPage" />
			<div class="btnArea" align="center">
				<a href="javascript:history.back()"><input type="button" value="수정취소" /></a> <input type="submit" value="수정완료" />
			</div>
		</form:form>
	</div>
</body>
</html>