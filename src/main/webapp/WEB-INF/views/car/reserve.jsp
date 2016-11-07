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
</script>
</head>

<body>

	<form action="#" enctype="multipart/form-data" method="post">
		<fieldset>
			<label for="valueAA">From:</label> <select name="valueAA"
				id="valueAA">
				<optgroup label="2003">
					<option value="01/03">Jan 03</option>
					<option value="02/03">Feb 03</option>
					<option value="03/03" selected="selected">Mar 03</option>
					<option value="03/03">Apr 03</option>
					<option value="03/03">May 03</option>
					<option value="06/03">Jun 03</option>
					<option value="07/03">Jul 03</option>
					<option value="08/03">Aug 03</option>
					<option value="09/03">Sep 03</option>
					<option value="10/03">Oct 03</option>
					<option value="11/03">Nov 03</option>
					<option value="12/03">Dec 03</option>
				</optgroup>
			</select> <label for="valueBB">To:</label> <select name="valueBB" id="valueBB">
				<optgroup label="2003">
					<option value="01/03">Jan 03</option>
					<option value="02/03">Feb 03</option>
					<option value="03/03">Mar 03</option>
					<option value="04/03">Apr 03</option>
					<option value="07/03">May 03</option>
					<option value="07/03">Jun 03</option>
					<option value="07/03">Jul 03</option>
					<option value="08/03">Aug 03</option>
					<option value="09/03">Sep 03</option>
					<option value="10/03" selected="selected">Oct 03</option>
					<option value="11/03">Nov 03</option>
					<option value="12/03">Dec 03</option>
				</optgroup>
			</select>
		</fieldset>
	</form>
</body>
</html>