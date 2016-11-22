<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="shortcut icon"
	href="/rentacar/resources/images/service/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="/rentacar/resources/css/use/service.css" />
<link rel="stylesheet" href="/rentacar/resources/css/use/use_common.css" />
<link rel="stylesheet" href="/rentacar/resources/css/use/use_layout.css" />
<body>
	<!-- Begin #container -->
	<div id="container">
		<div class="content-wrap">
			<div class="contentbox">
				<div class="location">
					<div class="location_in">
						<p>
							<span>이용안내</span>&gt; <strong>요금안내</strong>
						</p>
					</div>
				</div>
				<div class="subtop-content bg_subvisual_02_01">
					<h3 class="subtit">요금안내</h3>
					<p class="subtxt">
						<strong>경제적인 가카,</strong><br />최대 86%까지 할인된 요금혜택을 누려보세요.
					</p>
				</div>
				<div class="bodystart">
					<!-- bodystart -->
					<div class="charges-wrap">
						<h4>가카 회원제 안내</h4>
						<table
							summary="가카 회원제 안내에 대한 연회비 회원카드 대여요금 포인트적립 보험 혜택 (이용 無) 가입헤택"
							class="tbl-green-member">
							<caption>가카 회원제 안내</caption>
							<colgroup>
								<col width="150" />
								<col width="" />
							</colgroup>
							<tbody>
								<tr class="top">
									<th scope="row">연회비</th>
									<td>무료</td>
								</tr>
								<tr>
									<th scope="row">회원카드</th>
									<td>티머니카드 등록 or 회원카드(최초 1회무료발급) 선택</td>
								</tr>
								<tr>
									<th scope="row">대여요금</th>
									<td>하루 28,000원대부터~ 차종별, 시간대별 최대 86% 할인</td>
								</tr>
								<tr>
									<th scope="row">포인트 적립/사용<br />(결제대여요금기준)
									</th>
									<td>대여요금 결제금액의 3% 적립<br />
								</tr>
							</tbody>
						</table>

						<div class="green-charges-txt-wrap">
							<h4 class="mgtop">요금안내</h4>
							<p class="subtxt">- 예약한 시간, 주행한 거리만큼의 저렴하고 합리적인 요금으로 가카를 이용하실
								수 있습니다.</p>
							<div class="charges-boxing green-charges-box">
								<ul class="green-charges-txt">
									<li><strong>대여요금 : </strong>예약한 시간만큼 발생하는 렌트비로 등록한 결제카드에서
										대여요금이 자동 결제됩니다.</li>
									<li><strong>보험료 : </strong>예약한 시간만큼 보혐료가 부과되며 자동차
										종합보험(대인/대물/자손) 및 차량손해면책제도가 포함됩니다.</li>
									<li><strong>주행요금 : </strong>주행거리(km당)에 따라 부과되는 요금으로 차량 반납
										후 계산되어 결제됩니다.</li>
									<li class="last"><strong>하이패스 : </strong>차량 내 하이패스를 자유롭게
										이용 가능하며, 이용요금은 다음날 자동 결제됩니다.</li>
								</ul>
							</div>
						</div>



						<h4 class="mgtop" id="car_rent_charge">차종별 요금표</h4>
						<ul class="insurance-guide-txt">
							<li><span>- </span>가카는 상시 이벤트(차종 및 지역)를 진행하여 표준요금보다 더욱 저렴하게
								이용 가능합니다.</li>
						</ul>





						<!-- 차종별 요금표 추가,수정 (2016-07-07) -->
						<div class="tbl-charge-box">
							<table summary="차종별 요금표" class="tbl-green-member charge">
								<caption>차종별 요금표</caption>
								<colgroup>
									<col width="100" />
									<col width="" />
									<col width="90" />
									<col width="90" />
									<col width="90" />
									<col width="90" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2">차종</th>
										<th scope="col" rowspan="2">차량 모델</th>
										<th scope="col" rowspan="2">대여요금 <br />(1일기준)
										</th>
										<th scope="col" colspan="2">할인대여요금(1일기준)</th>
										<th scope="col" rowspan="2" class="last">주행요금</th>
									</tr>
									<tr>
										<th scope="col">주중할인</th>
										<th scope="col">주말할인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="3"><strong>경형A</strong></td>
										<td class="txt-l">넥스트 스파크</td>
										<td class="minute">28,000원</td>
										<td rowspan="3" class="dc">680원~</td>
										<td rowspan="3">900원~</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">모닝</td>
										<td class="minute">28,000원</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">스파크</td>
										<td class="minute">28,000원</td>
										<td class="last">160원</td>
									</tr>

									<tr>
										<td><strong>경형B</strong></td>
										<td class="txt-l">레이</td>
										<td class="minute">30,000원</td>
										<td class="dc">690원~</td>
										<td>910원~</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td rowspan="3"><strong>소형</strong></td>
										<td class="txt-l">엑센트</td>
										<td class="minute">36,000원</td>
										<td rowspan="3" class="dc">700원~</td>
										<td rowspan="3">930원~</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">엑센트(디젤)</td>
										<td class="minute">36,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">올뉴프라이드</td>
										<td class="minute">36,000원</td>
										<td class="last">160원</td>
									</tr>

									<tr>
										<td rowspan="12"><strong>준중형A</strong></td>
										<td class="txt-l">K3</td>
										<td class="minute">37,000원</td>
										<td rowspan="12" class="dc">660원~</td>
										<td rowspan="12">870원~</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">K3 Koup</td>
										<td class="minute">37,000원</td>
										<td class="last">230원</td>
									</tr>
									<tr>
										<td class="txt-l">K3(디젤)</td>
										<td class="minute">37,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">SM3 Neo</td>
										<td class="minute">37,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">SM3 Neo(디젤)</td>
										<td class="minute">37,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">뉴SM3</td>
										<td class="minute">37,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">더뉴K3</td>
										<td class="minute">37,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">아반떼AD</td>
										<td class="minute">37,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">아반떼MD</td>
										<td class="minute">37,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">아반떼MD(LPG)</td>
										<td class="minute">37,000원</td>
										<td class="last">130원</td>
									</tr>
									<tr>
										<td class="txt-l">아반떼MD(디젤)</td>
										<td class="minute">37,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">크루즈</td>
										<td class="minute">37,000원</td>
										<td class="last">220원</td>
									</tr>

									<tr>
										<td rowspan="4"><strong>준중형B</strong></td>
										<td class="txt-l">i30(디젤)</td>
										<td class="minute">51,000원</td>
										<td rowspan="4" class="dc">910원~</td>
										<td rowspan="4">1,210원~</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">i30(휘)</td>
										<td class="minute">51,000원</td>
										<td class="last">210원</td>
									</tr>
									<tr>
										<td class="txt-l">쏘울</td>
										<td class="minute">51,000원</td>
										<td class="last">210원</td>
									</tr>
									<tr>
										<td class="txt-l">아이오닉하이브리드</td>
										<td class="minute">68,000원</td>
										<td class="last">130원</td>
									</tr>

									<tr>
										<td rowspan="15"><strong>중형</strong></td>
										<td class="txt-l">K5 하이브리드</td>
										<td class="minute">51,000원</td>
										<td rowspan="15" class="dc">880원~</td>
										<td rowspan="15">1,180원~</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">K5(LPG)</td>
										<td class="minute">51,000원</td>
										<td class="last">130원</td>
									</tr>
									<tr>
										<td class="txt-l">K5(휘)</td>
										<td class="minute">51,000원</td>
										<td class="last">220원</td>
									</tr>
									<tr>
										<td class="txt-l">LF쏘나타(LPG)</td>
										<td class="minute">51,000원</td>
										<td class="last">130원</td>
									</tr>
									<tr>
										<td class="txt-l">LF쏘나타(휘)</td>
										<td class="minute">51,000원</td>
										<td class="last">210원</td>
									</tr>
									<tr>
										<td class="txt-l">YF쏘나타(LPG)</td>
										<td class="minute">51,000원</td>
										<td class="last">130원</td>
									</tr>
									<tr>
										<td class="txt-l">YF쏘나타(휘)</td>
										<td class="minute">51,000원</td>
										<td class="last">230원</td>
									</tr>
									<tr>
										<td class="txt-l">뉴SM5(LPG)</td>
										<td class="minute">51,000원</td>
										<td class="last">140원</td>
									</tr>
									<tr>
										<td class="txt-l">뉴SM5(휘)</td>
										<td class="minute">51,000원</td>
										<td class="last">230원</td>
									</tr>
									<tr>
										<td class="txt-l">말리부(LPG)</td>
										<td class="minute">51,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">말리부(디젤)</td>
										<td class="minute">51,000원</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">말리부(휘)</td>
										<td class="minute">51,000원</td>
										<td class="last">250원</td>
									</tr>
									<tr>
										<td class="txt-l">올뉴K5(LPG)</td>
										<td class="minute">51,000원</td>
										<td class="last">130원</td>
									</tr>
									<tr>
										<td class="txt-l">벨로스터</td>
										<td class="minute">51,000원</td>
										<td class="last">200원</td>
									</tr>
									<tr>
										<td class="txt-l">쏘나타 하이브리드</td>
										<td class="minute">72,000원</td>
										<td class="last">190원</td>
									</tr>

									<tr>
										<td rowspan="10"><strong>SUV</strong></td>
										<td class="txt-l">QM3</td>
										<td class="minute">68,000원</td>
										<td rowspan="10" class="dc">830원~</td>
										<td rowspan="10">1,100원~</td>
										<td class="last">120원</td>
									</tr>
									<tr>
										<td class="txt-l">니로 하이브리드</td>
										<td class="minute">68,000원</td>
										<td class="last">130원</td>
									</tr>
									<tr>
										<td class="txt-l">스포티지 QL</td>
										<td class="minute">68,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">스포티지 R</td>
										<td class="minute">68,000원</td>
										<td class="last">190원</td>
									</tr>
									<tr>
										<td class="txt-l">올 뉴 싼타페(4WD)</td>
										<td class="minute">68,000원</td>
										<td class="last">180원</td>
									</tr>
									<tr>
										<td class="txt-l">올 뉴 투싼 1.7</td>
										<td class="minute">68,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">올란도(LPG)</td>
										<td class="minute">68,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">투싼ix</td>
										<td class="minute">68,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">티볼리(디젤)</td>
										<td class="minute">68,000원</td>
										<td class="last">150원</td>
									</tr>
									<tr>
										<td class="txt-l">티볼리(휘)</td>
										<td class="minute">68,000원</td>
										<td class="last">200원</td>
									</tr>

									<tr>
										<td rowspan="8"><strong>수입</strong></td>
										<td class="txt-l">BMW 118D</td>
										<td class="minute">91,000원</td>
										<td rowspan="8" class="dc">760원~</td>
										<td rowspan="8">1,010원~</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">머스탱</td>
										<td class="minute">96,000원</td>
										<td class="last">370원</td>
									</tr>
									<tr>
										<td class="txt-l">미니 컨트리맨D</td>
										<td class="minute">91,000원</td>
										<td class="last">170원</td>
									</tr>
									<tr>
										<td class="txt-l">미니 쿠퍼D</td>
										<td class="minute">79,000원</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">미니 페이스맨D</td>
										<td class="minute">96,000원</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">벤츠 A200s</td>
										<td class="minute">91,000원</td>
										<td class="last">160원</td>
									</tr>
									<tr>
										<td class="txt-l">피아트500</td>
										<td class="minute">72,000원</td>
										<td class="last">220원</td>
									</tr>
									<tr>
										<td class="txt-l">볼트</td>
										<td class="minute">79,000원</td>
										<td class="last">90원</td>
									</tr>
									<tr>
										<td rowspan="2"><strong>승합</strong></td>
										<td class="txt-l">그랜드카니발</td>
										<td class="minute">79,000원</td>
										<td rowspan="2" class="dc">1,500원~</td>
										<td rowspan="2">2,000원~</td>
										<td class="last">220원</td>
									</tr>
									<tr>
										<td class="txt-l">뉴카니발 R(9인승)</td>
										<td class="minute">84,000원</td>
										<td class="last">220원</td>
									</tr>

									<tr>
										<td rowspan="2"><strong>대형</strong></td>
										<td class="txt-l">그랜저 HG(LPG)</td>
										<td class="minute">96,000원</td>
										<td rowspan="2" class="dc">960원~</td>
										<td rowspan="2">1,280원~</td>
										<td class="last">210원</td>
									</tr>
									<tr>
										<td class="txt-l">그랜저 HG(휘)</td>
										<td class="minute">96,000원</td>
										<td class="last">280원</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- // 차종별 요금표 추가,수정 (2016-07-07) -->





						<ul class="charges-tbl-guide">
							<li>- 차종 및 지역, 이벤트 등 할인조건에 따라 보다 많은 할인혜택이 제공됩니다. 실시간 할인대여요금을
								직접 조회해보세요.</li>
							<li>- 가카 이용요금은 기간별(비수기/성수기 등) 요금 정책에 따라 실시간 변동될 수 있습니다.</li>
							<li>- 주행요금은 유가변동에 따라 변경될 수 있습니다.</li>
						</ul>

						<h4 class="mgtop">보험안내</h4>
						<ul class="insurance-guide-txt">
							<li><span>- </span>예약한 시간만큼 보험료가 부과되며, 자동차
								종합보험(대인배상/대물배상/자기신체사고) 및 차량손해면책제도(자차보험)이 포함됩니다.</li>
						</ul>
						<div class="insurance-guide-wrap">
							<div class="insurance-guide-box pdr20 g01">
								<span class="insurance-img"><img
									src="/rentacar/resources/images/icons/txt_insurance03.gif"
									alt="자동차 종합보험" /></span>
								<p style="padding-top: 4px;">
									대인배상 무한<br /> 대물배상 1억원<br /> 자기신체사고 1천5백만원 한도
								</p>
								<!-- 							<p class="insuran-small-txt txt-l">*현재 대물배상 최대 1억원은 서울시에 한하며, <br />점차 확대 적용 예정입니다.</p> -->
							</div>
							<div class="insurance-guide-box g02">
								<span class="insurance-img"><img
									src="/rentacar/resources/images/icons/txt_insurance04.gif"
									alt="면책금" /></span>
								<p style="padding-top: 4px;">
									사고 1건당 자기부담금 30만원/70만원 중 선택 가능<br />(선택한 보험에 따라 보험료 차등 할인)
								</p>
								<p class="insuran-small-txt">
									(예시) 자기부담금 30만원 보험 선택한 경우,<br />사고 발생 시 수리비 총액에 관계없이 최대 30만원만
									본인 부담
								</p>
							</div>
							<div class="insurance-guide-box pdr20">
								<span class="insurance-img"><img
									src="/rentacar/resources/images/icons/txt_insurance01.png"
									alt="손해면책 예의적용" /></span>
								<p style="padding-top: 4px;">
									사고 발생 미신고,허위신고,고의적파손인 경우<br />손해면책에서 제외 실수리비 전액 배상과 고발 및 이용불가<br />조치가
									이루어 집니다.
								</p>
							</div>
							<div class="insurance-guide-box">
								<span class="insurance-img"><img
									src="/rentacar/resources/images/icons/txt_insurance02.png"
									alt="휴차보상" /></span>
								<p style="padding-top: 4px;">
									수리기간에 <strong class="col-grn">관계없이 최대 5일까지</strong>로 제한, <br />기준
									대여요금의 50%부과
								</p>
								<p class="insuran-small-txt">*단, 폐차 시 기준 대여요금의 30일로 계산하여
									부과됩니다.</p>
							</div>
						</div>

						<!-- 차량별 자기부담금 안내 (2016-07-07) -->
						<h4 class="mgtop">차량별 자기부담금 안내</h4>
						<ul class="insurance-guide-txt">
							<li><span>- </span>차량 대여 시 이용자의 귀책사유로 인해 차량손해가 발생한 경우 대여 시
								선택하신 보험료에 따라 손해면책 혜택을 받을 수 있습니다.</li>
						</ul>
						<div class="tbl-charge-box">
							<table summary="차량별 자기부담금 안내" class="tbl-green-member charge">
								<caption>차량별 자기부담금 안내</caption>
								<colgroup>
									<col width="150" />
									<col width="150" />
									<col width="150" />
									<col width="150" />
									<col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2">차종</th>
										<th scope="col" colspan="2">자기부담금 30만원</th>
										<th scope="col" colspan="2" class="last">자기부담금 70만원</th>
									</tr>
									<tr>
										<th scope="col">반나절</th>
										<th scope="col">1일</th>
										<th scope="col">반나절</th>
										<th scope="col" class="last">1일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><strong>경형</strong></td>
										<td>2,800원~</td>
										<td>7,000원~</td>
										<td>2,000원~</td>
										<td class="last">5,000원~</td>
									</tr>
									<tr>
										<td><strong>소형</strong></td>
										<td>3,200원~</td>
										<td>8,000원~</td>
										<td>3,400원~</td>
										<td class="last">6,000원~</td>
									</tr>
									<tr>
										<td><strong>준중형</strong></td>
										<td>3,600원~</td>
										<td>9,000원~</td>
										<td>2,800원~</td>
										<td class="last">7,000원~</td>
									</tr>
									<tr>
										<td><strong>중형</strong></td>
										<td>4,000원~</td>
										<td>10,000원~</td>
										<td>3,200원~</td>
										<td class="last">8,000원~</td>
									</tr>
									<tr>
										<td><strong>대형</strong></td>
										<td>6,000원~</td>
										<td>15,000원~</td>
										<td>5,200원~</td>
										<td class="last">13,000원~</td>
									</tr>
									<tr>
										<td><strong>승합</strong></td>
										<td>6,000원~</td>
										<td>15,000원~</td>
										<td>5,200원~</td>
										<td class="last">13,000원~</td>
									</tr>
									<tr>
										<td><strong>SUV</strong></td>
										<td>4,800원~</td>
										<td>12,000원~</td>
										<td>4,000원~</td>
										<td class="last">10,000원~</td>
									</tr>
									<tr>
										<td><strong>수입차</strong></td>
										<td>7,600원~</td>
										<td>19,000원~</td>
										<td>6,800원~</td>
										<td class="last">17,000원~</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- // 차량별 자기부담금 안내 (2016-07-07) -->


						<h4 class="mgtop">가카 요금활용 TIP</h4>
						<div class="charges-tip-wrap">
							<dl class="charges-tip01">
								<dt>초특가&amp;특가상품 이용</dt>
								<dd>
									<span>-</span> 초특가, 특가상품을 활용하시면 더욱 할인된 요금으로 이용하실 수 있습니다.
								</dd>
								<dd>
									<span>-</span> 브런치 데이트, 업무 시 활용, 마트 장보기 등 짧은 시간 동안 편리하게 이용
									가능합니다.
								</dd>
							</dl>
							<dl class="charges-tip02">
								<dt>장시간 이용혜택</dt>
								<dd>
									<span>-</span> 최대 24일까지 할인 적용됩니다.
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- charges-wrap -->

</body>
</html>