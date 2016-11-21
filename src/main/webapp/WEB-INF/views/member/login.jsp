<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> 
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
			if(document.getElementById("suc").value=="suc"||'${session_nick}'!=""){
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
			
			Kakao.init('07c311f880868cd4a01e442d6848026b'); 
 			function getKakaotalkUserProfile(){ 
 				Kakao.API.request({ 
 					url: '/v1/user/me', 
 					success: function(res) { 
 						/* $("#kakao-profile").append(res.properties.nickname); */
 						/* location.replace(""); */
 						location.href = "/rentacar/member/klogin.do?nick="+res.properties.nickname;
 					}, 
 					fail: function(error) { 
 						console.log(error);
 					}
 				}); 
 			} 
 			function createKakaotalkLogin(){ 
 				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove(); 
 				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"카카오계정으로 로그인"});
 				Kakao.Auth.logout(); 
 				loginBtn.click(function(){
 					Kakao.Auth.login({ 
 						persistAccessToken: true, 
 						persistRefreshToken: true, 
 						success: function(authObj) { 
							getKakaotalkUserProfile(); 
 							createKakaotalkLogout(); 
 						}, 
 						fail: function(err) { 
 							console.log(err); 
 						} 
 					}); 
 				}); 
 				$("#kakao-logged-group").prepend(loginBtn) 
 			} 
 			/* function createKakaotalkLogout(){ 
 				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove(); 
 				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"}); 
 				logoutBtn.click(function(){ 
 					Kakao.Auth.logout(); 
 					createKakaotalkLogin(); 
 					$("#kakao-profile").text(""); 
 				}); 
 				$("#kakao-logged-group").prepend(logoutBtn); 
 			} */
 			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""||'${session_nick}'!=""){ 
 				/* document.getElementById("test").innerHTML = '${session_nick}'; */
 				createKakaotalkLogout(); 
 				getKakaotalkUserProfile(); 
 			}else{ 
 				createKakaotalkLogin(); 
 			} 
		});

</script>
</head>
<body>

	<form:form commandName="member" action="login.do" method="post" name="loginform" onsubmit="return valueCheck()">
	<!-- <input type="hidden" name="parentUrl" id="parentUrl"/> -->
	<input type="hidden" id="suc" value="${suc}"/>
	<%-- <input type="text" id="err" value="${err}"/> --%>
	<div class="xans-element- xans-member xans-member-login" >
		<div class="login">
        <h3>회원로그인</h3>
        <fieldset>
			<legend> </legend>
            <label class="email">  
            	*이메일 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="email" name="email" class="inputTypeText" />
           	</label>
            <br/>
            <label class="password">       
         	   *비밀번호 <input type="password"  id="password" name="password" />           
            </label>
           <div class="login_btn">
				<input type="submit" value="로그인"/>
           </div>
           
            <p class="security">
            </p>
            
			<a href="/rentacar/member/emailpwFind.do" title="이메일/비밀번호 찾기" id="postBtn"> 아이디/비밀번호찾기</a>
			
		</fieldset>
		</div>
		<br/>
		<div id="kakao-logged-group" style=" cursor: pointer; background-color: gold; padding:10px; width: 200px; height: auto; text-align:center;"></div>
		<!-- <div id="kakao-profile"></div>  -->
		<br/><font size="2" color="red">*카카오계정으로 로그인 시, 사이트 사용에 제한이 있습니다.<br/>
		(모든 컨텐츠를 이용하시려면 회원로그인 후 이용하세요.)</font>
	</div>

</form:form>

<!-- <script type="text/javascript">

</script> -->
</body>
</html>