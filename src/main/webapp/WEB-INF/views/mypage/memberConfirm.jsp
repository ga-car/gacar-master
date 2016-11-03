<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<script type="text/javascript">
	
/* 	function openZipcode(){
		var url="zipcodeCheckForm.do";
		open(url, "confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
	 */
	function openAuth(){
		if (document.getElementById("email").value == "") {
	    	  alert("이메일을 입력하세요");
	    	  return false;
	      }
		if(document.getElementById("mailauth").value == "email변경"){
			document.joinform.email.value="";
			document.joinform.email.readOnly=false;
			document.getElementById("mailauth").value="이메일인증";
			document.getElementById("mailcheck").value="인증전";
		}else{
			var email=document.getElementById("email").value
			var url="emailAuth.do?email=" + email;
		
			open(url, "이메일인증","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
		}
	}
	
/* 	 $('#joinform').validate({
		rule:{
			name:{
				required: true
			},
			email:{
				required: true,
				email: true
			}
		},
		messages:{
			name:{
				required:'이름을 입력해주세요',
			},
			email:{
				required:'email을 입력해주세요',
				email:'이메일 형식에 맞게 입력해주세요'
			}
		}
		 
	 }) */
	function authCheck(){
		if (document.getElementById("name").value == "") {
	    	  alert("이름을 입력하세요.");
	    	  return false;
	      }
		
		
		if(document.getElementById("mailcheck").value=="인증전"){
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
		if (document.getElementById("password2").value != document.getElementById("password").value) {
	    	  alert("비밀번호와 비밀번호 확인 값이 다릅니다.");
	    	  return false;
	      }
		if (document.getElementById("zipcode").value =="" || document.getElementById("addr").value=="") {
	    	  alert("주소를 입력하세요");
	    	  return false;
	      }
		if (document.getElementById("phone").value =="") {
	    	  alert("전화번호를 입력하세요");
	    	  return false;
	      }
		if (document.getElementById("jumin1").value =="" || document.getElementById("jumin2").value =="") {
	    	  alert("주민번호를 입력하세요");
	    	  return false;
	      }

		
	}
	
	function numCheck() {
		if (isNaN(document.getElementById("phone").value)) {
		//	alert("숫자만 입력 가능합니다.");
			document.getElementById("phone").value = document.getElementById("phone").value.slice(0, -1);
		}
	}
	
	function zipOpen(){
		var url="zipcodeCheckForm.do";
		open(url, "우편번호검색","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
	/* $(document).ready(function(){
		$("#check_all").click(function() {
			$("input[name=mycheck]:checkbox").attr("checked", true);
		});
		$("#uncheck_all").click(function() {
			$("input[name=mycheck]:checkbox").attr("checked", false);
		});
		$("#count_check").click(function() {
			alert($("input[name=mycheck]:checkbox:checked").length);
		});
	 */
	
</script>

</head>

<body>
	<div id="header">
		<div id="container">
			<div class="contents1">
				<div class="titleArea">
					<h2>
						<!-- <img src="/pet/resources/images/SkinImg/join.gif" alt="회원가입"> -->
					</h2>
				</div>
				<form:form commandName="mem" action="memberEnd.do" method="post" name="joinform" onSubmit="return authCheck();">
					<div class="boardWrite ">
						<h2>기본정보</h2>
						<div class="boardWrite "></div>
						<table border="1" summary="">
							<tbody>

								<tr>
									<th scope="row" id="nameTitle">이름</th>
									<td>${mem.name}</td>
								</tr>

								<tr>
									<th scope="row">이메일</th>
									<td>${mem.email}</td>
								</tr>

								<tr class="">

								</tr>
								<tr>
									<th scope="row">주소</th>
									<td>우편번호 - ${mem.zipcode} <br /> 상세주소 - ${mem.addr} ${mem.addr2}
									</td>
								</tr>

								<tr>
									<th scope="row">휴대전화</th>
									<td>${mem.phone}</td>
								</tr>
								<tr>
									<th scope="row">주민번호</th>
									<td>${mem.jumin1}- *******</td>
								</tr>

							</tbody>
						</table>
					</div>

					<div class="boardWrite2">
						<h2>부가정보</h2>
						차량예약 및 카풀 모집 이용 시 필요한 사항입니다.
						<!-- <p class="required">차량예약 및 카풀 모집을 이용하시려면 입력하세요.</p> -->
						<div class="boardWrite2"></div>
						<font size="4"><strong>*면허정보</strong></font>
						<table border="1" summary="">

							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허종류</td>
								<td width="740" valign="middle" class="indigo">${mem.licensetype}</td>
							</tr>
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허번호</td>
								<td width="740" valign="middle" class="indigo">${mem.licensenum}</td>
							</tr>
							<tr>
								<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허유효일자</td>
								<td width="740" valign="middle" class="indigo">${mem.licensedate}</td>
							</tr>
						</table>
					</div>

					<div class="boardWrite2"></div>
					<font size="4"><strong>*차량정보</strong></font>
					<table border="1" summary="">

						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량종류</td>
							<td width="740" valign="middle" class="indigo">${mem.cartype}</td>
						</tr>
						<tr>
							<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량번호</td>
							<td width="740" valign="middle" class="indigo">${mem.carnum}</td>
						</tr>

					</table>
			</div>

			<div class="btnArea" align="center">
				<a href="memberModify.do"><input type="button" value="수정" /></a> <a href="memberDelPre.do"><input type="button" value="탈퇴" /></a>
			</div>
		</div>
		</form:form>
	</div>

</body>
</html>