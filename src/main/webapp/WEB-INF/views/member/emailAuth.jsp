<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			opener.document.joinform.email.readOnly=true;
			opener.document.getElementById("mailauth").value="email변경";
			self.close();
		}
	}

</script>
<c:if test="${email!=null}">
	<center>
		<br />
		<br />
		<h5>인증 번호 7자리를 입력하세요!</h5>
		<div class="container">
			<form method="post" name="authenform">
				<input type="text" name="authnum"><br />
				<br /> <input type="button" value="인증번호 확인" onClick="check()">
				<!-- <input type="submit" class="btn btn-info" value="Submit"> -->
			</form>
		</div>
	</center>
</c:if>

<c:if test="${email2!=null}">
	<br />
	<br />
	<table width=400 border=0 cellspacing=0 cellpadding=5 class="BTABLE">
		<tr align=center>
			<td height=30><font class="BFONT2"><b>${email2}</b> 은(는) 이미 사용 중이거나 사용되었던 E-mail입니다!<br /> 다른 E-mail 계정을 입력하세요.</font></td>
		</tr>
		<tr align=center>
			<td><a href="javascript:this.close();"><input type="button" value="확인"></a></td>
		</tr>
	</table>

</c:if>

<c:if test="${email3!=null}">
	<center>
		<br />
		<br />
		<table width=400 border=0 cellspacing=0 cellpadding=5 class="BTABLE">
			<tr align=center>
				<td height=30><font class="BFONT2"><b>${email3}</b> 은(는) 유효하지 않은 E-mail입니다!<br /> 다른 E-mail 계정을 입력하세요.</font></td>
			</tr>
			<tr align=center>
				<td><a href="javascript:this.close();"><input type="button" value="확인"></a></td>
			</tr>
		</table>
	</center>
</c:if>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>