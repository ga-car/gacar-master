<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value){
			alert("인증번호를 입력하세요!");
			return false;
		}
		if(form.authnum.value!=authNum){
			alert("인증번호가 틀렸습니다. 인증번호를 다시 입력해주세요!");
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum){
			alert("인증이 완료되었습니다.");
			opener.document.getElementById("mailcheck").value="인증완료";
			opener.document.pwFindForm.email.readOnly=true;
			/* opener.document.getElementById("mailauth").value="email변경"; */
			opener.document.getElementById("mailauth").style.display="none";
			self.close();
			/* window.close(); */
		}
	}
	
/* 	function other() {
		
		var form=document.checkEmailForm;
		
		if(form.email.value==""){
			alert("E-mail을 입력해주세요.");
			form.email.focus();
			return false;
		}
		else
			alert("dd")
	} */
</script>
<c:if test="${email!=null}">
<center>
	<br/><br/>
	<h5>인증 번호 7자리를 입력하세요!</h5>
	<div class="container">
		<form method="post" name="authenform">
			<input type="text" name="authnum"><br/><br/>
			<input type="button" value="인증번호 확인" onClick="check()">
			<!-- <input type="submit" class="btn btn-info" value="Submit"> -->
		</form>
	</div>
</center>
</c:if>

<c:if test="${email2!=null}">
<br/><br/>
	<table width=400 border=0 cellspacing=0 cellpadding=5 class="BTABLE">
		<tr align=center>
			<td height=30>
				<%-- <font class="BFONT2"><b>${email2}</b> 은(는) 이미 사용 중인 E-mail입니다!<br/>
				다른 E-mail 계정을 입력하세요.</font> --%>
				<font class="BFONT2"><b>가입되어 있지 않은 이메일 입니다.<br/> 이메일 주소가 기억이 안 날 경우, 이메일 찾기를 먼저해주세요.</b></font>
				
			</td>
		</tr>
		<tr align=center>
			<td>
				<a href="javascript:this.close();"><input type="button" value="확인" ></a>
			</td>
		</tr>
	</table>

<!-- 	<form action="emailAuth.dog" method="post" name="checkEmailForm" onSubmit="return other()">
	<table width=400 border=0 cellpadding=0 cellspacing=0 class="BTABLE">
		<tr>
			<td align=center>
				<font class="BFONT2">다른 아이디를 선택하세요!</font>
				<input type="text" size="10" maxlength="40" name="email" id="email" />
				<input type="submit"  value="중복확인" class="BBUTTON">
			</td>
		</tr>
	</table>
	</form> -->
</c:if>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>