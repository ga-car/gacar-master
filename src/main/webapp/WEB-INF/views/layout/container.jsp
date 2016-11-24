<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="Ko" lang="Ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<script type="text/javascript"
		src="/rentacar/resources/js/main/contextPath.jsp"></script>

	<script type="text/javascript"
		src="/rentacar/resources/js/main/encypt.sha1.js"></script>
	<script type="text/javascript"
		src="/rentacar/resources/js/main/jquery-1.9.1.js"></script>
	<script type="text/javascript"
		src="/rentacar/resources/js/main/jquery-ui-1.9.1.custom.js"></script>
	<script type="text/javascript" src="/rentacar/resources/js/main/com.js"></script>

	<link type="text/css" rel="stylesheet" media="all"
		href="/rentacar/resources/css/use/use_common.css" />
	<link type="text/css" rel="stylesheet" media="all"
		href="/rentacar/resources/css/main/master.css" />
	<link type="text/css" rel="stylesheet" media="all"
		href="/rentacar/resources/css/use/use_layout.css" />
	<link type="text/css" rel="stylesheet" media="all"
		href="/rentacar/resources/css/use/main.css" />
</head>

<body>

	<!-- top img start -->
	<div id="container" class="main-content-box"
		style="width: 80%; height: 80%;">
		<div class="content-wrap">
			<div class="mainview-box">
				<div class="main-visualbox">
					<div id="sequence">
						<div class="visual_car">
							<div class="wheel_a">
								<div id="wheel1" class="wheel">
									<img src="/rentacar/resources/images/main/wheels_1.png" alt="" />
								</div>
							</div>
							<div class="wheel_b">
								<div id="wheel2" class="wheel">
									<img src="/rentacar/resources/images/main/wheels_1.png" alt="" />
								</div>
							</div>
						</div>
						<ul class="sequence-canvas">
							<li><img
								src="/rentacar/resources/images/main/visual_01_02.png" alt="" />
								<!-- <div class="frame1_txt step">
									<img
										src="/rentacar/resources/images/main/visual_01_txt_20160802.png"
										alt="" />
								</div> -->
								<div class="frame1_cloud step">
									<img src="/rentacar/resources/images/main/visual_01_cloud.png"
										alt="" />
								</div>
							<!-- 	<div class="frame1_hand step">
									<img src="/rentacar/resources/images/main/visual_01_03.png"
										alt="" />
								</div> --></li>
							<li><img
								src="/rentacar/resources/images/main/visual_02_01.png" alt="" />
								<!-- <div class="frame2_txt step">
									<img src="/rentacar/resources/images/main/visual_02_txt.png"
										alt="" />
								</div> -->
								<div class="frame2_cloud step">
									<img src="/rentacar/resources/images/main/visual_02_cloud.png"
										alt="" />
								</div></li>
							<li><img
								src="/rentacar/resources/images/main/visual_03_01.png" alt="" />
								<!-- 	<div class="frame3_txt step">
									<img src="/rentacar/resources/images/main/visual_03_txt.png"
										alt="" />
								</div> -->
								<div class="frame3_cloud step">
									<img src="/rentacar/resources/images/main/visual_03_cloud.png"
										alt="" />
								</div></li>
							<li><img
								src="/rentacar/resources/images/main/visual_04_01.png" alt="" />
								<!-- 	<div class="frame4_txt step">
									<img src="/rentacar/resources/images/main/visual_04_txt.png"
										alt="" />
								</div> -->
								<div class="frame4_cloud step">
									<img src="/rentacar/resources/images/main/visual_04_cloud.png"
										alt="" />
								</div></li>
							<li><img
								src="/rentacar/resources/images/main/visual_05_01.png" alt="" />
								<!-- <div class="frame5_txt step">
									<img src="/rentacar/resources/images/main/visual_05_txt.png"
										alt="" />
								</div> -->
								<div class="frame5_cloud step">
									<img src="/rentacar/resources/images/main/visual_04_cloud.png"
										alt="" />
								</div></li>
							<li><img
								src="/rentacar/resources/images/main/visual_06_01.png" alt="" />
								<!-- 	<div class="frame6_txt step">
									<img src="/rentacar/resources/images/main/visual_06_txt.png"
										alt="" />
								</div> -->
								<div class="frame6_cloud step">
									<img src="/rentacar/resources/images/main/visual_04_cloud.png"
										alt="" />
								</div></li>
						</ul>
						<div class="control">
							<span class="button" id="control_stop"><button
									type="button" class="stop">stop</button></span> <span class="button"
								id="control_play" style="display: none;"><button
									type="button" class="play">play</button></span>
						</div>
						<div class="sequence-pagination">
							<a href="#1"><img
								src="/rentacar/resources/images/main/visual_nav_on.png"
								alt="nav1" /></a> <a href="#1"><img
								src="/rentacar/resources/images/main/visual_nav_off.png"
								alt="nav2" /></a> <a href="#1"><img
								src="/rentacar/resources/images/main/visual_nav_off.png"
								alt="nav3" /></a> <a href="#1"><img
								src="/rentacar/resources/images/main/visual_nav_off.png"
								alt="nav4" /></a> <a href="#1"><img
								src="/rentacar/resources/images/main/visual_nav_off.png"
								alt="nav5" /></a> <a href="#1"><img
								src="/rentacar/resources/images/main/visual_nav_off.png"
								alt="nav6" /></a>
						</div>
					</div>
				</div>
				<script type="text/javascript"
					src="/rentacar/resources/js/main/jquery.easing.1.3.js"></script>
				<script type="text/javascript"
					src="/rentacar/resources/js/main/main_visual.js"></script>
			</div>
		</div>
	</div>

	<!-- top img end -->
	<!-- 최근 게시물 -->
	<div id="index" class="content scaffold-list clearfix" role="main">
		<!-- 이용후기 시작 -->
		<div class="col-sm-6 main-block-left">
			<div class="main-block">
				<h3 class="main-header">
					<i class="fa fa-info"></i> 가카 이용후기 <a
						href="/rentacar/review/list.do" class="main-more-btn pull-right"><i
						class="fa fa-ellipsis-h"></i></a>
				</h3>
				<div class="panel panel-default">
					<ul class="list-group">
						<c:forEach var="list" items="${reviewList_new}">
							<c:url var="viewURL" value="/review/view.do">
								<c:param name="no" value="${list.no}" />
							</c:url>

							<li
								class="list-group-item list-group-item-small  list-group-has-note clearfix">

								<div class="list-title-wrapper">
									<h5 class="list-group-item-heading ">
										<h2>
											<a href="${viewURL}">${list.subject} [${list.car}]</a>
										</h2>
										<c:if test="${list.imagefile_savname != 'NULL'}">
											<a href="${viewURL}"><img
												src="/rentacar/resources/reviewUpload/${list.imagefile_savname}"
												width="100%" height="100%" /> </a>
										</c:if>
										<c:if test="${list.imagefile_savname == 'NULL'}">
											<p class="main-block-desc">${list.content}</p>

										</c:if>

									</h5>
								</div>

							</li>

						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- 이용후기 끝 -->
		<!-- 공지사항 시작 -->
		<div class="col-sm-6 main-block-right">
			<div class="main-block">
				<h3 class="main-header">
					<i class="fa fa-group"></i> 공지사항 <a href="/rentacar/notify/list.do"
						class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a>
				</h3>
				<div class="panel panel-default">
					<ul class="list-group">
						<c:forEach var="list" items="${noticeList}">
							<li
								class="list-group-item list-group-item-small  list-group-has-note clearfix">

								<div class="list-title-wrapper">
									<h5 class="list-group-item-heading ">
										<a href="${viewURL}">${list.subject}</a>
									</h5>
								</div>

							</li>

						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<!-- 공지사항 끝 -->
	</div>
</body>
</html>

