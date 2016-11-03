<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

/* $(document).ready(function(){
	alert("비밀번호 입력하시오.");
	
}); */
window.onload = function () {
	/*  alert("로딩 완료"); */
	 var fail=${pwCheck};
		if(fail==-1){
			alert(fail);
			/* alert("비밀번호가 틀렸습니다."); */
			
		}
		if(fail==1){
			alert("탈퇴 되었습니다.");
			location.replace("/rentacar/main.do");
			
		}
	}

/* 	$(document).ready(function() {
		alert("비밀번호가 틀렸습니다.");
		
	}); */
			
</script>
</head>
<body>
비밀번호를 입력하세요.
<br/>
<form action="memberDel.do" method="post">
	비밀번호 : <input type="password" name="password" id="password">
	<br/>
	<input type="submit" name="confirmPw" value="확인"/>
</form>
</body>
</html>