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
		open(url, "�α���","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
</script>
</head>
<body>
����
<%-- <a href="${contextPath}/CarShare/member/login.do" class="log">�α���</a> --%>
<!-- <a href="/rentacar/member/memberAgree.do" class="log">ȸ������</a> -->

<c:if test="${session_email==null}">

	<a href="/rentacar/member/memberAgree.do" class="log">ȸ������</a>
	<!-- �˾��� �α��� -->
	<a href="#" onclick="loginForm()">�α���</a>
</c:if>

<c:if test="${session_email!=null}">
	<strong>${session_name}&nbsp;��</strong>
	<a href="/rentacar/member/logout.do">�α׾ƿ�</a> 
</c:if>


<!-- ������ �̵� �α��� -->
<!-- <a href="/rentacar/member/login.do" class="log">�α���</a> -->

<!-- <a href="javascript:void(0);" onclick="loginForm()">�α���</a> -->

</body>
</html>