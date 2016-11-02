<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!--PG크로스브라우징필수내용 끝-->
<!-- 스마트디자인에서는 JQuery가 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<script type="text/javascript" src="/pet/resources/js/common.js"></script>
<!-- 해당 JS는 플래시를 사용하기 위한 스크립트입니다. -->
<meta name="google-site-verification"
	content="tvlinYJSu0jx2mqhjOag5X0T655GMY0lg1WjIMX7r3c" />
<link rel="canonical" href="http://okidogki.com/member/join.html" />
<link rel="alternate" href="http://m.okidogki.com/member/join.html" />
<link rel="shortcut icon" href="/web/upload/favicon_20150707144445.ico" />
<link rel="stylesheet" type="text/css" href="/pet/resources/css/d.css" />

<script type="text/javascript" src="/pet/resources/js/cid.generate.js"></script>
<script type="text/javascript" src="/pet/resources/js/wcslog.js"></script>
<script type="text/javascript" src="/pet/resources/js/cc.js"></script>
<script type="text/javascript">
	var EC_SDE_SHOP_NUM = 1;
	var SHOP = {
		getLanguage : function() {
			return "ko_KR";
		},
		getCurrency : function() {
			return "KRW";
		},
		getFlagCode : function() {
			return "KR";
		},
		isMultiShop : function() {
			return false;
		},
		isDefaultShop : function() {
			return true;
		},
		getProductVer : function() {
			return 2;
		},
		isSDE : function() {
			return true;
		}
	};
	
/* 	function openZipcode(){
		var url="zipcodeCheckForm.do";
		open(url, "confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
	 */
	function openAuth(){
		if (document.getElementById("email1").value == "") {
	    	  alert("이메일을 입력하세요");
	    	  return;
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




<!-- <link rel="stylesheet" type="text/css" href="/pet/resources/css/c.css" /> -->



<div id="header">

    
   
    
<!-- 메뉴 시작 -->    

  <div id="header">
  

    		<div id="container">
			<div class="contents1">
				


<div class="titleArea">
    <h2><img src="/pet/resources/images/SkinImg/join.gif" alt="회원가입"></h2>
</div>

<form:form commandName="member" action="memberEnd.do" method="post" name="joinform" onSubmit="return authCheck();">
<!-- <div class="xans-element- xans-member xans-member-join"> -->
     
<div class="boardWrite ">
        <h2>기본정보</h2><p class="required">회원가입을 위한 필수입력 항목을 입력해 주십시오.</p><div class="boardWrite ">
        </div><table border="1" summary="">

<!-- <caption>회원가입</caption> -->

</table><table border="1" summary="">

<!-- <caption>회원 기본정보</caption> -->

        <tbody>
        
<tr>
<th scope="row" id="nameTitle">이름</th>
                <td>
                    <form:input type="text" class="txt w200" path="name" />
									<font color="red"><form:errors path="name" /></font>
                </td>
</tr>

<tr>
<th scope="row">이메일</th>
                <td>
                <!-- <input type ="text" name ="email"/>&nbsp;&nbsp;
                <input type ="button" value="인증번호 받기" onclick="openSending(this.form)"/> -->
					<form:input type="text" class="txt w200" path="email"  id="email1" name="email1" />
					<font color="red"><form:errors path="email" /></font>&nbsp;
					<input type ="button" value="이메일인증" id="mailauth" onclick="openAuth()"/>&nbsp;&nbsp;
					<input type="text" name="mailcheck" id="mailcheck" value="인증전" readonly style="background-color:transparent;border:0 solid black;"/>
				<!-- <font color="red" size="2" id="mailcheck" >인증전</font> -->

				</td>
</tr>
<!--             <tr>
<th scope="row">인증번호</th>
                <td><input type ="text" name ="passcode"/>
					<input type ="button" value="아이디 찾기" onclick="incorrect(this.form)"/>
</td>
            </tr> -->

<tr>
<th scope="row">비밀번호</th>
                <td>
                <form:input type="password" class="txt w200" path="password" />
									<font color="red"><form:errors path="password" /></font>
                </td>
            </tr>
<tr>
<th scope="row">비밀번호 확인</th>
                <td>
                <form:input type="password" class="txt w200" path="password2" />
									<font color="red"><form:errors path="password2" /></font>
                </td>
            </tr>            
          
<tr>

<!-- 아래의 내용은 개인정보보호정책상 삭제되면 안되는 부분입니다. 개인을 구별할 수 있는 고유식별정보(주민등록번호, 여권번호, 외국인등록번호, 국제운전면허증등)를 수집 혹은 이용할 경우 꼭 필요한 문구입니다. 삭제시 법적제제를 받을 수 있습니다. --></tr><tr id="identification_check_nonauth" class="displaynone">
<th scope="row">개인정보사용체크</th>
                <td>
                    <p>회사는 회원의 본인확인 및 서비스제공을 위하여 고유식별정보를 수집하여 보관하며 개인정보취급방침에 따라 <br>보유 및 이용합니다.
                    고유식별정보 제공을 거부하는 경우 서비스 이용이 제한됩니다.</p>
                    <p></p>
                </td>
            </tr>
<tr class="">

</tr><tr>
<th scope="row">주소</th>
               <td>
                	<form:input type="text" class="txt w200" path="zipcode"  id="zipcode" readOnly="true"/>
                	<input type="button" value="우편번호 검색" onclick="zipOpen()"/>
                	<%-- <form:input type="button" value="우편번호 검색" onClick="zipOpen()"/> --%>
                	<%-- <form:input type="button" value="우편번호 검색" path="zipcodebt" onClick="zipCode()"/> --%>
				<%--<form:input type="button" value="우편번호 검색" onClick="javascript:location.href='zipcodeCheckForm.do'"/> --%>
                	<br/>
                	<form:input type="text" class="inputTypeText" path="addr"  id="addr" readOnly="true" size="60"/>
                	<br/>
                   	<form:input type="text" class="inputTypeText" path="addr2"  id="addr2" placeholder="상세주소" size="60"/>
                </td>
            </tr>

<tr>
<th scope="row">휴대전화</th>
                <td><form:input type="text" class="txt w200" path="phone" onkeyup="numCheck()" maxlength="11"/>
									<span class="ibk">" - " 없이 숫자만 입력하세요.</span>
				</td>
</tr>
<th scope="row">주민번호</th>
                <td><form:input type="text" class="txt w200" path="jumin1" onkeyup="numCheck()" maxlength="6"/> - 
            	    <form:input type="password" class="txt w200" path="jumin2" onkeyup="numCheck()" maxlength="7"/>
				</td>
</tr>

</tbody>
</table>
</div>
<div class="boardWrite2">
        <h2>부가정보</h2>차량예약 및 카풀 모집을 이용하시려면 입력하세요.<!-- <p class="required">차량예약 및 카풀 모집을 이용하시려면 입력하세요.</p> -->
        <div class="boardWrite2"></div>
        	<table border="1" summary="">
 
				<tr>
					<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허종류</td>
					<td width="740" valign="middle" class="indigo">
					<select name="licensetype">
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
					<td width="740" valign="middle" class="indigo">
						<input type="text" name="licenseno" size="28"/> <font color="red">(예: 서울01-123456-01)</font>
					</td>
				</tr>		
				<tr>
					<td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허유효일자</td>
					<td width="740" valign="middle" class="indigo">
						<input type="text" name="licensedate" id="licensedate" size="28"/></td>
				</tr>
        	</table>
</div>
<div class="boardWrite2"></div>
        	<font size="4"><strong>*차량정보</strong></font>
        	<table border="1" summary="">
 
				<tr>
					<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량종류</td>
					<td width="740" valign="middle" class="indigo">
						<input type="text" name="cartype" id="licensedate" size="28"/></td>
				</tr>
				<tr>
					<td width="150" height="40" valign="middle" align="center" class="body_grey_b">차량번호</td>
					<td width="740" valign="middle" class="indigo">
						<input type="text" name="carnum" size="28"/> <font color="red">(예: 12가 1234)</font>
					</td>
				</tr>		
				
        	</table>
</div>
<div class="btnArea" align="center">		
        <!-- <a href="/pet/main.dog"><img src="/pet/resources/images/SkinImg/btn_member_cancel.gif" alt="회원가입취소"/></a> -->
        <a href="/rentacar/main.do"><input type="button" value="회원가입취소"/></a>
        <!-- <input type="image" src="/pet/resources/images/SkinImg/btn_member_join.gif" name="Submit" value="" style="border:0px;" /> -->
        <input type="submit" value="회원가입"/>
</div>
</div>
</form:form>
			</div>
		</div>
<!-- // container -->
		</div>
	</div>
</body>
</html>





























