<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.onload = function () {
	 var fail=${pwCheck};
		if(fail==-1){
			alert(fail);	
		}
		if(fail==1){
			alert("탈퇴 되었습니다.");
			location.replace("/rentacar/main.do");
			
		}
	}
	
</script>
</head>
<body>
탈퇴 시 포인트와 등급이 초기화 됩니다.
<br/><br/>
탈퇴하시려면 비밀번호를 입력하세요.
<br/>
<form action="memberDel.do" method="post">
	비밀번호 : <input type="password" name="password" id="password">
	<br/>
	<input type="submit" name="confirmPw" value="확인"/>
</form>
</body>
</html>