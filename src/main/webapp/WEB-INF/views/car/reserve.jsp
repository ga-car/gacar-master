<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check() {
		var f = document.reserveRight; //문서.Form name="";

		if (f.reserve_mem_no.value == "") {
			alert("로그인 해주세요.");
			return false;
		}
		if (f.reserve_sdate.value == "" || f.reserve_edate.value == "") {
			alert("일정을 입력해주세요.");
			return false;
		}
		if (f.agreeUse.checked == false) {
			alert("이용약관에 동의해주세요")
			return false;
		}

	}
	function Cancel() {
		var car_lat = "${rentacarOne.car_lat}";
		var car_lng = "${rentacarOne.car_lng}";
		javascript: location.replace = "/rentacar/car/list.do?car_lat="
				+ car_lat + "&car_lng=" + car_lng;
	}
	function carclause() {
		open(
				"/rentacar/car/carclause.do",
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=800");
	}
	$(document).keydown(function(e) {
		if (e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA") {
			if (e.keyCode === 8) {
				return false;
			}
		}
	});
	window.history.forward(0);
	function reserveChange() {
		var no = "${rentacarOne.car_no}"
		var url = "reserveChangeForm.do?car_no=" + no;
		open(
				url,
				"예약일정변경",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=650, height=400");
	}
	function Rradio_OnOff(id) {
		//  <tr> id로 값을 비교한다!
		if (id == "Radio_On") {
			/* document.all["Radio_On"].style.display = ''; */
			document.getElementById('PriceType').innerHTML = "${Price2}원 | 보험금 하루 ${premium }원";
			document.reserveRight.reserve_insure.value = "true";
			document.reserveRight.reserve_price.value = "${Price2}";
		} else {
			/* document.all["Radio_On"].style.display = 'none'; */
			document.getElementById('PriceType').innerHTML = "${Price1}원";
			document.reserveRight.reserve_insure.value = "false";
			document.reserveRight.reserve_price.value = "${Price1}";
		}
	}
</script>

</head>
<body>
	<form name="reserveRight" id="reserveRight"
		enctype="multipart/form-data" method="post" onsubmit="return check()">
		<input type="hidden" name="reserve_car_no" id="reserve_car_no"
			value="${rentacarOne.car_no}"> <input type="hidden"
			name="reserve_mem_no" id="reserve_mem_no" value="${session_num}">
		<input type="hidden" name="reserve_sdate" id="reserve_sdate"
			value="${car_dt1}"> <input type="hidden" name="reserve_edate"
			id="reserve_edate" value="${car_dt2}"> <input type="hidden"
			name="reserve_slat" id="reserve_slat" value="${rentacarOne.car_lat}">
		<input type="hidden" name="reserve_slng" id="reserve_slng"
			value="${rentacarOne.car_lng}"> <input type="hidden"
			name="reserve_insure" id="reserve_insure" value="true"> <input
			type="hidden" name="reserve_price" id="reserve_price"
			value="${Price2}">

		<div id="article" class="content" role="main">
			<div class="nav" role="navigation">
				<h4>가카예약 > 날짜선택</h4>
			</div>
			<div class="panel panel-default clearfix">
				<div class="panel-heading clearfix">
					<!-- 이용약관 시작 -->
					<div class="form-group  has-feedback">
						<h4>차량 이용 약관 </h4>
						<iframe src="/rentacar/car/carclause.do" width="760" height="300"
							class="input-block-level"> </iframe>
						<!-- 		<textarea rows="10" cols="155"
							class="form-control input-block-level" style="">
							
		제1조 (목적)
		이 약관은 (주)그린카, 롯데렌탈(주) (이하 "임대인"/회사라 합니다)와 고객(이하 "임차인"이라 합니다.)
			사이의 대여용자동차 임대차계약(이하 "대여계약"이라 합니다.)상의 권리, 의무에 관한 사항을 규정함을 목적으로 합니다.
		</textarea> -->
						<label for="agreeUse">'가카 차량이용'이용약관에 동의합니다.<input
							type="checkbox" value="" id="agreeUse" name="GC_Agree"
							class="checkbox" />
						</label>

					</div>
					<!-- 이용약관 끝  -->
					<div id="containerLeft">

						<ul class="list-group">
							<li class="list-group-item note-item clearfix">
								<div class="content-left panel-body pull-left">
									<h4>대여 정보</h4>
									<br>
									<h5>모델명 : ${rentacarOne.car_name}</h5>
									<p>
									<h5>차종 : ${rentacarOne.car_type} | 브랜드 :
										${rentacarOne.car_brand}</h5>
									<p>
									<h5>차량 위치 :
										${rentacarOne.car_addr}&nbsp;${rentacarOne.car_addr2}</h5>
									<p>
									<h5>
										보험가입 확인 :&nbsp;<input type="radio" id="insure_check"
											name="insure_check" checked="checked"
											onclick="Rradio_OnOff('Radio_On');" /> 가입 &nbsp;<input
											type="radio" id="insure_check" name="insure_check"
											onclick="Rradio_OnOff('Radio_Off');" /> 비가입(보험가입시 별도의 비용이
										발생할수 있습니다.)
									</h5>
								</div>
								<div class="content-right pull-body pull-right">
									<img class="avatar-photo"
										src="../resources/carUpload/${rentacarOne.car_image}"
										style="width: 100px; height: 100px;">
								</div>
							</li>
							<li class="list-group-item note-item clearfix"
								style="cursor: pointer;">
								<div class="content-left panel-body pull-left">
									<h4>이용 기간 및 비용 확인</h4>
									<br>
									<c:choose>
										<c:when test="${Day == null}">
										</c:when>
										<c:when test="${Day != 0}">
												이용기간 : 	${Day}일<p>
												차량 이용금액
												<c:choose>
													<c:when test="${Price1 == null && Price2 == null}">
														일정을 입력해주세요.
													</c:when>
													<c:otherwise>
														<p id="PriceType">${Price2}원|보험금하루${premium }원</p>
													</c:otherwise>
												</c:choose>
										</c:when>
									</c:choose>
								</div>
								<div class="content-right pull-body pull-right">
									<c:choose>
										<c:when test="${car_dt1 == null && car_dt2 == null }">
						일정을 입력해주세요.<input type="button" value="예약일정입력"
												onclick="reserveChange()" />
										</c:when>
										<c:otherwise>
						${car_dt1}&nbsp;~&nbsp;${car_dt2}<input type="button"
												value="예약일정변경" onclick="reserveChange()" />

										</c:otherwise>
									</c:choose>
								</div>
							</li>
							<li class="list-group-item note-item clearfix"
								style="cursor: pointer;"></li>
						</ul>
					</div>
					<!-- 글목록 버튼 시작 -->
					<div class="menu-wrap pull-left">
						<button type="button" onclick="Cancel()" class="btn btn-primary">취소</button>
					</div>
					<!-- 글목록 버튼 끝 -->
					<!-- 글쓰기 버튼 시작 -->
					<div class="menu-wrap pull-right">
						<%-- <c:if test="${session_email != null }"> --%>
						<!-- 로그인을 해야 글을 쓸수 있음 -->
						<button type="submit" class="btn btn-primary">예약/결제</button>
						<%-- </c:if> --%>
					</div>
					<!-- 글쓰기 버튼 끝 -->

				</div>
			</div>
		</div>
	</form>
</body>
</html>
