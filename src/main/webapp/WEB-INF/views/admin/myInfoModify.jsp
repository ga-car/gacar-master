<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	function authCheck() {
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

	}
	
	 window.onload = function () {
			/* 1. jQury방식 */
			var pwchange = '${pwchange}';
			
			if(pwchange==-1){
				alert("비밀번호가 이전과 일치합니다.");
			}
			if(pwchange==1){
				alert("비밀번호가 변경되어 메인으로 이동합니다. 다시 로그인해주세요.");
				location.href="/rentacar/main.do";
			}
			/*  var licensetype = '${mem.licensetype}';
			 $("#licensetype").val(licensetype); */
			 
			 /* 2. */
			 //modifyform.licensetype.value='${mem.licensetype}';
			  
			  /* for(var i=0; i < 5; i++){
		         if($("#licensetype option:eq(" + i +")").val() == licensetype){
		            $("#licensetype option:eq(" + i +")").attr('selected', true);
		         }
		      } */
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

		<form:form commandName="mem" action="adminInfoModify.do" method="post" name="modifyform" onSubmit="return authCheck();">
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
								<td><input type="password" class="txt w200" name="password" id="password" /> <font color="red"><form:errors path="password" /></font></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td><input type="password" class="txt w200"  id="password2" /> <font color="red"><form:errors path="password2" /></font></td>
							</tr>
							<tr>
								<th scope="row">접속일</th>
								<td><fmt:formatDate value="${mem.accessdate}" pattern="YY.MM.dd HH:mm" /></td>
							</tr>
					 </tbody>
					</table>
				</div>
			</c:if>
			
			<div class="btnArea" align="center">
				<a href="javascript:history.back()"><input type="button" value="수정취소" /></a> <input type="submit" value="수정완료" />
			</div>
		</form:form>
	</div>
</body>
</html>