<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Demo Page: Using Progressive Enhancement to Convert a
	Select Box Into an Accessible jQuery UI Slider</title>
<script type="text/javascript"
	src="/rentacar/resources/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="/rentacar/resources/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript"
	src="/rentacar/resources/js/selectToUISlider.jQuery.js"></script>
<link rel="stylesheet"
	href="/rentacar/resources/selectToUISlider/css/redmond/jquery-ui-1.7.1.custom.css"
	type="text/css" />
<link rel="Stylesheet"
	href="/rentacar/resources/selectToUISlider/css/ui.slider.extras.css"
	type="text/css" />
<style type="text/css">
body {
	font-size: 62.5%;
	font-family: "Segoe UI", "Helvetica Neue", Helvetica, Arial, sans-serif;
}

fieldset {
	border: 0;
	margin: 6em;
	height: 12em;
}

label {
	font-weight: normal;
	float: left;
	margin-right: .5em;
	font-size: 1.1em;
}

select {
	margin-right: 1em;
	float: left;
}

.ui-slider {
	clear: both;
	top: 5em;
}
</style>
<script type="text/javascript">
	$(function() {
		//demo 1
		var abc = $('select#speed').selectToUISlider().next();

		//demo 2
		$('select#valueA, select#valueB').selectToUISlider();

		//demo 3
		$('select#valueAA, select#valueBB').selectToUISlider({
			labels : 12
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

	<form action="#">
		<!-- demo 1 -->
		<fieldset>
			<label for="speed">Select a Speed:</label> <select name="speed"
				id="speed">
				<option value="Slower">Slower</option>
				<option value="Slow">Slow</option>
				<option value="Med" selected="selected">Med</option>
				<option value="Fast">Fast</option>
				<option value="Faster">Faster</option>
			</select>
		</fieldset>

		<!-- demo 2 -->
		<fieldset>
			<label for="valueA">From:</label> <select name="valueA" id="valueA">
				<option value="6am">6:00</option>
				<option value="7am">7:00</option>
				<option value="8am">8:00</option>
				<option value="9am" selected="selected">9:00</option>
				<option value="10am">10:00</option>
				<option value="11am">11:00</option>
				<option value="Noon">Noon</option>
				<option value="1pm">1:00</option>
				<option value="2pm">2:00</option>
				<option value="3pm">3:00</option>
				<option value="4pm">4:00</option>
				<option value="5pm">5:00</option>
				<option value="6pm">6:00</option>
				<option value="7pm">7:00</option>
				<option value="8pm">8:00</option>
				<option value="9pm">9:00</option>
				<option value="10pm">10:00</option>
				<option value="11pm">11:00</option>
				<option value="12pm">12:00</option>
			</select> <label for="valueB">To:</label> <select name="valueB" id="valueB">
				<option value="6am">6:00</option>
				<option value="7am">7:00</option>
				<option value="8am">8:00</option>
				<option value="9am">9:00</option>
				<option value="10am">10:00</option>
				<option value="11am">11:00</option>
				<option value="Noon">Noon</option>
				<option value="1pm">1:00</option>
				<option value="2pm">2:00</option>
				<option value="3pm">3:00</option>
				<option value="4pm">4:00</option>
				<option value="5pm">5:00</option>
				<option value="6pm">6:00</option>
				<option value="7pm">7:00</option>
				<option value="8pm">8:00</option>
				<option value="9pm" selected="selected">9:00</option>
				<option value="10pm">10:00</option>
				<option value="11pm">11:00</option>
				<option value="12pm">12:00</option>
			</select>
		</fieldset>


		<!-- demo 3 -->
		<fieldset>
			<label for="valueAA">From:</label> <select name="valueAA"
				id="valueAA">
				<optgroup label="2003">
					<option value="01/03">Jan 03</option>
					<option value="02/03">Feb 03</option>
					<option value="03/03">Mar 03</option>
					<option value="03/03">Apr 03</option>
					<option value="03/03">May 03</option>
					<option value="06/03">Jun 03</option>
					<option value="07/03">Jul 03</option>
					<option value="08/03" selected="selected">Aug 03</option>
					<option value="09/03">Sep 03</option>
					<option value="10/03">Oct 03</option>
					<option value="11/03">Nov 03</option>
					<option value="12/03">Dec 03</option>
				</optgroup>
				<optgroup label="2004">
					<option value="01/04">Jan 04</option>
					<option value="02/04">Feb 04</option>
					<option value="03/04">Mar 04</option>
					<option value="04/04">Apr 04</option>
					<option value="04/04">May 04</option>
					<option value="06/04">Jun 04</option>
					<option value="07/04">Jul 04</option>
					<option value="08/04">Aug 04</option>
					<option value="09/04">Sep 04</option>
					<option value="10/04">Oct 04</option>
					<option value="11/04">Nov 04</option>
					<option value="12/04">Dec 04</option>
				</optgroup>
				<optgroup label="2005">
					<option value="01/05">Jan 05</option>
					<option value="02/05">Feb 05</option>
					<option value="03/05">Mar 05</option>
					<option value="04/05">Apr 05</option>
					<option value="05/05">May 05</option>
					<option value="06/05">Jun 05</option>
					<option value="07/05">Jul 05</option>
					<option value="08/05">Aug 05</option>
					<option value="09/05">Sep 05</option>
					<option value="10/05">Oct 05</option>
					<option value="11/05">Nov 05</option>
					<option value="12/05">Dec 05</option>
				</optgroup>
				<optgroup label="2006">
					<option value="01/06">Jan 06</option>
					<option value="02/06">Feb 06</option>
					<option value="03/06">Mar 06</option>
					<option value="04/06">Apr 06</option>
					<option value="06/06">May 06</option>
					<option value="06/06">Jun 06</option>
					<option value="07/06">Jul 06</option>
					<option value="08/06">Aug 06</option>
					<option value="09/06">Sep 06</option>
					<option value="10/06">Oct 06</option>
					<option value="11/06">Nov 06</option>
					<option value="12/06">Dec 06</option>
				</optgroup>
				<optgroup label="2007">
					<option value="01/07">Jan 07</option>
					<option value="02/07">Feb 07</option>
					<option value="03/07">Mar 07</option>
					<option value="04/07">Apr 07</option>
					<option value="07/07">May 07</option>
					<option value="07/07">Jun 07</option>
					<option value="07/07">Jul 07</option>
					<option value="08/07">Aug 07</option>
					<option value="09/07">Sep 07</option>
					<option value="10/07">Oct 07</option>
					<option value="11/07">Nov 07</option>
					<option value="12/07">Dec 07</option>
				</optgroup>
				<optgroup label="2008">
					<option value="01/08">Jan 08</option>
					<option value="02/08">Feb 08</option>
					<option value="03/08">Mar 08</option>
					<option value="04/08">Apr 08</option>
					<option value="08/08">May 08</option>
					<option value="08/08">Jun 08</option>
					<option value="08/08">Jul 08</option>
					<option value="08/08">Aug 08</option>
					<option value="09/08">Sep 08</option>
					<option value="10/08">Oct 08</option>
					<option value="11/08">Nov 08</option>
					<option value="12/08">Dec 08</option>
				</optgroup>
			</select> <label for="valueBB">To:</label> <select name="valueBB" id="valueBB">
				<optgroup label="2003">
					<option value="01/03">Jan 03</option>
					<option value="02/03">Feb 03</option>
					<option value="03/03">Mar 03</option>
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
				<optgroup label="2004">
					<option value="01/04">Jan 04</option>
					<option value="02/04">Feb 04</option>
					<option value="03/04">Mar 04</option>
					<option value="04/04">Apr 04</option>
					<option value="04/04">May 04</option>
					<option value="06/04">Jun 04</option>
					<option value="07/04">Jul 04</option>
					<option value="08/04">Aug 04</option>
					<option value="09/04">Sep 04</option>
					<option value="10/04">Oct 04</option>
					<option value="11/04">Nov 04</option>
					<option value="12/04">Dec 04</option>
				</optgroup>
				<optgroup label="2005">
					<option value="01/05">Jan 05</option>
					<option value="02/05">Feb 05</option>
					<option value="03/05">Mar 05</option>
					<option value="04/05">Apr 05</option>
					<option value="05/05">May 05</option>
					<option value="06/05">Jun 05</option>
					<option value="07/05">Jul 05</option>
					<option value="08/05">Aug 05</option>
					<option value="09/05">Sep 05</option>
					<option value="10/05">Oct 05</option>
					<option value="11/05">Nov 05</option>
					<option value="12/05">Dec 05</option>
				</optgroup>
				<optgroup label="2006">
					<option value="01/06">Jan 06</option>
					<option value="02/06">Feb 06</option>
					<option value="03/06">Mar 06</option>
					<option value="04/06">Apr 06</option>
					<option value="06/06">May 06</option>
					<option value="06/06">Jun 06</option>
					<option value="07/06">Jul 06</option>
					<option value="08/06">Aug 06</option>
					<option value="09/06">Sep 06</option>
					<option value="10/06">Oct 06</option>
					<option value="11/06">Nov 06</option>
					<option value="12/06">Dec 06</option>
				</optgroup>
				<optgroup label="2007">
					<option value="01/07">Jan 07</option>
					<option value="02/07">Feb 07</option>
					<option value="03/07">Mar 07</option>
					<option value="04/07">Apr 07</option>
					<option value="07/07">May 07</option>
					<option value="07/07">Jun 07</option>
					<option value="07/07">Jul 07</option>
					<option value="08/07" selected="selected">Aug 07</option>
					<option value="09/07">Sep 07</option>
					<option value="10/07">Oct 07</option>
					<option value="11/07">Nov 07</option>
					<option value="12/07">Dec 07</option>
				</optgroup>
				<optgroup label="2008">
					<option value="01/08">Jan 08</option>
					<option value="02/08">Feb 08</option>
					<option value="03/08">Mar 08</option>
					<option value="04/08">Apr 08</option>
					<option value="08/08">May 08</option>
					<option value="08/08">Jun 08</option>
					<option value="08/08">Jul 08</option>
					<option value="08/08">Aug 08</option>
					<option value="09/08">Sep 08</option>
					<option value="10/08">Oct 08</option>
					<option value="11/08">Nov 08</option>
					<option value="12/08">Dec 08</option>
				</optgroup>
			</select>
		</fieldset>
	</form>
</body>
</html>