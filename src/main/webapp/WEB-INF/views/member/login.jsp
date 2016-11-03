<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	function emailFind(){
		var url = "emailFind.do";
		open(url, "E-mail찾기","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
		
		
	}
	function pwFind(){
		var url = "pwFind.do";
		open(url, "Password찾기","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
		
	}
	function valueCheck(){
		 if($("#email").val()==""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		if($('#password').val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	}
	
	$(document).ready(function() {

		var err = '${suc}';
			if(document.getElementById("suc").value=="suc"){
				opener.document.location.reload();
				document.getElementById("suc").value="";
				window.close();
			} else if(document.getElementById("suc").value=="err"){
				alert("일치하는 정보가 없습니다.");
				document.getElementById("suc").value="";
			} else if(err=="err2"){
				alert("탈퇴한 회원입니다.");
			} else if(err=="admin"){
				opener.document.location.href = "/rentacar/admin/main.do";
				window.close();				
			} 
		});

</script>
</head>
<body>

	<form:form commandName="member" action="login.do" method="post" name="loginform" onsubmit="return valueCheck()">
		<input type="hidden" id="suc" value="${suc}" />
		<div class="xans-element- xans-member xans-member-login">
			<div class="login">
				<h3>회원로그인</h3>
				<fieldset>
					<legend> </legend>
					<label class="email"> *이메일 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="email" name="email" class="inputTypeText" />
					</label> <br /> <label class="password"> *비밀번호 <input type="password" id="password" name="password" />
					</label>
					<div class="login_btn">
						<input type="submit" value="로그인" />
					</div>

					<p class="security"></p>
					<a href="/rentacar/member/emailpwFind.do" title="이메일/비밀번호 찾기" id="postBtn"> 아이디/비밀번호찾기</a>
				</fieldset>
			</div>
		</div>
	</form:form>
</body>
</html>