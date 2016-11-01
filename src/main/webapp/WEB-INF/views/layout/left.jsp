<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function loginForm(){
		/* $.simpleBlock('hide'); */
		var url="/rentacar/member/login.do";
		open(url, "로그인","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
</script>
</head>
<body>
왼쪽
<%-- <a href="${contextPath}/CarShare/member/login.do" class="log">로그인</a> --%>
<!-- <a href="/rentacar/member/memberAgree.do" class="log">회원가입</a> -->

<c:if test="${session_email==null}">

	<a href="/rentacar/member/memberAgree.do" class="log">회원가입</a>
	<!-- 팝업용 로그인 -->
	<a href="#" onclick="loginForm()">로그인</a>
</c:if>

<c:if test="${session_email!=null}">
	<strong>${session_name}&nbsp;님</strong>
	<a href="/rentacar/member/logout.do">로그아웃</a> 
</c:if>


<!-- 페이지 이동 로그인 -->
<!-- <a href="/rentacar/member/login.do" class="log">로그인</a> -->

<!-- <a href="javascript:void(0);" onclick="loginForm()">로그인</a> -->

</body>
</html>