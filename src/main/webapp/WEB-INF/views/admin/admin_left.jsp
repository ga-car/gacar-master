<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

	window.onload = function() {

		if ('${session_email}' != "admin") {
			alert("�߸��� �������� ��ġ����Ÿ�� �������� �̵��մϴ�.");
			location.replace("/rentacar/main.do");
		}
	}
	function bookmarksite(url, title) {
		// Internet Explorer
		if (document.all || window.external) {
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
	<br />
	<c:if test='${session_email!=null && session_email=="admin"}'>
		<div class="sidebar">
			<strong>�����ڴ�</strong> <br /> <a href="/rentacar/member/logout.do">�α׾ƿ�</a>

			<a href="/rentacar/admin/adminInfoDetail.do">����������</a> <br />
			---------------------------------
			<h4>
				<a href="/rentacar/admin/memberList.do">ȸ������</a>
				<!-- //1104���� -->
			</h4>
			<ul>
				<li><a href="/rentacar/admin/memberList.do">ȸ�����</a></li>
				<li><a href="/rentacar/admin/withdrawList.do">Ż����</a></li>
				<li><a href="/rentacar/admin/stats.do">���</a></li>
			</ul>

			<h4>
				<a href="#">�̿�ȳ�</a>
			</h4>
			<ul>
				<li><a href="#">�̿���</a></li>
				<li><a href="#">�̿���</a></li>
				<li><a href="#">�̿��Ģ</a></li>
			</ul>

			<h4>
				<a href="/rentacar/admin/car/list.do">��ī����</a>
			</h4>
			<ul>
				<li><a href="/rentacar/admin/car/list.do">��ī���</a></li>
				<li><a href="/rentacar/admin/car/write.do">��ī���</a></li>
				<li><a href="/rentacar/admin/car/reserveList.do">������</a></li>
			</ul>

			<h4>
				<a href="/rentacar/admin/carpool/list.do">īǮ���Ӱ���</a>
			</h4>

			<h4>
				<a href="/rentacar/admin/carpool/attendlist.do">īǮ���Ӱ���</a>
			</h4>

			<h4>
				<a href="/rentacar/admin/review/list.do">�̿��ı����</a>
			</h4>

			<h4>
				<a href="/rentacar/admin/notify/list.do">�����Ͱ���</a>
			</h4>
			<ul>
				<li><a href="/rentacar/admin/notify/list.do">��������</a></li>
				<li><a href="/rentacar/admin/faq/list.do">FAQ</a></li>
				<li><a href="/rentacar/admin/qna/list.do">1:1����</a></li>
			</ul>

		</div>
	</c:if>
</body>
</html>