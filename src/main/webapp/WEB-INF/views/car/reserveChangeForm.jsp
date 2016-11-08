<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			duration : 200,
			showAnim : 'show',
			showMonthAfterYear : true,
			yearSuffix : '년',
			beforeShowDay : disableAllTheseDays
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true,
					changeYear : true,
					minDate : 0, //오늘날짜 이전 비활성화
					onSelect : function(selectedDate) {

						var option = this.id == "datepicker" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						jQuery("#datepicker, #datepicker1").not(this)
								.datepicker("option", option, date);
						$('input[type=text][id=datepicker]').val(
								$("#datepicker").val())

						var click = $("#datepicker").val();
						var arr = click.split("-");
						var clickDate = new Date(arr[0], Number(arr[1]) - 1,
								arr[2]);

						for (var i = 0; i < disabledDays.length; i++) {
							var arr2 = disabledDays[i].split("-");
							var disDate = new Date(arr2[0],
									Number(arr2[1]) - 1, arr2[2]);

							if (clickDate.getTime() < disDate.getTime()) {
								$("#datepicker1").datepicker("option",
										"maxDate", disabledDays[i]);
								break;
							} else {
								$("#datepicker1").datepicker("option",
										"maxDate", "");

							}
						}
					}

				});
	});

	$(function() {

		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			duration : 200,
			showAnim : 'show',
			showMonthAfterYear : true,
			yearSuffix : '년'
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		$("#datepicker1").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true,
					changeYear : true,
					minDate : 0, //오늘날짜 이전 비활성화

					onSelect : function(selectedDate) {

						var option = this.id == "datepicker" ? "minDate"
								: "maxDate", instance = $(this).data(
								"datepicker"), date = $.datepicker.parseDate(
								instance.settings.dateFormat
										|| $.datepicker._defaults.dateFormat,
								selectedDate, instance.settings);
						jQuery("#datepicker, #datepicker1").not(this)
								.datepicker("option", option, date);
						$('input[type=text][id=datepicker1]').val(
								$("#datepicker1").val());

					}
				});
	});

	function disableAllTheseDays(date) {
		var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
		for (i = 0; i < disabledDays.length; i++) {

			if ($.inArray(y + '-' + (m + 1) + '-' + d, disabledDays) != -1) {
				return [ false ];
			}
		}
		return [ true ];
	}

	var disabledDays = new Array();
	var i = 0;
	<s:iterator value="expiryDate" status="stat">
	disabledDays[i] = '<s:property/>';
	i++;
	</s:iterator>
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
		<table width="750" border="0" cellspacing="0" cellpadding="0"
			border="1">
			<tr>
				<td width="325" align="left">
					<div id="datepicker">
						<font class="indigo">대여</font>&nbsp;&nbsp;<input type="text"
							id="datepicker" name="st_day"
							style="border: 0px solid #eee; margin: 10px;" size="20">
						
					</div>
				</td>
				<td width="325" align="left">
					<div id="datepicker1">
						<font class="indigo">반납</font>&nbsp;&nbsp;<input type="text"
							id="datepicker1" name="end_day"
							style="border: 0px solid #eee; margin: 10px;" size="20">
					</div>
				</td>
			</tr>
		</table>
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