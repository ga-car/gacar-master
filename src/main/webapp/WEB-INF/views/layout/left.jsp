<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function loginForm() {
		/* $.simpleBlock('hide'); */
		var url = "/rentacar/member/login.do";
		open(
				url,
				"�α���",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
	
	window.onload = function(){
		var invalid="${invalid}";
		if(invalid==1){
			alert("�߸��� �������� ��ġ����Ÿ�� �������� �̵��Ǿ����ϴ�.");
		}
	}
</script>

<script type="text/javascript">
	function bookmarksite(url, title) {
		// Internet Explorer
		if (document.all || window.external) {
			/* alert(url); */
			/*  alert(title);  */
			window.external.AddFavorite(url, title);
		}
		// Google Chrome
		else if (window.chrome) {
			alert("Ctrl+DŰ�� �����ø� ���ã�⿡ �߰��Ͻ� �� �ֽ��ϴ�.");
		}
		// Firefox
		else if (window.sidebar) // firefox 
		{
			window.sidebar.addPanel(title, url, "");
		}
		// Opera
		else if (window.opera && window.print) { // opera 
			var elem = document.createElement('a');
			elem.setAttribute('href', url);
			elem.setAttribute('title', title);
			elem.setAttribute('rel', 'sidebar');
			elem.click();
		}
	}
</script>

</head>
<body>

	<c:if test="${session_email==null}">
		<a href="/rentacar/member/memberAgree.do" class="log">ȸ������</a>
		<!-- �˾��� �α��� -->
		<a href="#" onclick="loginForm()">�α���</a>
		<br />
		<a href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '��ġ����Ÿ')">���ã�� �߰�</a>
		<h4>
			<a href="#">�̿�ȳ�</a>
		</h4>
		<ul>
			<li><a href="#">�̿���</a></li>
			<li><a href="#">�̿���</a></li>
			<li><a href="#">�̿��Ģ</a></li>
		</ul>
		<h4>
			<a href="/Rentacar/car/list.do">��ī����</a>
		</h4>
		<h4>
			<a href="#">īǮ����</a>
		</h4>
		<h4>
			<a href="/rentacar/reviewList.do">�̿��ı�</a>
		</h4>
		<h4>
			<a href="/rentacar/notify/list.do">������</a>
		</h4>
		<ul>
			<li><a href="/rentacar/notify/list.do">��������</a></li>
			<li><a href="/rentacar/faqList.do">FAQ</a></li>
			<li><a href="#">1:1����</a></li>
		</ul>
	</c:if>

	<c:if test='${session_email!=null}'>
		<strong>${session_name}&nbsp;��</strong>
		<a href="/rentacar/member/logout.do">�α׾ƿ�</a>
		<br />
		<a href="javascript:bookmarksite('http://localhost:8080/rentacar/main.do', '��ġ����Ÿ')">���ã�� �߰�</a>
		<h4>
			<a href="#">�̿�ȳ�</a>
		</h4>
		<ul>
			<li><a href="#">�̿���</a></li>
			<li><a href="#">�̿���</a></li>
			<li><a href="#">�̿��Ģ</a></li>
		</ul>
		<h4>
			<a href="/Rentacar/car/list.do">��ī����</a>
		</h4>
		<h4>
			<a href="#">īǮ����</a>
		</h4>
		<h4>
			<a href="/rentacar/reviewList.do">�̿��ı�</a>
		</h4>
		<h4>
			<a href="/rentacar/notify/list.do">������</a>
		</h4>
		<ul>
			<li><a href="/rentacar/notify/list.do">��������</a></li>
			<li><a href="/rentacar/faqList.do">FAQ</a></li>
			<li><a href="#">1:1����</a></li>
		</ul>
		<h4>
			<a href="/rentacar/mypage/mypage.do">����������</a>
		</h4>
		<ul>
			<li><a href="/rentacar/mypage/memberConfirm.do">��������</a></li>
			<li><a href="#">��Ʈī �̿���Ȳ</a></li>
			<li><a href="#">īǮ �̿���Ȳ</a></li>
			<li><a href="#">�������ۺ���</a></li>
			<li><a href="/rentacar/mypage/memberDelPre.do">ȸ��Ż��</a></li>
		</ul>
	</c:if>
</body>
</html>