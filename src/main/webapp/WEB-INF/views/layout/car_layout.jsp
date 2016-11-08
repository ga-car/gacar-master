<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Project-rentacar</title>

</head>
<body>
	<div id="left"
		style="background: #339999; height: 950px; width: 15%; float: left; margin: 0 20px 20px 0;">
		<tiles:insertAttribute name="left" />
		<!-- // header -->
	</div>
	<div id="top"
		style="background: #999999; height: 50px; width: 80%; float: left; margin: 0 0 10px 0;">
		<tiles:insertAttribute name="top" />
		<!-- // container -->
	</div>
	<!-- container -->
	<div id="containerLeft"
		style="background: #FFCCCC; height: 700px; width: 60%; float: left; margin: 0 0 10px 0;">
		<tiles:insertAttribute name="bodyLeft" />
		<!-- // container -->
	</div>
	<div id="containerRight"
		style="background: #FFDDDD; height: 700px; width: 20%; float: left; margin: 0 0 10px 0;">
		<tiles:insertAttribute name="bodyRight" />
		<!-- // container -->
	</div>
	<!-- footer -->
	<div id="footer"
		style="background: #9999CC; height: 180px; width: 80%; float: left; margin: 0 20px 20px 0;">
		<tiles:insertAttribute name="footer" />
		<!-- // footer -->
	</div>
</body>
</html>