<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Project-rentacar</title>
</head>
<body>

	<!-- container -->
	<div id="container"
		style="background: #FFCCCC; height: 700px;">
		<tiles:insertAttribute name="body" />
		<!-- // container -->
	</div>
	<!-- footer -->
	<%-- <div id="footer" style="background:#9999CC; height:180px;">
		<tiles:insertAttribute name="footer" /> --%>
		<!-- // footer -->
	</div>
</body>
</html>