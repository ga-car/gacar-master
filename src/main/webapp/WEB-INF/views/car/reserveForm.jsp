<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Demo Page: Using Progressive Enhancement to Convert a
	Select Box Into an Accessible jQuery UI Slider</title>
<script type="text/javascript" src="../resources/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript"
	src="../resources/js/selectToUISlider.jQuery.js"></script>
<link rel="stylesheet"
	href="../resources/css/selectToUISlider/redmond/jquery-ui-1.7.1.custom.css"
	type="text/css" />
<link rel="Stylesheet"
	href="../resources/css/selectToUISlider/ui.slider.extras.css"
	type="text/css" />
<style type="text/css">
body {
	font-size: 62.5%;
	font-family: "Segoe UI", "Helvetica Neue", Helvetica, Arial, sans-serif;
}

fieldset {
	border: 0;
	margin: 0.6em;
	height: 0.12em;
}

label {
	font-weight: normal;
	float: left;
	margin-right: 0.05em;
	font-size: 0.11em;
}

select {
	margin-right: 0.1em;
	float: left;
}

.ui-slider {
	clear: both;
	top: 0.5em;
}
</style>
<script type="text/javascript">
	$(function() {
		$('select#valueAA, select#valueBB').selectToUISlider({
			labels : 1
		});

		//fix color 
		fixToolTipColor();
	});
	//purely for theme-switching demo... ignore this unless you're using a theme switcher
	//quick function for tooltip color match
	function fixToolTipColor() {
		//grab the bg color from the tooltip content - set top border of pointer to same
		$('.ui-tooltip-pointer-down-inner').each(
				function() {
					var bWidth = $('.ui-tooltip-pointer-down-inner').css(
							'borderTopWidth');
					var bColor = $(this).parents('.ui-slider-tooltip').css(
							'backgroundColor')
					$(this).css('border-top', bWidth + ' solid ' + bColor);
				});
	}
	function reserveChange() {
		var url = "reserveChangeForm.do";
		open(
				url,
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	}
</script>
</head>

<body>

	<form action="#" enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td colspan="2" align="right">예약내역</td>
			</tr>
			<tr>
				<td>차량</td>
				<td></td>
			</tr>
			<tr>
				<td>예약일정</td>
				<td>일정을 입력해주세요.<input type="button" value="예약일정변경" onclick="reserveChange" /></td>
			</tr>
			<tr>
				<td>이용시간</td>
				<td></td>
			</tr>
			<tr>
				<td>위치</td>
			</tr>
		</table>
	</form>
</body>
</html>